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
import com.bean.UserInfo;
import com.dao.UserInfoDao;
import com.util.DBconnection;

public class UserInfoImp implements UserInfoDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;
	private UserInfo info;
	@Override
	public int Add(UserInfo info) {
		int i=0;
		sql="insert into userinfor(Name,Card,Photo,Sex,Licence,Car,Statement,Time,Experience) values(?,?,?,?,?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, info.getName());
			ps.setString(2, info.getCard());
			ps.setString(3, info.getPhoto());
			ps.setString(4, info.getSex());
			ps.setString(5, info.getLicence());
			ps.setString(6, info.getCar());
			ps.setString(7, info.getStatement());
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String Time = df.format(info.getTime());
			ps.setString(8, Time);
			ps.setInt(9, info.getExperience());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}
	@Override
	public int Update(UserInfo info) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public UserInfo SelectInfo(String name) {
		sql="select * from userinfor where Name=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				info=new UserInfo();
				info.setId(rs.getInt("Id"));
				info.setName(rs.getString("Name"));
				info.setSex(rs.getString("Sex"));
				info.setCard(rs.getString("Card"));
				info.setLicence(rs.getString("Licence"));
				info.setPhoto(rs.getString("Photo"));
				info.setCar(rs.getString("Car"));
				info.setStatement(rs.getString("Statement"));
				Timestamp t=rs.getTimestamp("Time");
				info.setTime(t);
				info.setExperience(rs.getInt("Experience"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return info;
	}
	@Override
	public List<UserInfo> AllWorking(int id) {
		List<UserInfo> list=new ArrayList<UserInfo>();
		sql="SELECT * FROM apply RIGHT JOIN userinfor ON apply.AName=userinfor.`Name` WHERE apply.PId=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				info=new UserInfo();
				info.setName(rs.getString("Name"));
				info.setSex(rs.getString("Sex"));
				info.setCar(rs.getString("Car"));
				info.setExperience(rs.getInt("Experience"));
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

}
