<?php
include '_header.php';
// YEH LINE AB KAAM KARE GI (Blank page fix)
require_once __DIR__ . '/../includes/smm_api.class.php'; 

$action = $_GET['action'] ?? 'list';
$provider_id = $_GET['id'] ?? 0;
$error = '';
$success = '';

// --- Handle Form Submissions (Create/Update) ---
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = sanitize($_POST['name']);
    $api_url = sanitize($_POST['api_url']);
    $api_key = sanitize($_POST['api_key']);
    $profit_margin = (int)$_POST['profit_margin'];
    $is_active = isset($_POST['is_active']) ? 1 : 0;

    if ($profit_margin < 0) $profit_margin = 0;

    try {
        if ($action == 'edit' && $provider_id) {
            // Update
            $stmt = $db->prepare("UPDATE smm_providers SET name = ?, api_url = ?, api_key = ?, profit_margin = ?, is_active = ? WHERE id = ?");
            $stmt->execute([$name, $api_url, $api_key, $profit_margin, $is_active, $provider_id]);
            $success = 'Provider updated successfully!';
        } else {
            // Create
            $stmt = $db->prepare("INSERT INTO smm_providers (name, api_url, api_key, profit_margin, is_active) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute([$name, $api_url, $api_key, $profit_margin, $is_active]);
            $success = 'Provider created successfully!';
        }
        $action = 'list'; // Go back to list view
    } catch (PDOException $e) {
        $error = 'Database error: ' . $e->getMessage();
    }
}

// --- MODIFIED Handle Deletion ---
if ($action == 'delete' && $provider_id) {
    try {
        // --- NAYA LOGIC: Pehle services delete karein, phir provider ---
        $db->beginTransaction();
        
        // 1. Pehle is provider se linked saari services ko delete karein
        $stmt_del_services = $db->prepare("DELETE FROM smm_services WHERE provider_id = ?");
        $stmt_del_services->execute([$provider_id]);
        
        // 2. Ab provider ko delete karein
        $stmt_del_provider = $db->prepare("DELETE FROM smm_providers WHERE id = ?");
        $stmt_del_provider->execute([$provider_id]);
        
        $db->commit();
        // --- NAYA LOGIC KHATAM ---
        
        $success = 'Provider and all its linked services deleted successfully!';
        $action = 'list';
        
    } catch (PDOException $e) {
        $db->rollBack();
        $error = 'Failed to delete provider. Database error: ' . $e->getMessage();
    }
}

// --- Load Data for Views ---
$provider = null;
if (($action == 'edit' || $action == 'add') && $provider_id) {
    $stmt = $db->prepare("SELECT * FROM smm_providers WHERE id = ?");
    $stmt->execute([$provider_id]);
    $provider = $stmt->fetch();
}
if ($action == 'list') {
    $stmt = $db->query("SELECT * FROM smm_providers ORDER BY name ASC");
    $providers = $stmt->fetchAll();
}
?>

<h1>Manage API Providers</h1>
<p>You can add multiple SMM panel providers here. The system will use the **first active provider** to sync services and place orders.</p>


<?php if ($error): ?><div class="message error"><?php echo $error; ?></div><?php endif; ?>
<?php if ($success): ?><div class="message success"><?php echo $success; ?></div><?php endif; ?>


<?php if ($action == 'list'): ?>
    <a href="providers.php?action=add" class="btn-new">Add New Provider</a>
    <div class="admin-table-responsive">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Provider Name</th>
                    <th>API URL</th>
                    <th>Profit Margin</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($providers as $p): ?>
                <tr>
                    <td><?php echo sanitize($p['name']); ?></td>
                    <td><?php echo sanitize($p['api_url']); ?></td>
                    <td><?php echo $p['profit_margin']; ?>%</td>
                    <td>
                        <?php if ($p['is_active']): ?>
                            <span class="status-badge status-active">Active</span>
                        <?php else: ?>
                            <span class="status-badge status-expired">Disabled</span>
                        <?php endif; ?>
                    </td>
                    <td class="action-buttons">
                        <a href="providers.php?action=edit&id=<?php echo $p['id']; ?>" class="btn-edit">Edit</a>
                        <a href="providers.php?action=delete&id=<?php echo $p['id']; ?>" class="btn-delete" onclick="return confirm('Are you sure? This will delete the provider AND all services linked to it.');">Delete</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

<?php elseif ($action == 'add' || $action == 'edit'): ?>
    <h2><?php echo ($action == 'edit') ? 'Edit Provider' : 'Add New Provider'; ?></h2>
    
    <form action="providers.php?action=<?php echo $action; ?><?php echo $provider_id ? '&id='.$provider_id : ''; ?>" method="POST" class="admin-form">
        <div class="form-group">
            <label for="name">Provider Name (e.g., PerfectPanel)</label>
            <input type="text" id="name" name="name" class="form-control" value="<?php echo sanitize($provider['name'] ?? ''); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="api_url">API URL (e.g., https://dilsmmpanel.com/api/v2)</label>
            <input type="text" id="api_url" name="api_url" class="form-control" value="<?php echo sanitize($provider['api_url'] ?? 'https://dilsmmpanel.com/api/v2'); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="api_key">API Key</label>
            <input type="text" id="api_key" name="api_key" class="form-control" value="<?php echo sanitize($provider['api_key'] ?? ''); ?>" required>
        </div>

        <div class="form-group">
            <label for="profit_margin">Profit Margin (e.g., 50 for 50%)</label>
            <input type="number" id="profit_margin" name="profit_margin" class="form-control" value="<?php echo sanitize($provider['profit_margin'] ?? '50'); ?>" required>
        </div>
        
        <div class="form-group">
            <label>
                <input type="checkbox" name="is_active" value="1" <?php echo (isset($provider['is_active']) && $provider['is_active']) ? 'checked' : 'checked'; ?>>
                Active (Use this provider for orders)
            </label>
        </div>
        
        <button type="submit" class="btn btn-primary"><?php echo ($action == 'edit') ? 'Save Changes' : 'Add Provider'; ?></button>
        <a href="providers.php" class="btn" style="background: #555; color: #fff; text-decoration: none;">Cancel</a>
    </form>
<?php endif; ?>

<?php include '_footer.php'; ?>