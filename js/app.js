// ============================================
// INTRANET HOSPITAL SERIAN — App JavaScript
// Sidebar toggle, mobile menu, interactions
// ============================================

document.addEventListener('DOMContentLoaded', function () {

    // --- Sidebar Toggle (Desktop) ---
    const sidebar = document.getElementById('sidebar');
    const sidebarToggle = document.getElementById('sidebar-toggle');
    const topHeader = document.querySelector('.top-header');
    const mainContent = document.querySelector('.main-content');

    if (sidebarToggle && sidebar) {
        sidebarToggle.addEventListener('click', function () {
            sidebar.classList.toggle('collapsed');
        });
    }

    // --- Mobile Sidebar ---
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    const sidebarOverlay = document.getElementById('sidebar-overlay');

    if (mobileMenuBtn && sidebar) {
        mobileMenuBtn.addEventListener('click', function () {
            sidebar.classList.toggle('mobile-open');
            if (sidebarOverlay) {
                sidebarOverlay.classList.toggle('active');
            }
        });
    }

    if (sidebarOverlay) {
        sidebarOverlay.addEventListener('click', function () {
            sidebar.classList.remove('mobile-open');
            sidebarOverlay.classList.remove('active');
        });
    }

    // --- Active Nav Highlight ---
    const currentPage = window.location.pathname.split('/').pop() || 'dashboard.html';
    const navItems = document.querySelectorAll('.nav-item[data-page]');

    navItems.forEach(function (item) {
        if (item.getAttribute('data-page') === currentPage) {
            item.classList.add('active');
        } else {
            item.classList.remove('active');
        }
    });

    // --- Notification Dropdown (placeholder) ---
    const notifBtn = document.getElementById('notif-btn');
    if (notifBtn) {
        notifBtn.addEventListener('click', function () {
            // TODO: Implement notification dropdown panel
            console.log('Notification panel clicked');
        });
    }

    // --- Search Bar Focus Animation ---
    const searchInput = document.querySelector('.search-bar input');
    const searchBar = document.querySelector('.search-bar');
    if (searchInput && searchBar) {
        searchInput.addEventListener('focus', function () {
            searchBar.style.width = '380px';
        });
        searchInput.addEventListener('blur', function () {
            searchBar.style.width = '';
        });
    }

    // --- Greeting based on time ---
    const greetingEl = document.getElementById('greeting-text');
    if (greetingEl) {
        const hour = new Date().getHours();
        let greeting = 'Selamat Pagi';
        if (hour >= 12 && hour < 17) greeting = 'Selamat Tengah Hari';
        else if (hour >= 17 && hour < 20) greeting = 'Selamat Petang';
        else if (hour >= 20 || hour < 5) greeting = 'Selamat Malam';
        const storedName = localStorage.getItem('user_name') || 'Pengguna';
        const firstName = storedName.split(' ')[0];
        // Title case: "ELVIN" → "Elvin"
        const displayName = firstName.charAt(0).toUpperCase() + firstName.slice(1).toLowerCase();
        greetingEl.textContent = greeting + ', ' + displayName + ' 👋';
    }

    // --- Card hover sound effect (subtle) ---
    // Optional: Can add subtle interaction sounds later

    // --- Animate stat numbers on load ---
    const statValues = document.querySelectorAll('.stat-card-value[data-count]');
    statValues.forEach(function (el) {
        const target = parseInt(el.getAttribute('data-count'));
        let current = 0;
        const step = Math.max(1, Math.floor(target / 40));
        const timer = setInterval(function () {
            current += step;
            if (current >= target) {
                current = target;
                clearInterval(timer);
            }
            el.textContent = current.toLocaleString();
        }, 30);
    });

});
