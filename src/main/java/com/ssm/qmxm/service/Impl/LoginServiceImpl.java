package com.ssm.qmxm.service.Impl;

import com.ssm.qmxm.mapper.LoginMapper;
import com.ssm.qmxm.model.LoginModel;
import com.ssm.qmxm.model.PersonalModel;
import com.ssm.qmxm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    public LoginMapper loginMapper;
    @Autowired
    JavaMailSender javaMailSender;
    @Override
    public LoginModel account(String account,String password) {
        LoginModel loginModel = loginMapper.account(account);
        if(loginModel!=null) {
            String a = loginModel.buPass;
            if (a.equals(password)) {
                return loginModel;
            }
            return null;
        }
        else{
            return null;
        }
    }

    @Override
    public int login(String account,String pass1,String pass2) {
        if(account==null||account==""&&pass1==null||pass1==""&&pass2==null||pass2==""){
            return 1;
        }
        if(pass1.equals(pass2)) {
            LoginModel loginModel = loginMapper.account(account);
            if(loginModel!=null){
                return 3;
            }
        }
        else{
            return 2;
        }
        return 0;
    }

    @Override
    public int save(String account, String pass) {
        loginMapper.save(account,pass);
        return 0;
    }

    @Override
    public PersonalModel personal(int id) {
        PersonalModel personal = loginMapper.personal(id);
        return personal;
    }

    @Override
    public int insertpersonal(PersonalModel personalModel) {
        return loginMapper.insertpersonal(personalModel);
    }

    @Override
    public int updatepersonal(PersonalModel personalModel) {
        return loginMapper.updatepersonal(personalModel);
    }

    @Override
    public String selectPhoto(Integer id){
        return loginMapper.selectPhoto(id);
    }
    @Override
    public void sendEmail(String email,String code){
        SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
        simpleMailMessage.setSubject("小陈图书邮箱验证码！");
        simpleMailMessage.setText("尊敬的："+email+"，您的注册校验码为："+code+"，有效期5分钟，索要校验码的均为骗子！请勿轻易将校验码告诉他人！");
        simpleMailMessage.setTo(email);
        simpleMailMessage.setFrom("2315405873@qq.com");
        javaMailSender.send(simpleMailMessage);
    }
    @Override
    public int random(){
        Random random = new Random();
        int randomNumber = random.nextInt(90000) + 10000;
        return randomNumber;
    }
}
