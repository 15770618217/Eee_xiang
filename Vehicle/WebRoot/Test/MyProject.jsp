<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'MyProject.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
var toolbar=[{
text:'工作车辆',
iconCls:'icon-convert',
handler:function(){
								var row=$('#t').datagrid('getSelected');
								if(row){
									var Tid=row.id;
									$("#carDialog").dialog('open');
									var url="${pageContext.request.contextPath}/Project_workingCar.action?Tid="+Tid;
//									$.ajax({
//												type: "POST",
//												dataType: "json",
//												url:'${pageContext.request.contextPath}/Project_workingCar.action',
//												data:{"Tid":Tid},
//												success:function(data){
//												alert(data.rows[0].name);
//																$('#CarDialog').dialog('open');
//																$('#car').datagrid('loadData ',data.rows);
//																				},
//												});
$('#car').datagrid({
url:url,
});
									}else{
									alert("请选择工程再操作！");
											}
								}
					},{
text:'工作记录',
iconCls:'icon-chart',
handler:function(){
								var row=$('#t').datagrid('getSelected');
								if(row){
									var Pname=row.PName;
									var url="${pageContext.request.contextPath}/Notes_notes.action?Pname="+Pname;
									$('#workDialog').dialog('open');
									$('#work').datagrid({
									url:url,
									});
									}else{
									alert("请选择工程再操作！");
											}
				
								}				
					},{
					text:'搜索推荐',
					iconCls:'icon-search',
					handler:function(){
													var row=$('#t').datagrid('getSelected');
													if(row){
													$('#RecommendDialog').dialog('open');
													var url="${pageContext.request.contextPath}/User_recommend.action";
													$('#Drive').datagrid({
																					url:url,
																					});
													}else{
													alert("请选择工程再操作！");
															};
													},
					
					}];
					
					
function submit(){
var select=$('#select').val();
var name=$('#driver').val();
$.ajax({
type:'post',
data:{"appraisal":select,"name":name},
url:'${pageContext.request.contextPath}/UserInfo_evalu.action',
success:function(){
$('#win').window('close');
},
});
}

function evalu(){
var row = $("#car").datagrid('getSelected');
if(row){
var na=row.name;
$('#win').window('open');
$('#driver').val(na);
}else{
alert("请选择车辆司机再操作");}
}

 function pick(){
 var filter=$("#pic").val();
 $.ajax({
 			type:'post',
			data:{"select":filter,},
			url:'${pageContext.request.contextPath}/User_pick.action',
 			success:function(data){
												$('#Drive').datagrid('load',data);
 											}
 			});
 }
 
 function invite(){
 var row=$('#Drive').datagrid('getSelected');
 if(row){
 			
 			}else{
 			alert("请选择车辆司机再操作");
 			}
 }
