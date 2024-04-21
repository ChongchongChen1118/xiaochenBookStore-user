package com.ssm.qmxm.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.mapper.BooksMapper;
import com.ssm.qmxm.model.BooksModel;
import com.ssm.qmxm.model.ClassificationModel;
import com.ssm.qmxm.model.OrderModel;
import com.ssm.qmxm.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BooksServiceImpl implements BooksService {
    @Autowired
    public BooksMapper booksMapper;
    @Override
    public List<BooksModel> salesVolume(){
        return booksMapper.salesVolume();
    }

    @Override
    public List<BooksModel> recommend() {
        return booksMapper.recommend();
    }

    @Override
    public PageInfo<BooksModel> allbooks(Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.allbooks();
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }
    @Override
    public PageInfo<BooksModel> salesvolume(Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.salesvolume();
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }
    @Override
    public PageInfo<BooksModel> priceasc(Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.priceasc();
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }
    @Override
    public PageInfo<BooksModel> pricedesc(Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.pricedesc();
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }

    @Override
    public List<ClassificationModel> classification() {
        List<ClassificationModel> list=booksMapper.classification();
        return list;
    }
    @Override
    public PageInfo<BooksModel> typeBooks(Integer pageNum,Integer cid) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.typeBooks(cid);
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }
    @Override
    public PageInfo<BooksModel> bookName(Integer pageNum,String name) {
        PageHelper.startPage(pageNum, 8);
        List<BooksModel> list=booksMapper.bookName(name);
        PageInfo<BooksModel> page = new PageInfo<>(list, 5);
        return page;
    }

    @Override
    public BooksModel onebook(Integer id) {
        BooksModel booksModel = booksMapper.oneBook(id);
        return booksModel;
    }

    @Override
    public int purchase(OrderModel orderModel,String num,String id) {
        if(orderModel.orHouse==null||orderModel.orName.equals("")||orderModel.orNum.equals("")||orderModel.orNumber.equals("")||orderModel.orTel.equals("")){
            return -2;
        }
        int a=booksMapper.purchase(orderModel);
        int b=inventory(Integer.parseInt(num),Integer.parseInt(id));
        int c=-1;
        if(a>0&&b>0){
            c=1;
        }
        return c;
    }

    @Override
    public int inventory(Integer num,Integer id) {
        BooksModel booksModel = booksMapper.oneBook(id);
        int a=booksModel.boInventory-num;
        int b=booksModel.boSalt+num;
        return booksMapper.inventory(a,b,id);
    }

    @Override
    public PageInfo<OrderModel> ordermo(int id,int pagenum) {
        PageHelper.startPage(pagenum, 10);
        List<OrderModel> list=booksMapper.ordermo(id);
        PageInfo<OrderModel> page = new PageInfo<>(list, 5);
        return page;
    }

    @Override
    public String getboNumber(Integer id) {
        return booksMapper.getboNumber(id);
    }

}
