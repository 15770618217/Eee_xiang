package com.dao;

import java.util.List;

import com.bean.Comment;

public interface CommentDao {
public List<Comment> Select(int id);
public int Add(Comment comment);
public int Del(int id);
}
