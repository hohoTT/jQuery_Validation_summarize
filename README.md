# jQuery_Validation_summarize

有关jQuery Validation的用法及其应用的总结


### 一、 理解jquery的$.extend()、$.fn和$.fn.extend()
  	以下为详解
  	具体的实现可以参考页面  fn.extendTest.jsp
  	
  	1. jQuery.extend(object)
  
  		<1>. 为jQuery类添加类方法，可以理解为添加静态方法
  			举例如下：
  				jQuery.extend({
  					min: function(a, b) { return a < b ? a : b; },
  					max: function(a, b) { return a > b ? a : b; }
  				});
  				
  				jQuery.min(2,3); //  2 
  				jQuery.max(4,5); //  5
  		
  		<2>. Objectj Query.extend( target, object1, [objectN])
  			用一个或多个其他对象来扩展一个对象，返回被扩展的对象
  			var settings = { validate: false, limit: 5, name: "foo" }; 
  			var options = { validate: true, name: "bar" }; 
  			jQuery.extend(settings, options); 
  			结果：settings == { validate: true, limit: 5, name: "bar" }
  			
  		<3>. 其中需要注意的问题：
  		
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
  	
  	2. jQuery.fn.extend(object);
  	
  		对jQuery.prototype进得扩展，就是为jQuery类添加“成员函数”。
  		jQuery类的实例可以使用这个“成员函数”。
  		比如我们要开发一个插件，做一个特殊的编辑框，当它被点击时，便alert 当前编辑框里的内容。
  		
  		$.fn.extend({          
  		    alertWhileClick:function() {            
  		          $(this).click(function(){                 
  		                 alert($(this).val());           
  		           });           
  		     }       
  		});       
  		$("#input1").alertWhileClick(); 
  		
  		$("#input1")　为一个jQuery实例，当它调用成员方法 alertWhileClick后，
  		便实现了扩展，每次被点击时它会先弹出目前编辑里的内容。
		
### 二、 自定义奇偶行变色表格, 功能可以实现, 但是每次需要传参数

	  具体的实现如页面 customStyleTest.jsp 所示
	 
### 三、 采用缺省参数来优化自定义函数

  	 具体的实现如页面 customStyleTest2.jsp 所示
  	 
  		其中具体的实现代码详解如下：
  			<script type="text/javascript">
  				// #009ad6  #afdfe4  #76becc
  				// 把常用的函数, 定义在jquery库中
  		  		$.fn.extend({
  					
  					tableColor:function(color){
  						// 设置 thead, tr:even tr:odd 颜色
  						
  						// 如果没有传参数,则默认是缺省参数
  						// 此时$.extend() 中，前一个为自定义的方法， 之后的哪一个为覆盖第一个方法的方法
  						// 如果没有，此时执行的依旧是第一个方法中定义的内容
  						color = $.extend(
  									{thead : "#009ad6", even : "#afdfe4", odd : "#76becc"}, 
  									color
  								);
  						
  						$(this).find("thead > tr").css("background", color.thead);
  						// 以下为设置偶数行的样式
  						$(this).find("tbody > tr:even").css("background", color.even);
  						// 以下为设置技术行的样式
  						$(this).find("tbody > tr:odd").css("background", color.odd);
  						
  						// 除了以上方法设置css，同时还可以使用以下方式进行设置
  						// 即 选择指定的 css 文件，此时在需要设置的 css 样式较多时使用比较理想
  						//$(this).find("thead > tr").addClass("static/css/cssName.css");
  						
  					}  		
  		  		});
  		  		
  		  		$(function(){
  		  			// 传递的都为 json 格式的数据
  		  		
  		  			// 此时传递的什么，那么自定义函数中的参数值则发生变化，没有进行设置的参数依旧执行的为自定义函数中初始化的数值
  		  			$("#hohotable").tableColor({thead : "green"});
  		  			
  		  			// 此时如果不进行参数的，没有进行设置的参数依旧执行的为自定义函数中初始化的数值
  		  			//$("#hohotable").tableColor();
  		  		})
  		  		
  		  	</script>
	 
	
	

