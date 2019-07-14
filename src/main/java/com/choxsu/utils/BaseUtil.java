package com.choxsu.utils;

/**
 * @author choxsu
 * @date 2019/7/14
 */
public class BaseUtil {

    /**
     * 开发环境识别码
     */
    private static final String DEV = "development";

    /**
     * 获取开发模式
     *
     * @return true为开发模式
     */
    public static boolean isDevelop() {
        var active = System.getProperty("spring.profiles.active");
        return DEV.equalsIgnoreCase(active);
    }

}
