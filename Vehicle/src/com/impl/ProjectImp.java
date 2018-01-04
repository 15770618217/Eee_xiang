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

import com.bean.Apply;
import com.bean.Project;
import com.dao.ProjectDao;
import com.util.DBconnection;

public class ProjectImp implements ProjectDao {
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql=null;
	
// �û���������
	public int Add(Project project) {
		int i=0;
		sql="insert into project(Name,BName,PName,Time,StartTime,Amount,Contact,Adress,Verify) values(?,?,?,?,?,?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, project.getName());
			ps.setString(2, project.getBName());
			ps.setString(3, project.getPName());
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
            String Time = df.format(project.getTime());
            ps.setString(4, Time);
            DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String StartTime = df2.format(project.getStartTime());
            ps.setString(5, StartTime);
            ps.setInt(6, project.getAmount());
            ps.setString(7, project.getContact());
            ps.setString(8, project.getAdress());
            ps.setString(9,project.getVerify());
            i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override //����Ա�鿴���й��� ʱ�併��
	public List<Project> SelectAll(int start,int end) {
		Project project=null;
		List<Project> list=new ArrayList<Project>();
		sql="select * from project LIMIT ?,?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()){
				project=new Project();
				project.setAdress(rs.getString("Adress"));
				project.setAmount(rs.getInt("Amount"));
				project.setBName(rs.getString("BName"));
				project.setContact(rs.getString("Contact"));
				project.setId(rs.getInt("Id"));
				project.setPName(rs.getString("PName"));
				Timestamp t = rs.getTimestamp("StartTime");		//���ݿ��е�sql.date�ó���ת����util.date��һ�ַ���
				project.setStartTime(t);
//				project.setStartTime(new java.util.Date(rs.getDate("StartTime")));		//�ڶ��ַ���
				Timestamp t2=rs.getTimestamp("Time");
				project.setTime(t2);
//				project.setTime(rs.getDate("Time"));
				project.setVerify(rs.getString("Verify"));
				project.setName(rs.getString("Name"));
				list.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override// ����idɾ������
	public int Del(int id) {
		int i=0;
		sql="delete from project where id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override //����Ա��˹���
	public int Verify(int id,String verify) {
		int i=0;
		sql="update  project set Verify=? where Id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, verify);
			ps.setInt(2, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override// �û��鿴�ϸ񹤳�  ʱ�併��
	public List<Project> Select(int page,int pagesize) {
		Project project=null;
		List<Project> list=new ArrayList<Project>();
		sql="SELECT * FROM project WHERE Verify='�ϸ�' ORDER BY Time DESC LIMIT ?,?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, page);
			ps.setInt(2, pagesize);
			rs=ps.executeQuery();
			while(rs.next()){
				project=new Project();
				project.setAdress(rs.getString("Adress"));
				project.setAmount(rs.getInt("Amount"));
				project.setBName(rs.getString("BName"));
				project.setContact(rs.getString("Contact"));
				project.setId(rs.getInt("Id"));
				project.setPName(rs.getString("PName"));
				Timestamp t = rs.getTimestamp("StartTime");		//���ݿ��е�sql.date�ó���ת����util.date��һ�ַ���
				project.setStartTime(t);
//				project.setStartTime(new java.util.Date(rs.getDate("StartTime")));		//�ڶ��ַ���
				Timestamp t2=rs.getTimestamp("Time");
				project.setTime(t2);
//				project.setTime(rs.getDate("Time"));
				project.setVerify(rs.getString("Verify"));
				project.setName(rs.getString("Name"));
				list.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override//ӦƸ����
	public int add2(Apply apply) {
		int i=0;
		sql="insert into apply(AName,PId,Reply,ApplyTime) values(?,?,?,?)";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, apply.getAName());
			ps.setInt(2, apply.getPId());
			ps.setString(3, apply.getReply());
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
            String Time = df.format(apply.getApplyTime());
            ps.setString(4, Time);
            i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			DBconnection.closeConnection(con, ps, rs);
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}

	@Override// �鿴�������� ���ݹ��̷�����
	public List<Apply> apply(String Name) {
		Apply apply=null;
		List<Apply> list=new ArrayList<Apply>();
		sql="SELECT * FROM project RIGHT JOIN apply ON (project.Id=apply.PId) WHERE project.`Name`=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, Name);
			rs=ps.executeQuery();
			while(rs.next()){
				apply=new Apply();
				apply.setId(rs.getInt("apply.Id"));//apply���е�id
				apply.setPName(rs.getString("PName"));
//				Timestamp t = rs.getTimestamp("StartTime");		//���ݿ��е�sql.date�ó���ת����util.date��һ�ַ���
//				apply.setStartTime(t);
//				project.setStartTime(new java.util.Date(rs.getDate("StartTime")));		//�ڶ��ַ���
				Timestamp t2=rs.getTimestamp("ApplyTime");
				apply.setApplyTime(t2);
				apply.setAName(rs.getString("AName"));
				apply.setReply(rs.getString("Reply"));
				apply.setAdress(rs.getString("Adress"));
				apply.setAmount(rs.getInt("Amount"));
				Timestamp t = rs.getTimestamp("Time");
				apply.setTime(t);
				list.add(apply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}
	/*
	 *  �û�����id�ظ��û�����Ĺ���
	 * @see com.dao.ProjectDao#reply(int, java.lang.String)
	 */
	@Override
	public int reply(int id, String reply) {
		int i=0;
		sql="update  apply set Reply=? where Id=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, reply);
			ps.setInt(2, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}
/*
 * �û���ѯ�б��¼��
 * @see com.dao.ProjectDao#Count()
 */
	@Override
	public int Count() {
		int i=0;
		sql="SELECT COUNT(*) FROM project where Verify= '�ϸ�' ";
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
/*
 * ����������ѯ������Ĺ���
 * @see com.dao.ProjectDao#MyApply(java.lang.String)
 */
	@Override
	public List<Apply> MyApply(String name) {
		Apply apply=null;
		List<Apply> list=new ArrayList<Apply>();
		sql="SELECT * FROM project JOIN apply ON (project.Id=apply.PId) WHERE apply.AName=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				apply=new Apply();
				apply.setPId(rs.getInt("PId"));
				apply.setPName(rs.getString("PName"));
				apply.setBName(rs.getString("BName"));
				apply.setAdress(rs.getString("Adress"));
				Timestamp t=rs.getTimestamp("Time");
				apply.setTime(t);
				Timestamp t2=rs.getTimestamp("ApplyTime");
				apply.setApplyTime(t2);
				apply.setReply(rs.getString("Reply"));
				apply.setPhone(rs.getString("Contact"));
				list.add(apply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
/*
 * ���ݹ�������������
 * @see com.dao.ProjectDao#del(java.lang.String)
 */
	@Override
	public int delete(int id) {
		int i=0;
		sql="delete from apply where PId=?";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return i;
	}
/*
 * �û��Ѿ����ܵĹ���
 * @see com.dao.ProjectDao#MyWork(java.lang.String)
 */
	@Override
	public List<Apply> MyWork(String name) {
		Apply apply=null;
		List<Apply> list=new ArrayList<Apply>();
		sql="SELECT * FROM project JOIN apply ON project.Id=apply.PId WHERE apply.AName=? AND apply.Reply='ӦƸ�ɹ�'";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				apply=new Apply();
				apply.setId(rs.getInt("Id"));
				apply.setPName(rs.getString("PName"));
				apply.setAdress(rs.getString("Adress"));
				apply.setBName(rs.getString("BName"));
				Timestamp t=rs.getTimestamp("ApplyTime");
				apply.setApplyTime(t);
				apply.setPhone(rs.getString("Contact"));
				list.add(apply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

	@Override
	public List<Project> noVerify() {
		Project project=null;
		List<Project> list=new ArrayList<Project>();
		sql="SELECT * FROM project WHERE Verify='δ���' ";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				project=new Project();
				project.setAdress(rs.getString("Adress"));
				project.setAmount(rs.getInt("Amount"));
				project.setBName(rs.getString("BName"));
				project.setContact(rs.getString("Contact"));
				project.setId(rs.getInt("Id"));
				project.setPName(rs.getString("PName"));
				Timestamp t = rs.getTimestamp("StartTime");		//���ݿ��е�sql.date�ó���ת����util.date��һ�ַ���
				project.setStartTime(t);
//				project.setStartTime(new java.util.Date(rs.getDate("StartTime")));		//�ڶ��ַ���
				Timestamp t2=rs.getTimestamp("Time");
				project.setTime(t2);
//				project.setTime(rs.getDate("Time"));
				project.setVerify(rs.getString("Verify"));
				project.setName(rs.getString("Name"));
				list.add(project);
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
		sql="SELECT COUNT(*) FROM project";
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
	public List<Project> myIssue(String name) {
		Project project=null;
		List<Project> list=new ArrayList<Project>();
		sql="SELECT * FROM project WHERE Name=? ";
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while(rs.next()){
				project=new Project();
				project.setAdress(rs.getString("Adress"));
				project.setAmount(rs.getInt("Amount"));
				project.setBName(rs.getString("BName"));
				project.setContact(rs.getString("Contact"));
				project.setId(rs.getInt("Id"));
				project.setPName(rs.getString("PName"));
				Timestamp t = rs.getTimestamp("StartTime");		//���ݿ��е�sql.date�ó���ת����util.date��һ�ַ���
				project.setStartTime(t);
//				project.setStartTime(new java.util.Date(rs.getDate("StartTime")));		//�ڶ��ַ���
				Timestamp t2=rs.getTimestamp("Time");
				project.setTime(t2);
//				project.setTime(rs.getDate("Time"));
				project.setVerify(rs.getString("Verify"));
				project.setName(rs.getString("Name"));
				list.add(project);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconnection.closeConnection(con, ps, rs);
		return list;
	}

}
