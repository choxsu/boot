package com.choxsu.common.ret;

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

    /**
     * 业务校验失败 ， 需要弹窗
     */
    private static final int BUSINESS_MSG_ERR = 10008;
    /**
     * 业务校验失败 ， 不需要弹窗
     */
    private static final int BUSINESS_ERR = 10009;
    /**
     * 参数错误码
     */
    private static final int PARAM_ERR = 10010;
    /**
     * 系统错误
     */
    private static final int SYS_ERR = 10011;

    private Integer status;
    private String msg;
    private Object data;


    public static Ret build() {
        return new Ret();
    }

    public static Ret ok(String msg, Object data) {
        return new Ret(1, msg, data);
    }

    public static Ret ok(String msg) {
        return new Ret(1, msg, null);
    }

    public static Ret ok() {
        return new Ret(1, "操作成功", null);
    }

    public static Ret error(String msg, Object data) {
        return new Ret(0, msg, data);
    }

    public static Ret error(String msg) {
        return new Ret(0, msg, null);
    }

    public static Ret error() {
        return new Ret(0, "操作失败", null);
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

    public static Ret businessErr(String msg) {
        return new Ret(BUSINESS_MSG_ERR, msg, null);
    }

    public static Ret businessErr() {
        return new Ret(BUSINESS_ERR, "业务校验失败，请重试！", null);
    }
}
