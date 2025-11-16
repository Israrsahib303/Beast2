</div> <script src="../assets/js/countdown.js?v=2.2"></script>
    <script src="../assets/js/main.js?v=2.2"></script>
    
    <style>
    /* Yeh CSS sirf Dark Theme (Subscription) ke liye hai */
    .developer-credit {
        position: fixed;
        bottom: 15px;
        right: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
        background: rgba(40, 40, 40, 0.7); /* Dark background */
        backdrop-filter: blur(5px);
        padding: 8px 12px;
        border-radius: 50px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        z-index: 100;
        animation: fadeIn 1s ease-out 0.5s;
        opacity: 0;
        animation-fill-mode: forwards;
        color: #fff; /* Light text */
    }
    .developer-credit .dev-logo {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        object-fit: cover; /* NAYA: Taake image fit ho */
    }
    .developer-credit .dev-text {
        display: flex;
        flex-direction: column;
        line-height: 1.2;
    }
    .developer-credit .dev-text strong {
        font-size: 0.8rem;
        color: #fff;
        font-weight: 700;
    }
    .developer-credit .dev-text span {
        font-size: 0.7rem;
        color: #ccc;
    }
    @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
    
    /* Mobile par thora oopar (agar footer ho) */
    @media (max-width: 900px) {
        .developer-credit {
            bottom: 15px; /* Subscription page par neeche rehnay dein */
        }
    }
    </style>
    
    <div class="developer-credit">
        <img src="../assets/img/Mypic.jpeg" alt="Developer" class="dev-logo">
        <div class="dev-text">
            <strong>Built by Israr Liaqat</strong>
            <span>Crafted with ❤️ in Pakistan</span>
        </div>
        </div>
    </body>
</html>