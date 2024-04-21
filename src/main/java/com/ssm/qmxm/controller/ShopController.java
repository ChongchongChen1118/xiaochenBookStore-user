package com.ssm.qmxm.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.qmxm.dto.BuyerAddressDTO;
import com.ssm.qmxm.dto.ShopModelDTO;
import com.ssm.qmxm.model.*;
import com.ssm.qmxm.service.BooksService;
import com.ssm.qmxm.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    ShopService shopService;
    @Autowired
    BooksService booksService;
    @RequestMapping("/selectshop/{id}/{page}")
    public String selectshop(Model model, HttpSession httpSession, @PathVariable("id") Integer id, @PathVariable("page") Integer page){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        PageInfo<ShopModelDTO> list=shopService.selectshop(id,page);
        model.addAttribute("page",list);
        return "shop/shop";
    }
    @RequestMapping("/insertshop")
    public String insertshop(Model model,ShopModel shopModel,HttpSession httpsession){
        LoginModel user =(LoginModel) httpsession.getAttribute("user");
        if(user==null){
            return "redirect:/login";
        }
        System.out.println(shopModel);
        ShopModel shopModel1=shopService.selectshopbyid(Integer.parseInt(shopModel.shBuyer),Integer.parseInt(shopModel.shBooks));
        if(shopModel1==null){
            int a=shopService.insertshop(shopModel);
            if(a>0){
                model.addAttribute("prompt",1);
                return "forward:/book/"+shopModel.getShBooks();
            }
            else {
                model.addAttribute("prompt",2);
                return "forward:/book/"+shopModel.getShBooks();
            }
        }
        else{
            int b=shopService.updateshop(shopModel,shopModel1);
            if(b>0) {
                model.addAttribute("prompt", 1);
                return "forward:/book/" + shopModel.getShBooks();
            }
            else{
                model.addAttribute("prompt", 2);
                return "forward:/book/" + shopModel.getShBooks();
            }
        }
    }
    @RequestMapping("/deleteshop/{id}")
    public String deleteshop(@PathVariable("id") String id,Model model,HttpSession httpSession){
        shopService.deleteshop(id);
        model.addAttribute("delete",1);
        LoginModel loginModel=(LoginModel) httpSession.getAttribute("user");
        if(loginModel==null){
            return "forward:/login";
        }
        Integer idd=loginModel.buId;
        return "forward:/selectshop/"+idd+"/1";
    }
    @RequestMapping("/shopbuy/{id}")
    public String shopbuy(@PathVariable("id")Integer id,Model model,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        ShopModel shopModel=shopService.shopbyid(id);
        shopService.updateshopyes(shopModel.getShBuyer(),shopModel.getShBooks());
        String boNumber=booksService.getboNumber(Integer.parseInt(shopModel.getShBooks()));
        BuyerAddressDTO buyerAddressDTO=shopService.selectAddressDTOById(Integer.parseInt(shopModel.getShHouse()));
        OrderModel orderModel=new OrderModel();
        orderModel.setOrBuyid(shopModel.getShBuyer());
        orderModel.setOrNum(shopModel.getShNum());
        orderModel.setOrName(shopModel.getShName());
        orderModel.setOrHouse(buyerAddressDTO.getPrName()+' '+buyerAddressDTO.getCiName()+' '+buyerAddressDTO.getAdHouse());
        orderModel.setOrTel(shopModel.getShTel());
        orderModel.setOrNumber(boNumber);
        orderModel.setOrTime(new Date());
        booksService.purchase(orderModel,shopModel.getShNum(),shopModel.getShBooks());
        model.addAttribute("buy",1);
        return "forward:/selectshop/"+shopModel.getShBuyer()+"/1";
    }

    @RequestMapping("/address")
    public String address(HttpSession httpSession,Model model){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        LoginModel loginModel= (LoginModel) httpSession.getAttribute("user");
        List<BuyerAddressDTO> list=shopService.selectAddress(loginModel.buId);
        model.addAttribute("list",list);
        return "shop/address";
    }

    @RequestMapping("/insertaddress/{cid}")
    public String insertaddress(HttpSession httpSession, Model model,@PathVariable("cid") Integer cid){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        LoginModel loginModel= (LoginModel) httpSession.getAttribute("user");
        List<DistrictCity> list2=shopService.selectCity(cid);
        List<DistrictProvince> list1=shopService.selectProvince();
        model.addAttribute("province",list1);
        model.addAttribute("city",list2);
        model.addAttribute("cid",cid);
        return "shop/addaddress";
    }

    @RequestMapping("/addressjudgment")
    public String addressjudgment(BuyerAddress buyerAddress,Model model,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        LoginModel loginModel= (LoginModel) httpSession.getAttribute("user");
        buyerAddress.setAdProvince(shopService.selectProvinceByCityId(buyerAddress.getAdCity()).getPrId());
        if(buyerAddress.getAdId()==null){
            if(buyerAddress.getAdHouse().equals("")){
                model.addAttribute("not1",1);
                List<DistrictCity> list2=shopService.selectCity(shopService.selectProvinceByCityId(buyerAddress.getAdCity()).getPrId());
                List<DistrictProvince> list1=shopService.selectProvince();
                model.addAttribute("province",list1);
                model.addAttribute("city",list2);
                model.addAttribute("cid",shopService.selectProvinceByCityId(buyerAddress.getAdCity()).getPrId());
                model.addAttribute("cityId",buyerAddress.getAdCity());
                return "shop/addaddress";
            }
            buyerAddress.setAdBuyer(loginModel.getBuId());
            shopService.insertAddress(buyerAddress);
            model.addAttribute("judgment",1);
            return "forward:/address";
        }
        if(buyerAddress.getAdHouse().equals("")){
            model.addAttribute("not1",1);
            List<DistrictCity> list2=shopService.selectCity(shopService.selectProvinceByCityId(buyerAddress.getAdCity()).getPrId());
            List<DistrictProvince> list1=shopService.selectProvince();
            model.addAttribute("province",list1);
            model.addAttribute("city",list2);
            model.addAttribute("buyerAddress",buyerAddress);
            model.addAttribute("cid",shopService.selectProvinceByCityId(buyerAddress.getAdCity()).getPrId());
            model.addAttribute("id",buyerAddress.getAdId());
            return "shop/updateaddress";
        }
        shopService.updateAddress(buyerAddress);
        model.addAttribute("judgment",2);
        return "forward:/address";
    }

    @RequestMapping("/updateaddress/{id}/{cid}")
    public String updateaddress(HttpSession httpSession, Model model,@PathVariable("id") Integer id,@PathVariable("cid") Integer cid){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        BuyerAddress buyerAddress=shopService.selectAddressById(id);
        List<DistrictCity> list2=shopService.selectCity(cid);
        List<DistrictProvince> list1=shopService.selectProvince();
        model.addAttribute("province",list1);
        model.addAttribute("city",list2);
        model.addAttribute("buyerAddress",buyerAddress);
        model.addAttribute("cid",cid);
        model.addAttribute("id",id);
        return "shop/updateaddress";
    }

    @RequestMapping("/deleteaddress/{id}")
    public String deleteaddress(Model model,@PathVariable("id")Integer id,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        try {
            shopService.deleteAddress(id);
        }catch (Exception exception){
            model.addAttribute("judgment",4);
            return "forward:/address";
        }
        model.addAttribute("judgment",3);
        return "forward:/address";
    }

    @RequestMapping("/deliver/{id}")
    public String deliver(Model model,@PathVariable("id")Integer id,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        LoginModel loginModel= (LoginModel) httpSession.getAttribute("user");
        shopService.deliver(id);
        model.addAttribute("deliver",1);
        return "forward:/orders/"+loginModel.buId+"/1";
    }
}
