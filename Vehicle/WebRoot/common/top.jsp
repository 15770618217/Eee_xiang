<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function loginOut(){
	 if(confirm("真的退出系统吗？")){
	 	window.location.href="<%=path%>/Login_out.action";
	 }else{
	 	return false;
	 }
	}
	</script>
	<style type="text/css">
	a:hover{
	text-decoration:underline;color: red;
	}
	</style>
  </head>
  
  <body>
  
   <div data-options="region:'north'" style="width:100%;height:100px;overflow:hidden;scroll:no;font-family:sans-serif;background-color:#03A89E;"><span style="font-size: 45px;font-style: italic;margin-left: 400px">工程车任务管理系统</span>
  			<span style="float:right;font-size:20px; padding-right:20px;padding-top:65px">欢迎您<span style="color:#A52A2A;"><s:property value="#session.user.Name"/></span><s:property value="#session.user.Type"/>
  			<span style="color:#C20C0C;"><a onclick="loginOut();">退出系统</a></span></span>
  		<!--  	<div style="height:100px;text-align: center;line-height: 100px;font-size: 25px;font-family: sans-serif;">任务系统
 			欢迎<s:property value="#session.admin.Name"/>管理员  
 			</div>   -->
  </div>
  </body>
</html>
