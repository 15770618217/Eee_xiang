<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'IssueNews.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	</style>
  </head>
  
  <body style="background-color: #F5F5F5;">
    <h2 style="text-align: center;letter-spacing: 15px;color:gray">新闻资讯</h2> 
	<c:forEach items="${News}" var="news" varStatus="n"><div style="height:220px;border-top: 1px solid #ccc">
	<div style="margin-top: 10px;height:200px;">
			<div style="width:200px;float:left;padding-left: 20px">
			<img alt="没有相关图片" src="upload/${news.img}" style="width:200px;height:200px;text-align: center;line-height: 200px;color: blue">
			</div>
			
			<div  style="margin-left: 258px;color:blue">
			${news.title}
			</div>
			
			<div style="margin-left: 258px;padding-top: 5px;color:gray">${news.time} &nbsp;&nbsp; &nbsp;&nbsp;来源：${news.adress} </div>
			<div style="margin-left: 258px;padding-top: 10px;">${news.content}</div>
	</div>
	</div>
	</c:forEach>    
  </body>
</html>
