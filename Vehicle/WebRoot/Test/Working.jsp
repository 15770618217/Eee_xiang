<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% User user=(User)session.getAttribute("user"); 
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String date=sdf.format(new Date());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Working.jsp' starting page</title>
    
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
  	<script type="text/javascript">
  	
  	var toolbar = [{
			text:'工作记录',
			iconCls:'icon-chart',
			handler:function(){
			var row=$('#t').datagrid('getSelected');
			if(row){
			var PName=row.PName;
			var Name='<%=user.getName()%>';
			var url='${pageContext.request.contextPath}/Notes_personal.action?notes.PName='+PName+'&&notes.Name='+Name;
			 $('#writeDialog').dialog('open');
			 $('#datagrid').datagrid({url:url});
//			$.ajax({
//				type: "POST",
//				dataType: "json",
//				url:'${pageContext.request.contextPath}/Notes_personal.action',
//				data:{"notes.PName":PName,"notes.Name":Name},
//				async:false,
//				success:function(data){
//					 $('#writeDialog').dialog('open');
//				 	 $('#datagrid').datagrid('loadData ',data.rows);
//				}
//			});
			}else{alert("请选择工程再操作！");};
			},
		},{
			text:'工程评价',
			iconCls:'icon-comment',
			handler:function(){
						var row=$('#t').datagrid('getSelected');
								if(row){
											var id=row.id;
											var PName=row.PName;
											$('#ii').val(id);
											$('#nn').val(PName);
				       						$('#com').dialog('open');
											}else{
								alert("请选择工程再操作！");
													};
											},
			}];
			//添加今日工作
			
var editIndex = undefined;//待编辑行的行号

//添加一个可编辑的行
 function add(){
 	$('#datagrid').datagrid('appendRow',{name:'<%=user.getName()%>',
 																	PName:'',
 																	additional:'',
 																	time:'',
 																	number:'',
 																	});
 	var Index=$('#datagrid').datagrid('getRows').length-1;
 	$('#datagrid').datagrid('beginEdit',Index);	
 	editIndex=Index;														
//	var editIndex=$('#datagrid').datagrid('appendRow', {         
//                name:'<%=user.getName()%>',
//				PName:"",
//				additional:"",
//				time:"",
//				number:"",    
//           }).datagrid('getRows').length-1;
//	$('#datagrid').datagrid('beginEdit',editIndex);
}

