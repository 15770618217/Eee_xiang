<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.User" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	SimpleDateFormat fomat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String date= fomat.format(new Date());
  User user=(User)session.getAttribute("user");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Content.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
	a{text-decoration: none;}
	a:hover{text-decoration: underline;color:blue;}
	</style>
	<script>
	function discuss(){
		$('#discuss').dialog('open');
	}
	function submit(){
		var text=$('#text').val();
		$('#form').form('submit',{
			onSubmit:function(){
				if(text==null||text==""){
								alert("请正确填写您的评论！"); 
								return false;}
			},
			success:function(){
			$.messager.show({
														width:300,
														height:100,
														title:'新消息通知',
														msg:'评论提交成功！',
														timeout:2000,
														showType:'slide',
			});
			$('#discuss').dialog('close');
			window.location.reload();
			}
		});
	}
	</script>
  </head>
  
  <body style="background-color: #EEE0E5">
    <h3 style="text-align: center;color: blue;">${detail.title}</h3>
    <p style="text-align: center;color:gray;">楼主:&nbsp;${detail.name}&nbsp;&nbsp;&nbsp;&nbsp;时间:&nbsp;${detail.time}&nbsp;&nbsp;&nbsp;&nbsp;回复:&nbsp;${detail.reviewCount}</p>
    <div style="background-color: #F0F0F0;text-indent: 80px;height:100px;font-family: Tahoma;letter-spacing:1px;padding-top: 20px;font-size: 20px;text-indent: 20px;">${detail.content}
    <div><a style="position:relative;right:-1040px;bottom:-42px; color: RGB(100,100,180)" href="javascript:discuss()">我要评论</a></div>
    </div>
    	<p style="margin-top: 5px;">总共&nbsp;${DiscussCount}&nbsp;条评论</p>
    	<c:forEach items="${Discuss}" var="discuss" >
    <div style="background-color: #F0F0F0;">
    		<div style="text-indent: 18px;padding-top: 7px">${discuss.name}:</div>
    		<div style="text-indent: 80px">${discuss.text}</div>
    		<div style="text-align: right;font-size: 10px">时间：${discuss.time}</div>
    </div><br>
    	</c:forEach>
    	<div id="discuss" data-options="iconCls:'icon-com',modal:true,closed:true,buttons:'#bb'" class="easyui-dialog" title="话题评论" style="width:500px;height:300px;top:72px">
    		<form action="${pageContext.request.contextPath}/Topic_add.action" method="post" id="form">
    			<input type="hidden" name="discuss.Name" value="${user.name}">
    			<input type="hidden" name="discuss.TId" value="${detail.id}">
    			<textarea name="discuss.Text" style="width:100%;height:200px;font-size: 20px" id="text"></textarea>
    			<input type="hidden" name="discuss.Time" value="<%=date%>">
    		</form>
    	</div>
    	<div id="bb">
    		<a class="easyui-linkbutton" data-options="iconCls:'icon-in'" onclick="submit()">确认上传</a>
    	</div>
  </body>
</html>
