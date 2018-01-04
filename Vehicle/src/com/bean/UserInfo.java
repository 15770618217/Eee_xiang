package com.bean;

import java.util.Date;

public class UserInfo {
private int Id;
private String Name;
private String Card;
private String Car;
private String Photo;
private String Sex;
private String Licence;
private String Statement;
private Date Time;
private int Experience;

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
	this.Name = name;
}
public String getCard() {
	return Card;
}
public void setCard(String card) {
	Card = card;
}
public String getCar() {
	return Car;
}
public void setCar(String car) {
	Car = car;
}
public String getPhoto() {
	return Photo;
}
public void setPhoto(String photo) {
	Photo = photo;
}
public String getSex() {
	return Sex;
}
public void setSex(String sex) {
	Sex = sex;
}
public String getLicence() {
	return Licence;
}
public void setLicence(String licence) {
	Licence = licence;
}
public String getStatement() {
	return Statement;
}
public void setStatement(String statement) {
	Statement = statement;
}
public Date getTime() {
	return Time;
}
public void setTime(Date time) {
	Time = time;
}
public int getExperience() {
	return Experience;
}
public void setExperience(int experience) {
	Experience = experience;
}
}
