<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'VerifyProject.jsp' starting page</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
    
    <script type="text/javascript">
	var toolbar = [{
			text:'审核通过',
			iconCls:'icon-ok',
			handler:function(){
			var row = $('#tt').datagrid('getSelected');
			if(row){
			 $.messager.confirm('Confirm','确定这个工程合格吗?',function(r){
			 if(r){
			 var id=row.id;
			 var qualified="合格";
				$.ajax({
				type: "POST",
				
				url:'${pageContext.request.contextPath}/Project_ver.action',
				data:{"project.id":id,"project.verify":qualified},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:2000,
				     msg:'工程审核成功！',
				     height:200,
				     width:300,
				 //    style:{
				//				right:'',
				//				top:'',
				//				bottom:-document.body.scrollTop-document.documentElement.scrollTop,
				//			 	},
				     });
				   }
				});
				$('#tt').datagrid('reload'); 
			 }
			});
				
			}else{
			alert("请选择相应的工程再操作！");
			}
			
			}
		},{
			text:'审核不通过',
			iconCls:'icon-cancel',
			handler:function(){
											var row = $('#tt').datagrid('getSelected');
											if(row){
											 $.messager.confirm('Confirm','确定这个工程合格吗?',function(r){
											 if(r){
												var id=row.id;
												 var qualified="不合格";
												$.ajax({
													type:"POST",
													url:'${pageContext.request.contextPath}/Project_ver.action',
													data:{"project.id":id,"project.verify":qualified},
//													async:false,
													success:function(){
													$.messager.show({
															     title:'新消息通知',
															     timeout:2000,
															     msg:'工程审核成功！',
															     height:200,
															     width:300,
															});
															}
															});
															}
															});
															$('#tt').datagrid('reload');
														}else{
														alert("请选择工程后操作哦！");
																}
											},
			}];
	</script>

  </head>
  
  <body>
    <body>
   <table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_noVerify.action',method:'get',border:false,singleSelect:false,checkOnSelect:true,fit:true,fitColumns:false,rownumbers:false,pagination:false,toolbar:toolbar" style="overflow:hidden;width:960px;" id="tt">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"width="30px"></th>
						<th data-options="field:'id'" align="center" style="width: 40px">Id</th>
						<th data-options="field:'PName'" align="center"style="width: 100px">工程名称</th>
						<th data-options="field:'adress',align:'center'" style="width: 200px">工程地址</th>
						<th data-options="field:'amount',align:'center'" style="width: 76px">车辆数量</th>
						<th data-options="field:'BName',align:'center'" style="width: 100px">老板姓名</th>
						<th data-options="field:'contact',align:'center'" style="width: 120px">联系电话</th>
						<th data-options="field:'startTime',align:'center'"style="width: 180px" >开始时间</th>
						<th data-options="field:'time',align:'center'" style="width: 180px">发布时间</th>
						<th data-options="field:'name',align:'center'" style="width: 80px">发布人</th>
					  	<th data-options="field:'verify',align:'center'"  style="width: 95px">审核状态</th>
					</tr>
				</thead>
	</table> 
    
  </body>
</html>
