package com.dao;


import java.util.List;

import com.bean.UserInfo;


public interface UserInfoDao {
	public int Add(UserInfo info);
	public int Update(UserInfo info);
	public UserInfo SelectInfo(String name);
	public List<UserInfo> AllWorking(int id);
}
