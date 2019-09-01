package com.choxsu.blog.login;

import com.alibaba.fastjson.JSONObject;
import com.choxsu.common.constant.SecurityConstant;
import com.choxsu.common.entity.Account;
import com.choxsu.common.entity.LoginLog;
import com.choxsu.common.jwt.JwtProperties;
import com.choxsu.common.jwt.JwtToken;
import com.choxsu.common.ret.Ret;
import com.choxsu.service.AccountService;
import com.choxsu.utils.IPUtil;
import com.choxsu.utils.JwtUtil;
import com.choxsu.utils.RedisUtil;
import com.jfinal.kit.HashKit;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Service
public class LoginService {

    @Resource
    AccountService accountService;
    @Resource
    JwtProperties jwtProperties;

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

        Account accountByUsername = accountService.findAccountByUsername(username);

        if (accountByUsername == null) {
            return Ret.error(String.format("用户%s不存在", username));
        }
        Integer status = accountByUsername.getStatus();

        //域账号直接提示账号不存在
        if (status == -1) {
            return Ret.error("账号无效，请检查账号");
        }
        String salt = accountByUsername.getSalt();
        String hashedPass = HashKit.sha256(salt + password);
        if (!hashedPass.equals(accountByUsername.getPassword())) {
            return Ret.error("用户名或密码错误");
        }
        //账号是否锁定
        if (status == 1) {
            return Ret.error("该账号已被锁定");
        }
        accountByUsername.setPassword(null);
        accountByUsername.setSalt(null);

        //验证成功后处理
        String token = this.loginSuccess(accountByUsername);

        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken auth = new JwtToken(token);
        subject.login(auth);

        //登录成功
        JSONObject loginInfo = new JSONObject();
        loginInfo.put("token", token);
        loginInfo.put("userInfo", accountByUsername);
        return Ret.ok("登录成功", loginInfo);
    }

    /**
     * 登录成功后的业务
     *
     * @param accountByUsername 登录账户
     */
    private String loginSuccess(Account accountByUsername) {
        String username = accountByUsername.getUserName();
        String currentTimeMillis = String.valueOf(System.currentTimeMillis());
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        HttpServletResponse response = ((ServletRequestAttributes) requestAttributes).getResponse();
        Assert.notNull(request, "请求对象不能不为空");
        Assert.notNull(response, "响应头不能不为空");
        // 清除可能存在的Shiro权限信息缓存
        String tokenKey = SecurityConstant.PREFIX_SHIRO_CACHE + username;
        if (RedisUtil.exists(tokenKey)) {
            RedisUtil.del(tokenKey);
        } else {
            RedisUtil.set(tokenKey, username);
        }

        //更新RefreshToken缓存的时间戳
        String refreshTokenKey = SecurityConstant.PREFIX_SHIRO_REFRESH_TOKEN + username;
        if (RedisUtil.exists(refreshTokenKey)) {
            RedisUtil.setex(refreshTokenKey, currentTimeMillis, jwtProperties.getRefreshTokenExpireTime() * 60L);
        } else {
            RedisUtil.setex(refreshTokenKey, currentTimeMillis, jwtProperties.getRefreshTokenExpireTime() * 60L);
        }
        // 登录日志
        LoginLog loginLog = new LoginLog();
        loginLog.setAccountId(accountByUsername.getId());
        loginLog.setLoginAt(LocalDateTime.now());
        loginLog.setIp(IPUtil.getIp(request));
        loginLog.insert();

        //生成token
        String token = JwtUtil.sign(username, currentTimeMillis);
        //写入header
        response.setHeader(SecurityConstant.REQUEST_AUTH_HEADER, token);
        response.setHeader("Access-Control-Expose-Headers", SecurityConstant.REQUEST_AUTH_HEADER);
        return token;
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