</script>


  </head>
  
  <body>
   	<table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_MyIssue.action',method:'get',border:true,singleSelect:true,fit:true,fitColumns:false,rownumbers:true,toolbar:toolbar,pagination:false" style="overflow:hidden;width:auto;" id="t">
				<thead>
					<tr>
						<th data-options="field:'id'" align="center" style="width: 80px" >工程Id</th>
						<th data-options="field:'PName'" align="center"style="width: 200px">工程名称</th>
						<th data-options="field:'adress'" align="center"style="width: 200px">工程地址</th>
						<th data-options="field:'amount'" align="center"style="width: 175px">车辆数量</th>
						<th data-options="field:'BName'" align="center"style="width: 120px">工程老板</th>
						<th data-options="field:'contact'" align="center"style="width: 190px">联系电话</th>
						<th data-options="field:'time',align:'center'"style="width: 200px">发布时间</th>
					</tr>
				</thead>
	</table> 
   <div id="carDialog" class="easyui-dialog" title="作业车辆"    style="top: 5px;width:500px;height: 300px"
        data-options="iconCls:'icon-car',resizable:true,modal:true,closed:true">  
        
        <table class="easyui-datagrid"
		data-options="method:'get',border:true,singleSelect:false,fit:true,fitColumns:false,rownumbers:true,toolbar:'#tool',pagination:false" style="overflow:hidden;width:100%;" id="car">
				<thead>
					<tr>
						<th data-options="field:'car'" align="center" style="width: 200px" >车牌号</th>
						<th data-options="field:'name'" align="center"style="width: 100px">姓名</th>
						<th data-options="field:'sex'" align="center"style="width: 78px">性别</th>
						<th data-options="field:'experience'" align="center"style="width: 74px">车龄(年)</th>
					</tr>
				</thead>
	</table> 
	<div id="tool">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-com'" onclick="evalu()" href="javascript:void(0)">点评司机</a>
	</div>
    </div>
    
    <div id="workDialog" class="easyui-dialog" title="作业记录"    style="top: 5px;width:500px;height: 300px"
        data-options="iconCls:'icon-chart',resizable:true,modal:true,closed:true">  
        
         <table class="easyui-datagrid"
		data-options="method:'get',border:true,singleSelect:false,fit:true,fitColumns:false,rownumbers:true,pagination:false" style="overflow:hidden;width:auto;" id="work">
				<thead>
					<tr>
						<th data-options="field:'name'" align="center"style="width: 100px">姓名</th>
						<th data-options="field:'PName'" align="center"style="width: 150px">工程名</th>
						<th data-options="field:'number'" align="center"style="width: 80px">装车数量</th>
						<th data-options="field:'time'" align="center"style="width: 120px">工作时间</th>
					</tr>
				</thead>
	</table> 
     </div>
     
     <div id="win" class="easyui-window" title="点评司机" style="width:400px;height:200px;text-align: center;font-size: 17px;"   
        data-options="iconCls:'icon-in',modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false">
        <div style="margin-left: 30px;margin-top: 35px;margin-bottom: 12px">
          司机：   <input type="text" id="driver" style="border: none;font-size: 17px" readonly="readonly">
         </div>
     点评：
     		<select class="easyui-combobox" id="select" style="width:120px;">
     			<option value="优秀">优秀</option>
     			<option value="良好">良好</option>
     			<option value="差">差</option>
     		</select>&nbsp;&nbsp;
     		<a id="button" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-in'" onclick="submit()">提交</a> 
     </div>
     
     <div id="RecommendDialog" class="easyui-dialog" title="司机推荐"    style="top: 5px;width:600px;height: 300px"
        data-options="iconCls:'icon-man',resizable:true,modal:true,closed:true,buttons:'#driverButton'">  
        
         <table class="easyui-datagrid"
		data-options="method:'get',border:true,singleSelect:false,fit:true,fitColumns:false,rownumbers:true,pagination:false,toolbar:'#driverTool'" style="width:auto;" id="Drive">
				<thead>
					<tr>
						<th data-options="field:'name'" align="center"style="width: 80px">姓名</th>
						<th data-options="field:'sex'" align="center"style="width: 60px">性别</th>
						<th data-options="field:'car'" align="center"style="width: 100px">车牌</th>
						<th data-options="field:'experience'" align="center"style="width: 70px">车龄(年)</th>
						<th data-options="field:'excellent'" align="center"style="width: 70px">好评</th>
						<th data-options="field:'ordinary'" align="center"style="width: 70px">中评</th>
						<th data-options="field:'bad'" align="center"style="width: 80px">差评</th>
					</tr>
				</thead>
	</table> </div>
	<div id="driverTool">
		&nbsp;&nbsp;按&nbsp;<select class="easyui-combobox" id="pic" style="width:100px;">
			<option value="Excellent">口碑</option>
			<option value="Experience">车龄</option>
		</select>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="pick()">Search</a>
	</div>
	<div id="driverButton">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-in'" onclick="invite()">邀请</a> 
	</div>
     
  </body>
</html>
