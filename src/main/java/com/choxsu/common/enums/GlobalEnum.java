package com.choxsu.common.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;
import lombok.Getter;

/**
 * @author choxsu
 * @date 2019/7/14
 */
@Getter
public enum GlobalEnum implements IEnum<Integer> {

    SUCCESS(0, "成功"),
    FAILED(1, "失败");

    private int value;
    private String desc;

    GlobalEnum(int value, String desc) {
        this.value = value;
        this.desc = desc;
    }
    @Override
    public Integer getValue() {
        return this.value;
    }
}
