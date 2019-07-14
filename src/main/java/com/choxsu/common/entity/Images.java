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
 * 图片上厂记录表
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Images extends Model<Images> {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 上传者
     */
    @TableField("account_id")
    private Integer accountId;

    /**
     * 图片路径
     */
    @TableField("src")
    private String src;

    /**
     * 图片原始名称
     */
    @TableField("name")
    private String name;

    /**
     * 图片类型
     */
    @TableField("type")
    private String type;

    /**
     * 创建时间
     */
    @TableField("created")
    private Integer created;

    /**
     * 来源
     */
    @TableField("source")
    private String source;

    /**
     * 文件大小
     */
    @TableField("file_size")
    private String fileSize;

    /**
     * 原始名称
     */
    @TableField("original_name")
    private String originalName;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
