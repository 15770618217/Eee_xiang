<!DOCTYPE html>
<html>
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
</head>
<body><!-- width:1350px;height:550px; -->
	<div class="easyui-layout" style="width:100%;height:550px;overflow: hidden;">
		<jsp:include page="../common/top.jsp"></jsp:include>
		<jsp:include page="../common/bottom.jsp"></jsp:include>
		<div data-options="region:'west', split:false, title:'导航菜单',iconCls:'icon-chart'" style="width:150px;overflow: hidden;">
			<div class="easyui-accordion" style="wisdth:100%;height:100%;"id="according">
				<div title="工程总部" data-options="iconCls:'icon-computerchart'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-wajueji'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserProject.jsp" >工程列表</a>
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AddProject.jsp" style="margin-top:20px;">工程发布</a>
				<a data-options="plain:true,iconCls:'icon-envelope'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/ApplyProject.jsp" style="margin-top:20px;">我的工程</a>
				</div>
				
				<div title="个人中心" data-options="iconCls:'icon-man'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-people'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserInfo.jsp">信息完善</a><br>
				<a data-options="plain:true,iconCls:'icon-messager'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserProject.jsp" style="margin-top:20px;">消息查看</a>
				<a data-options="plain:true,iconCls:'icon-wajueji'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AlterPwd.jsp" style="margin-top:20px;">任务工程</a>
				<a data-options="plain:true,iconCls:'icon-key'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AlterPwd.jsp" style="margin-top:20px;">密码修改</a>
				</div>
				
				<div title="论坛中心" data-options="iconCls:'icon-earth'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AddProject.jsp">工程发布</a><br>
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserProject.jsp" style="margin-top:20px;">工程查看</a>
				</div>
				
				<div title="车队新鲜事" data-options="iconCls:'icon-tip'" style="overflow:hidden;padding:30px;">
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/AddProject.jsp">工程发布</a><br>
				<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/Test/UserProject.jsp" style="margin-top:20px;">工程查看</a>
				</div>
				
				<div title="" data-options="selected:true"></div>
			</div>
		</div>
		<jsp:include page="../common/center.jsp"></jsp:include>
</div>
</body>
</html>
