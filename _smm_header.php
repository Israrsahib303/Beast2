<?php
require_once __DIR__ . '/../includes/helpers.php';
requireLogin(); // Protect all user pages
$user_balance = getUserBalance($_SESSION['user_id']);
$current_page = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>SMM Panel - <?php echo $GLOBALS['settings']['site_name'] ?? 'SubHub'; ?></title>
    
    <link rel="stylesheet" href="../assets/css/smm_style.css?v=2.2">
    
    <style>
        /* --- Background Fix (White Theme) --- */
        :root {
            --app-bg: #FFFFFF;
            --app-card: #F8F9FA;
            --app-text: #212529;
            --app-text-muted: #6C757D;
        }

        /* --- Popup Height & Scroll Fix --- */
        .modal-content {
            max-height: 85vh; /* Screen ki height ka 85% se zyada na ho */
            overflow-y: auto;  /* Agar content lamba ho toh scrollbar de */
            padding-bottom: 100px; /* Neeche space taake 'Place Order' button na chupay */
        }
        .generator-modal-content {
            max-height: 90vh;
            overflow-y: auto;
        }
        
        /* --- Stats Box (Refill, Cancel, Time) ka CSS --- */
        .service-stats-box {
            display: grid;
            grid-template-columns: 1fr;
            gap: 10px;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.03);
            border-radius: 8px;
            margin-top: 15px;
        }
        @media (min-width: 576px) { .service-stats-box { grid-template-columns: 1fr 1fr; } }
        .stat-item { display: flex; align-items: center; gap: 12px; }
        .stat-icon { width: 36px; height: 36px; border-radius: 50%; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .stat-icon svg { width: 18px; height: 18px; stroke-width: 2.5; }
        .stat-icon-time { background-color: rgba(255, 159, 64, 0.2); color: #ff9f40; }
        .stat-icon-refill.yes { background-color: rgba(25, 135, 84, 0.2); color: #198754; }
        .stat-icon-cancel.yes { background-color: rgba(25, 135, 84, 0.2); color: #198754; }
        .stat-icon-refill.no { background-color: rgba(220, 53, 69, 0.2); color: #dc3545; }
        .stat-icon-cancel.no { background-color: rgba(220, 53, 69, 0.2); color: #dc3545; }
        .stat-info { display: flex; flex-direction: column; }
        .stat-info strong { font-size: 0.9rem; color: #212529; font-weight: 600; }
        .stat-info span { font-size: 0.85rem; color: #6C757D; }
        .stat-info .yes { color: #198754; }
        .stat-info .no { color: #dc3545; }
        
        /* --- Scrolling Description ka CSS --- */
        .service-description { height: 120px; overflow: hidden; position: relative; background: rgba(0,0,0,0.02); border: 1px solid rgba(0,0,0,0.05); border-radius: 8px; padding: 0; }
        .service-description p { position: absolute; width: 100%; margin: 0; padding: 10px; box-sizing: border-box; transform: translateY(120px); animation: marquee-scroll 20s linear infinite; will-change: transform; color: #333; }
        .service-description:hover p { animation-play-state: paused; }
        @keyframes marquee-scroll { from { transform: translateY(120px); } to { transform: translateY(-100%); } }

        /* --- Platform Cards (YouTube, Instagram...) --- */
        .platform-grid {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 2 columns */
            gap: 15px;
            margin-top: 15px;
        }
        @media (min-width: 768px) { .platform-grid { grid-template-columns: 1fr 1fr 1fr 1fr; } } /* 4 columns on desktop */

        .platform-card {
            background: var(--app-card);
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            animation: fadeIn 0.5s ease;
        }
        .platform-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
        }

        .platform-card-icon {
            width: 50px;
            height: 50px;
            margin: 0 auto 15px auto;
            border-radius: 10px;
            background-color: rgba(0,0,0,0.05); /* Placeholder */
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .platform-card-icon img {
            width: 30px;
            height: 30px;
        }
        .platform-card-icon .placeholder-icon {
            font-size: 24px;
            color: var(--app-text-muted);
            font-weight: bold;
        }

        .platform-card-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--app-text);
        }

        /* Back Button */
        #back-to-platforms-btn {
            background: var(--app-primary);
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 15px;
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* --- Custom Comments & Generator Modal CSS --- */
        .comments-group { display: none; } /* Default mein chupa ho ga */
        .btn-app-secondary {
            background: var(--app-bg);
            color: var(--app-primary);
            border: 1px solid var(--app-primary);
            width: 100%;
            padding: 0.8rem;
            font-weight: 600;
            border-radius: var(--app-radius-sm);
            cursor: pointer;
            margin-top: -0.5rem;
            margin-bottom: 1rem;
        }
        .generator-modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.7); /* Thora dark */
            z-index: 1003; /* Main popup se oopar */
            display: none;
            opacity: 0;
            transition: opacity 0.3s ease;
            align-items: center; 
            justify-content: center; 
            padding: 1rem;
        }
        .generator-modal-overlay.active {
            display: flex;
            opacity: 1;
        }
        .generator-modal-content {
            background: var(--app-bg);
            padding: 1.5rem;
            border-radius: var(--app-radius-md);
            width: 100%;
            max-width: 400px;
            z-index: 1004;
            animation: fadeIn 0.3s ease;
        }
        .generator-modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        .generator-modal-header h3 {
            font-size: 1.2rem;
            color: var(--app-dark);
            margin: 0;
        }
        .comment-presets {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 1rem;
        }
        .comment-presets button {
            background: var(--app-primary);
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8rem;
        }
        .comment-output {
            width: 100%;
            height: 150px;
            font-family: monospace;
            font-size: 0.9rem;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .generator-actions {
            display: flex;
            gap: 10px;
            margin-top: 1rem;
        }
        
        /* --- Service Name Marquee --- */
        @keyframes marquee-name-scroll {
            0% { transform: translateX(50%); } 
            100% { transform: translateX(-100%); } 
        }
        .service-name-box {
            overflow: hidden;
            background: var(--app-primary);
            border-radius: 8px;
            margin-top: 1rem; 
            margin-bottom: 1rem; 
            padding: 10px 0; 
            white-space: nowrap; 
        }
        .service-name-box p#modal-service-name-text {
            display: inline-block; 
            padding-left: 100%; 
            margin: 0;
            animation: marquee-name-scroll 15s linear infinite;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
        }
        .service-name-box p#modal-service-name-text:hover {
            animation-play-state: paused;
        }

        /* --- NAYA: Price Alert Badge (Feature 1) --- */
        .price-alert {
            font-size: 0.75rem;
            font-weight: 700;
            padding: 2px 6px;
            border-radius: 4px;
            margin-left: 8px;
            animation: fadeIn 0.5s;
        }
        .price-alert.price-drop {
            background-color: #e8f5e9; /* Green BG */
            color: #198754; /* Green Text */
        }
        .price-alert.price-hike {
            background-color: #fff8e1; /* Yellow BG */
            color: #ff9f40; /* Yellow Text */
        }
        
        /* --- NAYA: Advanced Progress Report (Feature 2) --- */
        .order-card-stats-adv {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr; /* 4 Columns */
            gap: 8px;
            padding: 10px 1rem;
            border-top: 1px solid #eee;
            margin-top: 10px;
        }
        .order-stat-item-adv {
            text-align: center;
            background: rgba(0,0,0,0.03);
            padding: 8px;
            border-radius: 8px;
        }
        .order-stat-item-adv p {
            font-size: 0.75rem;
            color: var(--app-text-muted);
            margin: 0;
            font-weight: 600;
            text-transform: uppercase;
        }
        .order-stat-item-adv h4 {
            font-size: 1.1rem;
            margin: 0;
            font-weight: 700;
        }
        .stat-start { color: var(--app-primary); }
        .stat-delivered { color: #ff9f40; } /* Orange */
        .stat-remains { color: #198754; } /* Green */
        .stat-current { color: var(--app-dark); }
        
    </style>
    </head>
<body class="smm-app-theme"> 
    
    <div class="smm-app-container">