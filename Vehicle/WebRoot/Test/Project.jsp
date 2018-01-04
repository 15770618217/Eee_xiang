<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'Project.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	$(function(){
	$('#tt').datagrid({  
    url:'${pageContext.request.contextPath}/Project_list.action',  
    method:'get',
    columns:[
        {field:'id',title:'ID',align:'center'},  
        {field:'PName',title:'工程名称',align:'center'},  
        {field:'Adress',title:'工程地址',align:'center'},
        {field:'amount',title:'车辆数量',align:'center'},  
        {field:'startTime',title:'开工时间',align:'center'},  
        {field:'BName',title:'工程老板',align:'center'},  
        {field:'Contact',title:'联系电话',align:'center'},
        {field:'Time',title:'发布时间',align:'center'},  
        {field:'Name',title:'发布人',align:'center'},  
   					 ],
   	rownumbers:true,  //显示行号
    singleSelect:true,//是否单选
    iconCls:'icon-book',
    fitColumns: true,	//
    pagination: true,//显示分页栏
	border:false,//边框
	striped:true,//斑马线效果
	nowrap:true,//提高加载性能	
	toolbar:[{
			text:'应聘工程',
			iconCls:'icon-ok',
			handler:function(){
						var row = $('#tt').datagrid('getSelected');
						if(row){
								$.messager.confirm('Confirm','现在申请参加工程吗?',function(r){
								if(r){
										var id=row.id;
										$.ajax({
											type:'POST',
											url:'${pageContext.request.contextPath}/Project_apply.action',
											async:false,
											data:{"project.id":id},
											success:function(){
													$.messager.show({
															     title:'新消息通知',
															     timeout:2000,
															     msg:'工程申请成功！静待回复',
															     height:200,
															     width:300,
																					});
																			},
											error:function(){
													$.messager.alert('新通知','工程申请失败!','error');
																		},								
													});
										}
																																	});
									}else{alert("请选择工程再操作!");};
											},
					}],	 
								});  
});
	</script>
  </head>
  
  <body>
   <table id="tt"></table>
  </body>
</html>
