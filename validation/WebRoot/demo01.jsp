<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jquery.fn.extend 插件技术</title>
    <script type="text/javascript" src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
    	// 向jquery库中添加大小写比较的功能,此函数只能$调用
    	$.extend({
    		// 如果有参数则设置参数
    		max:function(x,y){
    			return x>y?x:y;
    		}
    	});
    	
    	$.extend($.fn,{
    		min:function(x,y){
    			return x<y?x:y;
    		}
    	});
    	console.info($.max(4,8));
    	console.info($("html").min(4,8));
    </script>
  </head>
  <body>
     <!-- 通过jquery的插件机制,向Jquery类库或者对象库增加新的函数 -->
  </body>
</html>
