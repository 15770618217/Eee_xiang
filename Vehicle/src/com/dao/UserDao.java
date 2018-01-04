package com.dao;

import java.util.List;

import com.bean.User;
import com.bean.Recommend;

public interface UserDao {
public User Find(String phone);
public User Select(String name);	//根据name找寻一个用户
public int Add(User user);
public boolean Delete(int id);
public boolean Update(User user);
public boolean AlterPwd(String phone,String Pwd);//根据电话号码修改密码
public List<Recommend> Recommend();
public List<Recommend> Pick(String select);
}
