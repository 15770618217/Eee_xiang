package com.bean;

import java.util.Date;

public class Topic {
private int Id;
private String Name;
private String Title;
private Date Time;
private String Content;
private int ReviewCount;
private String Verify;

public int getId() {
	return Id;
}
public void setId(int id) {
	Id = id;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public Date getTime() {
	return Time;
}
public void setTime(Date time) {
	Time = time;
}
public String getContent() {
	return Content;
}
public void setContent(String content) {
	Content = content;
}
public int getReviewCount() {
	return ReviewCount;
}
public void setReviewCount(int reviewCount) {
	ReviewCount = reviewCount;
}
public String getVerify() {
	return Verify;
}
public void setVerify(String verify) {
	Verify = verify;
}
}
