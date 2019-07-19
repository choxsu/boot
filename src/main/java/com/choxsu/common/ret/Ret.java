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
    private Integer status;
    private String msg;
    private Object data;

    public static Ret build() {
        return new Ret();
    }

    public static Ret ok(String msg, Object data) {
        return new Ret(200, msg, data);
    }

    public static Ret ok(String msg) {
        return new Ret(200, msg, null);
    }

    public static Ret error(String msg, Object data) {
        return new Ret(500, msg, data);
    }

    public static Ret error(String msg) {
        return new Ret(500, msg, null);
    }

}
