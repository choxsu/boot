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
public class AccountRole extends Model<AccountRole> {

    private static final long serialVersionUID=1L;

    @TableId("accountId")
    private Integer accountId;

    @TableField("roleId")
    private Integer roleId;


    @Override
    protected Serializable pkVal() {
        return this.accountId;
    }

}
