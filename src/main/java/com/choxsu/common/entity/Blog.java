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
public class Blog extends Model<Blog> {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 博客主id
     */
    @TableField("accountId")
    private Integer accountId;

    /**
     * 标题
     */
    @TableField("title")
    private String title;

    /**
     * 内容
     */
    @TableField("content")
    private String content;

    /**
     * 待解析内容
     */
    @TableField("markedContent")
    private String markedContent;

    /**
     * 创建时间
     */
    @TableField("createAt")
    private LocalDateTime createAt;

    /**
     * 修改时间
     */
    @TableField("updateAt")
    private LocalDateTime updateAt;

    /**
     * 点击次数
     */
    @TableField("clickCount")
    private Integer clickCount;

    /**
     * 喜欢次数
     */
    @TableField("likeCount")
    private Integer likeCount;

    /**
     * 收藏次数
     */
    @TableField("favoriteCount")
    private Integer favoriteCount;

    /**
     * 类型 note（笔记）favorite(收藏）code(代码）about(关于）
     */
    @TableField("category")
    private String category;

    /**
     * 是否删除 0否1是
     */
    @TableField("isDelete")
    private Integer isDelete;

    /**
     * tag_id
     */
    @TableField("tag_id")
    private Integer tagId;

    /**
     * 代码分类id，如果category为code时候，这个值才会生效
     */
    @TableField("category_id")
    private Integer categoryId;

    /**
     * 允许评论
     */
    @TableField("allowComments")
    private Boolean allowComments;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
