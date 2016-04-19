<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>extend 实现自定义样式</title>
    
	<link rel="stylesheet" href="static/css/css-table.css" type="text/css"></link>
	
	<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
  
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

  </head>
  
  <body>
  
	<h1>The CustomStyleTest Page</h1><hr/>
	
	<table id="hohotable">
		<thead>
			<tr>
				<th scope="col">Central London</th>
				<th scope="col">Rest of Inner London</th>
				<th scope="col">Outer London</th>
				<th scope="col">All London</th>
				<th scope="col">Rest of Great Britain</th>
				<th scope="col">Great Britain</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>48</td>
				<td>32</td>
				<td>25</td>
				<td>29</td>
				<td>20</td>
				<td>20</td>
			</tr>

			<tr>
				<td>36</td>
				<td>29</td>
				<td>27</td>
				<td>31</td>
				<td>19</td>
				<td>21</td>
			</tr>

			<tr>
				<td>33</td>
				<td>24</td>
				<td>20</td>
				<td>25</td>
				<td>15</td>
				<td>17</td>
			</tr>

			<tr>
				<td>47</td>
				<td>39</td>
				<td>36</td>
				<td>40</td>
				<td>33</td>
				<td>34</td>
			</tr>

			<tr>
				<td>69</td>
				<td>66</td>
				<td>43</td>
				<td>66</td>
				<td>47</td>
				<td>58</td>
			</tr>

			<tr>
				<td>49</td>
				<td>45</td>
				<td>37</td>
				<td>47</td>
				<td>42</td>
				<td>46</td>
			</tr>

			<tr>
				<td>21</td>
				<td>16</td>
				<td>13</td>
				<td>15</td>
				<td>12</td>
				<td>13</td>
			</tr>
		</tbody>
	</table>
	
  </body>
</html>
