// Offline-Cache für "Kirbys Alm". Bei Änderungen die Versionsnummer erhöhen.
const CACHE = 'kirbys-alm-v9';
const ASSETS = [
  './',
  './index.html',
  './manifest.webmanifest',
  './icons/kirbys-alm-192.png',
  './icons/kirbys-alm-512.png',
  './icons/kirbys-alm-maskable-512.png',
  './icons/kirbys-alm-apple-180.png',
];

self.addEventListener('install', (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(ASSETS)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  const req = e.request;
  if (req.method !== 'GET') return;

  // Seite selbst: zuerst Netz (damit Updates ankommen), sonst Cache
  if (req.mode === 'navigate') {
    e.respondWith(
      fetch(req)
        .then((res) => { const copy = res.clone(); caches.open(CACHE).then((c) => c.put('./index.html', copy)); return res; })
        .catch(() => caches.match('./index.html'))
    );
    return;
  }

  // Alles andere (Icons, Schriften): zuerst Cache, sonst Netz und merken
  e.respondWith(
    caches.match(req).then((hit) => hit || fetch(req).then((res) => {
      if (res.ok || res.type === 'opaque') {
        const copy = res.clone();
        caches.open(CACHE).then((c) => c.put(req, copy));
      }
      return res;
    }))
  );
});
