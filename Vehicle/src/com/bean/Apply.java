package com.bean;

import java.util.Date;

public class Apply {
private int Id; // 申请表id
private int PId;//工程id
private String AName; //申请人
private String Reply;	//申请状态
private Date ApplyTime;//申请时间
private String PName;// 工程名
private String Adress;//  工程地址
private int Amount;// 车辆数量
private Date Time;// 工程发布时间
private String Phone;//联系电话
private String BName;//工程老板

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
public String getAName() {
	return AName;
}
public void setAName(String aName) {
	AName = aName;
}
public String getReply() {
	return Reply;
}
public void setReply(String reply) {
	Reply = reply;
}
public Date getApplyTime() {
	return ApplyTime;
}
public void setApplyTime(Date applyTime) {
	ApplyTime = applyTime;
}
public String getPName() {
	return PName;
}
public void setPName(String pName) {
	PName = pName;
}
public String getAdress() {
	return Adress;
}
public void setAdress(String adress) {
	Adress = adress;
}
public int getAmount() {
	return Amount;
}
public void setAmount(int amount) {
	Amount = amount;
}
public Date getTime() {
	return Time;
}
public void setTime(Date time) {
	Time = time;
}
public String getPhone() {
	return Phone;
}
public void setPhone(String phone) {
	Phone = phone;
}
public String getBName() {
	return BName;
}
public void setBName(String bName) {
	BName = bName;
}

}