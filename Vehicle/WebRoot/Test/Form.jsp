<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Form.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/validator.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("#botton").click(function(){
		$.messager.progress();	// display the progress bar
		alert($("#form").form('validate'));
		$.messager.progress('close');
$('#form').form('submit', {
	url: login.php,
	onSubmit: function(){
		var isValid = $(this).form('validate');
		if (!isValid){
			$.messager.progress('close');	// hide progress bar while the form is invalid
		}
		return isValid;	// return false will stop the form submission
	},
	success: function(){
		$.messager.progress('close');	// hide progress bar while submit successfully
	}
});
    });
    });
    </script>
   </head>
   <body>
   <form id="form" method="post">
   <fieldset>
     姓名：<input type="text" id="name" class="easyui-validatebox" data-options="validType:'CHS',required:true">
   	手机：<input type="text" id="phone" class="easyui-validatebox" data-options="validType:'Mobile',required:true">
   	<input type="button" id="botton" value="提交哦">
   </fieldset>
   </form>
   </body>
	</html>
	