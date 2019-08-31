package com.choxsu.common.constant;

/**
 * @author choxsu
 * @date 2019/8/31
 */
public class SecurityConstant {
    public static final String PREFIX_SHIRO_CACHE = "choxsu-api:cache:";
    //JWT-account
    public static final String ACCOUNT = "choxsu";

    public static final String LOGIN_SALT = "choxsu-api";
    //request请求头属性
    public static final String REQUEST_AUTH_HEADER = "Authorization";

    //redis-key-前缀-shiro:refresh_token
    public final static String PREFIX_SHIRO_REFRESH_TOKEN = "choxsu-api:refresh_token:";

    //JWT-currentTimeMillis
    public final static String CURRENT_TIME_MILLIS = "currentTimeMillis";
}
