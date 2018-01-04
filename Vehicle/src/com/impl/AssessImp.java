package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.bean.Assess;
import com.dao.AssessDao;
import com.util.DBconnection;

public class AssessImp implements AssessDao{
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;

	@Override
	public int Find(String name) {
		int i=0;
		sql="SELECT COUNT(*) FROM appraisal where name= ?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
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
	public void addAll(Assess assess) {
		sql="insert into appraisal(Name,Excellent,Ordinary,bad) values(?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, assess.getName());
			ps.setInt(2, assess.getExcellent());
			ps.setInt(3, assess.getOrdinary());
			ps.setInt(4, assess.getBad());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		
	}

	@Override
	public void addAppraisal(String name,String assess) {
		con=DBconnection.getConnection();
		if(assess.equals("”≈–„")){
			sql="update appraisal set Excellent=Excellent+1 where Name=?";
			try {
				ps=con.prepareStatement(sql);
				ps.setString(1, name);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBconnection.closeConnection(con, ps, rs);
		}else if(assess.equals("¡º∫√")){
			sql="update appraisal set Ordinary=Ordinary+1 where Name=?";
			try {
				ps=con.prepareStatement(sql);
				ps.setString(1, name);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBconnection.closeConnection(con, ps, rs);
		}else if(assess.equals("≤Ó")){
			sql="update appraisal set bad=bad+1 where Name=?";
			try {
				ps=con.prepareStatement(sql);
				ps.setString(1, name);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBconnection.closeConnection(con, ps, rs);
		}
	}
}
