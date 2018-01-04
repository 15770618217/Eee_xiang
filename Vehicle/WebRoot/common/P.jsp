<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'P.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="demo.css">
	<script type="text/javascript" src="../easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
	<script type="text/javascript">

	
	</script>
  </head>
  
  <body>
   <table class="easyui-datagrid"
					data-options="url:'${pageContext.request.contextPath}/project.action',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true"toolbar="#toolbar"over-flow="hidden">
				<thead>
					<tr>
						<th data-options="field:'id'" align="center">Id</th>
						<th data-options="field:'PName'" align="center">工程名称</th>
						<th data-options="field:'adress',align:'center'" >工程地址</th>
						<th data-options="field:'amount',align:'center'" >车辆数量</th>
						<th data-options="field:'startTime',align:'center'" >开始时间</th>
						<th data-options="field:'BName',align:'center'" >老板姓名</th>
						<th data-options="field:'contact',align:'center'" >联系电话</th>
						<th data-options="field:'time',align:'center'" >发布时间</th>
				<!--  		<th data-options="field:'verify',align:'center'" >审核状态</th> -->
					</tr>
				</thead>
	</table> 
		<div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New Project</a>
   		</div>
  </body>
</html>
