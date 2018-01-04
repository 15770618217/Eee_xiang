<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'test2.jsp' starting page</title>
    
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
	$('#dlg').dialog({    
    title: 'My Dialog',   
  	iconCls:'icon-edit',
    width: 400,    
    height: 200,  
   // collapsible: true,  
    closed: false,    
    cache: false,    
    minimizable: true,
    maximizable: true,
    resizable: true,
    href: 'form.jsp',
    modal: true,
    toolbar: [{
                text: 'Add',
                iconCls: 'icon-add',
                handler: function () {
                    alert('add');
                }
            }, '-', {
                text: 'Save',
                iconCls: 'icon-save',
                handler: function () {
                    alert('save');
                }
            }],
     buttons: [{
                        text: 'OK',
                        id: 'ok',
                        iconCls: 'icon-ok',
                        handler: function () {
                        	var phone=$("#Phone").val();
                        	var name=$("#UserName").val();
                        	var password=$("#Password").val();
                            $('#ok').linkbutton('disable');
                            $.ajax({
                                type: "POST",
                                url: '${pageContext.request.contextPath}/register.action',
                                async: false,
                               data:{"Phone":phone,"UserName":name,"Password":password},
                                success: function (data) {
                                    $('#ok').linkbutton('enable');
                                }
                            });
                        }
                    }, {
                        text: 'Cancel',
                        iconCls:'icon-cancel',
                        handler: function () {
                           $("#dlg").dialog("close");
                        }
                    }]

});    
//$('#dlg').dialog('refresh', 'form2.jsp'); 
});
	</script>
  </head>
  
  <body>
 	<div id="dlg" align="center"></div> 
  </body>
</html>
