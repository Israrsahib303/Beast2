<?php
include '_smm_header.php'; // Naya SMM Header istemal karein
require_once __DIR__ . '/../includes/smm_api.class.php';

$user_id = $_SESSION['user_id'];
$error = '';
$success = '';

// --- REFILL/CANCEL BUTTONS LOGIC ---
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action'])) {
    $order_id = (int)$_POST['order_id'];

    try {
        // 1. Order ko DB se fetch karein
        $stmt_order = $db->prepare("SELECT o.*, s.has_refill, s.has_cancel, p.api_url, p.api_key
                                    FROM smm_orders o
                                    JOIN smm_services s ON o.service_id = s.id
                                    JOIN smm_providers p ON s.provider_id = p.id
                                    WHERE o.id = ? AND o.user_id = ?");
        $stmt_order->execute([$order_id, $user_id]);
        $order = $stmt_order->fetch();

        if (!$order || empty($order['provider_order_id'])) {
            $error = 'Order not found or not yet processed by provider.';
        } else {
            $api = new SmmApi($order['api_url'], $order['api_key']);
            
            // 2. REFILL ACTION
            if ($_POST['action'] == 'refill' && $order['has_refill']) {
                
                // --- NAYA COOLDOWN CHECK ---
                $can_refill = true;
                if ($order['status'] == 'completed') {
                    $completion_time = strtotime($order['updated_at']);
                    $next_refill_time = $completion_time + (24 * 3600); // 24 Ghantay
                    
                    if (time() < $next_refill_time) {
                        $can_refill = false;
                        $error = 'You can request refill 24 hours after completion.';
                    }
                } else {
                    $can_refill = false; 
                }
                // --- COOLDOWN CHECK KHATAM ---

                if ($can_refill) {
                    $result = $api->refillOrder($order['provider_order_id']);
                    if ($result['success']) {
                        // Refill time ko update karein
                        $db->prepare("UPDATE smm_orders SET updated_at = NOW() WHERE id = ?")->execute([$order_id]);
                        $success = 'Refill request sent for Order #' . $order['id'] . '!';
                    } else {
                        $error = 'Refill failed: ' . ($result['error'] ?? 'Provider error');
                    }
                }

            } 
            // 3. CANCEL ACTION
            elseif ($_POST['action'] == 'cancel' && $order['has_cancel']) {
                $result = $api->cancelOrder($order['provider_order_id']);
                if ($result['success']) {
                    $db->prepare("UPDATE smm_orders SET status = 'cancelled' WHERE id = ?")->execute([$order_id]);
                    $success = 'Cancel request sent for Order #' . $order['id'] . '!';
                } else {
                    $error = 'Cancel failed: ' . ($result['error'] ?? 'Provider error');
                }
            } else {
                $error = 'This action is not supported for this service.';
            }
        }
    } catch (Exception $e) {
        $error = 'An error occurred: ' . $e->getMessage();
    }
}


