<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String error=(String)request.getAttribute("fail");%>
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
	body{
	background-color: RGB(225,235,249);
	}
	</style>
	<script type="text/javascript">
	function register(){
	window.location.href="Register.jsp";
	}
	
	function submit(){
	var phone=$('#Phone').val();
	var password=$('#Password').val();
	var type=document.getElementsByName("user.Type");
	$('#form').form('submit',{
	onSubmit:function(){
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
																														}
	}
	});
	}
	</script>
</head>
  
  <body >
		<h1 align="center">web工程车任务管理系统登陆</h1>
		<div align="center" style="border: thin;">
			<form action="<%=path%>/Login_login" method="post" id="form">
				<label for="Phone">手机号：</label>
				<input class="easyui-textbox" id="Phone" name="user.Phone" prompt="请输入您的手机号"><br><br>
				<label for="Password">密&nbsp;&nbsp;&nbsp;码：</label>
				<input class="easyui-passwordbox" id="Password" name="user.password" prompt="请输入您的密码" data-options="showEye:true"><br><br>
				<label for="type">权&nbsp;&nbsp;限：</label> 
				<input type="radio" name="user.Type"  value="admin" >管理员
				<input type="radio" name="user.Type"  value="user">普通用户<br>
<input type="submit">		
			</form>
		
		</div>
  </body>
</html>
