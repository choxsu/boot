package com.choxsu.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

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
    public static Object get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    /**
     * 将key放入redis
     */
    public static void set(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        RedisUtil.redisTemplate = (RedisTemplate) applicationContext.getBean("redisTemplate");
    }
}
