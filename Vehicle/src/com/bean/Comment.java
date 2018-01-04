package com.bean;

import java.util.Date;

public class Comment {
	
private int Id;		//工程评论id
private int PId;	//工程id
private String Name;		//评论者姓名
private Date Time;			//	评论时间
private String Text;			//	评论内容

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
