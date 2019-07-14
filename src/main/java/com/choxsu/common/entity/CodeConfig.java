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
public class CodeConfig extends Model<CodeConfig> {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 作者
     */
    @TableField("author")
    private String author;

    /**
     * 基础包名
     */
    @TableField("base_package")
    private String basePackage;

    /**
     * 实体包名
     */
    @TableField("entity_package")
    private String entityPackage;

    /**
     * service包名
     */
    @TableField("service_package")
    private String servicePackage;

    /**
     * 实体基础包
     */
    @TableField("entity_base_package")
    private String entityBasePackage;

    /**
     * 是否去除前缀
     */
    @TableField("is_clear_prefix")
    private Boolean isClearPrefix;

    /**
     * 前缀
     */
    @TableField("prefix")
    private String prefix;

    /**
     * BaseModel 是否生成链式 setter 方法
     */
    @TableField("is_generate_chain_setter")
    private Boolean isGenerateChainSetter;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
