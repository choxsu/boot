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
public class RolePermission extends Model<RolePermission> {

    private static final long serialVersionUID=1L;

    @TableId("roleId")
    private Integer roleId;

    @TableField("permissionId")
    private Integer permissionId;


    @Override
    protected Serializable pkVal() {
        return this.roleId;
    }

}
