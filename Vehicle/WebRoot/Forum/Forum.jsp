<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Forum.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
	table {
	text-align: center;
}
	td{
	border-bottom:#A0522D 1px solid;
	}
	a{text-decoration: none;color:#CD3700;}
	a:hover{text-decoration:underline;color:blue;}
	</style>
  </head>
  
  <body style="background-color: #FFF5EE;height: 100%;width: 100%;">
	<h3 style="text-align: center;">车队论坛</h3> 
   		<table id="ForumTable">
   			<thead>
   			<tr style="background-color: RGB(196,196,196)">
   				<th style="width: 150px">Num</th>
   				<th style="width: 300px">标题</th>
   				<th style="width: 250px">作者</th>
   				<th style="width: 200px">回复</th>
   				<th style="width: 300px">时间</th>
   			</tr>
   			</thead>
   			<tbody>
   				<c:forEach items="${Topic}" var="Topic" varStatus="T">
   					<tr>
   						<td>${T.index+1}</td>
   						<td><a href="${pageContext.request.contextPath}/Topic_content.action?id=${Topic.id}">${Topic.title}</a></td>
   						<td>${Topic.name}</td>
   						<td>${Topic.reviewCount}</td>
   						<td>${Topic.time}</td>
   					</tr>
   				</c:forEach>
   			</tbody>
   		</table>
  </body>
</html>
