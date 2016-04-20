<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jquery validate 自定义验证方法</title>
    
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
	
	<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>

	<script type="text/javascript" src="static/js/jquery.validate.js"></script>
	
  	<script type="text/javascript">
  		// 添加自定义的函数 addMethod( name, method, [message] ) 
  		// 参数 name     类型：String    要添加的方法名，用于标识和引用，必须是一个有效的javascript标识符。 即 fileExt
  		// 参数 method     类型：Callback    方法的实现部分，返回true如果表单元素通过验证。 即 function(){}
  		// 参数 message(Optional)     类型：String, Function    该方法的默认验证消息。 即 $.validator.format("文件类型必须为{0}格式")
  		// 消息的可以使用  jQuery.validator.format(value) 的 方法创建
  		
  		$.validator.addMethod("fileExt", function(value, element, params) {
			//console.info("value:" + value + ",element:" + element + "params:" + params);
			// 控制台实现的效果如下，同时可以理解 function 中三个参数的具体含义
			// value:test1.txt, element:[object HTMLInputElement] params:jpeg|jpg|gif|png
			
			// 以下为正则表达式的使用
			// \. 为将 . 进行转义
			// $ 为向后进行匹配
			// 其中 i 代表忽略大小写
			var reg = new RegExp("\.(" + params + ")$", "i");
			
			/*
				该方法的返回值是布尔值，通过该值可以匹配字符串中是否存在于正则表达式相匹配的结果，
				如果有匹配内容，返回ture，如果没有匹配内容返回false
			*/
   			return reg.test(value);
		}, $.validator.format("文件类型必须为{0}格式"));
  	
  	
  		/* 所有的jquery插件都遵循了一定流程, 吧dom对象转化jquery对象,然后在做相应的操作!*/
  		
		$(function(){
			// 调用 jQuery 对象注册的函数，即 validate，此函数为主函数 
			$("#ff").validate({
				debug : false, // 定义debug模式,这样就不会提交, 默认的值为 false
				
				onkeyup : true,	// 如果验证失败则按键up验证设置为false,默认是true
				
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
						equalTo : "#password"				
					},
					
					address : {
						required : true
					},
					
					like : {
						required : true
					},
					
					image : {
						required : true,
						// 调用自定义的验证方法
						// fileExt : ["jpeg", "jpg", "gif", "png"], 这种方法在出错信息时的验证太过于繁琐，使用到变化的验证符
						// 以下为使用正则表达式的方法进行后缀名的验证
						// | 在正则表达式中为或者的意思
						fileExt : "jpeg|jpg|gif|png"
					}
					
				}
				
			});
		});
  	</script>

  </head>
  
  <body>
  
	<h1>The customValidate Page</h1><hr/>
	
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
			<label>image:</label>
			<input type="file" name="image" />
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
