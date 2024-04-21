package com.ssm.qmxm.mapper;

import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.dto.ShopModelDTO;
import com.ssm.qmxm.model.BuyerAddress;
import com.ssm.qmxm.model.DistrictCity;
import com.ssm.qmxm.model.DistrictProvince;
import com.ssm.qmxm.model.ShopModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ShopMapper {
    public List<ShopModelDTO> selectshop(Integer id);
    public int insertshop(ShopModel shopModel);
    public ShopModel selectshopbyid(Integer id,Integer bookid);
    public int updatashop(String num,String price,String id,String bookid,String name,String tel,String house);
    public int deleteshop(String id);
    public int updateshopyes(String buyer,String shBooks);
    public ShopModel shopbyid(Integer id);
    public List<BuyerAddressDTO> selectAddress(Integer id);
    public int insertAddress(BuyerAddress buyerAddress);
    public int updateAddress(BuyerAddress buyerAddress);
    public int deleteAddress(Integer id);
    public List<DistrictProvince> selectProvince();
    public List<DistrictCity> selectCity(Integer id);
    public DistrictProvince selectProvinceByCityId(Integer id);
    public BuyerAddress selectAddressById(Integer id);
    public BuyerAddressDTO selectAddressDTOById(Integer id);
    public int deliver(Integer id);
}
