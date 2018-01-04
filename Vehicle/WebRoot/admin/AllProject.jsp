<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'AllProject.jsp' starting page</title>
    
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>

	<script>
	var toolbar = [{
			text:'删除工程',
			iconCls:'icon-cut',
			handler:function(){
			var Rows = $("#tt").datagrid("getSelections");  
			if(Rows.length>0){
			 var id="";
			 for(var i=0;i<Rows.length;i++){
			 id=id+Rows[i].id+",";
			 }
			id=id.substr(0, id.length - 1);
			 $.messager.confirm('Confirm','确定删除工程吗?',function(r){
			 if(r){
				$.ajax({
				type: "POST",
				url:'${pageContext.request.contextPath}/Project_del.action',
				data:{"ids":id},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:2000,
				     msg:'工程删除成功',
				     height:200,
				     width:300,
				     });
				     $('#tt').datagrid('reload');
				   }
				});
				$('#tt').datagrid('reload'); 
			 }
			});
			}else{alert("请选择工程再操作！");};
			}
		}];
	
	function menuHandler(item){
	if(item){
       	window.parent.location.reload();
		}
		}
		
	$(function(){
	var p = $('#tt').datagrid('getPager');    
               $(p).pagination({    
                    pageSize: 10,//每页显示的记录条数，默认为10    
                    pageList: [5,10,15],//可以设置每页记录条数的列表    
                    beforePageText: '第',//页数文本框前显示的汉字    
                    afterPageText: '页    共 {pages} 页',    
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'  
                });   
                
    $(document).bind('contextmenu',function(e){
				e.preventDefault();
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY,
				});
																					});
               });
	</script>
  </head>
  
  <body>
		<table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_AllProject.action',method:'get',border:false,singleSelect:false,checkOnSelect:true,fit:true,fitColumns:false,rownumbers:false,pagination:true,toolbar:toolbar" style="overflow:hidden;width:960px;" id="tt">
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

   <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" >
		<div data-options="name:'exit',iconCls:'icon-back'">Exit</div>
	</div>
	
  </body>
</html>
