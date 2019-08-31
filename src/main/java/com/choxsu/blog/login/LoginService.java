package com.choxsu.blog.login;

import com.choxsu.common.entity.Account;
import com.choxsu.common.ret.Ret;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Service
public class LoginService {

    /**
     * 登录by用户名
     *
     * @param username   用户名或邮箱
     * @param password   密码
     * @param rememberMe 是否记住我  true是 false否
     * @return 验证结果或成功结果
     */
    public Ret loginByUsername(String username, String password, Boolean rememberMe) {
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return Ret.paramError("当选择用户名或邮箱登录时，必须填写用户名或密码");
        }

        //添加用户认证信息
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        usernamePasswordToken.setRememberMe(rememberMe);
        //进行验证，这里可以捕获异常，然后返回对应信息
        try {
            subject.login(usernamePasswordToken);
        } catch (UnknownAccountException | IncorrectCredentialsException e) {
            return Ret.error("用户名/密码错误!");
        } catch (AuthenticationException e) {
            return Ret.error("登录失败，错误信息：" + e.getMessage());
        }
        Object principal = subject.getPrincipal();
        System.out.println("principal = " + principal);
        Account account = (Account) principal;
        return Ret.ok("登录成功", account);
    }

    /**
     * 登录by手机号
     *
     * @param phone      手机号
     * @param code       验证码
     * @param rememberMe 是否记住我  true是 false否
     * @return 验证结果或成功结果
     */
    public Ret loginByPhone(String phone, String code, Boolean rememberMe) {
        if (StringUtils.isBlank(phone) || StringUtils.isBlank(code)) {
            return Ret.paramError("当选择手机登录时，必须填写手机号和验证码");
        }
        return Ret.ok("登录成功");
    }
}
