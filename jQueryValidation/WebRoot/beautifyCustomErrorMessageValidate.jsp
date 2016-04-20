<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jquery validate 设置错误消息的位置, 和样式</title>
    
    <style type="text/css">
		form input,select{
			margin:5px;
			display:inline;
		}
		
		/*
		form input[type="checkbox"]{
			display: inline;
		}*/
		
		/* 
			以下的 error 用于设置错误的样式
			其中的 span 为自定义错误消息存放的标签
		*/
		form span{
			color: red;
			background-image: url("image/error.png");
			background-repeat: no-repeat;
			padding-left: 18px;
		}
		
		
		.ok{
			background-image: url("image/right.png");
			background-repeat: no-repeat;
			padding-left: 18px;
		}
	</style>
	
	<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="static/js/jquery.validate.js"></script>
	
  	<script type="text/javascript">
  		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
  		
		$(function(){
			// 调用 jQuery 对象注册的函数，即 validate，此函数为主函数 
			$("#ff").validate({
				debug : false, // 定义debug模式,这样就不会提交, 默认的值为 false
				
				onkeyup : false,	// 如果验证失败则按键up验证设置为false,默认是true
				
				//errorElement : 'b', // 可以将错误消息进行粗体化的显示
				errorElement : 'span', // 用来存储错误消息的标签，用html元素类型创建错误消息的容器
				
				/*
					当验证通过时显示一个消息。如果是String类型的，则添加该样式到标签中，
					如果是一个回调函数，则将标签作为其唯一的参数。 
				*/
				// 如果是字符串,则该样式会赋值到 errorElment指定的标签中
				// success : "ok",
				success:function(span){
					$(span).attr("class","ok");
				},
				
				/*
					用户自定义错误标签的显示位置。
					第一个参数：一个作为jQuery对象的错误标签
					第二个参数为：一个作为jQuery对象的未通过验证的表单元素。 
				*/
				errorPlacement : function(span, element){
					// 应该把原来的span删除掉.
					$(element).siblings("span").remove();
					$(element).parent().append(span);
				},
				
				// jquery validate可以采用name来确定验证的dom对象
				
				// 配置具体的验证规则, 此时为 json 格式
				rules : {
					// 之后的每一项的配置中同样为 json 的格式
					name : {
						// 如果有参数则 : 后面写参数, 如果没有则true
						required : true
					},
					
					email : {
						// 如果有参数则:后面写参数,如果没有则true,多个参数则用数组
						email : true,
						
						// 仅仅只需要配置验证的url地址即可
						remote : {
							url : 'servlet/AjaxServlet',
							// post请求IE中是不会有缓存问题
							type : 'post'
						}
					},
					
					age : {
						required : true,
						number : true,
						min : 18
					},
					
					pass : {
						required : true,
						rangelength : [6,12]
					},
					
					confirm : {
						required : true,
						equalTo : "#password"				
					},
					
					address : {
						required : true
					},
					
					like : {
						required : true
					}
				},
				
				// 以下为自定义的错误信息
				messages : {
					
						name : {
							required : "姓名不能为空"
						},
						
						email : {
							email : "邮箱格式不正确",
							remote : "该邮箱已被注册"
						},
						age : {
							required : "年龄不能为空",
							number : "年龄必须为数字",
							min : "年龄必须在18岁以上"
						},
						pass : {
							required : "密码必填",
							rangelength : $.validator.format("密码的长度必须为{0}-{1}之间")
						},
						confirm : {
							required : "密码确认",
							equalTo : "密码不一致"				
						},
						address : {
							required : "请选择地址"
						},
						like : {
							required : "必须要选择一个爱好"
						},
						image : {
							required : "请选择要上传的文件"
						}
					}
				
			});
		});
  	</script>

  </head>
  
  <body>
  
	<h1>The beautifyCustomErrorMessageValidate Page</h1><hr/>
	
    <!-- 1: 265 行有验证的基本配置 -->
    <!-- 2: 353 行有验证失败的错误消息,间接知道验证的方法 -->
    <!-- 3: 默认错误消息在被验证的dom对象的后面 -->
	<form id="ff" action="#" method="get">
		
		<div>
			<label>姓名</label>
			<input type="text" name="name" />
		</div>
		
		<div>
			<label>email</label>
			<input type="text" name="email" />
		</div>
		
		<div>
			<label>age</label>
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
				<option value="2">上海</option>
				<option value="3">广州</option>
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
