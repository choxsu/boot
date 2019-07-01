package com.choxsu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * 仅生产环境生效
 * Effective production environment only
 *
 * @author choxsu
 * @date 2019/7/1
 */
@Configuration
@Profile("production")
public class ProductionConfiguration {


}
