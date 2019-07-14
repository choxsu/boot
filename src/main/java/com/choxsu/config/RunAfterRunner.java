package com.choxsu.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

/**
 * 如果您需要在SpringApplication启动后运行一些特定的代码，
 * 您可以实现ApplicationRunner或CommandLineRunner接口。
 * 这两个接口都以相同的方式工作，并提供一个单一的run方法，
 * 该方法在SpringApplication.run()完成之前调用。
 *
 * 如果定义了多个CommandLineRunner或ApplicationRunner bean，则必须以特定的顺序调用它们
 * 您还可以实现org.springframework.core.Ordered接口或使用org.springframework.core.annotation.Order注释。
 * @author choxsu
 * @date 2019/7/1
 */
@Component
public class RunAfterRunner implements CommandLineRunner, Ordered {


    @Override
    public void run(String... args) throws Exception {
        // Do something...
    }

    @Override
    public int getOrder() {
        return 1;
    }
}
