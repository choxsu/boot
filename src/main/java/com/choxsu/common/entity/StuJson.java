package com.choxsu.common.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class StuJson extends Model<StuJson> {

    private static final long serialVersionUID=1L;

    @TableField("ids")
    private String ids;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
