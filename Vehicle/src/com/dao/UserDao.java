package com.dao;

import java.util.List;

import com.bean.User;
import com.bean.Recommend;

public interface UserDao {
public User Find(String phone);
public User Select(String name);	//����name��Ѱһ���û�
public int Add(User user);
public boolean Delete(int id);
public boolean Update(User user);
public boolean AlterPwd(String phone,String Pwd);//���ݵ绰�����޸�����
public List<Recommend> Recommend();
public List<Recommend> Pick(String select);
}
