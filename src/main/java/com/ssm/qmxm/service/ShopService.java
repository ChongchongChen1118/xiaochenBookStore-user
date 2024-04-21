package com.ssm.qmxm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.dto.ShopModelDTO;
import com.ssm.qmxm.model.BuyerAddress;
import com.ssm.qmxm.model.DistrictCity;
import com.ssm.qmxm.model.DistrictProvince;
import com.ssm.qmxm.model.ShopModel;

import java.util.List;

public interface ShopService {
    public PageInfo<ShopModelDTO> selectshop(Integer id, Integer pagenum);

    public ShopModel selectshopbyid(Integer id, Integer bookid);

    public int insertshop(ShopModel shopModel);

    public int updateshop(ShopModel shopModel, ShopModel shopModel1);

    public int deleteshop(String id);

    public int updateshopyes(String buyer, String shBooks);

    public ShopModel shopbyid(Integer id);

    public List<BuyerAddressDTO> selectAddress(Integer id);

    public int insertAddress(BuyerAddress buyerAddress);

    int updateAddress(BuyerAddress buyerAddress);

    public int deleteAddress(Integer id);
    public List<DistrictProvince> selectProvince();
    public List<DistrictCity> selectCity(Integer id);
    public DistrictProvince selectProvinceByCityId(Integer id);
    public BuyerAddress selectAddressById(Integer id);
    public BuyerAddressDTO selectAddressDTOById(Integer id);
    public int deliver(Integer id);
}

