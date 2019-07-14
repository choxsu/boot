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
 * IP库
 * </p>
 *
 * @author choxsu
 * @since 2019-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class IpRepository extends Model<IpRepository> {

    private static final long serialVersionUID=1L;

    /**
     *  
     */
    @TableId("id")
    private Long id;

    /**
     * IP
     */
    @TableField("ip")
    private String ip;

    /**
     * 国家
     */
    @TableField("country")
    private String country;

    /**
     * 区域
     */
    @TableField("area")
    private String area;

    /**
     * 区域2
     */
    @TableField("region")
    private String region;

    /**
     * 城市
     */
    @TableField("city")
    private String city;

    /**
     * 县
     */
    @TableField("county")
    private String county;

    /**
     * 运营商
     */
    @TableField("isp")
    private String isp;

    /**
     * 国家代码
     */
    @TableField("country_id")
    private String countryId;

    @TableField("area_id")
    private String areaId;

    @TableField("region_id")
    private String regionId;

    @TableField("city_id")
    private String cityId;

    @TableField("county_id")
    private String countyId;

    @TableField("isp_id")
    private String ispId;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
