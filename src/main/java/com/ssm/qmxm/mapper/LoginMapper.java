package com.ssm.qmxm.mapper;

import com.ssm.qmxm.model.LoginModel;
import com.ssm.qmxm.model.PersonalModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
     public LoginModel account(String account);
     public int save(String account,String pass);
     public PersonalModel personal(Integer id);
     public int insertpersonal(PersonalModel personalModel);
     public int updatepersonal(PersonalModel personalModel);
     public String selectPhoto(Integer id);
}
