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

import org.apache.commons.lang.exception.Nestable;

import com.bean.Discuss;
import com.bean.News;
import com.dao.NewsDao;
import com.util.DBconnection;

public class NewsImp implements NewsDao {
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public void Add(News news) {
		sql="insert into news(Title,Content,Adress,Time,Img) values(?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, news.getTitle());
			ps.setString(2, news.getContent());
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ps.setString(4,df.format(news.getTime()));
			ps.setString(3, news.getAdress());
			ps.setString(5, news.getImg());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

	@Override
	public List<News> All() {
		List<News> list=new ArrayList<News>();
		News news=null;
		sql="select * from news ORDER BY Time DESC";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				news=new News();
				news.setId(rs.getInt("Id"));
				news.setContent(rs.getString("Content"));
				Timestamp time=rs.getTimestamp("Time");
				news.setTime(time);
				news.setTitle(rs.getString("Title"));
				news.setAdress(rs.getString("Adress"));
				news.setImg(rs.getString("Img"));
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

}