//结束编辑
function endEditing(){
	if (editIndex == undefined){
		return true;
	}
	if ($('#datagrid').datagrid('validateRow', editIndex)){
		$('#datagrid').datagrid('endEdit', editIndex);
//		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}

// 双击行使可编辑
//function editWork(rowIndex,rowData){
//	if (editIndex != rowIndex && endEditing()){
//		$('#datagrid').datagrid('beginEdit', rowIndex);
//		editIndex = rowIndex;
//	}
//}
//保存新增编辑行
function save(){
			if (endEditing()){
//				$('#datagrid').datagrid('acceptChanges'); //接受所有修改，即getChanges获取不到数据了
				var rows_inserted = $('#datagrid').datagrid('getChanges','inserted');
//				var json_inserted = JSON.stringify(rows_inserted);  //转换成json
				alert(rows_inserted[0].name);
			$.ajax({
				type:"POST",
				url:'${pageContext.request.contextPath}/Notes_add.action',
				data:{"notes.Name":rows_inserted[0].name,"notes.PName":rows_inserted[0].PName,"notes.Time":rows_inserted[0].time,"notes.Additional":rows_inserted[0].additional,"notes.Number":rows_inserted[0].number,},
				async:false,
				success:function(){
						$('#datagrid').datagrid('reload');
												},
			});
			}else{
			alert("请正确填写作业信息！");
			}
		}

function submit(){
var text=$('#text').val();
	$('#form').form('submit',{
				url:'${pageContext.request.contextPath}/Comment_add.action',
				onSubmit:function(){
								if(text==null||text==""){
								alert("请仔细填写您对工程的评价"); 
								return false;}
													},
				success:function(){
											$.messager.show({
														width:300,
														height:100,
														title:'新消息通知',
														msg:'评论提交成功！',
														timeout:2000,
														showType:'slide',
														
																			});
											$('#com').dialog('close');							
												}
								});
}

 $(function(){
		var p = $('#t').datagrid('getPager');    
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
  	label{
  	color:#A0522D;
  	width:60px;
  	display:inline-block;
  	padding-left:40px;
  	}
  	input {
	height: 28px;
	text-align: center;
}
  	</style>
  </head>
  
  <body>
   	<table class="easyui-datagrid"
		data-options="url:'${pageContext.request.contextPath}/Project_working.action',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true,rownumbers:true,toolbar:toolbar,pagination:true" style="overflow:hidden;width:auto;" id="t">
				<thead>
					<tr>
						<th data-options="field:'id'" align="center" style="width: 80px" >工程Id</th>
						<th data-options="field:'PName'" align="center"style="width: 150px">工程名称</th>
						<th data-options="field:'adress'" align="center"style="width: 200px">工程地址</th>
						<th data-options="field:'BName'" align="center"style="width: 100px">工程老板</th>
						<th data-options="field:'phone'" align="center"style="width: 200px">联系电话</th>
						<th data-options="field:'applyTime',align:'center'"style="width: 200px">申请时间</th>
					</tr>
				</thead>
	</table> 
	<div id="writeDialog" class="easyui-dialog" title="上传今日作业"    style="top: 5px;width:500px;height: 300px"
        data-options="iconCls:'icon-book',resizable:true,modal:true,closed:true">   
        
		<table id="datagrid" class="easyui-datagrid" data-options="toolbar:'#tool',
				iconCls: 'icon-edit',
				singleSelect: true,"
				style="width: 100%; height: auto">
				<thead>
				<tr>
					<th data-options="field:'name',width:80,height:25,align:'center',editor:{type:'textbox',options:{required:true}}">
						姓名
					</th>
					<th data-options="field:'PName',width:100,align:'center',editor:{type:'textbox',options:{required:true}}">
						工程名
					</th>
					<th data-options="field:'number',width:100,align:'center',editor:{type:'numberbox',options:{required:true}}">
						工作量(车)
					</th>
					<th  data-options="field:'time',width:100,align:'center',editor:{type:'datebox',options:{required:true,}}">
						时间
					</th>
					<th data-options="field:'additional',width:100,align:'center',editor:'textbox'">
						备注
					</th>
				</tr>
			</thead>
        </table>
        <div id="tool" >
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">今日工作</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="save()">保存上传</a>
		</div>
	</div>
	<div id="com" class="easyui-dialog" data-options="iconCls:'icon-com',closable:true,closed:true,buttons:'#bb'," title="用户评价" style="width:400px;height:320px">
				
               <form  method="post" style="padding-top: 20px;font-size: 15px;font-family: sans-serif;" id="form">
               		<label>评论人：</label>
               		<input type="text" value="<%=user.getName()%>" readonly="readonly" name="comment.Name" style="color: RGB(100,100,180);"><br>
               		<input type="hidden" id="ii" name="comment.PId"><br>
               		<label>工程名：</label>
               		<input type="text" id="nn" readonly="readonly" style="color: RGB(100,100,180)"><br><br>
               		<label>评&nbsp;&nbsp;价：</label>
               		<textarea name="comment.Text" style="color: black;height: 56px;width:200px" id="text"></textarea><br><br>
               		<label>时&nbsp;&nbsp;间：</label>
               		<input type="text" name="comment.Time" value="<%=date%>" readonly="readonly" style="color: RGB(100,100,180)"><br>
               </form>
               <div id="bb">
               		<a class="easyui-linkbutton" data-options="iconCls:'icon-in'" onclick="submit()">确认上传</a>
               </div>
     </div>
  </body>
</html>
