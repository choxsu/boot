package com.choxsu.blog.login;

import com.choxsu.common.BaseController;
import com.choxsu.common.ret.Ret;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Api(tags = {"用户接口"})
@RestController
public class LoginController extends BaseController {

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
    @ApiOperation(value = "登录接口")
    @PostMapping(value = "/auth/login")
    public Ret login(@ApiParam(value = "登录类型") @RequestParam Integer loginType,
                     @ApiParam(value = "是否记住我", defaultValue = "false") @RequestParam(required = false, defaultValue = "false") Boolean rememberMe,
                     @ApiParam(value = "用户名") @RequestParam(required = false) String username,
                     @ApiParam(value = "密码" ) @RequestParam(required = false) String password,
                     @ApiParam(value = "手机号") @RequestParam(required = false) String phone,
                     @ApiParam(value = "短信验证码") @RequestParam(required = false) String code) {
        if (loginType == null || loginType == 1) {
            return loginService.loginByUsername(username, password, rememberMe);
        }
        return loginService.loginByPhone(phone, code, rememberMe);
    }


}
