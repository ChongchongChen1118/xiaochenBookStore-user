package com.ssm.qmxm.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.dto.ShopModelDTO;
import com.ssm.qmxm.mapper.ShopMapper;
import com.ssm.qmxm.model.BuyerAddress;
import com.ssm.qmxm.model.DistrictCity;
import com.ssm.qmxm.model.DistrictProvince;
import com.ssm.qmxm.model.ShopModel;
import com.ssm.qmxm.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    ShopMapper shopMapper;

    @Override
    public PageInfo<ShopModelDTO> selectshop(Integer id,Integer pagenum) {
        PageHelper.startPage(pagenum, 8);
        List<ShopModelDTO> list=shopMapper.selectshop(id);
        PageInfo<ShopModelDTO> page = new PageInfo<>(list, 5);
        return page;
    }

    @Override
    public ShopModel selectshopbyid(Integer id, Integer bookid) {
        ShopModel list=shopMapper.selectshopbyid(id,bookid);
        return list;
    }

    @Override
    public int insertshop(ShopModel shopModel) {
        if(shopModel.getShName().equals("")||shopModel.getShTel().equals("")||shopModel.getShHouse()==null||shopModel.getShNum().equals("")){
            return -1;
        }
        Integer a=Integer.parseInt(shopModel.getShNum())*Integer.parseInt(shopModel.getShPrice());
        shopModel.setShPrice(""+a);
        return shopMapper.insertshop(shopModel);
    }

    @Override
    public int updateshop(ShopModel shopModel, ShopModel shopModel1) {
        if(shopModel.getShNum().equals("")){
            return -1;
        }
        Integer num=Integer.parseInt(shopModel.getShNum())+Integer.parseInt(shopModel1.getShNum());
        Integer price=(Integer.parseInt(shopModel.getShPrice())*Integer.parseInt(shopModel.getShNum()))+Integer.parseInt(shopModel1.getShPrice());
        return shopMapper.updatashop(""+num,""+price,shopModel.getShBuyer(),shopModel.getShBooks(),shopModel.getShName(),shopModel.getShTel(),shopModel.getShHouse());
    }

    @Override
    public int deleteshop(String id) {
        return shopMapper.deleteshop(id);
    }

    @Override
    public int updateshopyes(String buyer, String shBooks) {
        return shopMapper.updateshopyes(buyer,shBooks);
    }

    @Override
    public ShopModel shopbyid(Integer id) {
        return shopMapper.shopbyid(id);
    }

    @Override
    public List<BuyerAddressDTO> selectAddress(Integer id){
        return shopMapper.selectAddress(id);
    }

    @Override
    public int insertAddress(BuyerAddress buyerAddress){
        return shopMapper.insertAddress(buyerAddress);
    }
    @Override
    public int updateAddress(BuyerAddress buyerAddress){
        return shopMapper.updateAddress(buyerAddress);
    }

    @Override
    public int deleteAddress(Integer id){
        return shopMapper.deleteAddress(id);
    }

    @Override
    public List<DistrictProvince> selectProvince(){
        return shopMapper.selectProvince();
    }

    @Override
    public List<DistrictCity> selectCity(Integer id){
        return shopMapper.selectCity(id);
    }

    @Override
    public DistrictProvince selectProvinceByCityId(Integer id){
        return shopMapper.selectProvinceByCityId(id);
    }

    @Override
    public BuyerAddress selectAddressById(Integer id){
        return shopMapper.selectAddressById(id);
    }

    @Override
    public BuyerAddressDTO selectAddressDTOById(Integer id){
        return shopMapper.selectAddressDTOById(id);
    }

    @Override
    public int deliver(Integer id){
        return shopMapper.deliver(id);
    }
 }
