package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.bean.Content;
import com.bean.Topic;
import com.dao.ContentDao;
import com.util.DBconnection;

public class ContentImp implements ContentDao {
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public String select(int id) {
		String c=null;
		sql="select Content from content where TId=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				c=rs.getString("Content");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return c;
	}
	
	public Topic oneContent(int id){
		Topic topic=new Topic();
		sql="select * from topic where Id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				topic.setId(rs.getInt("Id"));
				topic.setName(rs.getString("Name"));
				Timestamp timestamp=rs.getTimestamp("Time");
				topic.setTime(timestamp);
				topic.setTitle(rs.getString("Title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return topic;
	}

	@Override
	public void addContent(String title,Content content) {
	}
	
	
}
