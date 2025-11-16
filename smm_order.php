<?php
// Naye SMM Header aur Footer files istemal karein
include '_smm_header.php'; 

$error = $_GET['error'] ?? '';
$success = $_GET['success'] ?? '';
$user_id = (int)$_SESSION['user_id']; // User ID yahan define karein


// --- SMM Services ko DB se fetch karein ---
try {
    // 1. Pehle Main Categories (Cards) ko fetch karein
    $stmt_main_cats = $db->query("SELECT * FROM smm_categories WHERE name != '' ORDER BY sort_order ASC, name ASC");
    $main_categories = $stmt_main_cats->fetchAll();
    
    $main_cat_map = [];
    foreach ($main_categories as $mc) {
        $main_cat_map[$mc['name']] = $mc['icon_filename'];
    }

    // 2. Tamam Services ko fetch karein
    $stmt_services = $db->query("
        SELECT s.*, f.id as is_favorite
        FROM smm_services s
        LEFT JOIN user_favorite_services f ON s.id = f.service_id AND f.user_id = $user_id
        WHERE s.is_active = 1
        ORDER BY s.category ASC, s.name ASC
    ");
    $all_services = $stmt_services->fetchAll();
    
    $services_by_main_category = [];
    $services_data_json = []; 
    $sub_categories_by_main = [];

    // 3. Tamam Services ko group karein
    foreach ($all_services as $service) {
        
        if (preg_match('/^([\w\s]+?)(?:\s\»\s|\s\-\s|\s\d|$)/i', $service['category'], $matches)) {
            $main_category_name = trim($matches[1]);
        } else {
            $main_category_name = trim($service['category']);
        }
        
        $full_category_name = trim($service['category']);
        $services_by_main_category[$main_category_name][$full_category_name][] = $service;
        if (!isset($sub_categories_by_main[$main_category_name][$full_category_name])) {
             $sub_categories_by_main[$main_category_name][$full_category_name] = 1;
        }

        $services_data_json[$service['id']] = [
            'rate' => (float)$service['service_rate'],
            'min' => (int)$service['min'],
            'max' => (int)$service['max'],
            'avg_time' => formatSmmAvgTime($service['avg_time']),
            'has_refill' => (bool)$service['has_refill'],
            'has_cancel' => (bool)$service['has_cancel'],
            'name' => sanitize($service['name']),
            'desc' => nl2br($service['description'] ?? 'No description available.'),
            'is_comments_service' => (stripos($service['name'], 'Comment') !== false || stripos($service['category'], 'Comment') !== false)
        ];
    }
    
} catch (PDOException $e) {
    $main_categories = [];
    $services_by_main_category = [];
    $services_data_json = [];
    $error = "Database Error: Cannot load services. " . $e->getMessage();
}
// --- LOGIC KHATAM ---
?>

<div class="app-header">
    <div class="header-left">
        <p>Your Balance</p>
        <h2 style="color: var(--app-primary);"><?php echo formatCurrency($user_balance); ?></h2>
    </div>
    <div class="header-right">
        <a href="add-funds.php" class="btn-add-funds-app" style="background: var(--app-primary); color: white;">+</a>
    </div>
</div>

<?php if ($error): ?><div class="app-message app-error"><?php echo urldecode($error); ?></div><?php endif; ?>
<?php if ($success): ?><div class="app-message app-success"><?php echo sanitize($success); ?></div><?php endif; ?>

<h2 class="section-header" style="margin-top: 0; font-size: 1.5rem;">Order New Service</h2>
<div class="search-bar">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
    <input type="text" id="service-search" class="form-control-app" placeholder="Search for a service...">
</div>

<div class="platform-grid" id="platform-grid">
    <?php if (empty($main_categories)): ?>
        <div class="app-message">No SMM platforms found. Please sync services AND categories in Admin Panel.</div>
    <?php else: ?>
        <?php foreach ($main_categories as $main_cat): ?>
            <div class="platform-card" data-platform="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat['name']))); ?>">
                <div class="platform-card-icon">
                    <?php if (!empty($main_cat['icon_filename'])): ?>
                        <img src="../assets/img/icons/<?php echo sanitize($main_cat['icon_filename']); ?>" alt="<?php echo sanitize($main_cat['name']); ?>">
                    <?php else: ?>
                        <span class="placeholder-icon"><?php echo strtoupper(substr($main_cat['name'], 0, 1)); ?></span>
                    <?php endif; ?>
                </div>
                <span class="platform-card-title"><?php echo sanitize($main_cat['name']); ?></span>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>


<div class="category-accordion-container" id="category-accordion-container" style="display: none;">
    
    <button id="back-to-platforms-btn">&larr; Back to Platforms</button>
    
    <?php foreach ($main_categories as $main_cat): ?>
        <?php $main_cat_name = $main_cat['name']; ?>
        
        <div class="category-accordion" id="accordion-<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat_name))); ?>" data-platform-accordion="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat_name))); ?>" style="display: none;">
            
            <?php if (isset($sub_categories_by_main[$main_cat_name])): ?>
                <?php foreach (array_keys($sub_categories_by_main[$main_cat_name]) as $sub_cat_name): ?>
                    
                    <div class="category-group">
                        <div class="category-header" data-category="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $sub_cat_name))); ?>">
                            <div class="category-header-icon">
                                <span><?php echo strtoupper(substr($sub_cat_name, 0, 1)); ?></span>
                            </div>
                            <h3><?php echo sanitize($sub_cat_name); ?></h3>
                            <svg class="chevron" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                        
                        <div class="service-list" id="category-<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $sub_cat_name))); ?>">
                            <?php if (isset($services_by_main_category[$main_cat_name][$sub_cat_name])): ?>
                                <?php foreach ($services_by_main_category[$main_cat_name][$sub_cat_name] as $service): ?>
                                    
                                    <?php
                                    $price_alert_badge = '';
                                    if (!empty($service['old_price']) && (float)$service['old_price'] != (float)$service['service_rate']) {
                                        if ((float)$service['service_rate'] < (float)$service['old_price']) {
                                            $price_alert_badge = '<span class="price-alert price-drop" title="Price Dropped!">📉</span>';
                                        } else {
                                            $price_alert_badge = '<span class="price-alert price-hike" title="Price Updated">📈</span>';
                                        }
                                    }
                                    ?>

                                    <div class="service-item" 
                                         data-service-id="<?php echo $service['id']; ?>"
                                         data-service-name="<?php echo sanitize($service['name']); ?>">
                                        
                                        <div class="service-item-header">
                                            
                                            <span class="service-item-name">
                                                <?php if ($service['is_favorite']): ?>
                                                    <span class="smm-icon" title="Favorite">⭐</span>
                                                <?php endif; ?>
                                                
                                                <?php if ($service['has_refill']): ?>
                                                    <span class="smm-icon" title="Refill Available">♻️</span>
                                                <?php endif; ?>
                                                
                                                <?php if (stripos($service['name'], 'nstant') !== false || stripos($service['name'], '0-5 Min') !== false || (isset($service['avg_time']) && (int)$service['avg_time'] <= 15)): ?>
                                                    <span class="smm-icon" title="Instant/Fast Start">⚡️</span>
                                                <?php endif; ?>
                                                
                                                <?php if ($service['has_cancel']): ?>
                                                    <span class="smm-icon" title="Cancel Button Available">✅</span>
                                                <?php endif; ?>
                                                
                                                <?php echo sanitize($service['name']); ?>
                                            </span>

                                            <span class="service-item-rate">
                                                <?php echo formatCurrency($service['service_rate']); ?> / 1k <?php echo $price_alert_badge; ?>
                                            </span>
                                        </div>
                                        
                                        <div class="service-item-meta">
                                            <span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20v-6M6 20v-2M18 20v-4"></path></svg>
                                                Avg. Time: <?php echo formatSmmAvgTime($service['avg_time']); ?>
                                            </span>
                                            <?php if ($service['has_refill']): ?>
                                            <span class="refill-yes">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                                Refill Available
                                            </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="app-message">No services found for this platform.</div>
            <?php endif; ?>
            
        </div>
    <?php endforeach; ?>
</div>

<div class="modal-overlay" id="order-modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modal-title-placeholder" style="font-size: 1.3rem; font-weight: 600; margin: 0;">Place Order</h2>
            <button class="modal-close" id="modal-close-btn">&times;</button>
        </div>
        
        <div class="service-description" id="modal-service-desc">
            Service description will load here...
        </div>

        <div class="service-name-box">
            <p id="modal-service-name-text">Service Name Will Load Here...</p>
        </div>

        <div class="service-stats-box" id="modal-service-stats">
            </div>

        <form id="modal-order-form" action="smm_order_action.php" method="POST">
            <input type="hidden" name="service_id" id="modal-service-id">
            
            <div class="normal-group">
                <div class="app-form-group">
                    <label for="modal-link">Link</label>
                    <input type="text" name="link" id="modal-link" class="form-control-app" placeholder="https://..." required>
                    <div class="link-detector" id="link-detector-msg"></div>
                </div>
                
                <div class="app-form-group">
                    <label for="modal-quantity" id="modal-quantity-label">Quantity</label>
                    <input type="number" name="quantity" id="modal-quantity" class="form-control-app" placeholder="1000" required>
                    <small id="modal-min-max-msg" style="color: var(--app-secondary);"></small>
                </div>
            </div>
            
            <div class="comments-group" style="display: none;">
                <button type="button" class="btn-app-secondary" id="open-generator-btn">💡 Generate Comments</button>
                
                <div class="app-form-group">
                    <label for="modal-comments">Comments (One comment per line)</label>
                    <textarea name="comments" id="modal-comments" class="form-control-app" rows="5" placeholder="Nice pic...&#10;Wow...&#10;Amazing..."></textarea>
                </div>
            </div>
            
            <div class="charge-display">
                <p>Total Charge</p>
                <h2 id="modal-total-charge">PKR 0.00</h2>
            </div>
            
            <button type="submit" class="btn-app-primary" disabled>Place Order</button>
        </form>
    </div>
</div>

<div class="generator-modal-overlay" id="generator-modal">
    <div class="generator-modal-content">
        <div class="generator-modal-header">
            <h3>Comments Generator</h3>
            <button type="button" class="modal-close" id="generator-close-btn">&times;</button>
        </div>
        
        <p style="font-size: 0.9rem; color: var(--app-secondary); margin-bottom: 1rem;">
            Generate comments aur unhein copy kar ke pichle box mein paste karein.
        </p>
        
        <div class="comment-presets">
            <button type="button" class="btn-gen" data-lang="eng-positive">English (Positive)</button>
            <button type="button" class="btn-gen" data-lang="hinglish-positive">Hinglish (Positive)</button>
            <button type="button" class="btn-gen" data-lang="urdu-positive">Urdu (Positive)</button>
        </div>
        
        <textarea id="generator-output" class="comment-output" readonly></textarea>
        
        <div class="generator-actions">
            <button type="button" class="btn-app-primary" id="copy-comments-btn" style="width: 100%;">Copy to Clipboard</button>
        </div>
    </div>
</div>
<audio id="cha-ching-sound" src="../assets/sounds/cha-ching.mp3" preload="auto"></audio>


<script>
    // Tamam services ka data PHP se JS mein lein
    window.allServicesData = <?php echo json_encode($services_data_json); ?>;
</script>

<?php include '_smm_footer.php'; // Naya SMM Footer istemal karein ?><?php if ($error): ?><div class="app-message app-error"><?php echo urldecode($error); ?></div><?php endif; ?>
<?php if ($success): ?><div class="app-message app-success"><?php echo sanitize($success); ?></div><?php endif; ?>

<h2 class="section-header" style="margin-top: 0; font-size: 1.5rem;">Order New Service</h2>
<div class="search-bar">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
    <input type="text" id="service-search" class="form-control-app" placeholder="Search for a service...">
</div>

<div class="platform-grid" id="platform-grid">
    <?php if (empty($main_categories)): ?>
        <div class="app-message">No SMM platforms found. Please sync services AND categories in Admin Panel.</div>
    <?php else: ?>
        <?php foreach ($main_categories as $main_cat): ?>
            <div class="platform-card" data-platform="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat['name']))); ?>">
                <div class="platform-card-icon">
                    <?php if (!empty($main_cat['icon_filename'])): ?>
                        <img src="../assets/img/icons/<?php echo sanitize($main_cat['icon_filename']); ?>" alt="<?php echo sanitize($main_cat['name']); ?>">
                    <?php else: ?>
                        <span class="placeholder-icon"><?php echo strtoupper(substr($main_cat['name'], 0, 1)); ?></span>
                    <?php endif; ?>
                </div>
                <span class="platform-card-title"><?php echo sanitize($main_cat['name']); ?></span>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>


<div class="category-accordion-container" id="category-accordion-container" style="display: none;">
    
    <button id="back-to-platforms-btn">&larr; Back to Platforms</button>
    
    <?php foreach ($main_categories as $main_cat): ?>
        <?php $main_cat_name = $main_cat['name']; ?>
        
        <div class="category-accordion" id="accordion-<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat_name))); ?>" data-platform-accordion="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $main_cat_name))); ?>" style="display: none;">
            
            <?php if (isset($sub_categories_by_main[$main_cat_name])): ?>
                <?php foreach (array_keys($sub_categories_by_main[$main_cat_name]) as $sub_cat_name): ?>
                    
                    <div class="category-group">
                        <div class="category-header" data-category="<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $sub_cat_name))); ?>">
                            <div class="category-header-icon">
                                <span><?php echo strtoupper(substr($sub_cat_name, 0, 1)); ?></span>
                            </div>
                            <h3><?php echo sanitize($sub_cat_name); ?></h3>
                            <svg class="chevron" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </div>
                        
                        <div class="service-list" id="category-<?php echo sanitize(strtolower(preg_replace('/[^a-z0-9]+/', '-', $sub_cat_name))); ?>">
                            <?php if (isset($services_by_main_category[$main_cat_name][$sub_cat_name])): ?>
                                <?php foreach ($services_by_main_category[$main_cat_name][$sub_cat_name] as $service): ?>
                                    
                                    <?php
                                    $price_alert_badge = '';
                                    if (!empty($service['old_price']) && (float)$service['old_price'] != (float)$service['service_rate']) {
                                        if ((float)$service['service_rate'] < (float)$service['old_price']) {
                                            $price_alert_badge = '<span class="price-alert price-drop" title="Price Dropped!">📉</span>';
                                        } else {
                                            $price_alert_badge = '<span class="price-alert price-hike" title="Price Updated">📈</span>';
                                        }
                                    }
                                    ?>

                                    <div class="service-item" 
                                         data-service-id="<?php echo $service['id']; ?>"
                                         data-service-name="<?php echo sanitize($service['name']); ?>">
                                        
                                        <div class="service-item-header">
                                            
                                            <span class="service-item-name">
                                                <?php if ($service['is_favorite']): ?>
                                                    <span class="smm-icon" title="Favorite">⭐</span>
                                                <?php endif; ?>
                                                
                                                <?php if ($service['has_refill']): ?>
                                                    <span class="smm-icon" title="Refill Available">♻️</span>
                                                <?php endif; ?>
                                                
                                                <?php if (stripos($service['name'], 'nstant') !== false || stripos($service['name'], '0-5 Min') !== false || (isset($service['avg_time']) && (int)$service['avg_time'] <= 15)): ?>
                                                    <span class="smm-icon" title="Instant/Fast Start">⚡️</span>
                                                <?php endif; ?>
                                                
                                                <?php if ($service['has_cancel']): ?>
                                                    <span class="smm-icon" title="Cancel Button Available">✅</span>
                                                <?php endif; ?>
                                                
                                                <?php echo sanitize($service['name']); ?>
                                            </span>

                                            <span class="service-item-rate">
                                                <?php echo formatCurrency($service['service_rate']); ?> / 1k <?php echo $price_alert_badge; ?>
                                            </span>
                                        </div>
                                        
                                        <div class="service-item-meta">
                                            <span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20v-6M6 20v-2M18 20v-4"></path></svg>
                                                Avg. Time: <?php echo formatSmmAvgTime($service['avg_time']); ?>
                                            </span>
                                            <?php if ($service['has_refill']): ?>
                                            <span class="refill-yes">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                                Refill Available
                                            </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="app-message">No services found for this platform.</div>
            <?php endif; ?>
            
        </div>
    <?php endforeach; ?>
</div>

<div class="modal-overlay" id="order-modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modal-title-placeholder" style="font-size: 1.3rem; font-weight: 600; margin: 0;">Place Order</h2>
            <button class="modal-close" id="modal-close-btn">&times;</button>
        </div>
        
        <div class="service-description" id="modal-service-desc">
            Service description will load here...
        </div>

        <div class="service-name-box">
            <p id="modal-service-name-text">Service Name Will Load Here...</p>
        </div>

        <div class="service-stats-box" id="modal-service-stats">
            </div>

        <form id="modal-order-form" action="smm_order_action.php" method="POST">
            <input type="hidden" name="service_id" id="modal-service-id">
            
            <div class="normal-group">
                <div class="app-form-group">
                    <label for="modal-link">Link</label>
                    <input type="text" name="link" id="modal-link" class="form-control-app" placeholder="https://..." required>
                    <div class="link-detector" id="link-detector-msg"></div>
                </div>
                
                <div class="app-form-group">
                    <label for="modal-quantity" id="modal-quantity-label">Quantity</label>
                    <input type="number" name="quantity" id="modal-quantity" class="form-control-app" placeholder="1000" required>
                    <small id="modal-min-max-msg" style="color: var(--app-secondary);"></small>
                </div>
            </div>
            
            <div class="comments-group" style="display: none;">
                <button type="button" class="btn-app-secondary" id="open-generator-btn">💡 Generate Comments</button>
                
                <div class="app-form-group">
                    <label for="modal-comments">Comments (One comment per line)</label>
                    <textarea name="comments" id="modal-comments" class="form-control-app" rows="5" placeholder="Nice pic...&#10;Wow...&#10;Amazing..."></textarea>
                </div>
            </div>
            
            <div class="charge-display">
                <p>Total Charge</p>
                <h2 id="modal-total-charge">PKR 0.00</h2>
            </div>
            
            <button type="submit" class="btn-app-primary" disabled>Place Order</button>
        </form>
    </div>
</div>

<div class="generator-modal-overlay" id="generator-modal">
    <div class="generator-modal-content">
        <div class="generator-modal-header">
            <h3>Comments Generator</h3>
            <button type="button" class="modal-close" id="generator-close-btn">&times;</button>
        </div>
        
        <p style="font-size: 0.9rem; color: var(--app-secondary); margin-bottom: 1rem;">
            Generate comments aur unhein copy kar ke pichle box mein paste karein.
        </p>
        
        <div class="comment-presets">
            <button type="button" class="btn-gen" data-lang="eng-positive">English (Positive)</button>
            <button type="button" class="btn-gen" data-lang="hinglish-positive">Hinglish (Positive)</button>
            <button type="button" class="btn-gen" data-lang="urdu-positive">Urdu (Positive)</button>
        </div>
        
        <textarea id="generator-output" class="comment-output" readonly></textarea>
        
        <div class="generator-actions">
            <button type="button" class="btn-app-primary" id="copy-comments-btn" style="width: 100%;">Copy to Clipboard</button>
        </div>
    </div>
</div>
<audio id="cha-ching-sound" src="../assets/sounds/cha-ching.mp3" preload="auto"></audio>


<script>
    // Tamam services ka data PHP se JS mein lein
    window.allServicesData = <?php echo json_encode($services_data_json); ?>;
</script>

<?php include '_smm_footer.php'; // Naya SMM Footer istemal karein ?>
