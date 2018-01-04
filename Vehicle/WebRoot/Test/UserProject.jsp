<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			text:'应聘工程',
			iconCls:'icon-ok',
			handler:function(){
			var row = $('#tt').datagrid('getSelected');
			if(row){
			 $.messager.confirm('Confirm','现在申请这个工程吗?',function(r){
			 if(r){
			 var id=row.id;
			 var reply="申请中--";  
			 alert(id);
				$.ajax({
				type: "POST",
				url:'${pageContext.request.contextPath}/Project_apply.action',
				data:{"project.Id":id,"apply.AName":'<%=user.getName()%>',"apply.ApplyTime":'<%=date%>',"apply.Reply":reply},
				async:false,
				success: function(){
				     $.messager.show({
				     title:'新消息通知',
				     timeout:2000,
				     msg:'工程申请成功',
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
			}else{alert("请选择工程再操作！");};
			}
		},{
			text:'用户评价',
			iconCls:'icon-tip',
			handler:function(){
											var row = $('#tt').datagrid('getSelected');
											if(row){
												var id=row.id;
												$("#table tbody").html("");
												$.ajax({
													type:"POST",
													url:'${pageContext.request.contextPath}/Comment_comment.action',
													data:{"comment.PId":id},
//													async:false,
													success:function(data){
															var d=data.Comment;
															var l=data.Comment.length;
															var table="";
															for(var i=0;i<l;i++){
															table+="<tr>";
															table+="<td>"+(i+1)+"</td>";
															table+="<td>"+d[i].text;+"</td>";
															table+="<td>"+d[i].time;+"</td>";
															table+="</tr>";
															}
															$('#table').append(table);
															$('#dialog').dialog('open');
																							},
															});
														}else{
														alert("请选择工程后操作哦！");
																}
											},
			}];
		$(function(){
	var p = $('#tt').datagrid('getPager');    
               $(p).pagination({    
                    pageSize: 10,//每页显示的记录条数，默认为10    
                    pageList: [5,10,15],//可以设置每页记录条数的列表    
                    beforePageText: '第',//页数文本框前显示的汉字    
                    afterPageText: '页    共 {pages} 页',    
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'  
                      
                });   
                });
	</script>
	<style type="text/css">
	#table td{
	text-align:center;
	border-bottom:#A0522D 1px solid;
	}
	</style>
  </head>
  <body>
   <table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_list.action',method:'get',border:false,singleSelect:true,fit:true,fitColumns:false,rownumbers:true,pagination:true,toolbar:toolbar" style="overflow:hidden;width:960px;" id="tt">
				<thead>
					<tr>
						<th data-options="field:'id'" align="center" style="width: 80px">Id</th>
						<th data-options="field:'PName'" align="center"style="width: 120px">工程名称</th>
						<th data-options="field:'adress',align:'center'" style="width: 200px">工程地址</th>
						<th data-options="field:'amount',align:'center'" style="width: 76px">车辆数量</th>
						<th data-options="field:'BName',align:'center'" style="width: 100px">老板姓名</th>
						<th data-options="field:'contact',align:'center'" style="width: 120px">联系电话</th>
						<th data-options="field:'startTime',align:'center'"style="width: 180px" >开始时间</th>
						<th data-options="field:'time',align:'center'" style="width: 180px">发布时间</th>
						<th data-options="field:'name',align:'center'"style="width: 110px">发布人</th>
					</tr>
				</thead>
	</table> 
	<div id="dialog" class="easyui-dialog" title="工程评价"    style="top: 5px;width:500px;height: 300px"
        data-options="iconCls:'icon-book',resizable:true,modal:true,closed:true">   
        <table style="color: RGB(100,100,180);" cellpadding="10" id="table" >
        	<thead>
        	<tr>
        		<th style="width: 50px;color:teal;">Number</th>
        		<th style="width: 300px;color:teal;">评论内容</th>
        		<th style="width: 150px;color:teal;">评论时间</th>
        	</tr>
        	</thead>
        </table>
	</div>
  </body>
</html>
