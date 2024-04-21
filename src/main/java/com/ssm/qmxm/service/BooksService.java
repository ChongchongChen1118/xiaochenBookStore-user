package com.ssm.qmxm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.model.BooksModel;
import com.ssm.qmxm.model.ClassificationModel;
import com.ssm.qmxm.model.OrderModel;

import java.util.List;

public interface BooksService {
    public List<BooksModel> salesVolume();
    public List<BooksModel> recommend();
    public PageInfo<BooksModel> allbooks(Integer pageNum);
    public PageInfo<BooksModel> salesvolume(Integer pageNum);
    public PageInfo<BooksModel> priceasc(Integer pageNum);
    public PageInfo<BooksModel> pricedesc(Integer pageNum);
    public List<ClassificationModel> classification();
    public PageInfo<BooksModel> typeBooks(Integer pageNum,Integer cid);
    public PageInfo<BooksModel> bookName(Integer pageNum,String name);
    public BooksModel onebook(Integer id);
    public int purchase(OrderModel orderModel,String num,String id);
    public int inventory(Integer num,Integer id);
    public PageInfo<OrderModel> ordermo(int id, int pagenum);
    public String getboNumber(Integer id);
}
