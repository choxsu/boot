package com.choxsu.config.web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
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

    /**
     * 配置静态资源路径
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/page/**").addResourceLocations("classpath:/page/");
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        //从这里开始，是我加的swagger的静态资源
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");

    }

    /**
     * 拦截器
     **/
    public void addInterceptors(InterceptorRegistry registry) {
    }

}
