package com.dao;

import java.util.List;

import com.bean.Topic;

public interface TopicDao {
	
public void Add(Topic topic);
public List<Topic> All();
public List<Topic> adminAll(int start,int end);
public String oneContent(int id);
public Topic oneTotic(int id);
public List<Topic> noAll();
public void verify(int id,String verify);
public int CountAll();
public void Del(int id);
}
