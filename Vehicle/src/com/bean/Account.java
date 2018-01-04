package com.bean;

import java.util.Date;

public class Account {

	private int id;
	private String PName;
	private String Worker;
	private int Number;
	private Date Time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
	public String getWorker() {
		return Worker;
	}
	public void setWorker(String worker) {
		Worker = worker;
	}
	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}
	public Date getTime() {
		return Time;
	}
	public void setTime(Date time) {
		Time = time;
	}
}
