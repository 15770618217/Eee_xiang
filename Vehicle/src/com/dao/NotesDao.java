package com.dao;

import java.util.List;

import com.bean.Notes;


public interface NotesDao {
	public void Add(Notes note);									//���һ����ҵ
	public List<Notes> Select(String PName,String name);		//�鿴ĳ�����Լ�����ҵ
	public List<Notes> SelectAll(String name);						//�鿴���̵���ҵ
	
}
