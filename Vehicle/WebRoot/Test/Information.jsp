<%@page import="com.bean.UserInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Information.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style type="text/css">
 *{
 margin:0px;
 }
 </style>
  </head>
  
  <body>
   <table border="1" bgcolor="#F7F7F7" cellpadding="10" style="width:100%;">
   		<thead>
   			<tr>
   			<th bgcolor="#EEE9E9">名称：</th>
   			<th bgcolor="#EEE9E9">详情：</th>
   			</tr>
   		</thead>
   		<tbody>
   			<tr>
   			<td style="text-align: center;">Id:</td>
   			<td><s:property value="#session.UserInfo.Id"></s:property></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">姓名:</td>
   			<td><s:property value="#session.UserInfo.Name"></s:property></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">性别:</td>
   			<td><s:property value="#session.UserInfo.Sex"></s:property></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">身份证:</td>
   			<td><s:property value="#session.UserInfo.Card"></s:property></td>
   			</tr>
   			<tr>
   			<td style="height:100px;text-align: center;">照片:</td>
   			<td style="height:100px;"><img src="/Vehicle/upload/<s:property value="#session.UserInfo.Photo"/>" style="height:100%;"/></td>
   			</tr>
   			<tr>
   			<td style="height:100px;text-align: center;">驾照:</td>
   			<td style="height:100px;"><img src="/Vehicle/upload/<s:property value="#session.UserInfo.Licence"/>" style="height:100%; "/></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">车牌:</td>
   			<td><s:property value="#session.UserInfo.Car"/></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">车龄:</td>
   			<td><s:property value="#session.UserInfo.Experience"></s:property>年</td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">备注:</td>
   			<td><s:property value="#session.UserInfo.Statement"></s:property></td>
   			</tr>
   			<tr>
   			<td style="text-align: center;">注册时间:</td>
   			<td><s:property value="#session.UserInfo.Time"></s:property></td>
   			</tr>
   		</tbody>
   </table>
  </body>
</html>
