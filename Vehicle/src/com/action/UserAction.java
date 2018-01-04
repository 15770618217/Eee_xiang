package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.bean.Apply;
import com.bean.User;
import com.dao.UserDao;
import com.dao.UserInfoDao;
import com.impl.UserImp;
import com.impl.UserInfoImp;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JSONObject resultObj = null;
	private String name;
	private String select;
	

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String look(){
		Map<String, Object> map=new HashMap<String, Object>();
		UserInfoDao userInfoDao=new UserInfoImp();
		map.put("user", userInfoDao.SelectInfo(name));
		resultObj=JSONObject.fromObject(map);
		return "success";
	}
	
	//搜索推荐司机
	public String recommend(){
		Map<String, Object> map=new HashMap<String, Object>();
		UserDao userDao=new UserImp();
		map.put("total",userDao.Recommend().size());
		map.put("rows",userDao.Recommend());
		resultObj=JSONObject.fromObject(map);
		return "success";
	}
	//司机挑选
	public  String pick(){
		Map<String, Object> map=new HashMap<String, Object>();
		UserDao userDao=new UserImp();
		map.put("total",userDao.Pick(select).size());
		map.put("rows",userDao.Pick(select));
		resultObj=JSONObject.fromObject(map);
		return "success";
	}
	
	// get,set方法
	public JSONObject getResultObj() {
		return resultObj;
	}
	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
