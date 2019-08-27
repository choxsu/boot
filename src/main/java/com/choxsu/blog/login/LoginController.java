package com.choxsu.blog.login;

import com.choxsu.common.ret.Ret;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@RestController
public class LoginController {

    @Resource
    private LoginService loginService;

    /**
     * @param loginType  登录类型   1 账号或密码（默认）  2 手机号
     * @param phone      手机号
     * @param code       验证码
     * @param username   用户名或邮箱
     * @param password   密码
     * @param rememberMe 是否记住我  true是 false否
     */
    @PostMapping(value = "/auth/login")
    public Ret login(@RequestParam Integer loginType,
                     @RequestParam(required = false, defaultValue = "false") Boolean rememberMe,
                     String username,
                     String phone,
                     String password,
                     String code) {
        if (loginType == null || loginType == 1) {
            return loginService.loginByUsername(username, password, rememberMe);
        }
        return loginService.loginByPhone(phone, code, rememberMe);
    }


}
