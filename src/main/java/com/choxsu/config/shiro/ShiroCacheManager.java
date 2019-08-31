package com.choxsu.config.shiro;

import com.choxsu.common.constant.SecurityConstant;
import com.choxsu.utils.JwtUtil;
import com.choxsu.utils.RedisUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @author choxsu
 * @date 2019/8/31
 */
@Service
public class ShiroCacheManager implements CacheManager {

    @Override
    public <K, V> Cache<K, V> getCache(String s) throws CacheException {
        return new ShiroCache<>();
    }

    /**
     * 重写Shiro的Cache保存读取
     *
     * @param <K>
     * @param <V>
     */
    public class ShiroCache<K, V> implements Cache<K, V> {

        ShiroCache() {
        }

        /**
         * 获取缓存
         *
         * @param key
         * @return
         * @throws CacheException
         */
        @Override
        public Object get(Object key) throws CacheException {
            String tempKey = this.getKey(key);
            return RedisUtil.get(tempKey);
        }

        /**
         * 保存缓存
         *
         * @param key
         * @param value
         * @return
         * @throws CacheException
         */
        @Override
        public Object put(Object key, Object value) throws CacheException {
            RedisUtil.set(this.getKey(key), value);
            return value;
        }

        /**
         * 移除缓存
         *
         * @param key
         * @return
         * @throws CacheException
         */
        @Override
        public Object remove(Object key) throws CacheException {
            String tempKey = this.getKey(key);
            return RedisUtil.del(tempKey);
        }

        @Override
        public void clear() throws CacheException {
        }

        @Override
        public int size() {
            return 20;
        }

        @Override
        public Set<K> keys() {
            return null;
        }

        @Override
        public Collection<V> values() {
            Set keys = this.keys();
            List<V> values = new ArrayList<>();
            for (Object key : keys) {
                values.add((V) RedisUtil.get(this.getKey(key)));
            }
            return values;
        }

        /**
         * 根据名称获取
         *
         * @param key
         * @return
         */
        private String getKey(Object key) {
            return SecurityConstant.PREFIX_SHIRO_CACHE + JwtUtil.getClaim(key.toString(), SecurityConstant.ACCOUNT);
        }
    }
}
