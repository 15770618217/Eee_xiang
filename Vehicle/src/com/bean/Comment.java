package com.bean;

import java.util.Date;

public class Comment {
	
private int Id;		//��������id
private int PId;	//����id
private String Name;		//����������
private Date Time;			//	����ʱ��
private String Text;			//	��������

public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
}
public int getPId() {
	return PId;
}
public void setPId(int pId) {
	PId = pId;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getText() {
	return Text;
}
public void setText(String text) {
	Text = text;
}
public Date getTime() {
	return Time;
}
public void setTime(Date time) {
	Time = time;
}
}
