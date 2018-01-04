<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui15/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui15/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui15/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui15/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	
	function register(){
	var reg=/^1(3|4|5|7|8)\d{9}$/;
	var phone=$("#Phone").val();
	if(!reg.test(phone)){
		$("#errorMsg").css('display','inline-block');
									}else{
									$("#Phone").attr("readonly",true);
	$.ajax({
	type:'POST',
	url:'${pageContext.request.contextPath}/Register_register.action',
	async:false,
	data:{"user.phone":phone},
	success:function(data){
					if(data.result!=null){
					$("#errorMsg").html(data.result);
					$("#errorMsg").css('display','inline-block');
					$('#Phone').textbox('textbox').focus();
					}
	},
				});
	}}
	
	function login(){
	window.location.href="${pageContext.request.contextPath}/login/Jsp.jsp";
	}
	
	function mit(){
	var phone=$("#Phone").val();
	var code=$("#code").val();
	var password=$("#Password").val();
	var name=$("#Name").val();
	if(phone==""||phone==null){
		alert("请填写手机号注册！");
		$('#Phone').textbox('textbox').focus();
	}else
	if(name==""||name==null){
		alert("请认真填写姓名！");
		$('#Name').textbox('textbox').focus();
	}else if(password==""||password==null){
		alert("请认真设置密码！");
		$('#Password').textbox('passwordbox').focus();
	}else if(code==""|| code==null){
		alert("请认真填写注册码！");
		$('#code').textbox('textbox').focus();
			}else{
			$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/Register_victory.action',
			async:false,
			data:{"user.phone":phone,"user.name":name,"code":code,"user.password":password},
			success:function(data){
			if(!data.msg){
											$("#msg").html(data.result);
											$("#msg").attr("style","color:red");
											}else{
											$("#msg").html(data.result);
											$("#msg").attr("style","color:green");
											setTimeout(function(){//两秒后跳转  
				                                 location.href = "${pageContext.request.contextPath}/login/Jsp.jsp";
				                              },1000);  
													}
													}
			})
//			$("#form").submit();
			}
	}
	</script>
	
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
	
  </head>
  <body>
		<div style="line-height: 100px;height:100px;text-align: center;">
		<h1 style="color:darkcyan">工程车任务管理系统</h1>
		</div>
		
		<div style="background-color:darkcyan;height:450px;width: 100%">
		
		<div style="float: left;width:600px;margin: 44px 84px 56 27px;">
		<img  src="${pageContext.request.contextPath}/image/car1.png" width=600px style="margin-left: 88px">
		</div>
		
		<div style="float:right;width:332px;height:335px;border: 1px solid lightblue;background-color: #F7F7F7;margin: 70px 144px;">
			<div style="border-bottom: 1px solid lightblue;height:47px;text-align: center;"><b><span>手机号注册</span></b></div>
			<form action="<%=path%>/Register_victory" method="post" id="form" style="margin: 20px 30px 0px 37px;">
				<label for="Phone">手&nbsp;机&nbsp;号&nbsp;：</label>
		    	<input class="easyui-textbox" id="Phone" name="user.phone" prompt="请输入您的手机号"><br>
			  <div style="display: inline-block;">  <div id="errorMsg" style="display: none;color:red">请输入正确的手机号</div><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="register()"style="margin: 0 0 0 166px">发送验证码</a></div>
			    
		<div>
		<label for="Password">&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;：</label>
		<input class="easyui-textbox" id="Name" name="user.name" prompt="请输入您的姓名"/><br><br>
		<label for="Password">设置密码：</label>
		<input class="easyui-passwordbox" id="Password" name="user.password" prompt="请输入您的密码">
		</div><br>
				<label for="code">验&nbsp;证&nbsp;码&nbsp;：</label>
				<input class="easyui-textbox" id="code" name="code">
<!-- 			<s:actionerror cssStyle="color:red" /> -->	
				<div id="msg" ></div>
				<input type="button" style="width:260px;background-color: skyblue;font-size: 17px;margin-top: 20px" value="提      交" onclick="mit();">
			</form>
			<a href="${pageContext.request.contextPath}/login/Jsp.jsp" style="float:right; margin:6px 7px">去登录—></a>
		</div>
		</div><br>
		
		<div style="text-align: center;width:100%;clear: both;"><span style="font-size: 20px;color: black">信息科学与技术学院&copy;尹祥</span><span style="text-decoration: underline;">Construction Vehicle</span></div>
  </body>
</html>
