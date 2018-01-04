<%@page import="com.bean.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD  HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'form1.jsp' starting page</title>
    <!--  
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  <%SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
  	String date= format.format(new Date());
  	User user=(User)session.getAttribute("user");
  %>
  <body>
  <div style="text-align: center;">
  <p style="text-align:center;font-size: 16px;text-decoration:underline"><strong>工程信息</strong></p>
	<form id="fm" method="post">
		<div class="fitem" >
			<label>工程名称:</label>
			<input name="project.PName" class="easyui-textbox" required="true" id="PName"style="height:30px">&nbsp;&nbsp;
			<label>工程地点:</label>
			<input name="project.Adress" class="easyui-textbox" required="true" id="Adress"style="height:30px">
		</div>
		
		<div class="fitem">
			<label>开工时间:</label>
			<input name="project.StartTime" class="easyui-datetimebox" required="true" id="StartTime" editable="false"style="height:30px">&nbsp;&nbsp;
			<label>工程老板:</label>
			<input name="project.BName" class="easyui-textbox" required="true" id="BName"style="height:30px">
		</div>
		
		<div class="fitem">
			<label>车辆数量:</label>
			<input name="project.Amount" class="easyui-numberbox" required="true" id="Amount"style="height:30px">&nbsp;&nbsp;
			<label>联系电话:</label>
			<input name="project.Contact" type="text" class="easyui-validatebox" data-options="validType:'Mobile',required:true" id="Contact"style="height:30px">
		</div>
		
		<div class="fitem">
			<label>发&nbsp;布&nbsp;人:</label>
			<input name="project.Name" class="easyui-textbox"  value="<%=user.getName()%>" disabled="false"  id="Name"style="height:30px">&nbsp;&nbsp;
			<label>创建时间:</label>
			<input class="easyui-textbox" style="height:30px" value="<%=date%>" id="Time" name="project.Time"disabled="false">
		</div>
		</form>
		</div>
  </body>
</html>
