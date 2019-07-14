package com.choxsu.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author choxsu
 * @date 2019/7/14
 */
@Configuration
@MapperScan(value = {"com.choxsu.common.mapper"})
public class MybatisPlusConfig {
    
}
