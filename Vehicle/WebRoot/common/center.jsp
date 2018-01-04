<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'center.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	</style>
  </head>
  <body>
   <div data-options="region:'center',title:'数据展示',iconCls:'icon-book'" style="overflow: hidden;background-image:url(/Vehicle/image/red.png);
   background-repeat: no-repeat;background-attachment:fixed;background-position: center;background-color: #F7F7F7">
    <iframe name="iframe" style="border: 0;width:100%;height: 100%;scrolling:no" ></iframe>
   </div>
  </body>
</html>
