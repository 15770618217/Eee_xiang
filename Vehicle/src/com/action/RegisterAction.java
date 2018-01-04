package com.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


import msg.CodeActive;
import msg.HttpClientUtil;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.ActionError;
import org.apache.struts2.interceptor.SessionAware;

import com.bean.User;
import com.bean.UserInfo;
import com.dao.UserDao;
import com.dao.UserInfoDao;
import com.impl.UserImp;
import com.impl.UserInfoImp;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private UserInfo info;
	private Map session;
  	private String code;
	private JSONObject resultObj = null;
	private  File Photo;
	private  File Licence;
	private String PhotoFileName;
	private String LicenceFileName;
	
	public File getPhoto() {
		return Photo;
	}
	public void setPhoto(File photo) {
		Photo = photo;
	}
	public File getLicence() {
		return Licence;
	}
	public void setLicence(File licence) {
		Licence = licence;
	}
	public String getPhotoFileName() {
		return PhotoFileName;
	}
	public void setPhotoFileName(String photoFileName) {
		this.PhotoFileName = photoFileName;
	}
	public String getLicenceFileName() {
		return LicenceFileName;
	}
	public void setLicenceFileName(String licenceFileName) {
		LicenceFileName = licenceFileName;
	}

	@Override
	public void setSession(Map session) {
		this.session=session;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public JSONObject getResultObj() {
		return resultObj;
	}
	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public UserInfo getInfo() {
		return info;
	}
	public void setInfo(UserInfo info) {
		this.info = info;
	}
	/*
	 * �û��ֻ���ע�ᷢ����֤����֤
	 */
	public String register(){
		
		String text="ע����֤��:";
		Map<String, Object> map=new HashMap<String, Object>();
		CodeActive code1=new CodeActive();
		session.put("code", code1.code());
		HttpClientUtil client = HttpClientUtil.getInstance();
		String phone= user.getPhone();
		UserDao userDao=new UserImp();
		User U=userDao.Find(phone);
		if(U!=null){
			map.put("result", "���ֻ�����ע�ᣡ");
			this.setResultObj(JSONObject.fromObject(map));
			return "success";
		}else{
			int result = client.sendMsgUtf8("��������", "yinxiang999999999",text+session.get("code")+",ǧ�����߱���Ŷ��",phone);
			if(result>0){
				System.out.println("��֤�뷢�ͳɹ�");
				System.out.println("��֤�룺"+session.get("code"));
			}else{
			session.put("result",client.getErrorMsg(result));
			map.put("result",client.getErrorMsg(result));
			this.setResultObj(JSONObject.fromObject(map));
			System.out.println(client.getErrorMsg(result));
			}
		return "success";
				}
	}
	/*
	 * ��֤��֤���Ƿ���ȷ
	 */
	public String victory(){
		Map<String, Object> map=new HashMap<String, Object>();
		UserDao userDao=new UserImp();
		String precode=(String)session.get("code");
		User user1=new User();
		user1.setName(user.getName());
		user1.setPassword(user.getPassword());
		user1.setPhone(user.getPhone());
		user1.setType("�û�");
		if(precode.equals(code)){
														userDao.Add(user1);
														map.put("msg", true);
														map.put("result","ע��ɹ�����ȥ��¼>" );
														this.setResultObj(JSONObject.fromObject(map));
													}else{
														map.put("msg", false);
														map.put("result","��֤�����벻��ȷ" );
														this.setResultObj(JSONObject.fromObject(map));
													}
		return "success";
	}
	
	/*
	 * �û�����ע����Ϣ ���ظ�����Ϣ
	 */
	public String info() throws IOException{
		Date date=new Date();
		UserInfoDao userInfoDao=new UserInfoImp();
		UserInfo userInfo=new UserInfo();
		File destFile2=new File(ServletActionContext.getServletContext().getRealPath("/upload/"+LicenceFileName));
		File destFile3=new File(ServletActionContext.getServletContext().getRealPath("/upload/"+PhotoFileName));
		FileUtils.copyFile(Photo, destFile3);
		FileUtils.copyFile(Licence, destFile2);
		userInfo.setName(info.getName());
		userInfo.setSex(info.getSex());
		userInfo.setCard(info.getCard());
		userInfo.setPhoto(PhotoFileName);
		userInfo.setLicence(LicenceFileName);
		userInfo.setStatement(info.getStatement());
		userInfo.setTime(date);
		userInfo.setCar(info.getCar());
		userInfo.setExperience(info.getExperience());
		int i=userInfoDao.Add(userInfo);
		ActionContext actionContext=ActionContext.getContext();
		Map<String, Object> session=actionContext.getSession();
		session.put("UserInfo", userInfoDao.SelectInfo(info.getName()));
		if(i>0){
				return "good";
				}else{
					System.out.println("error");
					return "good";
				}
	}

}
