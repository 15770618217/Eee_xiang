<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String date=format.format(new Date());
 User user=(User)session.getAttribute("user");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'AddForum.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
  	
  	<style type="text/css">
  	label{
  	display: inline;
  	font-family: fantasy;
  	font-size: 17px;
  	}
  	</style>
  	
  	<script>
  	function submit(){
  	var content=$('#content').val();
  	var title=$('#title').val();
  	$('#form').form('submit',{
			onSubmit:function(){
				if(content==null||content==""){
								alert("请仔细填写帖子内容！"); 
								return false;}else if(title==null||title==""){
								alert("帖子标题不能为空！");
								return false;
								}
			},
			success:function(){
			$.messager.show({
														width:300,
														height:100,
														title:'新消息通知',
														msg:'帖子发表成功！',
														timeout:2000,
														showType:'slide',
			});
			$('#form').form('clear');
			}
			});
}
  	</script>
  </head>
  
  <body style="background-color: #7D9EC0">
  <div style="text-align: center;width:600px;height:320px;background-color:#F7F7F7" class="easyui-window" data-options="iconCls:'icon-com',modal:true,collapsible:false,minimizable:false,maxmizable:false,closable:false,">
			<h2 style="text-align: center;text-decoration: underline;">发帖发帖</h2>
			<form action="${pageContext.request.contextPath}/Topic_addForum.action" method="post" id="form" > 
			<label>标题：</label><input class="easyui-textbox" name="topic.Title" id="title" style="height: 30px;"><br><br>
			<label style="vertical-align: top;">内容：</label><textarea name="topic.Content" id="content" style="width:300px;height:100px;font-size: 20px"></textarea>
			<input type="hidden" name="topic.Time" value="<%=date%>">
			<input type="hidden" name="topic.Name" value="${user.name}"><br>
			</form>
			<button onclick="submit()" style="background-color: #D1EEEE;width: 102px;height:31px;margin-right: -450px;margin-top: 35px">确认上传</button>
		</div>
  </body>
</html>
