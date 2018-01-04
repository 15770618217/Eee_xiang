<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Project</title>
    
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
	<!--  <link rel="stylesheet" type="text/css" href="demo.css"> -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	var toolbar = [{
			text:'删除',
			iconCls:'icon-cut',
			handler:function(){
			var row = $('#tt').datagrid('getSelected');
			if(row){
			 $.messager.confirm('Confirm','你确定要删除这个工程吗?',function(r){
			 if(r){
			 var id=row.id;
			 alert(id);
				$.ajax({
				type: "POST",
				
				url:'${pageContext.request.contextPath}/Project_del.action',
				data:{"project.id":id},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:2000,
				     msg:'工程删除成功',
				     height:200,
				     width:300,
				     style:{
								right:'',
								top:'',
								bottom:-document.body.scrollTop-document.documentElement.scrollTop,
							 	},
				     });
				   }
				});
				$('#tt').datagrid('reload'); 
			 }
			})
				
			}
			}
		},'-',{
			text:'审核通过',
			iconCls:'icon-ok',
			handler:function(){
			var row = $('#tt').datagrid('getSelected');
			if(row){
			 $.messager.confirm('Confirm','确定这个工程合格吗?',function(r){
			 if(r){
			 var id=row.id;
			 var qualified="合格";
			 alert(id);
				$.ajax({
				type: "POST",
				
				url:'${pageContext.request.contextPath}/Project_ver.action',
				data:{"project.id":id,"project.verify":qualified},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:2000,
				     msg:'工程审核通过！',
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
				
			}
			
			}
		}];
	</script>
  </head>
  <body>
   <table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_list.action',method:'get',border:false,singleSelect:false,checkOnSelect:true,fit:true,fitColumns:false,rownumbers:true,pagination:true,toolbar:toolbar" style="overflow:hidden;width:960px;" id="tt">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"width="30px"></th>
						<th data-options="field:'id'" align="center" style="width: 40px">Id</th>
						<th data-options="field:'PName'" align="center"style="width: 120px">工程名称</th>
						<th data-options="field:'adress',align:'center'" style="width: 120px">工程地址</th>
						<th data-options="field:'amount',align:'center'" style="width: 76px">车辆数量</th>
						<th data-options="field:'BName',align:'center'" style="width: 100px">老板姓名</th>
						<th data-options="field:'contact',align:'center'" style="width: 120px">联系电话</th>
						<th data-options="field:'startTime',align:'center'"style="width: 180px" >开始时间</th>
						<th data-options="field:'time',align:'center'" style="width: 180px">发布时间</th>
						<th data-options="field:'name',align:'center'">发布人</th>
				<!--  		<th data-options="field:'verify',align:'center'" >审核状态</th> -->
					</tr>
				</thead>
	</table> 
  </body>
</html>
