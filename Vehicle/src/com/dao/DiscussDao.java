package com.dao;

import java.util.List;

import com.bean.Discuss;

public interface DiscussDao {
	
	public List<Discuss> All(String name);
	public List<Discuss> All(int id);
	public int Count(int id);
	public void Add(Discuss discuss);
}
