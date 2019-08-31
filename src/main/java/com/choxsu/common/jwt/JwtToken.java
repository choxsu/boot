package com.choxsu.common.jwt;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author choxsu
 * @date 2019/8/31
 */
public class JwtToken implements AuthenticationToken {
    //密钥
    private String token;

    public JwtToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
