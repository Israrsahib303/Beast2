<?php
include '_header.php';

$error = $_GET['error'] ?? '';
$success = $_GET['success'] ?? '';
$sync_status = $_GET['sync_status'] ?? '';

// --- NAYA LOGIC: Filter by status ---
$show = $_GET['show'] ?? 'active'; // Default sirf 'active' dikhayein
$where_clause = "";
if ($show == 'active') {
    $where_clause = " WHERE s.is_active = 1";
} elseif ($show == 'disabled') {
    $where_clause = " WHERE s.is_active = 0";
}
// Agar 'all' hai, toh $where_clause khali rahega


// --- Category Grouping ke liye services fetch karein ---
try {
    // --- SQL QUERY MEIN BADLAAO ---
    $stmt = $db->query("
        SELECT s.*, p.name as provider_name, p.api_key, p.api_url
        FROM smm_services s
        JOIN smm_providers p ON s.provider_id = p.id
        $where_clause 
        ORDER BY s.category ASC, s.name ASC
    ");
    $all_services = $stmt->fetchAll();
    
    $services_by_category = [];
    $categories = [];

    foreach ($all_services as $service) {
        
        // --- YEH RAHA FIX: Ab hum poora category name istemal kareinge ---
        $clean_category = trim($service['category']);
        // --- FIX KHATAM ---
        
        $services_by_category[$clean_category][] = $service;
        $categories[$clean_category] = $clean_category; // Unique list
    }
    
    ksort($categories); // Categories ko Alphabetical order mein sort karein

} catch (PDOException $e) {
    $error = 'Database Error: Failed to load services list.';
    $services_by_category = [];
    $categories = [];
}
?>

<h1>SMM Services & Categories</h1>

<?php if ($error): ?><div class="message error"><?php echo $error; ?></div><?php endif; ?>
<?php if ($success): ?><div class="message success"><?php echo $success; ?></div><?php endif; ?>
<?php if ($sync_status === 'sync_start'): ?><div class="message info">Service sync has started. Please wait a moment and refresh this page.</div><?php endif; ?>
<?php if ($sync_status === 'sync_complete'): ?><div class="message success">Service sync completed successfully.</div><?php endif; ?>


<div class="top-actions" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
    
    <button class="btn btn-primary btn-sync" 
            data-job="smm_service_sync" 
            data-file="smm_sync_action.php" 
            data-loading-text="Syncing Services... (This may take 1-5 minutes)">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle; margin-right: 5px;"><path d="M21.5 2v6h-6"></path><path d="M2.5 22v-6h6"></path><path d="M22 11.5A10 10 0 0 0 12 2C6.48 2 2 6.48 2 12a10 10 0 0 0 10 10 10 10 0 0 0 10-10"></path></svg>
        Sync Services Now
    </button>
    
    <div class="filter-tabs" style="display: flex; gap: 10px;">
        <a href="smm_services.php?show=active" class="btn <?php echo ($show == 'active') ? 'btn-primary' : 'btn-secondary'; ?>" style="text-decoration: none;">
            Active
        </a>
        <a href="smm_services.php?show=disabled" class="btn <?php echo ($show == 'disabled') ? 'btn-primary' : 'btn-secondary'; ?>" style="text-decoration: none;">
            Disabled
        </a>
        <a href="smm_services.php?show=all" class="btn <?php echo ($show == 'all') ? 'btn-primary' : 'btn-secondary'; ?>" style="text-decoration: none;">
            All
        </a>
    </div>
</div>

<div class="admin-table-responsive" style="margin-top: 20px;">
    <div class="category-manager">
        <?php if (empty($categories)): ?>
            <div class="message info" style="margin: 20px;">
                No services found for '<?php echo sanitize($show); ?>' filter.
                <?php if ($show == 'active'): ?>
                    Try syncing services or check the 'Disabled' tab.
                <?php endif; ?>
            </div>
        <?php else: ?>
            <?php foreach ($categories as $category_name): ?>
                <div class="category-card">
                    <div class="category-header">
                        <h2><?php echo sanitize($category_name); ?> (<?php echo count($services_by_category[$category_name]); ?> Services)</h2>
                        
                        <div class="category-actions">
                            <a href="smm_edit_service.php?category=<?php echo urlencode($category_name); ?>" class="btn-small btn-info" title="Edit Category Name">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"></path><path d="M16.5 3.5l4 4L7.5 19H3v-4L16.5 3.5z"></path></svg>
                                Edit Name
                            </a>
                            <a href="smm_sync_action.php?deactivate_category=<?php echo urlencode($category_name); ?>" 
                               class="btn-small btn-danger" 
                               onclick="return confirm('Are you sure you want to DEACTIVATE ALL SERVICES in the category: <?php echo sanitize($category_name); ?>? They will be hidden from users.');" 
                               title="Deactivate All Services in this Category">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                Deactivate All
                            </a>
                        </div>
                    </div>
                    
                    <div class="category-body">
                        <table class="admin-table service-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Service Name</th>
                                    <th>Provider</th>
                                    <th>Rate (User)</th>
                                    <th>Rate (Provider)</th>
                                    <th>Min/Max</th>
                                    <th>Active</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($services_by_category[$category_name] as $service): ?>
                                    <tr>
                                        <td>#<?php echo $service['id']; ?></td>
                                        <td><?php echo sanitize($service['name']); ?></td>
                                        <td><?php echo sanitize($service['provider_name']); ?></td>
                                        <td><?php echo formatCurrency($service['service_rate']); ?></td>
                                        <td><?php echo formatCurrency($service['provider_rate']); ?></td>
                                        <td><?php echo number_format($service['min']); ?>/<?php echo number_format($service['max']); ?></td>
                                        <td>
                                            <span class="status-badge status-<?php echo $service['is_active'] ? 'active' : 'inactive'; ?>">
                                                <?php echo $service['is_active'] ? 'Yes' : 'No'; ?>
                                            </span>
                                        </td>
                                        
                                        <td class="action-buttons">
                                            <a href="smm_edit_service.php?id=<?php echo $service['id']; ?>" class="btn-small btn-info" title="Edit Service">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"></path><path d="M16.5 3.5l4 4L7.5 19H3v-4L16.5 3.5z"></path></svg>
                                            </a>
                                            
                                            <?php if ($service['is_active'] == 1): // Agar service ACTIVE hai ?>
                                                <a href="smm_sync_action.php?deactivate_service=<?php echo $service['id']; ?>" 
                                                   class="btn-small btn-danger" 
                                                   onclick="return confirm('Are you sure you want to DEACTIVATE Service #<?php echo $service['id']; ?>: <?php echo sanitize($service['name']); ?>?');" 
                                                   title="Deactivate Service">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                                </a>
                                            <?php else: // Agar service DISABLED hai ?>
                                                <a href="smm_sync_action.php?delete_service=<?php echo $service['id']; ?>" 
                                                   class="btn-small btn-danger" 
                                                   onclick="return confirm('PERMANENT DELETE! Are you sure? This will fail if it has past orders.');" 
                                                   title="Delete Service Permanently">
                                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                                </a>
                                            <?php endif; ?>

                                        </td>
                                        </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

<style>
/* Aapki original styles */
.category-manager {
    border: 1px solid var(--admin-border-color);
    border-radius: 8px;
    overflow: hidden;
}
.category-card {
    border-bottom: 1px solid var(--admin-border-color);
}
.category-card:last-child {
    border-bottom: none;
}
.category-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    background: var(--admin-sidebar-bg);
    cursor: pointer;
}
.category-header h2 {
    margin: 0;
    font-size: 1.1rem;
    color: var(--admin-text-color);
}
.category-actions {
    display: flex;
    gap: 10px;
}
.category-actions a {
    text-decoration: none;
}
.category-body {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease-out;
    background: var(--admin-card-bg);
}
.category-card.active .category-body {
    max-height: 2000px; /* Suficiently large value */
    overflow: auto; /* Allow scrolling if table is too big */
}
.service-table th, .service-table td {
    padding: 10px 15px;
    border: none;
}
.service-table tbody tr:nth-child(even) {
    background: var(--admin-sidebar-bg);
}

