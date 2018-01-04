<!DOCTYPE html>
<html>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<head>
	<meta charset="UTF-8">
	<title>Basic Layout - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="demo.css">
	<script type="text/javascript" src="../easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body >
	<div class="easyui-layout" style="width:700px;height:400px;">
		<jsp:include page="top.jsp"></jsp:include>
		<jsp:include page="bottom.jsp"></jsp:include>
		<!--  <div data-options="region:'east',split:true" title="East" style="width:100px;"></div>-->
		<div data-options="region:'west',split:false" title="导航菜单" style="width:100px;overflow:hidden;">
			<div class="easyui-accordion" style="width:100px;height:300px;"id="according">
				<div title="个人信息" data-options="iconCls:'icon-people'" style="overflow:auto;padding:10px;">
			<!--  	<a href="/Vehicle/jsp/T.jsp" target="iframe">查看</a></div>-->
			<a data-options="plain:true,iconCls:'icon-book'" class="easyui-linkbutton" target="iframe"href="/Vehicle/jsp/T.jsp">类型管理</a></div>
				<div title="个人动态" data-options="iconCls:'icon-key'" style="overflow:hidden;padding:10px;"></div>
				<div title="工程动态" data-options="iconCls:'icon-car'" style="overflow:hidden;padding:10px;"></div>
				<div title="新鲜事"  data-options="iconCls:'icon-message'" style="overflow:hidden;padding:10px;"></div>
				<div title="车队论坛" data-options="iconCls:'icon-help'" style="overflow:hidden;padding:10px;"></div>
			</div>
				
		</div>
		<!--  <div class="easyui-accordion" style="width:100px">
				<div title="About" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;"></div>
				<a href="#">个人中心</a>
			</div>	-->	
		
		<jsp:include page="center.jsp"></jsp:include>
		<!--  <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">-->
		
		<!-- 	<table class="easyui-datagrid"
					data-options="url:'datagrid_data1.json',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
				<thead>
					<tr>
						<th data-options="field:'itemid'" width="80">Item ID</th>
						<th data-options="field:'productid'" width="100">Product ID</th>
						<th data-options="field:'listprice',align:'right'" width="80">List Price</th>
						<th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
						<th data-options="field:'attr1'" width="150">Attribute</th>
						<th data-options="field:'status',align:'center'" width="60">Status</th>
					</tr>
				</thead>
			</table> -->
		</div>

</body>
</html>