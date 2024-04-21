package com.ssm.qmxm.controller;

import com.ssm.qmxm.model.LoginModel;
import com.ssm.qmxm.model.PersonalModel;
import com.ssm.qmxm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class LoginController {

    @Autowired
    public LoginService loginService;

    @RequestMapping("/compare")
    public String login(String account, String pass, Model model, HttpSession httpSession){
        LoginModel loginModel = loginService.account(account, pass);
        if(loginModel!=null){
            if(loginModel.getBuOut().equals("0")) {
                httpSession.setAttribute("user", loginModel);
                return "redirect:/";
            }else{
                model.addAttribute("confirm",2);
                model.addAttribute("account",account);
                return "login/login";
            }
        }
        else{
            model.addAttribute("confirm",1);
            model.addAttribute("account",account);
            return "login/login";
        }
    }
    @RequestMapping("/exit")
    public String exit(HttpSession httpSession){
        httpSession.removeAttribute("user");
        return "redirect:/";
    }
    @RequestMapping("/register")
    public String register(Model model,Integer deposit){
        if(deposit==null){
            return "redirect:/skipemail";
        }
        model.addAttribute("confirm",1);
        return "login/register";
    }
    @RequestMapping("/skipemail")
    public String email(Model model){
        model.addAttribute("aaa",0);
        return "login/email";
    }

    @RequestMapping("/email")
    public String email(String email,Model model){
        String code=""+loginService.random();
        loginService.sendEmail(email,code);
        model.addAttribute("aaa",1);
        model.addAttribute("code",code);
        return "login/email";
    }
    @RequestMapping("/emailjudg")
    public String emailjudg(String code,String code1,Model model){
        if(code.equals(code1)){
            return "redirect:/register?deposit=1";
        }else{
            model.addAttribute("code",code1);
            model.addAttribute("aaa",1);
            model.addAttribute("bbb",1);
            return "login/email";
        }
    }


    @RequestMapping("/register/verification")
    public String comparisonaccount(Model model,String account,String pass1,String pass2){
        int a=loginService.login(account,pass1,pass2);
        if(a==0){
              loginService.save(account,pass1);
              model.addAttribute("value",1);
              model.addAttribute("confirm",0);
              return "login/login";
        }
        else {
            model.addAttribute("account",account);
            model.addAttribute("confirm", a);
            return "login/register";
        }
    }
    @RequestMapping("/personal/{id}")
    public String personal(Model model,@PathVariable("id") int id,HttpSession httpSession){
        LoginModel user = (LoginModel) httpSession.getAttribute("user");
        if(user==null){
            return "forward:/login";
        }
        PersonalModel personal = loginService.personal(id);
        if(personal==null){
            personal=new PersonalModel();
        }
        model.addAttribute("personal",personal);
        return "login/personal";
    }

    @RequestMapping("/updatepersonal")
    public String updatepersonal(PersonalModel personalModel, Model model, HttpSession httpSession, MultipartFile file1) throws IOException {
       if(httpSession.getAttribute("user")==null){
           return "forward:/login";
       }
        PersonalModel personalModel1=loginService.personal(Integer.parseInt(personalModel.cid));
        if(personalModel1==null){
            loginService.insertpersonal(personalModel);
            PersonalModel personalModel2=loginService.personal(Integer.parseInt(personalModel.cid));
            model.addAttribute("personal",personalModel2);
            model.addAttribute("aaa",1);
            return "login/personal";
        }
        else if(personalModel1!=null){
            if(file1.getSize()!=0) {
                //获取上传的文件的文件名
                String fileName = file1.getOriginalFilename();
                //处理文件重名问题
                String hzName = fileName.substring(fileName.lastIndexOf("."));
                fileName = UUID.randomUUID().toString() + hzName;
                //获取服务器中file目录的路径
                String photoPath = "C:\\Users\\23154\\Desktop\\upload";
                File file = new File(photoPath);
                if (!file.exists()) {
                    file.mkdir();
                }
                String finalPath = photoPath + "\\" + fileName;
                //实现上传功能
                file1.transferTo(new File(finalPath));
                personalModel.setXxPhoto("/upload/" + fileName);
            }else{
                String a=loginService.selectPhoto(Integer.parseInt(personalModel.getXxId()));
                personalModel.setXxPhoto(a);
            }
            loginService.updatepersonal(personalModel);
            PersonalModel personalModel2=loginService.personal(Integer.parseInt(personalModel.cid));
            model.addAttribute("personal",personalModel2);
            model.addAttribute("aaa",1);
            return "login/personal";
        }
        return "";
    }
    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("confirm",0);
        return "login/login";
    }
}
