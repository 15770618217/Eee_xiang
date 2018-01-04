package com.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.bean.Notes;
import com.dao.NotesDao;
import com.impl.NotesImp;
import com.sun.crypto.provider.RSACipher;
import com.transform.JsonDateValueProcessor2;

public class NotesAction extends SuperAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Notes notes;
	private JSONObject resultObject=null;
	private String Pname;
	
	public String personal() throws UnsupportedEncodingException{
		NotesDao notesDao=new NotesImp();
		List<Notes> list=new ArrayList<Notes>();
		Map<String, Object> map=new HashMap<String, Object>();
		String name=new String(notes.getPName().getBytes("iso-8859-1"),"utf-8");
		String name2=new String(notes.getName().getBytes("iso-8859-1"),"utf-8");
		list=notesDao.Select(name,name2);
		map.put("total", list.size());
		map.put("rows", list);
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor2());
		setResultObject(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	public String add(){
		NotesDao notesDao=new NotesImp();
		Notes note=new Notes();
		note.setAdditional(notes.getAdditional());
		note.setName(notes.getName());
		note.setNumber(notes.getNumber());
		note.setTime(notes.getTime());
		note.setPName(notes.getPName());
		notesDao.Add(note);
		return "success";
	}
	
	//一个工程的所有作业记录
	public  String notes() throws UnsupportedEncodingException{
		NotesDao notesDao=new NotesImp();
		Map<String, Object> map=new HashMap<String, Object>();
		String name=new String(Pname.getBytes("iso-8859-1"),"utf-8");
		map.put("total",notesDao.SelectAll(name));
		map.put("rows", notesDao.SelectAll(name));
		// 在使用JSONObject之前创建JsonConfig对象
	    JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor2());
		setResultObject(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	public Notes getNotes() {
		return notes;
	}

	public void setNotes(Notes notes) {
		this.notes = notes;
	}

	public JSONObject getResultObject() {
		return resultObject;
	}

	public void setResultObject(JSONObject resultObject) {
		this.resultObject = resultObject;
	}

	public String getPname() {
		return Pname;
	}

	public void setPname(String pname) {
		Pname= pname;
	}
}
