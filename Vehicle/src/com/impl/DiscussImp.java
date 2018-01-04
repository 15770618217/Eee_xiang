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

import com.bean.Discuss;
import com.dao.DiscussDao;
import com.util.DBconnection;

public class DiscussImp implements DiscussDao{
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public List<Discuss> All(int id) {
		List<Discuss> list=new ArrayList<Discuss>();
		Discuss discuss=null;
		sql="select * from discuss where TId=? ORDER BY Time DESC";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				discuss=new Discuss();
				discuss.setId(rs.getInt("Id"));
				discuss.setTId(rs.getInt("TId"));
				discuss.setName(rs.getString("Name"));
				discuss.setText(rs.getString("Text"));
				Timestamp time=rs.getTimestamp("Time");
				discuss.setTime(time);
				list.add(discuss);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public int Count(int id) {
		int i=0;
		con=DBconnection.getConnection();
		sql="SELECT COUNT(*) FROM discuss WHERE TId=?";
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
	public void Add(Discuss discuss) {
		sql="insert into discuss(TId,Name,Text,Time) values(?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, discuss.getTId());
			ps.setString(2, discuss.getName());
			ps.setString(3, discuss.getText());
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ps.setString(4,df.format(discuss.getTime()));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

	@Override
	public List<Discuss> All(String name) {
		List<Discuss> list=new ArrayList<Discuss>();
		Discuss discuss=null;
		sql="SELECT *,discuss.`Name` AS DName FROM topic JOIN discuss ON topic.`Name`=? AND topic.Id=discuss.TId ORDER BY discuss.Time DESC;";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,name);
			rs=ps.executeQuery();
			while(rs.next()){
				discuss=new Discuss();
				discuss.setId(rs.getInt("Id"));
				discuss.setTId(rs.getInt("TId"));
				discuss.setTitle(rs.getString("Title"));
				discuss.setName(rs.getString("DName"));
				discuss.setText(rs.getString("Text"));
				Timestamp time=rs.getTimestamp("Time");
				discuss.setTime(time);
				list.add(discuss);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}
	
	
}
