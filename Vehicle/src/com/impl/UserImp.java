package com.impl;

import com.bean.Recommend;
import com.bean.User;
import com.bean.UserInfo;
import com.dao.UserDao;
import com.util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserImp implements UserDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;
	private User user;
	@Override
	public User Find(String phone) {
		sql="select * from user where Phone=? limit 1";
		con =DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, phone);
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("Id"));
				user.setName(rs.getString("Name"));
				user.setPassword(rs.getString("Password"));
				user.setPhone(rs.getString("Phone"));
				user.setType(rs.getString("Type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return user;
	}

	@Override
	public User Select(String name) {
		sql="select * from user where Name=? ";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				user=new User();
				user.setId(rs.getInt("Id"));
				user.setName(rs.getString("Name"));
				user.setPhone(rs.getString("Phone"));
				user.setType(rs.getString("Type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return user;
	}

	@Override
	public int Add(User user) {
		int i=0;
		sql="insert into User(Phone,Name,Password,Type) values(?,?,?,?)";
		con=DBconnection.getConnection();
		try {
		ps=con.prepareStatement(sql);
		ps.setString(1, user.getPhone());
		ps.setString(2, user.getName());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getType());
		i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override
	public boolean Delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean Update(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean AlterPwd(String phone,String Pwd) {
		int i=0;
		sql="update user set Password=? where Phone=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, Pwd);
			ps.setString(2, phone);
			i=ps.executeUpdate();
			DBconnection.closeConnection(con, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0){
			return true;
			}else{
			return false;
		}
	}

	@Override
	public List<Recommend> Recommend() {
		Recommend recommend;
		List<Recommend> list=new ArrayList<Recommend>();
		sql="SELECT userinfor.`Name`,userinfor.Car,userinfor.Sex,userinfor.Experience,appraisal.Bad,appraisal.Excellent,appraisal.Ordinary FROM userinfor join appraisal ON userinfor.`Name`=appraisal.`Name`";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				recommend=new Recommend();
				recommend.setName(rs.getString("Name"));
				recommend.setSex(rs.getString("Sex"));
				recommend.setCar(rs.getString("Car"));
				recommend.setExperience(rs.getInt("Experience"));
				recommend.setBad(rs.getInt("Bad"));
				recommend.setOrdinary(rs.getInt("Ordinary"));
				recommend.setExcellent(rs.getInt("Excellent"));
				list.add(recommend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public List<com.bean.Recommend> Pick(String select) {
		Recommend recommend;
		List<Recommend> list=new ArrayList<Recommend>();
		sql="SELECT userinfor.`Name`,userinfor.Car,userinfor.Sex,userinfor.Experience,appraisal.Bad,appraisal.Excellent,appraisal.Ordinary FROM userinfor join appraisal ON userinfor.`Name`=appraisal.`Name` order by ? Desc";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, select);
			rs=ps.executeQuery();
			while(rs.next()){
				recommend=new Recommend();
				recommend.setName(rs.getString("Name"));
				recommend.setSex(rs.getString("Sex"));
				recommend.setCar(rs.getString("Car"));
				recommend.setExperience(rs.getInt("Experience"));
				recommend.setBad(rs.getInt("Bad"));
				recommend.setOrdinary(rs.getInt("Ordinary"));
				recommend.setExcellent(rs.getInt("Excellent"));
				list.add(recommend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}
}
