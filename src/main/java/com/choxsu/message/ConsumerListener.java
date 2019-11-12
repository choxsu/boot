package com.choxsu.message;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class ConsumerListener {

    @KafkaListener(topics = "testTopic")
    public void onMessage(String message){
        System.out.println(message);
    }
}
