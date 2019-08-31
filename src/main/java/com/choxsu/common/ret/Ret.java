package com.choxsu.common.ret;

import com.alibaba.fastjson.JSON;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author choxsu
 * @date 2019/7/19
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Ret {

    private static final int SUCCESS_CODE = 200;

    /**
     * 业务校验失败 ， 需要弹窗
     */
    private static final int FAILED_CODE = -1;
    /**
     * 业务校验失败 ， 不需要弹窗
     */
    private static final int FAILED_NO_TIPS = -2;
    /**
     * 参数错误码
     */
    private static final int PARAM_ERR = 401;
    /**
     * 没权限
     */
    private static final int NO_AUTH_ERR = 403;
    /**
     * 系统错误
     */
    private static final int SYS_ERR = 500;
    /**
     * 请登录
     */
    private static final int NO_LOGIN_ERR = 501;

    private int status;
    private String msg;
    private Object data;

    public static Ret noAuth() {
        return new Ret(NO_AUTH_ERR, "没有操作权限", null);
    }

    public static Ret noLogin() {
        return new Ret(NO_LOGIN_ERR, "请登录", null);
    }


    public static Ret build() {
        return new Ret();
    }

    public static Ret ok() {
        return new Ret(SUCCESS_CODE, "操作成功", null);
    }

    public static Ret ok(String msg, Object data) {
        return new Ret(SUCCESS_CODE, msg, data);
    }

    public static Ret ok(String msg) {
        return new Ret(SUCCESS_CODE, msg, null);
    }

    public static Ret error() {
        return new Ret(FAILED_CODE, "操作失败", null);
    }

    public static Ret error(String msg, Object data) {
        return new Ret(FAILED_CODE, msg, data);
    }

    public static Ret error(String msg) {
        return new Ret(FAILED_CODE, msg, null);
    }

    public static Ret businessErr() {
        return new Ret(FAILED_NO_TIPS, "业务校验失败，请重试！", null);
    }


    public static Ret paramError() {
        return new Ret(PARAM_ERR, "参数错误，请检查参数！", null);
    }

    public static Ret paramError(String msg) {
        return new Ret(PARAM_ERR, msg, null);
    }

    public static Ret sysError() {
        return new Ret(SYS_ERR, "系统错误，请联系管理员！", null);
    }

    public boolean success() {
        return getStatus() == SUCCESS_CODE;
    }

    public String toJsonStr() {
        return JSON.toJSONString(this);
    }
}
