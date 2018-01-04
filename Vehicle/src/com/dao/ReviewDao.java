package com.dao;

import java.util.List;

import com.bean.Review;

public interface ReviewDao {

	public int Quantity();
	public int Count(int id);
	public List<Review> OneAll(String name);
	public void AddReply(Review review);
}
