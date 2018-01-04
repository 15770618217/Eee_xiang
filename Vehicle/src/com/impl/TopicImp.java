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

import com.bean.Topic;
import com.dao.TopicDao;
import com.util.DBconnection;

public class TopicImp implements TopicDao{
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public void Add(Topic topic) {
		sql="insert into topic(Name,Title,Time,Content,ReviewCount,Verify) values(?,?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, topic.getName());
			ps.setString(2, topic.getTitle());
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ps.setString(3, format.format(topic.getTime()));
			ps.setString(4, topic.getContent());
			ps.setInt(5, 0);
			ps.setString(6, topic.getVerify());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

	@Override
	public List<Topic> All() {
		List<Topic> list=new ArrayList<Topic>();
		Topic topic=null;
		sql="SELECT * FROM topic where Verify='∫œ∏Ò' ORDER BY Time DESC";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				topic=new Topic();
				topic.setId(rs.getInt("Id"));
				topic.setTitle(rs.getString("Title"));
				topic.setName(rs.getString("Name"));
				Timestamp t = rs.getTimestamp("Time");	
				topic.setTime(t);
				topic.setReviewCount(rs.getInt("ReviewCount"));
				topic.setVerify(rs.getString("Verify"));
				list.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public String oneContent(int id) {
		String c=null;
		sql="select Content from topic where Id=?";
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

	@Override
	public Topic oneTotic(int id) {
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
				topic.setContent(rs.getString("Content"));
				topic.setReviewCount(rs.getInt("ReviewCount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return topic;
	}

	@Override
	public List<Topic> noAll() {
		List<Topic> list=new ArrayList<Topic>();
		Topic topic=null;
		sql="SELECT * FROM topic where Verify='Œ¥…Û∫À' ";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				topic=new Topic();
				topic.setId(rs.getInt("Id"));
				topic.setTitle(rs.getString("Title"));
				topic.setName(rs.getString("Name"));
				Timestamp t = rs.getTimestamp("Time");	
				topic.setTime(t);
				topic.setContent(rs.getString("Content"));
				topic.setReviewCount(rs.getInt("ReviewCount"));
				topic.setVerify(rs.getString("Verify"));
				list.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public void verify(int id, String verify) {
		sql="update  topic set Verify=? where Id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, verify);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

	@Override
	public List<Topic> adminAll(int start,int end) {
		List<Topic> list=new ArrayList<Topic>();
		Topic topic=null;
		sql="SELECT * FROM topic ORDER BY Time DESC limit ?,?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()){
				topic=new Topic();
				topic.setId(rs.getInt("Id"));
				topic.setTitle(rs.getString("Title"));
				topic.setName(rs.getString("Name"));
				Timestamp t = rs.getTimestamp("Time");	
				topic.setTime(t);
				topic.setContent(rs.getString("Content"));
				topic.setReviewCount(rs.getInt("ReviewCount"));
				topic.setVerify(rs.getString("Verify"));
				list.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public int CountAll() {
		int i=0;
		sql="SELECT COUNT(*) FROM topic";
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
	public void Del(int id) {
		sql="delete from topic where id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

}
