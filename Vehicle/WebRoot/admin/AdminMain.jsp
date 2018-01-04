<!DOCTYPE html>
<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<title>AdminMain </title>
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
</head>
<body >
	<div class="easyui-layout" style="width:1350px;height:550px;overflow: hidden;">
		<jsp:include page="../common/top.jsp"></jsp:include>
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		<div data-options="region:'west', split:false, title:'导航菜单',iconCls:'icon-chart'" style="width:150px;overflow: hidden;">
			<div class="easyui-accordion" style="wisdth:100%;height:100%;"id="according">
				<div title="审核信息" data-options="iconCls:'icon-computerchart'" style="overflow:hidden;padding:30px;">
<!--  			<a data-options="plain:true,iconCls:'icon-wajueji'" class="easyui-linkbutton" target="iframe"href="/Vehicle/admin/VerifyUser.jsp" >用户审核</a>  -->
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/admin/VerifyProject.jsp" >工程审核</a>
				<a data-options="plain:true,iconCls:'icon-convert'" class="easyui-linkbutton" target="iframe"href="/Vehicle/admin/VerifyTopic.jsp" style="margin-top:20px;font-size: 10px">话题审核</a>
				<a data-options="plain:true,iconCls:'icon-more'" class="easyui-linkbutton" target="iframe"href="/Vehicle/admin/AllProject.jsp" style="margin-top:20px;">全部工程</a>
				<a data-options="plain:true,iconCls:'icon-more'" class="easyui-linkbutton" target="iframe"href="/Vehicle/admin/AllTopic.jsp" style="margin-top:20px;">全部话题</a>
				</div>
				
				<div title="个人中心" data-options="iconCls:'icon-man'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-key'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AlterPwd.jsp" style="margin-top:20px;">密码修改</a>
				</div>
				
				<div title="论坛中心" data-options="iconCls:'icon-earth'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-com'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Forum/AddForum.jsp">我要发帖</a><br>
				<a data-options="plain:true,iconCls:'icon-forum'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_all.action" style="margin-top:20px;">论坛总览</a>
				<a data-options="plain:true,iconCls:'icon-messager'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_discuss.action" style="margin-top:20px;">查看评论</a>
				<a data-options="plain:true,iconCls:'icon-envelope'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Topic_myReply.action" style="margin-top:20px;">我的回复</a>
				</div>
				
				<div title="最新时讯" data-options="iconCls:'icon-tip'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-in'" class="easyui-linkbutton" target="iframe"href="/Vehicle/News/News.jsp" style="margin-top:20px;">发布新闻</a>
				<a data-options="plain:true,iconCls:'icon-list'" class="easyui-linkbutton" target="iframe"href="/Vehicle/News_news.action" style="margin-top:20px;">新闻总览</a>
				</div>
				
				<div title="" data-options="selected:true"></div>
			</div>
		</div>
		<jsp:include page="../common/center.jsp"></jsp:include>
</div>
</body>
</html>
