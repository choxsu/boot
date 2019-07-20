package com.choxsu.config.shiro;

import com.choxsu.common.entity.Account;
import com.choxsu.service.AccountService;
import com.jfinal.kit.HashKit;
import org.apache.shiro.authc.*;
import org.apache.shiro.realm.CachingRealm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author choxsu
 * @date 2019/7/20
 */
@Component
public class UserRealm extends CachingRealm {

    @Autowired
    AccountService accountService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    @Override
    public AuthenticationInfo getAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        Account accountByUsername = accountService.findAccountByUsername(username);
        if (accountByUsername == null) {
            throw new UnknownAccountException();
        }
        String salt = accountByUsername.getSalt();
        String hashedPass = HashKit.sha256(salt + password);
        // 未通过密码验证
        if (!accountByUsername.getPassword().equals(hashedPass)) {
            throw new IncorrectCredentialsException();
        }
        //如果身份认证验证成功，返回一个AuthenticationInfo实现；
        return new SimpleAuthenticationInfo(username, password, getName());
    }
}
