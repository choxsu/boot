package com.choxsu.message;

import kafka.admin.AdminUtils;
import kafka.admin.RackAwareMode;
import kafka.utils.ZkUtils;
import org.apache.kafka.common.config.TopicConfig;
import org.apache.kafka.common.security.JaasUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.KafkaTemplate;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Properties;

@Configuration
public class InitTopicBean {


    public void initTopic() {
    }

    public boolean createTopic(String topicName) {
        ZkUtils zkUtils = ZkUtils.apply("192.168.3.133:2181", 30000, 30000, JaasUtils.isZkSecurityEnabled());
        try {
            //
            AdminUtils.createTopic(zkUtils, topicName, 1, 1, new Properties(), RackAwareMode.Enforced$.MODULE$);
            return true;
        } catch (RuntimeException ignored) {

        } finally {
            zkUtils.close();
        }
        return false;
    }


}
