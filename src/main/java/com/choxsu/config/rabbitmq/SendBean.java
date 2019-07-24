package com.choxsu.config.rabbitmq;

import org.springframework.amqp.core.AmqpAdmin;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.core.Queue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author choxsu
 * @since 2019/7/24
 */
@Component
public class SendBean {

    private final AmqpAdmin amqpAdmin;
    private final AmqpTemplate amqpTemplate;

    @Autowired
    public SendBean(AmqpAdmin amqpAdmin, AmqpTemplate amqpTemplate) {
        this.amqpAdmin = amqpAdmin;
        this.amqpTemplate = amqpTemplate;
    }

    static AtomicInteger ai = new AtomicInteger();

    /**
     * 发送消息
     */
    public void sendChoxsu() {
        int add = ai.addAndGet(1);
        String dateString = "choxsu->" + add;
//        System.out.println("[string] send msg:" + dateString);
        // 第一个参数为刚刚定义的队列名称
        this.amqpTemplate.convertAndSend(RabbitConfig.CHOXSU, dateString);
    }
}
