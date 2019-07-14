package com.choxsu.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
public class JobManager extends Model<JobManager> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 任务名
     */
    @TableField("name")
    private String name;

    /**
     * 组名
     */
    @TableField("group")
    private String group;

    /**
     * 类名
     */
    @TableField("clazz")
    private String clazz;

    /**
     * 定时表达式
     */
    @TableField("cron_expression")
    private String cronExpression;

    /**
     * 是否开启
     */
    @TableField("is_enabled")
    private String isEnabled;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
