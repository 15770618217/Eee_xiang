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

import com.bean.Comment;
import com.dao.CommentDao;
import com.util.DBconnection;

public class CommentImp implements CommentDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;
	
	@Override
	public List<Comment> Select(int id) {
		Comment comment=null;
		List<Comment> list=new ArrayList<Comment>();
		sql="select * from comment where PId=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				comment=new Comment();
				comment.setId(rs.getInt("Id"));
				comment.setName(rs.getString("Name"));
				comment.setText(rs.getString("Text"));
				Timestamp t = rs.getTimestamp("Time");	
				comment.setTime(t);
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public int Add(Comment comment) {
		int i=0;
		sql="insert into comment(PId,Name,Text,Time) values(?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, comment.getPId());
			ps.setString(2, comment.getName());
			ps.setString(3, comment.getText());
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			String time=df.format(comment.getTime());
			ps.setString(4, time);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override
	public int Del(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
