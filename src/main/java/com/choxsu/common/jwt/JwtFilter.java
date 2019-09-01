package com.choxsu.common.jwt;

import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.choxsu.common.constant.SecurityConstant;
import com.choxsu.common.entity.Account;
import com.choxsu.common.ret.Ret;
import com.choxsu.utils.JwtUtil;
import com.choxsu.utils.RedisUtil;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author choxsu
 * @date 2019/8/31
 */
public class JwtFilter extends BasicHttpAuthenticationFilter {

    private Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    @Autowired
    JwtProperties jwtProperties;

    /**
     * 检测Header里Authorization字段
     * 判断是否登录
     */
    @Override
    protected boolean isLoginAttempt(ServletRequest request, ServletResponse response) {
        HttpServletRequest req = (HttpServletRequest) request;
        String authorization = req.getHeader(SecurityConstant.REQUEST_AUTH_HEADER);
        return authorization != null;
    }

    /**
     * 登录验证
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String authorization = httpServletRequest.getHeader(SecurityConstant.REQUEST_AUTH_HEADER);

        JwtToken token = new JwtToken(authorization);
        // 提交给realm进行登入，如果错误他会抛出异常并被捕获
        getSubject(request, response).login(token);

        // 绑定上下文
        String account = JwtUtil.getClaim(authorization, SecurityConstant.ACCOUNT);
//        UserContext userContext = new UserContext(new Account(account));
        // 如果没有抛出异常则代表登入成功，返回true
        return true;
    }

    /**
     * 刷新AccessToken，进行判断RefreshToken是否过期，未过期就返回新的AccessToken且继续正常访问
     */
    private boolean refreshToken(ServletRequest request, ServletResponse response) {
        // 获取AccessToken(Shiro中getAuthzHeader方法已经实现)
        String token = this.getAuthzHeader(request);
        // 获取当前Token的帐号信息
        String account = JwtUtil.getClaim(token, SecurityConstant.ACCOUNT);
        String refreshTokenCacheKey = SecurityConstant.PREFIX_SHIRO_REFRESH_TOKEN + account;
        // 判断Redis中RefreshToken是否存在
        if (RedisUtil.exists(refreshTokenCacheKey)) {
            // 获取RefreshToken时间戳,及AccessToken中的时间戳
            // 相比如果一致，进行AccessToken刷新
            String currentTimeMillisRedis = RedisUtil.get(refreshTokenCacheKey);
            String tokenMillis = JwtUtil.getClaim(token, SecurityConstant.CURRENT_TIME_MILLIS);

            if (currentTimeMillisRedis.equals(tokenMillis)) {

                // 设置RefreshToken中的时间戳为当前最新时间戳
                String currentTimeMillis = String.valueOf(System.currentTimeMillis());
                Integer refreshTokenExpireTime = jwtProperties.refreshTokenExpireTime;
                RedisUtil.setex(refreshTokenCacheKey, currentTimeMillis, refreshTokenExpireTime * 60L);
                // 刷新AccessToken，为当前最新时间戳
                token = JwtUtil.sign(account, currentTimeMillis);

                // 使用AccessToken 再次提交给ShiroRealm进行认证，如果没有抛出异常则登入成功，返回true
                JwtToken jwtToken = new JwtToken(token);
                this.getSubject(request, response).login(jwtToken);

                // 设置响应的Header头新Token
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                httpServletResponse.setHeader(SecurityConstant.REQUEST_AUTH_HEADER, token);
                httpServletResponse.setHeader("Access-Control-Expose-Headers", SecurityConstant.REQUEST_AUTH_HEADER);
                return true;
            }
        }
        return false;
    }

    /**
     * 是否允许访问
     *
     * @param request
     * @param response
     * @param mappedValue
     * @return
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if (isLoginAttempt(request, response)) {
            try {
                this.executeLogin(request, response);
            } catch (Exception e) {
                String msg = e.getMessage();
                Throwable throwable = e.getCause();
                if (throwable instanceof SignatureVerificationException) {
                    msg = "Token或者密钥不正确(" + throwable.getMessage() + ")";
                } else if (throwable instanceof TokenExpiredException) {
                    // AccessToken已过期
                    if (this.refreshToken(request, response)) {
                        return true;
                    } else {
                        msg = "Token已过期(" + throwable.getMessage() + ")";
                    }
                } else {
                    if (throwable != null) {
                        msg = throwable.getMessage();
                    }
                }
                this.response401(response, msg);
                return false;
            }
        }
        return true;
    }

    /**
     * 401非法请求
     *
     * @param resp
     */
    private void response401(ServletResponse resp, String msg) {
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json; charset=utf-8");
        try (PrintWriter out = httpServletResponse.getWriter()) {
            Ret ret = Ret.paramError(msg);
            out.append(ret.toJsonStr());
        } catch (IOException e) {
            LOGGER.error("返回Response信息出现IOException异常:" + e.getMessage());
        }
    }
}
