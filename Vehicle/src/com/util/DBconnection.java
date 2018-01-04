package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconnection {
	public static Connection getConnection(){
	    Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/Vehicle";
			con=DriverManager.getConnection(url,"root","123");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void closeConnection(Connection conn,PreparedStatement ps,ResultSet rs){
		if(rs!=null)
			   try {
			    rs.close();
			   } catch (SQLException e) {
			    e.printStackTrace();
			   }
			  if(ps!=null)
			   try {
			    ps.close();
			   } catch (SQLException e) {
			    e.printStackTrace();
			   }
			  if(conn!=null)
			   try {
			    conn.close();
			   } catch (SQLException e) {
			    e.printStackTrace();
			   }
			  
	}
}

