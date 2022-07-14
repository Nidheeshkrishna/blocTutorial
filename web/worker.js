const CACHE_NAME = 'test-cache';
 
self.addEventListener('install', () => {
  caches.open(CACHE_NAME)
    .then((cache) => {
      cache.add('./dog.jpg');
    })
});