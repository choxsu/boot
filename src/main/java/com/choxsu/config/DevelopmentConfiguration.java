package com.choxsu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * 仅开发环境生效
 * Effective development environment only
 *
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@Profile("dev")
public class DevelopmentConfiguration {

}
