package com.ssm.qmxm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.model.BooksModel;
import com.ssm.qmxm.model.ClassificationModel;
import com.ssm.qmxm.model.LoginModel;
import com.ssm.qmxm.model.OrderModel;
import com.ssm.qmxm.service.Impl.BooksServiceImpl;
import com.ssm.qmxm.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class BooksController {
    @Autowired
    public BooksServiceImpl booksService;
    @Autowired
    public ShopService shopService;

    @RequestMapping("/")
    public String index(Model model) {
        List<BooksModel> list = booksService.salesVolume();
        List<BooksModel> list1 = booksService.recommend();
        model.addAttribute("salt1", list.get(0));
        model.addAttribute("salt2", list.get(1));
        model.addAttribute("salt3", list.get(2));
        model.addAttribute("recommend1", list1.get(0));
        model.addAttribute("recommend2", list1.get(1));
        model.addAttribute("recommend3", list1.get(2));
        return "books/index";
    }

    @RequestMapping("/homepage/{pageNum}")
    public String homepage(Model model, @PathVariable("pageNum") Integer pageNum) {
        PageInfo<BooksModel> list = booksService.allbooks(pageNum);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 1);
        return "books/homepage";
    }

    @RequestMapping("/homepage/desc/{desc}")
    public String salesvolume(Model model, @PathVariable("desc") Integer pageNum) {
        PageInfo<BooksModel> list = booksService.salesvolume(pageNum);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 2);
        return "books/homepage";
    }

    @RequestMapping("/homepage/priceasc/{priceasc}")
    public String priceasc(Model model, @PathVariable("priceasc") Integer pageNum) {
        PageInfo<BooksModel> list = booksService.priceasc(pageNum);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 3);
        return "books/homepage";
    }

    @RequestMapping("/homepage/pricedesc/{pricedesc}")
    public String pricedesc(Model model, @PathVariable("pricedesc") Integer pageNum) {
        PageInfo<BooksModel> list = booksService.pricedesc(pageNum);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 4);
        return "books/homepage";
    }

    @RequestMapping("/homepage/type/{pageNum}/{cid}")
    public String typeBooks(Model model, @PathVariable("pageNum") Integer pageNum, @PathVariable("cid") Integer cid) {
        PageInfo<BooksModel> list = booksService.typeBooks(pageNum, cid);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 5);
        model.addAttribute("cid", cid);
        return "books/homepage";
    }

    @RequestMapping("/homepage/name/{pageNum}")
    public String typeBooks(Model model, @PathVariable("pageNum") Integer pageNum, @RequestParam(value = "book", required = false) String name) {
        PageInfo<BooksModel> list = booksService.bookName(pageNum, name);
        List<ClassificationModel> list1 = booksService.classification();
        model.addAttribute("classification", list1);
        model.addAttribute("page", list);
        model.addAttribute("pagetype", 6);
        model.addAttribute("name", name);
        return "books/homepage";
    }

    @RequestMapping("/book/{id}")
    public String book(Model model, @PathVariable("id") Integer id,HttpSession httpSession) {
        LoginModel user =(LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "redirect:/login";
        }
        LoginModel loginModel= (LoginModel) httpSession.getAttribute("user");
        BooksModel booksModel = booksService.onebook(id);
        List<BuyerAddressDTO> list=shopService.selectAddress(loginModel.buId);
        model.addAttribute("list",list);
        model.addAttribute("book", booksModel);
        return "books/book";
    }
    @RequestMapping("/purchase")
    public String purchase(Model model, OrderModel orderModel,String boId,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        if(orderModel.orBuyid.equals("-1")){
            return "redirect:/login";
        }
        else{
            orderModel.setOrTime(new Date());
            int a=booksService.purchase(orderModel,orderModel.orNum,boId);
            if(a>0){
                model.addAttribute("nums",1);
                return "forward:/book/"+boId;
            }
            else{
                model.addAttribute("nums",2);
                return "forward:/book/"+boId;
            }
        }
    }
    @RequestMapping("/orders/{id}/{page}")
    public String ordermo(@PathVariable("id") Integer id, @PathVariable("page") Integer page, Model model, HttpSession httpSession){
        LoginModel user =(LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        PageInfo<OrderModel> pageInfo=booksService.ordermo(id,page);
        model.addAttribute("page",pageInfo);
        return "order/orders";
    }
    @RequestMapping("/propaganda")
    public String propaganda(){
        return "books/propaganda";
    }
}
