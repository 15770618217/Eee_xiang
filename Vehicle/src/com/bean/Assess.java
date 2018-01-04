package com.bean;

public class Assess {

	private int Id;
	private String Name;
	private int Excellent;
	private int Ordinary;
	private int bad;
	
	
	
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
	public int getExcellent() {
		return Excellent;
	}
	public void setExcellent(int excellent) {
		Excellent = excellent;
	}
	public int getOrdinary() {
		return Ordinary;
	}
	public void setOrdinary(int ordinary) {
		Ordinary = ordinary;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
}
