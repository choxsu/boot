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
 * 账户-登录第三方表
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class AccountOpen extends Model<AccountOpen> {

    private static final long serialVersionUID=1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 账户ID
     */
    @TableField("accountId")
    private Integer accountId;

    /**
     * 第三方类型，比如qq、weibo
     */
    @TableField("openType")
    private String openType;

    /**
     * 代表用户唯一身份的ID
     */
    @TableField("openId")
    private String openId;

    /**
     * 调用接口需要用到的token，比如利用accessToken发表微博等，如果只是对接登录的话，这个其实没啥用
     */
    @TableField("accessToken")
    private String accessToken;

    /**
     * 授权过期时间，第三方登录授权都是有过期时间的，比如3个月之后，这里存放毫秒数，过期的毫秒数
     */
    @TableField("expiredTime")
    private Long expiredTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
