<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.bean.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <% 
  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
  String date= format.format(new Date());
  User user=(User)session.getAttribute("user"); 
  %>
    <title>Project</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript">
	var toolbar = [{
			text:'同意申请',
			iconCls:'icon-ok',
			handler:function(){
			var row = $('#tt').datagrid('getSelected');
			var status=row.reply;
			if(row){
			if(status=="应聘成功"||status=="应聘失败"){alert("已回复，请勿更改结果！如果变动，请致电司机沟通！");}else{
			 $.messager.confirm('Confirm','确定同意该用户申请此工程吗?',function(r){
			 if(r){
			 var id=row.id;
			 var reply="应聘成功";  
				$.ajax({
				type: "POST",
				url:'${pageContext.request.contextPath}/Project_reply.action',
				data:{"apply.Id":id,"apply.Reply":reply,},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:1500,
				     msg:'同意申请成功',
				     height:200,
				     width:300,
				     style:{
								right:'',
								top:'',
								bottom:-document.body.scrollTop-document.documentElement.scrollTop,
							 	},
				     });
				     $('#tt').datagrid('reload');
				   }
				});
				$('#tt').datagrid('reload'); 
			 }
			});
			}}else{alert("请选择工程再操作！");};
			},
		},{
			text:'拒绝申请',
			iconCls:'icon-cancel',
			handler:function(){
				var row = $('#tt').datagrid('getSelected');
				var status=row.reply;
				if(row){
					if(status=="应聘成功"||status=="应聘失败"){alert("已回复，请勿更改结果！如果变动，请致电司机沟通！");}else{
					 $.messager.confirm('Confirm','确定拒绝该用户申请此工程吗?',function(r){
			 if(r){
			 var id=row.id;
			 var reply="应聘失败";  
				$.ajax({
				type: "POST",
				url:'${pageContext.request.contextPath}/Project_reply.action',
				data:{"apply.Id":id,"apply.Reply":reply,},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:1500,
				     msg:'拒绝申请成功',
				     height:200,
				     width:300,
				     style:{
								right:'',
								top:'',
								bottom:-document.body.scrollTop-document.documentElement.scrollTop,
							 	},
				     });
				     $('#tt').datagrid('reload');
				   }
				});
				$('#tt').datagrid('reload'); 
			 }
			});
			}}else{alert("请选择工程再操作！");};
											},
			},{
				text:'查看该用户',
				iconCls:'icon-blueMan',
				handler:function(){
								var row = $('#tt').datagrid('getSelected');
								if(row){
								var Name=row.AName;
									$.ajax({
											type: "POST",
											url:'${pageContext.request.contextPath}/Information.action',
											data:{"name":Name},
											async:false,
											success: function(data){
											    $("#UserDialog").dialog('open');
											   }
											});
										 		}else{alert("请选择工程再操作！");};
												},
				},
		];
	</script>
  </head>
  
  <body>
   <table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_lookapply.action',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true,rownumbers:true,pagination:true,toolbar:toolbar" style="overflow:hidden;width:auto;" id="tt">
				<thead>
					<tr>
						<th data-options="field:'id'" align="center" style="width: 80px" >Id</th>
						<th data-options="field:'PName'" align="center"style="width: 140px">工程名称</th>
						<th data-options="field:'adress'" align="center"style="width: 150px">工程地址</th>
						<th data-options="field:'amount'" align="center"style="width: 100px">车辆数量</th>
						<th data-options="field:'time'" align="center"style="width: 200px">发布时间</th>
						<th data-options="field:'AName',align:'center'"style="width: 120px">申请人</th>
						<th data-options="field:'applyTime',align:'center'"style="width: 200px">申请时间</th>
						<th data-options="field:'reply'" align="center"style="width: 120px">申请状态</th>
					</tr>
				</thead>
	</table> 
	<div id="UserDialog" class="easyui-dialog" title="用户信息"    style="top: 5px;"
        data-options="iconCls:'icon-blueMan',resizable:true,modal:true,closed:true">   
         <table border="1" bgcolor="#EEE9E9" cellpadding="12%" cellspacing="2">
   		<tbody>
   			<tr>
   			<td>Id:</td>
   			<td><s:property value="#session.UserInfo.Id"></s:property></td>
   			<td>姓名:</td>
   			<td><s:property value="#session.UserInfo.Name"></s:property></td>
   			</tr>
   			<tr>
   			<td>性别:</td>
   			<td><s:property value="#session.UserInfo.Sex"></s:property></td>
   			<td>身份证:</td>
   			<td><s:property value="#session.UserInfo.Card"></s:property></td>
   			</tr>
   			<tr>
   			<td>照片:</td>
   			<td><img src="/Vehicle/upload/<s:property value="#session.UserInfo.Photo"/>" style="height:60px; weight:100px;"/></td>
   			<td>驾照:</td>
   			<td><img src="/Vehicle/upload/<s:property value="#session.UserInfo.Licence"/>" style="height:60px; weight:100px;"/></td>
   			</tr>
   			<tr>
   			<td>车牌:</td>
   			<td><s:property value="#session.UserInfo.Car"/></td>
   			<td>车龄:</td>
   			<td><s:property value="#session.UserInfo.Experience"></s:property>年</td>
   			</tr>
   			<tr>
   			<td>备注:</td>
   			<td><s:property value="#session.UserInfo.Statement"></s:property></td>
   			<td>注册时间:</td>
   			<td><s:property value="#session.UserInfo.Time"></s:property></td>
   			</tr>
   		</tbody>
   </table>
   </div>
  </body>
</html>
