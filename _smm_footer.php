</div> <nav class="smm-bottom-nav">
        <a href="smm_dashboard.php" class="<?php echo ($current_page == 'smm_dashboard.php') ? 'active' : ''; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3v18h18"></path><path d="m18.7 8-5.1 5.2-2.8-2.7L7 15.2"></path></svg>
            <span>Dashboard</span>
        </a>
        
        <a href="smm_order.php" class="<?php echo ($current_page == 'smm_order.php') ? 'active' : ''; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2z"></path><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
            <span>New Order</span>
        </a>
        
        <a href="smm_history.php" class="<?php echo ($current_page == 'smm_history.php') ? 'active' : ''; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
            <span>Orders</span>
        </a>
        
        <a href="index.php" class="<?php echo ($current_page == 'index.php') ? 'active' : ''; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
            <span>Subs</span>
        </a>
    </nav>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    
    <script src="../assets/js/smm_main.js?v=2.9"></script>
    
    <script>
    document.addEventListener("DOMContentLoaded", () => {
        // Check karein ke graph canvas mojood hai
        const ctx = document.getElementById('smm-spending-chart');
        if (ctx && typeof Chart !== 'undefined' && window.smmGraphLabels && window.smmGraphValues) {
            
            // Graph banayein
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: window.smmGraphLabels, // PHP se 'D, j M' format
                    datasets: [{
                        label: 'PKR Spent',
                        data: window.smmGraphValues, // PHP se [0, 0, 5.85, ...]
                        backgroundColor: 'rgba(13, 110, 253, 0.1)',
                        borderColor: 'rgba(13, 110, 253, 1)',
                        borderWidth: 3,
                        fill: true,
                        tension: 0.4 // Line ko smooth karein
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                // 'PKR 100' likha aaye
                                callback: function(value, index, values) {
                                    return 'PKR ' + value;
                                }
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false // 'PKR Spent' label ko chupayein
                        }
                    }
                }
            });
        }
    });
    </script>
    
</body>
</html>