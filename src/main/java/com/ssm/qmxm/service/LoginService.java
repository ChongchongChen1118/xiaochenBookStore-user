package com.ssm.qmxm.service;

import com.ssm.qmxm.model.LoginModel;
import com.ssm.qmxm.model.PersonalModel;

public interface LoginService {
    public LoginModel account(String account,String password);
    public int login(String account,String pass1,String pass2);
    public int save(String account,String pass);
    public PersonalModel personal(int id);
    public int insertpersonal(PersonalModel personalModel);
    public int updatepersonal(PersonalModel personalModel);
    public String selectPhoto(Integer id);
    public void sendEmail(String email,String code);
    public int random();
}
