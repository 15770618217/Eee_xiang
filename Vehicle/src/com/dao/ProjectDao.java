package com.dao;

import java.util.List;

import com.bean.Apply;
import com.bean.Project;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Woodstox;

public interface ProjectDao {
	public List<Project> SelectAll(int start,int end);  						//��ѯ����ȫ�����̵�list��
	public List<Project> Select(int page,int pagesize);								//��ѯ�Ѿ���˺ϸ�Ĺ���  ��ҳ
	public int Count();												//��ѯ�ܼ�¼�� �û�
	public int CountAll();											//��ѯ�ܼ�¼�� ����Ա
	public List<Apply> apply(String Name);			//��ѯ����Ĺ���
	public int Add(Project project);							//����һ������ 
	public int Del(int id);											//ɾ��һ������ 
	public int Verify(int id,String verify);					//����Ա���һ������
	public int reply(int id,String reply);					//�ظ��û�����
	public int add2(Apply apply); 							// �û�����һ��������ӵ�����
	public List<Apply> MyApply(String name);		//�û��鿴�Լ�����Ĺ���
	public int delete(int id);										//�û��������빤��
	public List<Apply> MyWork(String name);		//�û��鿴�ѽ��ܵĹ���
	public List<Project> noVerify();							//����Ա�鿴δ��˵Ĺ���
	public List<Project> myIssue(String name);							//�û��鿴�Լ���������
}
