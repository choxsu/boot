package com.choxsu.common.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class UploadCounter extends Model<UploadCounter> {

    private static final long serialVersionUID=1L;

    @TableId("uploadType")
    private String uploadType;

    @TableField("counter")
    private Integer counter;

    @TableField("descr")
    private String descr;


    @Override
    protected Serializable pkVal() {
        return this.uploadType;
    }

}
