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
public class Message extends Model<Message> {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 消息的主人
     */
    @TableField("user")
    private Integer user;

    /**
     * 对方的ID
     */
    @TableField("friend")
    private Integer friend;

    /**
     * 发送者
     */
    @TableField("sender")
    private Integer sender;

    /**
     * 接收者
     */
    @TableField("receiver")
    private Integer receiver;

    /**
     * 0：普通消息，1：系统消息
     */
    @TableField("type")
    private Integer type;

    /**
     * 详细内容
     */
    @TableField("content")
    private String content;

    /**
     * 创建时间
     */
    @TableField("createAt")
    private LocalDateTime createAt;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
