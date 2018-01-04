<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="demo.css">
	<script type="text/javascript" src="../easyUI/jquery.min.js"></script>
	<script type="text/javascript" src="../easyUI/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	$(function(){
	$('#tt').datagrid({      
    url:'${pageContext.request.contextPath}/user.action',
    rownumbers:true,  
    singleSelect:true,
    title:"user",
    
    iconCls:'icon-book',
    columns:[[      
    	{field:'ck',checkbox:true},
        {field:'phone',title:'Phone',width:100},      
        {field:'name',title:'Name',width:100},      
        {field:'password',title:'Password',width:100,align:'right'}      
    ]]      
});    
	$("#data").click(function(){
		var  row=$("#tt").datagrid("getSelected");
		if(row){
		alert(row.name);
		}
	});
	 $("#ckAll").click(function() {
    	$("input[name='sub']").prop("checked", this.checked);
  		});
		 $("input[name='sub']").click(function() {
  			  var $subs = $("input[name='sub']");
   				 $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
  		});
	});
	</script>

  </head>
  
  <body >
  <!-- 设置according全部折叠 -->
  	<div id="menu" class="easyui-accordion" style="width:200px;height:200px;">
                <div title="Title1">
                </div>
                <div title="Title2"   >
                </div>                
             <div title="" data-options="selected:true">
                </div>
	</div>
	<!-- js动态创建datagrid -->
	  <div style="width:400px;height: 150px;text-align: center" >
		  <table id="tt" align="center" position="absolute;" height="100%"></table>
		  <input type="button" value="取值" id="data">
	  </div>
	  <!-- checkbox全选 -->
  	<div>
  		<input type="checkbox" id="ckAll" />check all<br />
			<input type="checkbox" name="sub" />1<br />
			<input type="checkbox" name="sub"/>2<br />
			<input type="checkbox" name="sub"/>3<br />
			<input type="checkbox" name="sub"/>4<br />
  	</div>
  	
  </body>
</html>
