package com.choxsu.config.rabbitmq;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author choxsu
 * @since 2019/7/24
 */
@Component
@RabbitListener(queues = RabbitConfig.CHOXSU)
public class ReceivingBean {

    /**
     * 消息消费
     * @RabbitHandler 代表此方法为接受到消息后的处理方法
     */
    @RabbitHandler
    public void processMessage(String choxsu) {
        System.out.println("receiving msg " + choxsu);
    }

}
