<?php
include '_header.php';

$action = $_GET['action'] ?? ''; // Nayi tabdeeli
$error = '';
$success = '';

// --- NAYA LOGIC: Single Category Delete ---
if ($action == 'delete_category' && isset($_GET['id'])) {
    $category_id = (int)$_GET['id'];
    
    try {
        // 1. Pehle category ka naam fetch karein (taake services check kar sakein)
        $stmt_cat_name = $db->prepare("SELECT name FROM smm_categories WHERE id = ?");
        $stmt_cat_name->execute([$category_id]);
        $category_name = $stmt_cat_name->fetchColumn();

        if ($category_name) {
            // 2. Check karein ke is category mein koi service toh nahi
            // (Hum 'category' naam se check kar rahe hain kyunke smm_services table aise hi link hai)
            $stmt_check = $db->prepare("SELECT COUNT(id) FROM smm_services WHERE category = ?");
            $stmt_check->execute([$category_name]);
            $service_count = $stmt_check->fetchColumn();

            if ($service_count > 0) {
                // Agar services hain, toh error dein
                $error = "Cannot delete category: Pehle '{$category_name}' mein se saari ({$service_count}) services ko SMM Services page se delete karein.";
            } else {
                // 3. Agar category khaali hai, toh delete karein
                $stmt_delete = $db->prepare("DELETE FROM smm_categories WHERE id = ?");
                $stmt_delete->execute([$category_id]);
                $success = "Category '{$category_name}' deleted successfully.";
            }
        } else {
            $error = "Category not found.";
        }
    } catch (PDOException $e) {
        $error = "Database error: " . $e->getMessage();
    }
    // Action ko URL se hatayein taake refresh par dobara na chale
    echo '<script>history.pushState(null, "", "smm_categories.php");</script>';
}
// --- NAYA LOGIC KHATAM ---


// --- MODIFIED "BEAST" LOGIC: Automatic Category Sync ---
// Ab yeh sirf "Sync Categories" button dabane par chalega
if ($action == 'sync_categories') {
    try {
        // 1. Pehle 'smm_services' se tamam unique "clean" categories nikalen
        $stmt_services_cats = $db->query("SELECT DISTINCT category FROM smm_services WHERE is_active = 1");
        $service_categories = $stmt_services_cats->fetchAll(PDO::FETCH_COLUMN);
        
        $clean_categories = [];
        foreach ($service_categories as $category_name) {
            
            // --- YEH RAHA BADLAAO: Wapas "Clean" logic par aagaye taaki duplicate error na aaye ---
            if (preg_match('/^([\w\s]+?)(?:\s\»\s|\s\-\s|\s\d|$)/i', $category_name, $matches)) {
                $clean_category = trim($matches[1]);
            } else {
                $clean_category = trim($category_name);
            }
            // --- BADLAAO KHATAM ---

            $clean_categories[$clean_category] = 1; // Unique list banayein
        }

        // 2. Ab in categories ko 'smm_categories' table mein add karein (agar pehle se nahi hain)
        $count = 0;
        if (!empty($clean_categories)) {
            $stmt_insert = $db->prepare("INSERT IGNORE INTO smm_categories (name) VALUES (?)");
            foreach (array_keys($clean_categories) as $name) {
                if (!empty($name)) {
                    $stmt_insert->execute([$name]);
                    $count += $stmt_insert->rowCount();
                }
            }
        }
        $success = "Sync complete! $count new categories added.";
        // Clear action from URL
        echo '<script>history.pushState(null, "", "smm_categories.php");</script>';

    } catch (PDOException $e) {
        $error = "Failed to sync categories: " . $e->getMessage();
    }
}
// --- SYNC LOGIC KHATAM ---


// --- Handle Form Submission (Icon Update) ---
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_icons'])) {
    $icons = $_POST['icons'] ?? [];
    $sort_orders = $_POST['sort_orders'] ?? [];
    
    try {
        $db->beginTransaction();
        $stmt_update = $db->prepare("UPDATE smm_categories SET icon_filename = ?, sort_order = ? WHERE id = ?");
        
        foreach ($icons as $id => $icon_name) {
            $sort = (int)($sort_orders[$id] ?? 0);
            $stmt_update->execute([sanitize($icon_name), $sort, $id]);
        }
        
        $db->commit();
        $success = 'Category icons and sorting updated successfully!';
    } catch (PDOException $e) {
        $db->rollBack();
        $error = 'Database error: ' . $e->getMessage();
    }
}

