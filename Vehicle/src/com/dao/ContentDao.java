package com.dao;


import com.bean.Content;
import com.bean.Topic;

public interface ContentDao {

	public String select(int id);
	public Topic oneContent(int id);
	public void addContent(String title,Content content);
}
