<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jquery validate 环境搭建</title>
    
	<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="static/js/jquery.validate.js"></script>
	
  	<script type="text/javascript">
  		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
  		
		$(function(){
			// 调用 jQuery 对象注册的函数，即 validate，此函数为主函数 
			$("#ff").validate({
				debug : true // 定义debug模式,这样就不会提交, 默认的值为 false
			});
		});
  	</script>

  </head>
  
  <body>
  
	<h1>The jqueryValidateBuild Page</h1><hr/>
	
	
	<form id="ff" action="#" method="get">
		<input type="submit" value="提交" />
	</form>
	
  </body>
</html>
