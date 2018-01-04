package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bean.Notes;
import com.dao.NotesDao;
import com.util.DBconnection;

public class NotesImp implements NotesDao {
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public void Add(Notes note) {
		sql="insert into notes(PName,Name,Additional,Time,Number) values(?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, note.getPName());
			ps.setString(2, note.getName());
			ps.setString(3, note.getAdditional());
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
			String Time=df.format(note.getTime());
			ps.setString(4, Time);
			ps.setInt(5, note.getNumber());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
	}

	@Override
	public List<Notes> Select(String PName, String name) {
		List<Notes> list=new ArrayList<Notes>();
		Notes notes=null;
		sql="select * from notes where PName=? and Name=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, PName);
			ps.setString(2, name);
			rs=ps.executeQuery();
			while(rs.next()){
				notes=new Notes();
				notes.setPName(rs.getString("PName"));
				notes.setName(rs.getString("Name"));
				notes.setNumber(rs.getInt("Number"));
				Timestamp t = rs.getTimestamp("Time");	
			    notes.setTime(t);
//				notes.setTime(new java.util.Date(rs.getDate("Time").getTime()));
				notes.setAdditional(rs.getString("Additional"));
				list.add(notes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public List<Notes> SelectAll(String name) {
		List<Notes> list=new ArrayList<Notes>();
		Notes notes=null;
		sql="select * from notes where PName=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				notes=new Notes();
				notes.setPName(rs.getString("PName"));
				notes.setName(rs.getString("Name"));
				notes.setNumber(rs.getInt("Number"));
				Timestamp t = rs.getTimestamp("Time");	
			    notes.setTime(t);
//				notes.setTime(new java.util.Date(rs.getDate("Time").getTime()));
				notes.setAdditional(rs.getString("Additional"));
				list.add(notes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

}
