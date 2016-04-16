<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>jquery validate 环境搭建</title>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript">
		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
		$(function(){
			$("#ff").validate({
				debug:false // 定义debug模式,这样就不会提交
			});
		});
	</script>
</head>
<body>
	<form id="ff" action="#" method="get">
		<input type="submit" value="提交" />
	</form>
</body>
</html>
