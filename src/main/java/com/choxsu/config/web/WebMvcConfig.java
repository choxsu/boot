package com.choxsu.config.web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {


    @Bean
    public ExecutorService executorService() {
        return Executors.newCachedThreadPool();
    }

}