// --- SMM Orders ki history fetch karein (o.* pehle se hi sab columns le aata hai) ---
try {
    $stmt = $db->prepare("
        SELECT o.*, s.name as service_name, s.has_refill, s.has_cancel
        FROM smm_orders o
        JOIN smm_services s ON o.service_id = s.id
        WHERE o.user_id = ?
        ORDER BY o.created_at DESC
        LIMIT 50 
    ");
    $stmt->execute([$user_id]);
    $smm_orders = $stmt->fetchAll();
} catch (PDOException $e) {
    $smm_orders = [];
    $error = "Failed to load orders: " . $e->getMessage();
}
?>

<div class="app-page-header">
    <a href="smm_order.php" class="back-button">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 12H5"></path><path d="m12 19-7-7 7-7"></path></svg>
    </a>
    <h2>My SMM Orders</h2>
</div>

<?php if ($error): ?><div class="app-message app-error"><?php echo sanitize($error); ?></div><?php endif; ?>
<?php if ($success): ?><div class="app-message app-success"><?php echo sanitize($success); ?></div><?php endif; ?>
<?php if (isset($_GET['success'])): ?><div class="app-message app-success"><?php echo sanitize($_GET['success']); ?></div><?php endif; ?>

<div class="order-history-list">
    <?php if (empty($smm_orders)): ?>
        <div class="app-card" style="text-align: center; padding-top: 2rem; padding-bottom: 2rem;">
            <p style="color: var(--app-secondary); margin:0;">You have not placed any SMM orders yet.</p>
        </div>
    <?php else: ?>
        <?php foreach ($smm_orders as $order): ?>
            <div class="app-card-order">
                <div class="order-card-header">
                    <div class="order-card-info">
                        <h3><?php echo sanitize($order['service_name']); ?></h3>
                        <p>Order ID: #<?php echo $order['id']; ?> | Qty: <?php echo $order['quantity']; ?></p>
                    </div>
                    <div class="order-card-price">
                        <?php echo formatCurrency($order['charge']); ?>
                    </div>
                </div>
                
                <div class="order-card-status">
                    <span class="app-status status-<?php echo str_replace(' ', '_', strtolower($order['status'])); ?>">
                        <?php echo ucfirst($order['status']); ?>
                    </span>
                </div>

                <?php
                $start_count = (int)($order['start_count'] ?? 0);
                $remains = (int)($order['remains'] ?? 0);
                $quantity_ordered = (int)($order['quantity'] ?? 0);
                $delivered = 0;
                $current_count = $start_count; // Default
                
                // Logic to calculate delivered/current
                if ($order['status'] == 'completed') {
                    $delivered = $quantity_ordered;
                    $current_count = $start_count + $quantity_ordered;
                } elseif ($order['status'] == 'partial') {
                    if ($start_count > 0) {
                        $delivered = $quantity_ordered - $remains;
                        $current_count = $start_count + $delivered;
                    }
                } elseif ($order['status'] == 'in_progress' && $start_count > 0) {
                    $delivered = $quantity_ordered - $remains;
                    $current_count = $start_count + $delivered;
                } elseif ($order['status'] == 'cancelled' || $order['status'] == 'refunded') {
                    $remains = $quantity_ordered; // Cancelled means 0 delivered
                }
                ?>
                
                <div class="order-card-stats-adv">
                    <div class="order-stat-item-adv">
                        <p>Start Count</p>
                        <h4 class="stat-start"><?php echo number_format($start_count); ?></h4>
                    </div>
                    <div class="order-stat-item-adv">
                        <p>Delivered</p>
                        <h4 class="stat-delivered"><?php echo number_format($delivered); ?></h4>
                    </div>
                    <div class="order-stat-item-adv">
                        <p>Remains</p>
                        <h4 class="stat-remains"><?php echo number_format($remains); ?></h4>
                    </div>
                    <div class="order-stat-item-adv">
                        <p>Current</p>
                        <h4 class="stat-current"><?php echo number_format($current_count); ?></h4>
                    </div>
                </div>
                <div class="order-card-details">
                    <p><strong>Link:</strong> <span style="word-break: break-all;"><?php echo sanitize($order['link']); ?></span></p>
                    <p><strong>Date:</strong> <?php echo formatDate($order['created_at']); ?></p>
                    
                    <div class="order-actions">
                        
                        <?php
                        $has_refill_support = $order['has_refill'];
                        $is_completed = $order['status'] == 'completed';
                        
                        $can_refill_now = false;
                        $cooldown_ends_at = '';
                        $cooldown_active = false;
                        $button_text = 'Refill';

                        if ($has_refill_support) {
                            if ($is_completed) {
                                // Order complete hai, ab time check karo
                                $cooldown_period = 24 * 3600; // 24 Ghantay
                                $completion_time = strtotime($order['updated_at']);
                                $next_refill_time = $completion_time + $cooldown_period;

                                if (time() < $next_refill_time) {
                                    // Cooldown abhi jaari hai
                                    $can_refill_now = false;
                                    $cooldown_active = true;
                                    $cooldown_ends_at = date('Y-m-d H:i:s', $next_refill_time); // JS ke liye
                                    $button_text = 'Wait...'; // JS isay update kar dega
                                } else {
                                    // Cooldown poora ho gaya, button active karein
                                    $can_refill_now = true;
                                    $button_text = 'Refill';
                                }
                            } else {
                                // Order abhi 'pending' ya 'in_progress' hai
                                $can_refill_now = false;
                                $button_text = 'Refill'; // Disabled nazar aaye ga
                            }
                        }
                        ?>
                        
                        <form action="smm_history.php" method="POST">
                            <input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
                            <button type="submit" name="action" value="refill" 
                                    class="btn-app-secondary btn-refill" 
                                    <?php if (!$can_refill_now) echo 'disabled'; ?>
                                    <?php if ($cooldown_active) echo 'data-cooldown-ends="' . $cooldown_ends_at . '"'; ?>>
                                
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 4 23 10 17 10"></polyline><polyline points="1 20 1 14 7 14"></polyline><path d="M3.51 9a9 9 0 0 1 14.85-3.36L20.49 15a9 9 0 0 1-14.85 3.36L3.51 9z"></path></svg>
                                <span class="refill-button-text"><?php echo $button_text; ?></span>
                            </button>
                        </form>
                        
                        <form action="smm_history.php" method="POST">
                            <input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
                            <button type="submit" name="action" value="cancel" class="btn-app-secondary btn-cancel" 
                                <?php echo ($order['has_cancel'] && ($order['status'] == 'pending' || $order['status'] == 'in_progress')) ? '' : 'disabled'; ?>>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg>
                                Cancel
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>


<?php include '_smm_footer.php'; // Naya SMM Footer istemal karein ?>