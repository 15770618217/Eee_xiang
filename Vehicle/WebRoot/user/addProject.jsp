 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>addProject</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../js/validator.js"></script>
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
	$('#dlg').dialog({    
    title: '发布新工程',   
  	iconCls:'icon-edit',
    width: 600,    
    height: 300,  
   // collapsible: true,  //当定义时显示可折叠面板的按钮。默认false
    closed: false,    //当定义时该面板初始化时处于关闭状态。默认false
    cache: false,    
    minimizable: true,
    maximizable: true,
    resizable: true,
    href: 'form.jsp',
    modal: true,
  //  toolbar: [{
  //              text: 'Add',
   //             iconCls: 'icon-add',
  //              handler: function () {
    //                alert('add');
    //            }
    //        }, '-', {
    //            text: 'Save',
   //             iconCls: 'icon-save',
   //             handler: function () {
    //                alert('save');
   //             }
    //        }],
     buttons: [{
                        text: '发布',
                        id: 'ok',
                        iconCls: 'icon-ok',
                        handler: function () {
                        alert($("#fm").form('validate'));
                        alert($("#BName").val());
                        	var BName=$("#BName").val();
							var PName=$("#PName").val();
							var StartTime=$("#StartTime").datetimebox('getValue');
							var Time=$("#Time").val();
							var Name=$("#Name").val();  
							var Amount=Number($("#Amount").val());
							var Contact=$("#Contact").val();
							var Adress=$("#Adress").val();
               //             $('#ok').linkbutton('disable');
                            $.ajax({
                                type: "post",
                                dataType:"json",
                                url: '${pageContext.request.contextPath}/Project_add.action',
                                async: false,
                              	data:{"BName":BName,"PName":PName,"Contact":Contact,"Adress":Adress,"Amount":Amount,"StartTime":StartTime,"Time":Time,"Name":Name},
                                success: function (data) {
                                	if(data.result){
                                	$.messager.show({
										title:'New Project',
										height:200,
										width:300,
										msg:'工程发布成功！',
										timeout:2000,
										showType:'slide',
										style:{
													right:'',
													top:'',
													bottom:-document.body.scrollTop-document.documentElement.scrollTop,
												 },
																});
                                	}
                                	$("#dlg").dialog("clear");
                                },
                                error:function(data){
                         //       alert(data[0].result);
                                    
                                	$.messager.show({
                                	title:'New Project',
                                	height:200,
                                	width:300,
                                	msg:'工程发布失败！',
                                	timeout:2000,
                                	});
                                }
                            });
                        }
                    }, {
                        text: '取消',
                        iconCls:'icon-cancel',
                        handler: function () {
                           $("#dlg").dialog("close");
                        }
                    }]
	});    
});
</script>
  
  <body>
  <div id="dlg" ></div>
    <!--  <div id="dlg" class="easyui-dialog" style="width:600px;height:300px;padding:10px 20px" title="发布工程"
		closed="false" buttons="#dlg-buttons" resizable="true" minimizable="false" maximizable="true">
	<p style="text-align:center;font-size: 16px;text-decoration:underline">工程信息</p>
	<div style="text-align: center;">
	<form id="fm" method="post">
		<div class="fitem" >
			<label>工程名称:</label>
			<input name="PName" class="easyui-validatebox" required="true" id="PName">&nbsp;&nbsp;
			<label>工程地点:</label>
			<input name="Adress" class="easyui-validatebox" required="true" id="Adress">
		</div>
		
		<div class="fitem">
			<label>开工时间:</label>
			<input name="StartTime" class="easyui-datetimebox" required="true" id="StartTime">&nbsp;&nbsp;
			<label>工程老板:</label>
			<input name="BName" class="easyui-validatebox" required="true" id="BName">
		</div>
		
		<div class="fitem">
			<label>发&nbsp;布&nbsp;人:</label>
			<input name="Name" class="easyui-textbox" required="true" id="Name">&nbsp;&nbsp;
			<label>发布时间:</label>
			<input name="Time" class="easyui-datetimebox" required="true" id="Time">
		</div>
		
		<div class="fitem">
			<label>车辆数量:</label>
			<input name="Amount" class="easyui-validatebox" required="true" id="Amount">&nbsp;&nbsp;
			<label>联系电话:</label>
			<input name="Contact" class="easyui-validatebox" required="true" id="Contact">
		</div>
		
	</form>
	</div>
</div>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProject()">发布</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
-->
  </body>
</html>