/* Edit/Delete Buttons */
.btn-small {
    padding: 5px 10px;
    font-size: 0.8rem;
    display: inline-flex;
    align-items: center;
    gap: 5px;
    border-radius: 4px;
}
.btn-info { background: #007bff; color: white; border: none; }
.btn-danger { background: #dc3545; color: white; border: none; }
.status-active { background: #28a745; color: white; }
.status-inactive { background: #6c757d; color: white; }

/* Filter Buttons Style */
.btn-secondary {
    background-color: #6c757d;
    color: white;
    text-decoration: none; /* Added */
}
.btn-secondary:hover {
    background-color: #5a6268;
}

</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Accordion logic (Aapka original script)
    const categoryCards = document.querySelectorAll('.category-card');
    categoryCards.forEach(card => {
        const header = card.querySelector('.category-header');
        header.addEventListener('click', function(e) {
            // Stop click if it's on a button
            if (e.target.closest('a') || e.target.closest('button')) {
                return;
            }
            
            // Toggle active state on the card
            card.classList.toggle('active');
            
            // Toggle visibility of the body
            const body = card.querySelector('.category-body');
            if (card.classList.contains('active')) {
                // Open: Set a large height to allow scrolling
                body.style.maxHeight = body.scrollHeight + "px";
            } else {
                // Close: Collapse the height
                body.style.maxHeight = "0";
            }
        });
    });

    // --- NAYA SCRIPT: Loading animation script (Cron Jobs page se copy kiya) ---
    const overlay = document.getElementById('loading-overlay');
    const loadingText = document.getElementById('loading-text');
    const syncButtons = document.querySelectorAll('.btn-sync'); // Ab "Sync" button ko target karega

    syncButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault(); // Form submit hone se rokein
            
            if (!confirm('Do you want to start a full service sync from providers? This may take up to 2 minutes.')) {
                return;
            }

            const jobName = this.dataset.job;
            const jobFile = this.dataset.file;
            const jobLoadingText = this.dataset.loadingText || 'Processing...';

            if (!jobName || !jobFile) {
                alert('Error: Job or File not specified for this button.');
                return;
            }

            // 1. Loading animation dikhayein
            loadingText.textContent = jobLoadingText;
            overlay.classList.add('active');
            
            const fetchUrl = `${jobFile}?job=${jobName}`; // 'smm_sync_action.php?job=smm_service_sync'

            // 2. AJAX call karein
            fetch(fetchUrl)
                .then(response => {
                    const contentType = response.headers.get('content-type');
                    if (contentType && contentType.indexOf('application/json') !== -1) {
                        return response.json();
                    } else {
                        return response.text().then(text => {
                            throw new Error('Server did not return valid JSON. Response: \n' + text);
                        });
                    }
                })
                .then(data => {
                    // 3. Success par loading chhupayein aur result dikhayein
                    overlay.classList.remove('active');
                    if (data.success) {
                        alert('Success!\n\n' + data.message.replace(/<br\s*\/?>/gi, '\n'));
                        window.location.href = 'smm_services.php?show=active'; // Wapas Active tab par bhej dein
                    } else {
                        alert('Error:\n\n' + data.message);
                    }
                })
                .catch(error => {
                    // 4. Error par loading chhupayein aur error dikhayein
                    overlay.classList.remove('active');
                    console.error('Fetch Error:', error);
                    alert('An error occurred while communicating with the server.\n' + error.message);
                });
        });
    });
});
</script>

<?php include '_footer.php'; ?>