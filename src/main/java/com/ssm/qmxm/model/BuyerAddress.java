package com.ssm.qmxm.model;

import java.io.Serializable;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * (buyer_address)实体类
 *
 * @author kancy
 * @since 2023-07-10 15:13:35
 * @description 由 Mybatisplus Code Generator 创建
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class BuyerAddress implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * adId
     */
    private Integer adId;
    /**
     * adProvince
     */
    private Integer adProvince;
    /**
     * adCity
     */
    private Integer adCity;
    /**
     * adHouse
     */
    private String adHouse;
    /**
     * adBuyer
     */
    private Integer adBuyer;

}