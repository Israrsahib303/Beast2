<?php
// --- CRON JOB (Run every 5 minutes) ---
// Yeh script 'in_progress' orders ka status check karti hai

chdir(dirname(__DIR__)); 
require_once 'config.php';
require_once 'db.php';
require_once 'smm_api.class.php';
require_once 'wallet.class.php'; // Refund ke liye

$log_file = '../../assets/logs/smm_status_sync.log';
$log_message = "Status Sync Cron started at " . date('Y-m-d H:i:s') . "\n";

try {
    // 1. Provider fetch karein
    $stmt_provider = $db->prepare("SELECT * FROM smm_providers WHERE is_active = 1 LIMIT 1");
    $stmt_provider->execute();
    $provider = $stmt_provider->fetch();

    if (!$provider) {
        throw new Exception('No active SMM provider found.');
    }
    
    $api = new SmmApi($provider['api_url'], $provider['api_key']);
    $wallet = new Wallet($db);

    // 2. Tamam 'in_progress' orders fetch karein
    // --- NAYA BADLAAO: Hum 'quantity' bhi fetch kar rahe hain ---
    $stmt_orders = $db->prepare("SELECT id, provider_order_id, charge, user_id, quantity FROM smm_orders WHERE status = 'in_progress' LIMIT 50");
    $stmt_orders->execute();
    $in_progress_orders = $stmt_orders->fetchAll();

    if (empty($in_progress_orders)) {
        $log_message .= "No 'In Progress' orders found to sync.\n";
    } else {
        $log_message .= count($in_progress_orders) . " orders found. Syncing...\n";
    }

    // 3. Har order ka status check karein
    foreach ($in_progress_orders as $order) {
        $order_id = $order['id'];
        $provider_order_id = $order['provider_order_id'];
        
        $result = $api->getOrderStatus($provider_order_id);

        if ($result['success']) {
            $status_data = $result['status_data'];
            $new_status = strtolower($status_data['status']);
            
            // --- NAYA LOGIC: Start Count aur Remains ko hamesha fetch karein ---
            $start_count = (int)($status_data['start_count'] ?? 0);
            $remains = (int)($status_data['remains'] ?? 0);
            
            // --- NAYA LOGIC: Hamesha start_count aur remains ko update karein ---
            // Is se 'in_progress' orders ka bhi count update hota rahega
            $stmt_update_counts = $db->prepare("UPDATE smm_orders SET start_count = ?, remains = ? WHERE id = ?");
            $stmt_update_counts->execute([$start_count, $remains, $order_id]);
            
            // API Statuses: 'Pending', 'In progress', 'Completed', 'Partial', 'Canceled', 'Processing'
            
            if ($new_status == 'completed') {
                // Order complete ho gaya
                $db->prepare("UPDATE smm_orders SET status = 'completed' WHERE id = ?")->execute([$order_id]);
                $log_message .= "  SUCCESS: Order #$order_id (Prov: $provider_order_id) is COMPLETED. (S: $start_count, R: $remains)\n";
            
            } elseif ($new_status == 'partial') {
                // Order partial hua (Auto-Refund)
                $charge = (float)$order['charge'];
                $quantity = (float)($order['quantity'] ?? 0); // Quantity DB se lein
                
                $refund_amount = 0;
                if ($quantity > 0 && $remains > 0) {
                    $per_item_cost = $charge / $quantity;
                    $refund_amount = $per_item_cost * $remains;
                }

                $db->beginTransaction();
                $db->prepare("UPDATE smm_orders SET status = 'partial' WHERE id = ?")->execute([$order_id]);
                if ($refund_amount > 0) {
                    $wallet->addCredit($order['user_id'], $refund_amount, 'admin_adjust', $order_id, "SMM Order Partial Refund #" . $provider_order_id);
                }
                $db->commit();
                $log_message .= "  PARTIAL: Order #$order_id (Prov: $provider_order_id). Refunded " . formatCurrency($refund_amount) . ". (S: $start_count, R: $remains)\n";

            } elseif ($new_status == 'canceled' || $new_status == 'refunded') {
                // Order cancel ho gaya (Auto-Refund)
                $charge = (float)$order['charge'];
                
                $db->beginTransaction();
                $db->prepare("UPDATE smm_orders SET status = 'cancelled' WHERE id = ?")->execute([$order_id]);
                $wallet->addCredit($order['user_id'], $charge, 'admin_adjust', $order_id, "SMM Order Cancelled Refund #" . $provider_order_id);
                $db->commit();
                $log_message .= "  CANCELLED: Order #$order_id (Prov: $provider_order_id). Refunded " . formatCurrency($charge) . ". (S: $start_count, R: $remains)\n";

            } else {
                // Status abhi bhi 'in_progress' ya 'pending' hai
                $log_message .= "  INFO: Order #$order_id is still '$new_status'. (S: $start_count, R: $remains)\n";
            }

        } else {
            $log_message .= "  ERROR: Could not get status for Order #$order_id. API Error: " . $result['error'] . "\n";
        }
    }

} catch (Exception $e) {
    if (isset($db) && $db->inTransaction()) $db->rollBack();
    $log_message .= "CRITICAL ERROR: " . $e->getMessage() . "\n";
}

$log_message .= "Cron finished at " . date('Y-m-d H:i:s') . "\n\n";
file_put_contents($log_file, $log_message, FILE_APPEND);
echo $log_message;
?>