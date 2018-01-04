<!DOCTYPE html>
<html>
<%@ page import="com.bean.UserInfo" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<title>User Main </title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<!--  <link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">--> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
	*{
	margin: 0;
	}
	</style>
	<script>
	</script>
</head>
<body >
	<div class="easyui-layout" style="width:100%;height:620px;overflow: hidden;background-color: cadetblue;">
		<jsp:include page="../common/top.jsp"></jsp:include>
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		<div data-options="region:'west', split:false, title:'导航菜单',iconCls:'icon-chart'" style="width:150px;overflow: hidden;">
			<div class="easyui-accordion" style="wisdth:100%;height:100%;"id="according">
				<div title="工程总部" data-options="iconCls:'icon-computerchart'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-wajueji'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserProject.jsp" >最新工程</a>
				<a data-options="plain:true,iconCls:'icon-in'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AddProject.jsp" style="margin-top:20px;">发布工程</a>
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/MyProject.jsp" style="margin-top:20px;">我的工程</a>
				<a data-options="plain:true,iconCls:'icon-convert'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/Working.jsp" style="margin-top:20px;font-size: 10px">正在进行</a>
				</div>
				
				<div title="个人中心" data-options="iconCls:'icon-man'" style="overflow:hidden;padding:30px;">
				<a id="info" data-options="plain:true,iconCls:'icon-blueMan'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Login_info.action">个人信息</a><br>
				<a data-options="plain:true,iconCls:'icon-envelope'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/ApplyProject.jsp" style="margin-top:20px;">查看申请</a>
				<a data-options="plain:true,iconCls:'icon-wajueji'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/MyApply.jsp" style="margin-top:20px;">我的申请</a>
				<a data-options="plain:true,iconCls:'icon-key'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AlterPwd.jsp" style="margin-top:20px;">密码修改</a>
				</div>
				
				<div title="论坛中心" data-options="iconCls:'icon-earth'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-com'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Forum/AddForum.jsp">我要发帖</a><br>
				<a data-options="plain:true,iconCls:'icon-forum'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_all.action" style="margin-top:20px;">论坛总部</a>
				<a data-options="plain:true,iconCls:'icon-messager'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_discuss.action" style="margin-top:20px;">查看评论</a>
				<a data-options="plain:true,iconCls:'icon-envelope'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_myReply.action" style="margin-top:20px;">我的回复</a>
				</div>
				
				<div title="最新时讯" data-options="iconCls:'icon-tip'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-list'" class="easyui-linkbutton" target="iframe"href="/Vehicle/News_news.action" style="margin-top:20px;">最新资讯</a>
				</div>
				
				<div title="" data-options="selected:true"></div>
			</div>
		</div>
		<jsp:include page="../common/center.jsp"></jsp:include>
</div>
</body>
</html>
