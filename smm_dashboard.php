<?php
include '_header.php'; 
require_once __DIR__ . '/../includes/smm_api.class.php';

// --- NAYI SQL Queries (Sirf SMM ke liye) ---
try {
    // 1. Total SMM Revenue (Jo user ne pay kiya)
    $smm_total_revenue = $db->query("SELECT SUM(charge) FROM smm_orders")->fetchColumn() ?? 0;

    // 2. Total SMM Orders
    $smm_total_orders = $db->query("SELECT COUNT(id) FROM smm_orders")->fetchColumn() ?? 0;

    // 3. SMM Orders (Pending)
    $smm_pending_orders = $db->query("SELECT COUNT(id) FROM smm_orders WHERE status = 'pending'")->fetchColumn() ?? 0;

    // 4. SMM Orders (In Progress)
    $smm_in_progress = $db->query("SELECT COUNT(id) FROM smm_orders WHERE status = 'in_progress'")->fetchColumn() ?? 0;
    
    // 5. Total SMM Profit (Asal Munafa)
    $stmt_profit = $db->query("
        SELECT SUM(o.charge - ( (o.quantity / 1000) * s.base_price )) 
        FROM smm_orders o
        JOIN smm_services s ON o.service_id = s.id
        WHERE o.status = 'completed' OR o.status = 'partial'
    ");
    $smm_total_profit = $stmt_profit->fetchColumn() ?? 0;
    
    // 6. Provider Balance (Live API Call)
    $provider_balance = 'N/A';
    $provider_currency = '';
    $stmt_provider = $db->query("SELECT * FROM smm_providers WHERE is_active = 1 LIMIT 1");
    $provider = $stmt_provider->fetch();
    if ($provider) {
        $api = new SmmApi($provider['api_url'], $provider['api_key']);
        $balance_result = $api->getBalance();
        if ($balance_result['success']) {
            $provider_balance = number_format($balance_result['balance'], 2);
            $provider_currency = $balance_result['currency'];
        } else {
            $provider_balance = 'Error';
        }
    }
    
    // 7. Recent SMM Orders
    $stmt_recent = $db->query("
        SELECT o.*, u.email, s.name 
        FROM smm_orders o
        JOIN users u ON o.user_id = u.id
        JOIN smm_services s ON o.service_id = s.id
        ORDER BY o.created_at DESC
        LIMIT 5
    ");
    $recent_smm_orders = $stmt_recent->fetchAll();

} catch (PDOException $e) {
    echo "<div class='message error'>Failed to load SMM dashboard stats: " . $e->getMessage() . "</div>";
}
?>

<style>
    @keyframes pulseGlow {
        0% { box-shadow: 0 0 10px rgba(40, 167, 69, 0.2); }
        50% { box-shadow: 0 0 20px rgba(40, 167, 69, 0.6); }
        100% { box-shadow: 0 0 10px rgba(40, 167, 69, 0.2); }
    }
    .stat-card .positive { color: #28a745; }
    .stat-card .negative { color: #dc3545; }
    .stat-card .live-balance {
        color: #007bff;
        animation: pulseGlow 2s infinite;
    }
</style>

<h1>SMM Panel Dashboard</h1>

<div class="stat-grid">
    <div class="stat-card">
        <h3>SMM Total Revenue</h3>
        <p class="positive"><?php echo formatCurrency($smm_total_revenue); ?></p>
    </div>
    <div class="stat-card">
        <h3>SMM Total Profit</h3>
        <p class="positive"><?php echo formatCurrency($smm_total_profit); ?></p>
    </div>
    <div class="stat-card">
        <h3>SMM Total Orders</h3>
        <p><?php echo number_format($smm_total_orders); ?></p>
    </div>
    <div class="stat-card">
        <h3>Orders Pending</h3>
        <p class="negative"><?php echo number_format($smm_pending_orders); ?></p>
    </div>
    <div class="stat-card">
        <h3>Orders In Progress</h3>
        <p><?php echo number_format($smm_in_progress); ?></p>
    </div>
     <div class="stat-card">
        <h3>Provider Balance</h3>
        <p class="live-balance"><?php echo $provider_balance . ' ' . $provider_currency; ?></p>
    </div>
</div>

<h2>Recent SMM Orders</h2>
<div class="admin-table-responsive">
    <table class="admin-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User</th>
                <th>Service</th>
                <th>Charge</th>
                <th>Status</th>
                <th>Provider ID</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($recent_smm_orders)): ?>
                <tr><td colspan="6" style="text-align: center;">No recent SMM orders.</td></tr>
            <?php else: ?>
                <?php foreach ($recent_smm_orders as $order): ?>
                <tr>
                    <td><strong>#<?php echo $order['id']; ?></strong></td>
                    <td><?php echo sanitize($order['email']); ?></td>
                    <td><?php echo sanitize($order['name']); ?></td>
                    <td><?php echo formatCurrency($order['charge']); ?></td>
                    <td><span class="status-badge status-<?php echo str_replace(' ', '_', strtolower($order['status'])); ?>"><?php echo ucfirst($order['status']); ?></span></td>
                    <td><?php echo $order['provider_order_id'] ?? 'N/A'; ?></td>
                </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include '_footer.php'; ?>