package com.dao;

import java.util.List;

import com.bean.Notes;


public interface NotesDao {
	public void Add(Notes note);									//添加一份作业
	public List<Notes> Select(String PName,String name);		//查看某工程自己的作业
	public List<Notes> SelectAll(String name);						//查看工程的作业
	
}
