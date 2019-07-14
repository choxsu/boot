package com.choxsu.config.cache;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.jfinal.plugin.activerecord.cache.ICache;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * @author choxsu
 */
public class CaffeineCache implements ICache {

    private static String configName = "Caffeine";

    private static ConcurrentHashMap<String, Cache<Object, Object>> caches = new ConcurrentHashMap<>(8);

    public static final CaffeineCache me = new CaffeineCache();

    private CaffeineCache() {
        this(configName);
    }

    private CaffeineCache(String configName) {
        CaffeineCache.configName = configName;
        init();
    }

    private void init() {
        init(CaffeineCache.configName);
    }

    private void init(String configName) {
        caches.put(configName, Caffeine.newBuilder().expireAfterWrite(30, TimeUnit.MINUTES).build());
    }

    @Override
    public <T> T get(String cacheName, Object key) {
        Cache<Object, Object> cache = caches.get(cacheName);
        if (cache == null) {
            return null;
        }
        return (T) cache.getIfPresent(key);
    }


    @Override
    public void put(String cacheName, Object key, Object value) {
        Cache<Object, Object> cache = caches.get(cacheName);
        if (cache == null) {
            init(cacheName);
            cache = caches.get(cacheName);
        }
        cache.put(key, value);
    }

    @Override
    public void remove(String cacheName, Object key) {
        Cache<Object, Object> cache = caches.get(cacheName);
        if (cache != null) {
            cache.invalidate(key);
        }

    }

    @Override
    public void removeAll(String cacheName) {
        Cache<Object, Object> cache = caches.get(cacheName);
        if (cache != null) {
            cache.invalidateAll();
        }
    }

}
