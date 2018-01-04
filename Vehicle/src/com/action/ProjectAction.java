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
	private String rows;//每页显示的记录数    
    private String page;//当前第几页
    private String ids;
    private int Tid;
    
    //管理员查看所有工程
    public String AllProject(){
    	List<Project> list=new ArrayList<Project>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
    	//当前页
    	int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);    
		//每页显示条数    
	    int number = Integer.parseInt((rows == null || rows == "0") ? "5":rows);    
	     //每页的开始记录  第一页为1  第二页为number +1     
	    int start = (intPage-1)*number;  
	    list=projectDao.SelectAll(start,number);
    	jsonMap.put("total", projectDao.CountAll());
    	jsonMap.put("rows", list);
    	JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
    	return "success";
    }
    
    
    //管理员查看未审核的工程
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
    
    
	
	// 用户查看工程  审核合格的
	public String list(){
		List<Project> list=new ArrayList<Project>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		//当前页
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);    
		//每页显示条数    
	    int number = Integer.parseInt((rows == null || rows == "0") ? "5":rows);    
	     //每页的开始记录  第一页为1  第二页为number +1     
	    int start = (intPage-1)*number;  
	    
		list=projectDao.Select(start,number);
		jsonMap.put("total", projectDao.Count());
		jsonMap.put("rows", list);
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
//		System.out.println(resultObj);
		return "success";
	}
	// 发布工程
	public String add(){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		Project project1=new Project();
		ProjectDao projectDao=new ProjectImp();
		
		
		project1.setAdress(project.getAdress());
		project1.setAmount(project.getAmount());
		project1.setBName(project.getBName());
		project1.setContact(project.getContact());
		project1.setName(project.getName());		//发布人姓名从session中读取
		project1.setPName(project.getPName());
		project1.setStartTime(project.getStartTime());
		project1.setTime(project.getTime());
		project1.setVerify("未审核");
		if(projectDao.Add(project1)>0){
			System.out.println("发布成功");
			map.put("result", true);
			resultObj=JSONObject.fromObject(map);
			return "success";
		}else {
			System.out.println("发布失败");
			map.put("result", false);
			resultObj=JSONObject.fromObject(map);
			return "success";
		}
	}
	//删除工程
	public String del(){
		ProjectDao projectDao=new ProjectImp();
		String[] Sid=ids.split(",");
		for(int i=0;i<Sid.length;i++){
			int id=Integer.parseInt(Sid[i]);
			projectDao.Del(id);
		}
		return "success";
	}
	//用户申请工程
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
	// 发布工程用户 查看申请消息
	public String lookapply(){
		
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.apply(user.getName());
		jsonMap.put("total", list.size());
		jsonMap.put("rows", list);
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
//		System.out.println(resultObj);
		return "success";
	}
	//发布人同意用户申请工程
	public void reply(){
		ProjectDao pDao=new ProjectImp();
		int i=pDao.reply(apply.getId(), apply.getReply());
		if(i>0){
			System.out.println("回复成功");
		}else{
			System.out.println("回复失败");
		}
	}
	//管理员审核工程
	public String ver(){
		ProjectDao projectDao=new ProjectImp();
		projectDao.Verify(project.getId(),project.getVerify());
		return "success";
	}
	/*
	 * 用户查看自己申请的工程
	 */
	public String myApply(){
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> map=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.MyApply(user.getName());
		map.put("total", list.size());
		map.put("rows", list);
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
				//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	/*
	 * 用户撤销工程申请
	 */
	public String revoked(){
		ProjectDao projectDao=new ProjectImp();
		int i=projectDao.delete(apply.getPId());
		if(i>0){
		return "success";}else{
			return "success";
		}
	}
	
	//已接受任务 工作中
	public String working(){
		List<Apply> list=new ArrayList<Apply>();
		Map<String, Object> map=new HashMap<String, Object>();
		ProjectDao projectDao=new ProjectImp();
		list=projectDao.MyWork(user.getName());
		map.put("total", list.size());
		map.put("rows", list);
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	//用户查看自己的工程
	public String MyIssue(){
		ProjectDao projectDao=new ProjectImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", projectDao.myIssue(user.getName()));
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	//查看工作的车辆
	public String workingCar(){
		UserInfoDao userInfoDao=new UserInfoImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows",userInfoDao.AllWorking(Tid));
		setResultObj(JSONObject.fromObject(map));
		return "success";
	}
	
	
	
	//  创建set，get方法
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
