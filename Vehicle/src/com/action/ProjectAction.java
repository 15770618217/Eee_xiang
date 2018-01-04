package com.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpSession;


import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.bean.Apply;
import com.bean.Project;
import com.bean.User;
import com.dao.ProjectDao;
import com.dao.UserInfoDao;
import com.impl.ProjectImp;
import com.impl.UserInfoImp;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.transform.JsonDateValueProcessor;

public class ProjectAction extends ActionSupport{
	ActionContext ac=ActionContext.getContext();
	Map session=ac.getSession();
	User user=(User) session.get("user");
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private JSONObject resultObj = null;
	private Project project;
	private Apply apply;
	private String rows;//ÿҳ��ʾ�ļ�¼��    
    private String page;//��ǰ�ڼ�ҳ
    private String ids;
    private int Tid;
    
    //����Ա�鿴���й���
    public String AllProject(){
    	List<Project> list=new ArrayList<Project>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
    	//��ǰҳ
    	int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);    
		//ÿҳ��ʾ����    
	    int number = Integer.parseInt((rows == null || rows == "0") ? "5":rows);    
	     //ÿҳ�Ŀ�ʼ��¼  ��һҳΪ1  �ڶ�ҳΪnumber +1     
	    int start = (intPage-1)*number;  
	    list=projectDao.SelectAll(start,number);
    	jsonMap.put("total", projectDao.CountAll());
    	jsonMap.put("rows", list);
    	JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
    	return "success";
    }
    
    
    //����Ա�鿴δ��˵Ĺ���
    public String noVerify(){
    	List<Project> list=new ArrayList<Project>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
    	list=projectDao.noVerify();
    	jsonMap.put("total", list.size());
    	jsonMap.put("rows", list);
    	JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
    	return "success";
    }
    
    
	
	// �û��鿴����  ��˺ϸ��
	public String list(){
		List<Project> list=new ArrayList<Project>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		//��ǰҳ
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);    
		//ÿҳ��ʾ����    
	    int number = Integer.parseInt((rows == null || rows == "0") ? "5":rows);    
	     //ÿҳ�Ŀ�ʼ��¼  ��һҳΪ1  �ڶ�ҳΪnumber +1     
	    int start = (intPage-1)*number;  
	    
		list=projectDao.Select(start,number);
		jsonMap.put("total", projectDao.Count());
		jsonMap.put("rows", list);
		// ��ʹ��JSONObject֮ǰ����JsonConfig����
		JsonConfig jsonConfig = new JsonConfig();  
		//ע�������Զ����dateת����
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
//		System.out.println(resultObj);
		return "success";
	}
	// ��������
	public String add(){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		Project project1=new Project();
		ProjectDao projectDao=new ProjectImp();
		
		
		project1.setAdress(project.getAdress());
		project1.setAmount(project.getAmount());
		project1.setBName(project.getBName());
		project1.setContact(project.getContact());
		project1.setName(project.getName());		//������������session�ж�ȡ
		project1.setPName(project.getPName());
		project1.setStartTime(project.getStartTime());
		project1.setTime(project.getTime());
		project1.setVerify("δ���");
		if(projectDao.Add(project1)>0){
			System.out.println("�����ɹ�");
			map.put("result", true);
			resultObj=JSONObject.fromObject(map);
			return "success";
		}else {
			System.out.println("����ʧ��");
			map.put("result", false);
			resultObj=JSONObject.fromObject(map);
			return "success";
		}
	}
	//ɾ������
	public String del(){
		ProjectDao projectDao=new ProjectImp();
		String[] Sid=ids.split(",");
		for(int i=0;i<Sid.length;i++){
			int id=Integer.parseInt(Sid[i]);
			projectDao.Del(id);
		}
		return "success";
	}
	//�û����빤��
	public String apply(){
		ProjectDao projectDao=new ProjectImp();
		Apply apply1=new Apply();
		apply1.setAName(apply.getAName());
		apply1.setPId(project.getId());
		apply1.setReply(apply.getReply());
		apply1.setApplyTime(apply.getApplyTime());
		int i=projectDao.add2(apply1);
		if(i>0){
			return "success";
		}else{
			return "success";
		}
	}
	// ���������û� �鿴������Ϣ
	public String lookapply(){
		
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.apply(user.getName());
		jsonMap.put("total", list.size());
		jsonMap.put("rows", list);
		// ��ʹ��JSONObject֮ǰ����JsonConfig����
		JsonConfig jsonConfig = new JsonConfig();  
		//ע�������Զ����dateת����
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
//		System.out.println(resultObj);
		return "success";
	}
	//������ͬ���û����빤��
	public void reply(){
		ProjectDao pDao=new ProjectImp();
		int i=pDao.reply(apply.getId(), apply.getReply());
		if(i>0){
			System.out.println("�ظ��ɹ�");
		}else{
			System.out.println("�ظ�ʧ��");
		}
	}
	//����Ա��˹���
	public String ver(){
		ProjectDao projectDao=new ProjectImp();
		projectDao.Verify(project.getId(),project.getVerify());
		return "success";
	}
	/*
	 * �û��鿴�Լ�����Ĺ���
	 */
	public String myApply(){
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> map=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.MyApply(user.getName());
		map.put("total", list.size());
		map.put("rows", list);
		// ��ʹ��JSONObject֮ǰ����JsonConfig����
		JsonConfig jsonConfig = new JsonConfig();  
				//ע�������Զ����dateת����
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	/*
	 * �û�������������
	 */
	public String revoked(){
		ProjectDao projectDao=new ProjectImp();
		int i=projectDao.delete(apply.getPId());
		if(i>0){
		return "success";}else{
			return "success";
		}
	}
	
	//�ѽ������� ������
	public String working(){
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> map=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.MyWork(user.getName());
		map.put("total", list.size());
		map.put("rows", list);
		// ��ʹ��JSONObject֮ǰ����JsonConfig����
		JsonConfig jsonConfig = new JsonConfig();  
		//ע�������Զ����dateת����
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	//�û��鿴�Լ��Ĺ���
	public String MyIssue(){
		ProjectDao projectDao=new ProjectImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", projectDao.myIssue(user.getName()));
		// ��ʹ��JSONObject֮ǰ����JsonConfig����
		JsonConfig jsonConfig = new JsonConfig();  
		//ע�������Զ����dateת����
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	//�鿴�����ĳ���
	public String workingCar(){
		UserInfoDao userInfoDao=new UserInfoImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows",userInfoDao.AllWorking(Tid));
		setResultObj(JSONObject.fromObject(map));
		return "success";
	}
	
	
	
	//  ����set��get����
	public JSONObject getResultObj() {
		return resultObj;
	}
	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public Apply getApply() {
		return apply;
	}
	public void setApply(Apply apply) {
		this.apply = apply;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}


	public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}


	public int getTid() {
		return Tid;
	}


	public void setTid(int tid) {
		Tid = tid;
	}
}
