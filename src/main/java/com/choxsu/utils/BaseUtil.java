package com.choxsu.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @author choxsu
 * @date 2019/7/14
 */
@Component
public class BaseUtil implements ApplicationContextAware {


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

    }
}
