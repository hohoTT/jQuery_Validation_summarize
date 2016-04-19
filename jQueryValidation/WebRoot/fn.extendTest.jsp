<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jquery .fn.extend 插件技术</title>
    
    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
  
  	<script type="text/javascript">
  		
  		// 向jquery库中添加大小写比较的功能, 此函数只能$调用
    	$.extend({
    		// 如果有参数则设置参数
    		max:function(x,y){
    			return x > y ? x : y;
    		},
    		
    		// 相同名称时使用，此时会替换掉之前的那个方法
    		//max:function(){
    		//	alert("hohoTT");
    		//}
    	});
    	
    	// 以下为以 alert的形式进行显示结果
    	//alert($.max(12, 13));
    	
    	// 以下为在 console 控制台中打印显示
    	console.info($.max(12, 13));
    	
    	$.fn.extend({
    		// 如果有参数则设置参数
    		min:function(x,y){
    			return x < y ? x : y;
    		}
    	});
    	
    	// 以下为 $.fn.extend 的另一种写法，实现起来是一样的效果
    	//$.extend($.fn,{
    	//	min:function(x,y){
    	//		return x<y?x:y;
    	//	}
    	//});
    	
    	console.info($("html").min(12, 13));
  		
  	</script>
  	
  </head>
  
  <body>
	
	<h1>The Fn.extendTest Page</h1><hr/>
    
     <!-- 通过jquery的插件机制,向Jquery类库或者对象库增加新的函数 -->
     
  </body>
</html>