// --- NAYA LOGIC: Handle "Reset SMM Panel" (SAFE VERSION) ---
if ($action == 'delete_all_smm_confirmed') {
    try {
        $db->beginTransaction();
        
        // --- SAHI LOGIC: Orders ko nahi chherna ---
        
        // 1. Pehle user favorites clear karein (Safe)
        $db->query("TRUNCATE TABLE user_favorite_services"); 
        
        // 2. Phir SMM Categories clear karein (Safe)
        $db->query("TRUNCATE TABLE smm_categories"); 

        // 3. Ab SMM Services ko DELETE nahi, balke DEACTIVATE karein
        // Isse order history mehfooz rahegi
        $db->query("UPDATE smm_services SET is_active = 0");
        
        $db->commit();
        
        $success = 'SMM Panel Reset! All services DEACTIVATED and categories cleared. Order history is SAFE.';
        
        // Clear action from URL
        echo '<script>history.pushState(null, "", "smm_categories.php");</script>';

    } catch (PDOException $e) {
        $db->rollBack();
        $error = 'Failed to reset SMM panel: ' . $e->getMessage();
    }
}
// --- NAYA LOGIC KHATAM ---


// --- Load Data for View ---
try {
    $stmt_list = $db->query("SELECT * FROM smm_categories ORDER BY sort_order ASC, name ASC");
    $categories = $stmt_list->fetchAll();
} catch (PDOException $e) {
    $error = 'Failed to fetch categories: ' . $e->getMessage();
    $categories = [];
}
?>

<h1>Manage SMM Category Icons</h1>
<p class="description">
    Aap ki provider ki categories yahan automatically list ho jati hain. <br>
    Aap har category ke liye `assets/img/icons/` folder mein maujood icon ka naam (e.g., `tiktok.svg` or `youtube.png`) yahan likh sakte hain.
</p>

<?php if ($error): ?><div class="message error"><?php echo $error; ?></div><?php endif; ?>
<?php if ($success): ?><div class="message success"><?php echo $success; ?></div><?php endif; ?>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; flex-wrap: wrap; gap: 10px;">
    
    <a href="smm_categories.php?action=sync_categories" class="btn-new" 
       style="background-color: #28a745;"
       onclick="return confirm('This will find new categories from your services. Are you sure?');">
       Sync Categories from Services
    </a>
    
    <a href="smm_categories.php?action=delete_all_smm_confirmed" class="btn-delete" 
       onclick="return confirm('Are you sure you want to reset the SMM panel? This will DEACTIVATE all services and clear all categories. Your order history will be safe.');">
       Reset SMM Panel (Clear Services & Categories)
    </a>
</div>
<form action="smm_categories.php" method="POST" class="admin-form">
    <input type="hidden" name="update_icons" value="1">
    
    <div class="admin-table-responsive">
        <table class="admin-table">
            <thead>
                <tr>
                    <th style="width: 100px;">Current Icon</th>
                    <th>Category Name</th>
                    <th>Icon Filename (e.g., tiktok.svg)</th>
                    <th style="width: 100px;">Sort Order</th>
                    <th style="width: 100px;">Actions</th> </tr>
            </thead>
            <tbody>
                <?php if (empty($categories)): ?>
                    <tr><td colspan="5" style="text-align: center;">No categories found. Please click "Sync Categories from Services".</td></tr>
                <?php endif; ?>
                
                <?php foreach ($categories as $cat): ?>
                <tr>
                    <td>
                        <?php if (!empty($cat['icon_filename'])): ?>
                            <img src="../assets/img/icons/<?php echo sanitize($cat['icon_filename']); ?>" alt="" style="width: 30px; height: 30px; background: #fff; border-radius: 4px; padding: 2px;">
                        <?php else: ?>
                            (None)
                        <?php endif; ?>
                    </td>
                    <td><strong><?php echo sanitize($cat['name']); ?></strong></td>
                    <td>
                        <input type="text" name="icons[<?php echo $cat['id']; ?>]" class="form-control" 
                               value="<?php echo sanitize($cat['icon_filename']); ?>" 
                               placeholder="e.g., youtube.svg">
                    </td>
                    <td>
                        <input type="number" name="sort_orders[<?php echo $cat['id']; ?>]" class="form-control" 
                               value="<?php echo (int)$cat['sort_order']; ?>">
                    </td>
                    <td class="action-buttons">
                        <a href="smm_categories.php?action=delete_category&id=<?php echo $cat['id']; ?>" 
                           class="btn-delete" 
                           onclick="return confirm('Are you SURE you want to delete this category? This will only work if no services are inside it.');"
                           title="Delete Category">
                            Delete
                        </a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    
    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1.5rem;">
        <button type="submit" class="btn btn-primary" style="width: auto;">Save All Changes</button>
    </div>
</form>

<?php include '_footer.php'; ?>