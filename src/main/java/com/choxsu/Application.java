package com.choxsu;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author choxsu
 * @date 2019/7/1
 */
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        // Startup mode 1
        SpringApplication application = new SpringApplication(Application.class);
        // off banner mode
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
        // Startup mode 2
//        new SpringApplicationBuilder()
//                .sources(Application.class)
//                .bannerMode(Banner.Mode.OFF)
//                .run(args);

        // Startup mode 3 --default
//        SpringApplication.run(Application.class, args);
    }
}
