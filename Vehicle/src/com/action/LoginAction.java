package com.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.bean.User;
import com.dao.UserDao;
import com.dao.UserInfoDao;
import com.impl.UserImp;
import com.impl.UserInfoImp;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends  ActionSupport implements SessionAware{
	
	ActionContext ac=ActionContext.getContext();
	Map session2=ac.getSession();
	User user2=(User) session2.get("user");
	
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private  User user;
private Map session;
public void setSession(Map session) {  
    this.session = session;  
} 
//判断登陆
public String login(){
	UserInfoDao userInfoDao=new UserInfoImp();
	UserDao userDao=new UserImp();
	if(user.getType().equals("用户")){
		User user1=userDao.Find(user.getPhone());
		if(user1==null){
			addActionError("对不起，您还没有权限！请前往注册");
			return "input";
		}else{
			if(!user1.getType().equals("用户")){
				addActionError("对不起，您还没有权限！请前往注册");
				return "input";
			}else{
				if(user1.getPassword().equals(user.getPassword())){
					session.put("user", user1);
					session.put("UserInfo",userInfoDao.SelectInfo(user1 .getName()));
					return "userSuccess";
				}else{
					addActionError("密码错误！");
					return "input";
				}
			}
		}
	}else{
		User user2=userDao.Find(user.getPhone());
		if(user2==null){
			addActionError("对不起,您不是管理员！");
			return "input";
		}else{
			if(!user2.getType().equals("管理员")){
				addActionError("对不起，您没有管理员权限！");
				return "input";
			}else{
				if(!user2.getPassword().equals(user.getPassword())){
					addActionError("密码错误！");
					return "input";
				}else{
					session.put("user",user2);
					return "adminSuccess";
				}
			}
		}
	}
}
//用户退出，清除session中的值
public String out(){
	HttpServletRequest request = ServletActionContext.getRequest(); 
	HttpSession session = request.getSession();  
	session.invalidate();  
	return "input";
}
//用户修改密码
public String alterPwd(){
	UserDao userDao=new UserImp();
	boolean flag=userDao.AlterPwd(user.getPhone(),user.getPassword());
	if(flag){
		return "success";
	}else{
		return "success";
	}
}

//判断是否填写了信息
public String info(){
	UserInfoDao userInfoDao=new UserInfoImp();
	if(userInfoDao.SelectInfo(user2.getName())==null){
		return "noFill";
	}else{
		session.put("UserInfo",userInfoDao.SelectInfo(user2.getName()));
		return "Fill";
	}
}

public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
}
