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
public class Visitor extends Model<Visitor> {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 请求的IP地址
     */
    @TableField("ip")
    private String ip;

    /**
     * ip所在地区
     */
    @TableField("address")
    private String address;

    /**
     * 查询结果json
     */
    @TableField("addressJson")
    private String addressJson;

    /**
     * 请求的页面路径
     */
    @TableField("url")
    private String url;

    /**
     * 请求方法
     */
    @TableField("method")
    private String method;

    /**
     * 客户端
     */
    @TableField("client")
    private String client;

    /**
     * 请求时间
     */
    @TableField("requestTime")
    private LocalDateTime requestTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
