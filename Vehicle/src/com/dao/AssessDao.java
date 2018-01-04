package com.dao;

import com.bean.Assess;


public interface AssessDao {

	public int Find(String name);
	public void addAll(Assess assess);
	public void addAppraisal(String name,String assess);
}
