package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.bean.Review;
import com.bean.Topic;
import com.dao.ReviewDao;
import com.util.DBconnection;

public class ReviewImp implements ReviewDao {
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public int Quantity() {
		int i=0;
		sql="SELECT COUNT(*) FROM review";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				i=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override
	public int Count(int id) {
		int i=0;
		con=DBconnection.getConnection();
		sql="SELECT COUNT(*) FROM review WHERE TId=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while (rs.next()) {
				i=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override
	public List<Review> OneAll(String name) {
		List<Review> list=new ArrayList<Review>();
		Review review=null;
		sql="SELECT * FROM review where TName=? ORDER BY Time DESC";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				review=new Review();
				review.setId(rs.getInt("Id"));
				review.setTitle(rs.getString("Title"));
				review.setText(rs.getString("Text"));
				Timestamp t = rs.getTimestamp("Time");	
				review.setTime(t);
				review.setFName(rs.getString("FName"));
				review.setTName(rs.getString("TName"));
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public void AddReply(Review review) {
		sql="insert into review(Title,FName,Text,TName,Time) values(?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, review.getTitle());
			ps.setString(2, review.getFName());
			ps.setString(3, review.getText());
			ps.setString(4, review.getTName());
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ps.setString(5,df.format(review.getTime()));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

}
