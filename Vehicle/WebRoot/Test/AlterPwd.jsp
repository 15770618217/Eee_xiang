<%@ page import="com.bean.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%User user=(User)session.getAttribute("user"); %>
    <title>My JSP 'AlterPwd.jsp' starting page</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	$(function(){
	$("#Pwd").dialog({
			title: '密码修改',    
			iconCls:'icon-edit',
		    width: 400,    
		    height: 200,    
		    closed: false,    
		    cache: false,  
		     
		    modal: true,  
			resizable:false,
			maximizable:false,
			minimizable:false,
			collapsible:false,
			buttons:[{
						text:'保存',
						iconCls:'icon-save',
						handler:function(){
								var pwd1=$("#Pwd1").val();	
								var NPwd=$("#NPwd").val();
								var phone=<%=user.getPhone()%>;
								var Rpwd="<%=user.getPassword()%>";
								if(pwd1!=Rpwd){
										$("#error").css('display','block');
										$("input").val('');
										$("#Pwd1").focus();
																		}else if(NPwd=='' || NPwd==null){
																		var error=$('#error').css('display');
																		if(error=='block'){$('#error').css('display','none');}
																		alert('新密码不能为空！');
																		$("input").val('');
																		$("#Pwd1").focus();
																		}else{
																		$.ajax({
																			type:'POST',
																			url:'${pageContext.request.contextPath}/alterPwd.action',
																			async:false,
																			data:{"user.password":NPwd,"user.phone":phone},
																			success:function(data){
																					$.messager.show({
																							title:'新消息通知',
																							height:200,
																							width:300,
																							iconCls:'icon-ok',
																							msg:'修改密码成功！',
																							timeout:2000,
																												});
																					$("#Pwd").dialog('close');						
																											},
																					});
																		};
														},
						},{
						text:'取消',
						iconCls:'icon-cancel',	
						handler:function(){
									$("#Pwd").dialog('close');
														},
							}],
										});
	});
	</script>
  </head>
  
  <body>
	<div id="Pwd" style="text-align: center">
		<div style="margin-top: 20">
			原密码：<input type="password" id="Pwd1" name="password">
		</div>
		<div style="padding: 10;display: none;color: red" id="error">原密码输入不正确！</div>
		<div style="padding: 10">
			新密码：<input type="password" id="NPwd" name="newpassword">
		</div>
	</div>
  </body>
</html>
