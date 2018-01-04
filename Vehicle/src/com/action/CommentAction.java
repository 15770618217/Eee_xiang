package com.action;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.bean.Comment;
import com.dao.CommentDao;
import com.impl.CommentImp;
import com.transform.JsonDateValueProcessor2;

public class CommentAction extends SuperAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Comment comment;
	private JSONObject resultObj=null;
	
	public String comment(){
		CommentDao commentDao=new  CommentImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("Comment", commentDao.Select(comment.getPId()));
		// 在使用JSONObject之前创建JsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();  
		//注册我们自定义的date转换器
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor2());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	public void add(){
		CommentDao commentDao=new CommentImp();
		Comment com=new Comment();
		com.setName(comment.getName());
		com.setPId(comment.getPId());
		com.setText(comment.getText());
		com.setTime(comment.getTime());
		commentDao.Add(com);
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public JSONObject getResultObj() {
		return resultObj;
	}
	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}
}
