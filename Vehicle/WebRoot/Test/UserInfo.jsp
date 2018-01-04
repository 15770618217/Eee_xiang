<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String Time=sdf.format(new Date());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body {
	text-align:center;
	background-color: #F7F7F7;
	}
	label {
	margin-left:40px;
	width:100px;
	display:inline-block;
	text-align: right;
	}
	#info{
	margin-top: 20px;
	}	
	</style>
	<script type="text/javascript">
	function Check(){
	var regn=/^\d+$/;
	var reg =/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;  
	var regc=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
	var car=$('#Car').val();
	var experience=$("#Experience").val();
	var card=$("#Card").val();
	var name=$("#Name").val();
	var info=$("#Sex").val();
    var licence=$('#Licence').val();
	if(name==""){
	alert("请正确填写姓名！");
	$("#Name").focus();
	return false;
	}
	
	if(!reg.test(card)){
								alert("身份证输入有误！");
								$("#Card").focus();
								return false;
								}
								
	if(experience==""||experience==null||!regn.test(experience)){
	alert("请正确填写您的车龄(只能数字)！");
	$("#Experience").focus();
	return false;
	}
	
	if(!regc.test(car)){
							alert("车牌号输入有误！");
							$("#Car").focus();
							return false;
							}							
	
	if(licence==""||licence==null){
	alert("请上传您的驾照证件！");
	$("#Licence").focus();
	return false;
	}
	
	if($("input[type='file']").val()==""||info==""){
		alert("请完整填写信息！");
		$("#photo").focus();
		return false;
	}	
	}
	</script>
  </head>
  
  <body>
 <u><h2>完善个人信息</h2></u>
 <div style="text-align: center;">
  	<form  id="User" action="Register_info.action" method="post" enctype="multipart/form-data" onSubmit="return Check();">
  		<div id="Info" style="margin-left: -125px;">
	  		<label>姓名：</label>
	  		<input type="text" name="info.Name" placeholder="输入您的中文名" style="height:27px" id="Name">
	  		<label>性别：</label>
	  		<input type="radio" name="info.Sex" value="男" id="Sex">男
  			<input type="radio" name="info.Sex" value="女" id="Sex">女
  		</div>
  		
	  	<div id="Info" style="margin-left: -30px;">
  			<label>身份证：</label>
  			<input type="text" name="info.Card" placeholder="输入您的身份证号" style="height:26px" id="Card">
  			<label>车龄：</label>
  			<input type="text" name="info.Experience" placeholder="车龄只允许数字（年）" style="height:26px" id="Experience">
  		</div>
  		
	  	<div id="Info" style="margin-left: 48px;">
  		<label>车牌号：</label>
  		<input type="text" name="info.Car" placeholder="输入您的车牌号" style="height:27px" id="Car">
  		
  		<label>本人照片：</label>
  		<input type="file" name="Photo" id="photo">
  		</div>
  		
  		<div id="Info" style="margin-left: -43px;">
  		<label>驾驶证凭证：</label>
  		<input type="file" name="Licence" id="Licence">
  		<div style="margin-left: -78px;;display: inline;">
  		<label>备注：</label>
  		<textarea rows="3" name="info.Statement" ></textarea>
  		</div>
  		</div>
  		
  		<div id="Info" style="margin-left: -41px;">
  		<label>注册时间：</label>
  		<input type="text" name="info.Time" value="<%=Time%>" disabled="disabled" style="height:27px">
  		<div style="margin-left: 140px;display: inline;">
  		<input type="submit" value="保存注册信息" style="color: RGB(39,72,98);width:170px;height:28px;">
  		</div>
  		</div>
  		</div>
  	</form>
  </body>
</html>
