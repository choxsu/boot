package com.choxsu.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author choxsu
 * @since 2019/7/17
 */
@Component
public class RedisUtil implements ApplicationContextAware {

    private static RedisTemplate redisTemplate;

    /**
     * 获取通过key
     */
    public static <T> T get(String key) {
        return (T) redisTemplate.opsForValue().get(key);
    }

    /**
     * 将key放入redis
     */
    public static void set(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    public static boolean del(String tempKey) {
        return redisTemplate.delete(tempKey);
    }

    public static boolean exists(String key) {
        return redisTemplate.hasKey(key);
    }

    public static void setex(String key, String value, long seconds) {
        redisTemplate.opsForValue().set(key, value, seconds, TimeUnit.SECONDS);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        redisTemplate = applicationContext.getBean(RedisTemplate.class);
    }
}
