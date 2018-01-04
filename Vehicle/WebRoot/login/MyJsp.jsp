 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登陆注册</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui15/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui15/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui15/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui15/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{
	margin: 0px;
	}
	span{
	color:darkcyan;
	line-height: 47px;
	}
	a{color:cadetblue;text-decoration: none;}
	a:hover{text-decoration: underline;color:blue;}
	</style>

	<script type="text/javascript">
	
	function register(){
	window.location.href="{pageContext.request.contextPath}/login/Register.jsp";
	}
	
	function submit(){
	var phone=$('#Phone').val();
	var password=$('#Password').val();
	var type=document.getElementsByName("user.Type");
	if(phone==""||phone==null){
							alert("请输入您的手机号！");
							$('#Phone').textbox('textbox').focus();
							return false;
													}else if(password==""||password==null){
													alert("请输入您的密码！");
													$('#Password').sfocus();
													return false;
																														}else if(!type[0].checked && !type[1].checked){
																														alert("请选择您的身份！");
																														$('input:radio:last').focus();
																														return false;
																														}else{
																														return true;}
	}
	
	function mit(){
	if(submit()){
	$('#form').submit();
	}
	}
	</script>
</head>
  
  <body >
		<div style="line-height: 88px;height:88px;background-color: RGB(225,235,249);text-align: center;">
		<h1 style="color:darkcyan">工程车任务管理系统</h1>
		</div>
		
		<div style="background-color: RGB(242,242,242);height:540px;">
		
		<div style="float: right;width:600px;margin: 44px 84px 56 27px;">
		<img  src="${pageContext.request.contextPath}/image/car1.png" width=600px>
		</div>
		
		<div style="float:left;width:330px;height:335px;border: 1px solid lightblue;background-color: #F7F7F7;margin: 70px 144px;">
			<div style="border-bottom: 1px solid lightblue;height:47px;text-align: center;"><span>手机号登录</span></div>
			
			<div style="text-align: center;height:44px">
			<s:actionerror cssStyle="color:red" />
			</div>
			
			<form action="<%=path%>/Login_login" method="post" id="form" style="margin: 0px 30px 0px 50px;">
				<label for="Phone">手机号：</label>
				<input class="easyui-textbox" id="Phone" name="user.Phone" prompt="请输入您的手机号"><br><br>
				<label for="Password">密&nbsp;&nbsp;&nbsp;码：</label>
				<input class="easyui-passwordbox" id="Password" name="user.password" prompt="请输入您的密码"><br><br>
				<label for="type">权&nbsp;&nbsp;限：</label> 
				<input type="radio" name="user.Type"  value="管理员" id="type">管理员
				<input type="radio" name="user.Type"  value="用户" id="type" style="margin-left:23px">普通用户
				<input type="button" style="width:243px;background-color: skyblue;font-size: 17px;margin-top: 20px" value="登      录" onclick="mit();">
			</form>
			<a href="javascript:void(0)" onclick="register();" style="float: right;margin-top: 26px;">没权限？去注册---></a>
		</div>
		</div>
		<div style="background-color: RGB(225,235,249);"></div>
  </body>
</html>
