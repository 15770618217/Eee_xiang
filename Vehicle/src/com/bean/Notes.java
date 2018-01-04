package com.bean;

import java.util.Date;

public class Notes {
	private int Id;
	private String PName;
	private String Name;
	private Date Time;
	private String Additional;
	private int Number;
	
	
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
	public Date getTime() {
		return Time;
	}
	public void setTime(Date time) {
		Time = time;
	}
	public String getAdditional() {
		return Additional;
	}
	public void setAdditional(String additional) {
		Additional = additional;
	}
	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
}
