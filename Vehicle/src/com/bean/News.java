package com.bean;

import java.util.Date;

public class News {
	
	private String Content;
	private int Id;
	private String Title;
	private String Img;
	private Date Time;
	private String Adress;
	private String Theme;

	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
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
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public Date getTime() {
		return Time;
	}
	public void setTime(Date time) {
		Time = time;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}
	public String getTheme() {
		return Theme;
	}
	public void setTheme(String theme) {
		Theme = theme;
	}

}
