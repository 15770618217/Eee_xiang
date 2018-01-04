package com.dao;

import java.util.List;

import com.bean.News;

public interface NewsDao {

	
	public void Add(News news);
	public List<News> All();
}
