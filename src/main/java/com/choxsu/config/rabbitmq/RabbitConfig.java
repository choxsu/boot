package com.choxsu.config.rabbitmq;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author choxsu
 * @since 2019/7/24
 */
@Configuration
public class RabbitConfig {
    /*
     * 定义队列名
     */
    final static String CHOXSU = "choxsu";

    /**
     * 定义choxsu队列
     */
    @Bean
    public Queue choxsu() {
        return new Queue(CHOXSU);
    }
}
