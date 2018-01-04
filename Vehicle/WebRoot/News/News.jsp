<%@ page language="java" import="java.io.*,java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String Time=sdf.format(new Date());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'News.jsp' starting page</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{
	margin: 0px;
	}
	body{
	text-align: center;
	 background: #F7F7F7;
	}
	#firstbox,#secondbox{
	border:1px solid #D3D3D3;
	}
	p{
	color: gray;
	}
	h2{
	color:#FF8247;
	}
	label{
	text-align:center;
	margin-top:10px;
	display: block;
	font-size: 17px;
	color: #292929;
	}
	#form{
	margin:0 auto;
	}
	input{
	width:250px;
	height:26px;
	}
	textarea{
	width:250px;
	font-size: 17px;
	}
	</style>
	
	<script type="text/javascript">
//	$(function(){
//		var curr_time=new Date();     
//	    var strDate=curr_time.getFullYear()+"-";     
//	    strDate +=curr_time.getMonth()+1+"-";     
//	    strDate +=curr_time.getDate()+"-";     
//	    strDate +=" "+curr_time.getHours()+":";     
//	    strDate +=curr_time.getMinutes()+":";     
//	    strDate +=curr_time.getSeconds();     
//	    $("#time").datetimebox("setValue",strDate);  
//	});
	
	function previewImage(picfile){
        var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/i;  
        if (!pattern.test(picfile.value)) {  
            alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
            picfile.focus();  
        }   
        path = URL.createObjectURL(picfile.files[0]);  
        document.getElementById("previewImage").innerHTML = "<img src='"+path+"' style='width:250px;' />";  
	}
	 
	 function issue(){
	 var title=$('#title').val();
	 var content=$('#content').val();
	 var from=$('#from').val();
	 $('#form').form('submit',{
	 onSubmit:function(){
	 					if(title==""||title==null){
	 					alert("请填写新闻标题");
	 					$('#title').focus();
	 					return false;
	 					}else if(from==""|| from==null){
	 					alert("请填写新闻来源");
	 					$('#from').focus();
	 					return false;
	 					}else if(content=="" ||content==null){
	 					alert("请填写新闻内容");
	 					$('#content').focus();
	 					return false;
	 					}
	 									},
	 	success:function(){
	 	$.messager.show({
														title:'新消息通知',
														msg:'新闻发布成功！',
														timeout:2000,
														showType:'slide',
										});
	 	$('#form').form('clear');
	 	$('img').remove();
	 									}								
	 })
	 
	 }
	</script>
  </head>
  
  <body>
  	<div id="firstbox">
    	<h2>新闻发布</h2>
   	 	<p>Please fill all the texts in the fields</p>
   </div>
    <div id="secondbox">
    	<form action="${pageContext.request.contextPath}/News_add.action" enctype="multipart/form-data" method="post" id="form">
    	<label>
    	<span>标题：</span>
    	<input class="easyui-textbox" name="news.Title" id="title">
    	</label>
    	
    	<label>
    	<span>来源：</span>
    	<input class="easyui-textbox" name="news.Adress" id="from">
    	</label>
    	
    	<label>
    	<span style="vertical-align: top;">内容：</span>
    	<textarea  name="news.Content" id="content" style="height:100px;"></textarea>
    	</label>
    	
    	<label>
    	<div style="border:1px solid #D3D3D3;width:301px;margin-left: 445px">
    	<span style="float: left">图片：</span>
    	<input type="file" name="pic" onchange="previewImage(this)" style="width:200px;margin-left:-55px"/>
    <!--  	<input class="easyui-filebox" name="news.Img" id="img"  data-options="buttonText: '选择文件', buttonAlign: 'right'">  -->
    	<div id="previewImage" style="margin-left:44px;margin-bottom:7px"></div>
    	</div>
    	</label>
    	
    	<label>
    	<span>时间：</span>
    	<input type="text" name="news.Time" id="time" readonly="readonly" value="<%=Time%>">
    	</label>
    	
    	</form>
    	<button onclick="issue();"style="background-color: lightcyan;color: black;margin-top:5px;width:306px;letter-spacing:19px;margin-bottom:10px;">发布新闻</button>
    </div>
  </body>
</html>
