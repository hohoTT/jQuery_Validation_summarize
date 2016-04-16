<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>jquery validate 常见验证规则_上</title>
	<style type="text/css">
		form input{
			margin:5px 0px;
			display: block;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript">
		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
		$(function(){
			$("#ff").validate({
				debug:true // 配置 required,email,number,min
			});
		});
	</script>
</head>
<body>
    <!-- 1: 237行有验证的基本配置 -->
    <!-- 2: 326行有验证失败的错误消息,间接知道验证的方法 -->
    <!-- 3: 默认错误消息在被验证的dom对象的后面 -->
	<form id="ff" action="#" method="get">
		<div>
			<label>email</label>
			<input type="text" name="email" />
		</div>
		<div>
			<label>age</label>
			<input type="text" name="age" size="2" />
		</div>
		<input type="submit" value="提交" />
	</form>
</body>
</html>
