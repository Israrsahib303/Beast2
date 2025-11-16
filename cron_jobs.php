<?php
include '_header.php';
?>

<h1>Cron Job Manager</h1>
<p>These are scripts that should be run automatically by your server at set intervals. You can also run them manually here.</p>
<p>Apne cPanel mein yeh commands set karein:</p>

<div class="admin-table-responsive">
    <table class="admin-table">
        <thead>
            <tr>
                <th>Cron Job</th>
                <th>Recommended Schedule</th>
                <th>Manual Run</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <strong>Sync SMM Services</strong>
                    <p>Provider se services/prices ko sync karta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/smm_service_sync.php"
                    </code>
                </td>
                <td>Once every 24 hours</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="smm_service_sync" 
                            data-file="smm_sync_action.php"
                            data-loading-text="Syncing Services... (This may take 1-5 minutes)">
                        Sync Now
                    </button>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Sync SMM Order Statuses</strong>
                    <p>Pending SMM orders ka status check karta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/smm_status_sync.php"
                    </code>
                </td>
                <td>Every 15 minutes</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="smm_status_sync"
                            data-file="smm_status_sync.php" 
                            data-loading-text="Syncing Order Statuses...">
                        Sync Now
                    </button>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Check Email for Auto-Payments</strong>
                    <p>NayaPay/EasyPaisa emails check karke wallet auto-fund karta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/check_email.php"
                    </code>
                </td>
                <td>Every 5 minutes</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="check_email"
                            data-file="check_email.php" 
                            data-loading-text="Checking Emails...">
                        Sync Now
                    </button>
                </td>
            </tr>
             <tr>
                <td>
                    <strong>Place SMM Orders</strong>
                    <p>Pending SMM orders ko API par bhejta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/smm_order_placer.php"
                    </code>
                </td>
                <td>Every 1 minute</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="smm_order_placer"
                            data-file="smm_order_placer.php" 
                            data-loading-text="Placing Orders...">
                        Sync Now
                    </button>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Expire Subscriptions</strong>
                    <p>Purane (expired) subscription orders ko 'expired' mark karta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/expire_subscriptions.php"
                    </code>
                </td>
                <td>Once every hour</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="expire_subscriptions"
                            data-file="expire_subscriptions.php" 
                            data-loading-text="Expiring Subscriptions...">
                        Sync Now
                    </button>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Recalculate User Wallets</strong>
                    <p>(Maintenance) Har user ka balance dobara calculate karta hai.</p>
                    <code class="cron-command">
                        curl "<?php echo SITE_URL; ?>/includes/cron/recalc_wallet.php"
                    </code>
                </td>
                <td>Manually (if needed)</td>
                <td class="action-buttons">
                    <button class="btn-sync" 
                            data-job="recalc_wallet"
                            data-file="recalc_wallet.php" 
                            data-loading-text="Recalculating Wallets...">
                        Sync Now
                    </button>
                </td>
            </tr>
           
        </tbody>
    </table>
</div>


<script>
document.addEventListener('DOMContentLoaded', function() {
    const overlay = document.getElementById('loading-overlay');
    const loadingText = document.getElementById('loading-text');
    const syncButtons = document.querySelectorAll('.btn-sync');

    syncButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault(); 
            
            // Confirm prompt sirf sync ke liye
            if (this.dataset.job === 'smm_service_sync') {
                if (!confirm('Do you want to start a full service sync from providers? This may take up to 2 minutes.')) {
                    return;
                }
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
            
            // File ko job parameter ke saath call karein
            const fetchUrl = `${jobFile}?job=${jobName}`;

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
                        if(jobName === 'smm_service_sync') {
                           window.location.href = 'smm_services.php?show=active'; 
                        } else {
                           window.location.reload();
                        }
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