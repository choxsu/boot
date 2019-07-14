package com.choxsu.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
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
public class NewsFeed extends Model<NewsFeed> {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 动态创建者
     */
    @TableField("accountId")
    private Integer accountId;

    /**
     * 动态引用类型
     */
    @TableField("refType")
    private Integer refType;

    /**
     * 动态引用所关联的 id
     */
    @TableField("refId")
    private Integer refId;

    /**
     * reply所属的贴子类型, 与type 字段填的值一样
     */
    @TableField("refParentType")
    private Integer refParentType;

    @TableField("refParentId")
    private Integer refParentId;

    /**
     * 动态创建时间
     */
    @TableField("createAt")
    private LocalDateTime createAt;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
