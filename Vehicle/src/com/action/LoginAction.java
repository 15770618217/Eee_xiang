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
//�жϵ�½
public String login(){
	UserInfoDao userInfoDao=new UserInfoImp();
	UserDao userDao=new UserImp();
	if(user.getType().equals("�û�")){
		User user1=userDao.Find(user.getPhone());
		if(user1==null){
			addActionError("�Բ�������û��Ȩ�ޣ���ǰ��ע��");
			return "input";
		}else{
			if(!user1.getType().equals("�û�")){
				addActionError("�Բ�������û��Ȩ�ޣ���ǰ��ע��");
				return "input";
			}else{
				if(user1.getPassword().equals(user.getPassword())){
					session.put("user", user1);
					session.put("UserInfo",userInfoDao.SelectInfo(user1 .getName()));
					return "userSuccess";
				}else{
					addActionError("�������");
					return "input";
				}
			}
		}
	}else{
		User user2=userDao.Find(user.getPhone());
		if(user2==null){
			addActionError("�Բ���,�����ǹ���Ա��");
			return "input";
		}else{
			if(!user2.getType().equals("����Ա")){
				addActionError("�Բ�����û�й���ԱȨ�ޣ�");
				return "input";
			}else{
				if(!user2.getPassword().equals(user.getPassword())){
					addActionError("�������");
					return "input";
				}else{
					session.put("user",user2);
					return "adminSuccess";
				}
			}
		}
	}
}
//�û��˳������session�е�ֵ
public String out(){
	HttpServletRequest request = ServletActionContext.getRequest(); 
	HttpSession session = request.getSession();  
	session.invalidate();  
	return "input";
}
//�û��޸�����
public String alterPwd(){
	UserDao userDao=new UserImp();
	boolean flag=userDao.AlterPwd(user.getPhone(),user.getPassword());
	if(flag){
		return "success";
	}else{
		return "success";
	}
}

//�ж��Ƿ���д����Ϣ
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
