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
public class Remind extends Model<Remind> {

    private static final long serialVersionUID=1L;

    /**
     * 用户账号id，必须手动指定，不自增
     */
    @TableId("accountId")
    private Integer accountId;

    /**
     * 提到我的消息条数
     */
    @TableField("referMe")
    private Integer referMe;

    /**
     * 私信条数
     */
    @TableField("message")
    private Integer message;

    /**
     * 粉丝增加个数
     */
    @TableField("fans")
    private Integer fans;


    @Override
    protected Serializable pkVal() {
        return this.accountId;
    }

}
