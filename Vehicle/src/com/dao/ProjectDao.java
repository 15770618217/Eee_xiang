package com.dao;

import java.util.List;

import com.bean.Apply;
import com.bean.Project;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Woodstox;

public interface ProjectDao {
	public List<Project> SelectAll(int start,int end);  						//查询保存全部工程到list中
	public List<Project> Select(int page,int pagesize);								//查询已经审核合格的工程  分页
	public int Count();												//查询总记录数 用户
	public int CountAll();											//查询总记录数 管理员
	public List<Apply> apply(String Name);			//查询申请的工程
	public int Add(Project project);							//发布一个工程 
	public int Del(int id);											//删除一个工程 
	public int Verify(int id,String verify);					//管理员审核一个工程
	public int reply(int id,String reply);					//回复用户申请
	public int add2(Apply apply); 							// 用户申请一个工程添加到表中
	public List<Apply> MyApply(String name);		//用户查看自己申请的工程
	public int delete(int id);										//用户撤销申请工程
	public List<Apply> MyWork(String name);		//用户查看已接受的工程
	public List<Project> noVerify();							//管理员查看未审核的工程
	public List<Project> myIssue(String name);							//用户查看自己发布工程
}
