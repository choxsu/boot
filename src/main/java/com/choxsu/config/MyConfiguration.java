package com.choxsu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

/**
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@EnableAutoConfiguration(exclude = DataSourceAutoConfiguration.class)
public class MyConfiguration {


    /**
     * Initialization
     */
    @PostConstruct
    public void openConnection() {
        System.out.println("Initialization");
    }

}
