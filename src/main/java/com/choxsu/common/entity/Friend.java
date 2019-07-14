package com.choxsu.common.entity;

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
public class Friend extends Model<Friend> {

    private static final long serialVersionUID=1L;

    /**
     * 账户ID
     */
    @TableId("accountId")
    private Integer accountId;

    /**
     * 朋友账户ID
     */
    @TableField("friendId")
    private Integer friendId;

    /**
     * 创建时间
     */
    @TableField("createAt")
    private LocalDateTime createAt;


    @Override
    protected Serializable pkVal() {
        return this.accountId;
    }

}
