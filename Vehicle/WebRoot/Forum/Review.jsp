<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bean.User" %>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
User user=(User)request.getAttribute("user");
SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String date=format.format(new Date());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Review.jsp' starting page</title>
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{
	margin: 0px;
	}
	td{
	border-bottom:#A0522D 1px solid;
	}
	a{text-decoration: none;color:blue;}
	a:hover{text-decoration:underline;color:#CD3700;}
	</style>
	
	<script type="text/javascript">
	var title,name;
	function reply(title,name){
		$('#reply').dialog('open');
		$('#title').val(title);
		$('#name').val(name);
	}
	function submit(){
	var text=$('#text').val();
	$('#form').form('submit',{
	onSubmit:function(){
	if(text==""||text==null){
									alert("请填写回复内容再提交！");
									return false;
											}
									   },
	success:function(){
								$('#reply').dialog('close');
								window.location.reload();
									}
	});
	}
	</script>
  </head>
  <body style="background-color: #EEEED1;">
  		<table style="text-align: center;">
  			<thead>
  				<tr style="background-color: RGB(196,196,196)">
  					<th style="width: 50px">Num</th>
  					<th style="width: 300px">帖子标题</th>
  					<th style="width: 300px">回复内容</th>
  					<th style="width: 200px">回复用户</th>
  					<th style="width: 200px">回复时间</th>
  					<th style="width: 150px">&nbsp;操&nbsp;&nbsp;作</th>
  				</tr>
  			</thead>
  			<tbody>
				<c:forEach items="${Review}" var="review" varStatus="r">
					<tr>
						<td>${r.index+1}</td>
						<td>${review.title}</td>
						<td>${review.text}</td>
						<td>${review.FName}</td>
						<td>${review.time}</td>
						<td><a href="javascript:void(0)" onclick="reply('${review.title}','${review.FName}');">回复</a></td>
					</tr>
				</c:forEach>
  			</tbody>
  		</table>
  		<div class="easyui-dialog" id="reply" style="width:600px;height:230px" data-options="iconCls:'icon-messager',modal:true,closed:true" title="评论回复">
  			<form action="${pageContext.request.contextPath}/Topic_reply.action" method="post" id="form">
  				<textarea style="width:100%;height:160px;font-size: 20px"name="review.Text" id="text"></textarea>
  				<input type="hidden" name="review.Title" id="title">
  				<input type="hidden" name="review.Time" value="<%=date%>">
  				<input type="hidden" name="review.TName" id="name">
  				<input type="hidden" name="review.FName" value="${user.name}">
  			</form>
  			<span style="color: gray;font-size: 17px;letter-spacing: 2px;padding-left: 195px;">健康绿色回复信息</span><button onclick="submit()" style="background-color: lightskyblue;width:100px;height:30px;position: relative;right: -138px;">确认回复</button>
  		</div>
  </body>
</html>
