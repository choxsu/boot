package com.choxsu.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * 如果您需要在SpringApplication启动后运行一些特定的代码，
 * 您可以实现ApplicationRunner或CommandLineRunner接口。
 * 这两个接口都以相同的方式工作，并提供一个单一的run方法，
 * 该方法在SpringApplication.run()完成之前调用。
 *
 * @author choxsu
 * @date 2019/7/1
 */
@Component
public class RunAfterRunner implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        // Do something...
    }
}
