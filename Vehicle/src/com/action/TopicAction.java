package com.action;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.bean.Discuss;
import com.bean.Project;
import com.bean.Review;
import com.bean.Topic;
import com.bean.User;
import com.dao.DiscussDao;
import com.dao.ProjectDao;
import com.dao.ReviewDao;
import com.dao.TopicDao;
import com.impl.DiscussImp;
import com.impl.ProjectImp;
import com.impl.ReviewImp;
import com.impl.TopicImp;
import com.opensymphony.xwork2.ActionContext;
import com.transform.JsonDateValueProcessor;

public class TopicAction extends SuperAction{
	
	ActionContext ac=ActionContext.getContext();
	Map session=ac.getSession();
	User user=(User) session.get("user");

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JSONObject resultObj=null;
	private int id;
	private Discuss discuss;
	private Topic topic;
	private Review review;
	private String ids;
	private String rows;//每页显示的记录数    
    private String page;//当前第几页

	/*
	 * 所有帖子标题显示
	 */
	public String all(){
		TopicDao topicDao=new TopicImp();
		request.setAttribute("Topic", topicDao.All());
		return "All";
	}

	/*
	 *内容显示
	 */
	public String content(){
		TopicDao topicDao=new TopicImp();
		DiscussDao discussDao=new DiscussImp();
		request.setAttribute("Discuss", discussDao.All(id));
		request.setAttribute("DiscussCount", discussDao.Count(id));
		
		request.setAttribute("detail", topicDao.oneTotic(id));
		return "Content";
	}
	/*
	 * 评论显示
	 */
	public String discuss(){
		DiscussDao discussDao=new DiscussImp();
		request.setAttribute("Discuss", discussDao.All(user.getName()));
		return "Discuss";
	}
	/*
	 * 添加评论
	 */
	public void add(){
		DiscussDao discussDao=new DiscussImp();
		Discuss d=new Discuss();
		d.setTId(discuss.getTId());
		d.setName(discuss.getName());
		d.setText(discuss.getText());
		d.setTime(discuss.getTime());
		discussDao.Add(d);
	}
	
	/*
	 * 发帖发帖
	 */
	public void addForum(){
		Topic t=new Topic();
		TopicDao topicDao=new TopicImp();
		t.setContent(topic.getContent());
		t.setName(topic.getName());
		t.setTime(topic.getTime());
		t.setTitle(topic.getTitle());
		t.setVerify("未审核");
		topicDao.Add(t);
	}
	
	/*
	 * 消息列表
	 */
	public String review(){
		ReviewDao reviewDao=new ReviewImp();
		request.setAttribute("Review", reviewDao.OneAll(user.getName()));
		return "Review";
	}
	
	/*
	 * 评论回复
	 */
	public void reply(){
		ReviewDao reviewDao=new ReviewImp();
		Review r=new Review();
		r.setFName(review.getFName());
		r.setText(review.getText());
		r.setTime(review.getTime());
		r.setTitle(review.getTitle());
		r.setTName(review.getTName());
		reviewDao.AddReply(r);
	}
	
	/*
	 * 回复列表
	 */
	public String myReply() {
		ReviewDao reviewDao=new ReviewImp();
		request.setAttribute("Review", reviewDao.OneAll(user.getName()));
		return "Reply";
	}

	/*
	 * 管理员查看未审核帖子
	 */
	public String noVerify(){
		TopicDao topicDao=new TopicImp();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", topicDao.noAll());
		JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(map,jsonConfig));
		return "success";
	}
	
	/*
	 * 管理员审核帖子合格
	 */
	public String verify(){
		TopicDao topicDao=new TopicImp();
		String[] amount=ids.split(",");
		for(int i=0;i<amount.length;i++){
			topicDao.verify(Integer.parseInt(amount[i]), "合格");
		}
		return "success";
	}
	/*
	 * 管理员审核帖子bu合格
	 */
	public String verify2(){
		TopicDao topicDao=new TopicImp();
		String[] amount=ids.split(",");
		for(int i=0;i<amount.length;i++){
			topicDao.verify(Integer.parseInt(amount[i]), "不合格");
		}
		return "success";
	}
	
	/*
	 * 管理员查看所有的帖子 
	 */
	public String allTopic(){
		List<Topic> list=new ArrayList<Topic>();
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		TopicDao topicDao=new TopicImp();
    	//当前页
    	int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);    
		//每页显示条数    
	    int number = Integer.parseInt((rows == null || rows == "0") ? "5":rows);    
	     //每页的开始记录  第一页为1  第二页为number +1     
	    int start = (intPage-1)*number;  
	    list=topicDao.adminAll(start,number);
    	jsonMap.put("total", topicDao.CountAll());
    	jsonMap.put("rows", list);
    	JsonConfig jsonConfig = new JsonConfig();
    	jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		setResultObj(JSONObject.fromObject(jsonMap,jsonConfig));
    	return "success";
	}
	
	/*
	 * 删除帖子
	 */
	public void del(){
		TopicDao topicDao=new TopicImp();
		String[] amount=ids.split(",");
		for(int i=0;i<amount.length;i++){
			topicDao.Del(Integer.parseInt(amount[i]));
		}
	}
	
	
	public JSONObject getResultObj() {
		return resultObj;
	}


	public void setResultObj(JSONObject resultObj) {
		this.resultObj = resultObj;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Discuss getDiscuss() {
		return discuss;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
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
}
