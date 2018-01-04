package com.bean;

import java.util.Date;

public class Review {
private int Id;
private String Title;
private String FName;
private String Text;
private Date Time;
private String TName;



public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getFName() {
	return FName;
}
public void setFName(String fName) {
	FName = fName;
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
public String getTName() {
	return TName;
}
public void setTName(String tName) {
	TName = tName;
}
	
}
