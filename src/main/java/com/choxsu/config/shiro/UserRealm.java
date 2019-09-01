package com.choxsu.config.shiro;

import com.choxsu.common.constant.SecurityConstant;
import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.Permission;
import com.choxsu.common.entity.Role;
import com.choxsu.common.jwt.JwtToken;
import com.choxsu.service.AccountService;
import com.choxsu.service.PermissionService;
import com.choxsu.service.RoleService;
import com.choxsu.utils.JwtUtil;
import com.choxsu.utils.RedisUtil;
import com.jfinal.kit.HashKit;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.CachingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * @author choxsu
 * @date 2019/7/20
 */
@Component
public class UserRealm extends AuthorizingRealm {

    @Resource
    AccountService accountService;
    @Resource
    RoleService roleService;
    @Resource
    PermissionService permissionService;

    @Override
    public String getName() {
        return "choxsu_realm";
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }


//    public AuthenticationInfo getAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
//        String username = (String) auth.getPrincipal();
//        String password = new String((char[]) auth.getCredentials());
//        Account accountByUsername = accountService.findAccountByUsername(username);
//        if (accountByUsername == null) {
//            throw new UnknownAccountException();
//        }
//        String salt = accountByUsername.getSalt();
//        String hashedPass = HashKit.sha256(salt + password);
//        // 未通过密码验证
//        if (!accountByUsername.getPassword().equals(hashedPass)) {
//            throw new IncorrectCredentialsException();
//        }
//        //如果身份认证验证成功，返回一个AuthenticationInfo实现；
//        return new SimpleAuthenticationInfo(username, password, getName());
//    }

    /**
     * 用户名信息验证
     *
     * @param auth
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getPrincipal();
        String username = JwtUtil.getClaim(token, SecurityConstant.ACCOUNT);
        if (username == null) {
            throw new AuthenticationException("账户无效");
        }
        Account accountByUsername = accountService.findAccountByUsername(username);
        if (accountByUsername == null) {
            throw new AuthenticationException("账户不存在！");
        }

        String refreshTokenCacheKey = SecurityConstant.PREFIX_SHIRO_REFRESH_TOKEN + username;
        if (JwtUtil.verify(token) && RedisUtil.exists(refreshTokenCacheKey)) {
            String currentTimeMillisRedis = RedisUtil.get(refreshTokenCacheKey);
            // 获取AccessToken时间戳，与RefreshToken的时间戳对比
            if (Objects.equals(JwtUtil.getClaim(token, SecurityConstant.CURRENT_TIME_MILLIS), currentTimeMillisRedis)) {
                return new SimpleAuthenticationInfo(token, token, getName());
            }
        }
        throw new AuthenticationException("Token expired or incorrect.");

    }

    /**
     * 检查用户权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        String account = JwtUtil.getClaim(principals.toString(), SecurityConstant.ACCOUNT);
        Account accountByUsername = accountService.findAccountByUsername(account);

        // 查询用户关联的所有角色信息
        List<Role> roleList = roleService.listByAccount(accountByUsername);
        for (Role role : roleList) {
            authorizationInfo.addRole(role.getName());
            //获取权限
            List<Permission> authorityList = permissionService.findByRoleId(role.getId());
            for (Permission perm : authorityList) {
                authorizationInfo.addStringPermission(perm.getActionKey());
            }
        }
        return authorizationInfo;
    }
}
