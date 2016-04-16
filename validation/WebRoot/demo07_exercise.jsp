<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>jquery validate 实现远程验证</title>
	<style type="text/css">
		form input,select{
			margin:5px;
			display:inline;
		}
		/*
		form input[type="checkbox"]{
			display: inline;
		}*/
	</style>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript">
		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
		$(function(){
			$("#ff").validate({
				debug:false, // 定义debug模式,这样就不会提交
				onkeyup:false,	// 如果验证失败则按键up验证设置为false,默认是true
				// jquery validate可以采用name来确定验证的dom对象
				rules:{
					// 配置具体的验证规则
					email:{
						// 如果有参数则:后面写参数,如果没有则true,多个参数则用数组
						email:true
						// 1：仅仅只需要配置验证的url地址即可
						// 2:创建AjaxServlet
						// 3:配置 type=post
					},
					age:{
						required:true,
						number:true,
						min:18
					},
					pass:{
						required:true,
						rangelength:[6,12]
					},
					confirm:{
						equalTo:"#password"				
					},
					address:{
						required:true
					},
					like:{
						required:true
					}
				}
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
			<label>email:</label>
			<input type="text" name="email" />
		</div>
		<div>
			<label>age:</label>
			<input type="text" name="age" size="2" />
		</div>
		<div>
			<label>pass:</label>
			<input type="password" id="password" name="pass"/>
		</div>
		<div>
			<label>confirm:</label>
			<input type="password" name="confirm"/>
		</div>
		<div>
			<label>address:</label>
			<select name="address">
				<option value="">----请选择-----</option>
				<option value="1">北京</option>
				<option value="1">上海</option>
				<option value="1">广州</option>
			</select>
		</div>
		<div>
			<label>like:</label>
			看书:<input type="checkbox" name="like" value="看书"/>
			上网:<input type="checkbox" name="like" value="上网"/>
			旅游:<input type="checkbox" name="like" value="旅游"/>
		</div>
		<input type="submit" value="提交" />
	</form>
</body>
</html>
