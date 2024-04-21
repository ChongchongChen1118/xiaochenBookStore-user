package com.ssm.qmxm.mapper;

import com.ssm.qmxm.model.BooksModel;
import com.ssm.qmxm.model.ClassificationModel;
import com.ssm.qmxm.model.OrderModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BooksMapper {
    public List<BooksModel> salesVolume();
    public List<BooksModel> recommend();
    public List<BooksModel> allbooks();
    public List<BooksModel> salesvolume();
    public List<BooksModel> priceasc();
    public List<BooksModel> pricedesc();
    public List<ClassificationModel> classification();
    public List<BooksModel> typeBooks(Integer cid);
    public List<BooksModel> bookName(String name);
    public BooksModel oneBook(Integer id);
    public int purchase(OrderModel orderModel);
    public int inventory(int inventory,int salt,int boId );
    public List<OrderModel> ordermo(int id);
    public String getboNumber(Integer id);
}
