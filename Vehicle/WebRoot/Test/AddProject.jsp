<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'AddProject.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validator.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
.fitem{
padding-top:10px;
font-size: 14px;
font-family: sans-serif;
}
	</style>
	<script type="text/javascript">
	$(function(){
	$("#dlg").dialog({
	title: '发布新工程',   
  	iconCls:'icon-edit',
    width: 600,    
    height: 300,  
    minimizable: true,
    maximizable: true,
    resizable: true,
    href: 'form1.jsp',
    modal: true,
    buttons:[{
    	text:'发布',
    	iconCls:'icon-ok',
    	handler:function(){
    						var BName=$("#BName").val();
							var PName=$("#PName").val();
							var StartTime=$("#StartTime").datetimebox('getValue');
							var Time=$("#Time").val();
							var Name=$("#Name").val();  
							var Amount=Number($("#Amount").val());
							var Contact=$("#Contact").val();
							var Adress=$("#Adress").val();
    						var boolean=$("#fm").form('validate');
    						if(boolean){
								$.ajax({
									type:'POST',
									url:'${pageContext.request.contextPath}/Project_add.action',
									data:{"project.BName":BName,"project.PName":PName,"project.Contact":Contact,"project.Adress":Adress,"project.Amount":Amount,"project.StartTime":StartTime,"project.Time":Time,"project.Name":Name},
									dataType:'json',
									async:false,
									success:function(data){
												$.messager.alert('My Title','工程发布成功!');
												 $('#fm').form('clear');
																			},
									error:function(data){
												$.messager.alert('My Title','工程发布失败!','error');
																		},									
											});
    											}else{
    												alert("请正确填写工程信息！");
    													}
    									},
   					},{
   					 text: '取消',
                     iconCls:'icon-cancel',
                     handler:function(){
                     								$("#dlg").dialog('close');
                     								},
   						}],
	});
	});
	</script>
  </head>
  
  <body>
   <div id="dlg"></div>
  </body>
</html>
