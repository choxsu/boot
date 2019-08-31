package com.choxsu.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

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
public class Account extends Model<Account> {


    public Account() {
    }

    public Account(String account) {
        this.account = account;
    }

    @TableField(exist = false)
    private String account;

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("nickName")
    private String nickName;

    @TableField("userName")
    private String userName;

    @TableField("password")
    private String password;

    @TableField("salt")
    private String salt;

    /**
     * 0:正常 -1:无效 1:锁定
     */
    @TableField("status")
    private Integer status;

    @TableField("createAt")
    private LocalDateTime createAt;

    @TableField("ip")
    private String ip;

    @TableField("avatar")
    private String avatar;

    /**
     * 被赞次数
     */
    @TableField("likeCount")
    private Integer likeCount;

    /**
     * 是否第三方登陆 0-否 1-是
     */
    @TableField("isThird")
    private Integer isThird;

    @TableField(exist = false)
    private List<Role> roles;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
