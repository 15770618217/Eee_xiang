package com.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.bean.Assess;
import com.bean.UserInfo;
import com.dao.AssessDao;
import com.dao.UserInfoDao;
import com.impl.AssessImp;
import com.impl.UserInfoImp;



public class UserInfoAction extends SuperAction{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String appraisal;
	private UserInfo info;
	private JSONObject resultObj = null;
	
public String info(){
	Map<String, Object> map=new HashMap<String, Object>();
	UserInfoDao userInfoDao=new UserInfoImp();
	session.setAttribute("UserInfo", userInfoDao.SelectInfo(name));
	map.put("info", userInfoDao.SelectInfo(name));
	resultObj=JSONObject.fromObject(map);
	return "success";
}

//点评司机
public void evalu(){
	AssessDao assessDao=new AssessImp();
	if(assessDao.Find(name)==0){
		String str=appraisal;
		if(str.equals("优秀")){
			Assess assess=new Assess();
			assess.setBad(0);
			assess.setExcellent(1);
			assess.setName(name);
			assess.setOrdinary(0);
			assessDao.addAll(assess);
		}else if(str.equals("良好")){
			Assess assess=new Assess();
			assess.setBad(0);
			assess.setExcellent(0);
			assess.setName(name);
			assess.setOrdinary(1);
			assessDao.addAll(assess);
		}else if(str.equals("差")){
			Assess assess=new Assess();
			assess.setBad(1);
			assess.setExcellent(0);
			assess.setName(name);
			assess.setOrdinary(0);
			assessDao.addAll(assess);
		}
	}else{
		assessDao.addAppraisal(name, appraisal);
	}
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public JSONObject getResultObj() {
	return resultObj;
}
public void setResultObj(JSONObject resultObj) {
	this.resultObj = resultObj;
}
public UserInfo getInfo() {
	return info;
}
public void setInfo(UserInfo info) {
	this.info = info;
}


public String getAppraisal() {
	return appraisal;
}


public void setAppraisal(String appraisal) {
	this.appraisal = appraisal;
}
}
