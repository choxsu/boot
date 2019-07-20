package com.choxsu.config.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.realm.CachingRealm;
import org.springframework.stereotype.Component;

/**
 * @author choxsu
 * @date 2019/7/20
 */
@Component
public class UserRealm extends CachingRealm {


    @Override
    public boolean supports(AuthenticationToken token) {
        return false;
    }

    @Override
    public AuthenticationInfo getAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        return null;
    }
}
