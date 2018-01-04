<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyApply.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var toolbar=[{
		text:'撤销申请',
		iconCls:'icon-cancel',
		handler:function(){
						var row=$("#table").datagrid('getSelected');
						if(row){
						var status=row.reply;
						if(status=="应聘成功"){
						alert("您已经应聘成功参加该工程，现在不能撤销，如需撤销请致电包工头！");
						}else{
									$.messager.confirm('Confirm','真的撤销这个工程申请吗？',function(r){
									if(r){
											var id=row.PId;
											$.ajax({
														type: "POST",
														url:'${pageContext.request.contextPath}/Project_revoked.action',
														data:{"apply.PId":id},
														async:false,
														success:function(){
															$.messager.show({
															 title:'新消息通知',
														     timeout:2000,
														     msg:'申请撤销成功',
														     height:200,
														     width:300,
																						});
															 $('#table').datagrid('reload');  
																						},
														});
											}
																																			});}
									}else{
										alert("请选择工程再操作！");
											}
										}
						}]

</script>
  </head>
  
  <body>
   <table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_myApply.action',method:'get',border:false,singleSelect:false,checkOnSelect:true,fit:true,fitColumns:false,rownumbers:true,toolbar:toolbar" style="overflow:hidden;width:960px;" id="table">
		<thead>
					<tr>
						<th data-options="field:'PId'" align="center"style="width: 50px">工程ID</th>
						<th data-options="field:'PName'" align="center"style="width: 150px">工程名称</th>
						<th data-options="field:'adress',align:'center'" style="width: 160px">工程地址</th>
						<th data-options="field:'BName',align:'center'" style="width: 150px">工程老板</th>
						<th data-options="field:'phone',align:'center'" style="width: 150px">联系电话</th>
						<th data-options="field:'time',align:'center'" style="width: 200px">发布时间</th>
						<th data-options="field:'applyTime',align:'center'"style="width: 200px" >申请时间</th>
						<th data-options="field:'reply',align:'center'"style="width: 100px">申请状态</th>
					</tr>
				</thead>
	</table>
  </body>
</html>
