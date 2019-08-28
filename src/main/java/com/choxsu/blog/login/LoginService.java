package com.choxsu.blog.login;

import com.choxsu.common.ret.Ret;
import org.apache.commons.lang3.StringUtils;
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


        return Ret.ok("登录成功");
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
