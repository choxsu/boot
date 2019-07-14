package com.choxsu.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@EnableAutoConfiguration(exclude = DataSourceAutoConfiguration.class)
public class MyConfiguration {

    private static final Logger logger = LoggerFactory.getLogger(MyConfiguration.class);

    /**
     * Initialization
     */
    @PostConstruct
    public void openConnection() {
        logger.info("Initialization");
    }

}
