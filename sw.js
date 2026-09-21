const CACHE_NAME = 'intranet-hser-v1';

self.addEventListener('install', (e) => {
    console.log('[Service Worker] Install');
    self.skipWaiting();
});

self.addEventListener('activate', (e) => {
    console.log('[Service Worker] Activate');
    return self.clients.claim();
});

self.addEventListener('fetch', (e) => {
    // Simple pass-through fetch
    e.respondWith(
        fetch(e.request).catch(() => {
            console.log('[Service Worker] Fetch failed');
        })
    );
});
