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
			tableColor:function(thead, even, odd){
				// 设置 thead, tr:even tr:odd 颜色
				
				$(this).find("thead > tr").css("background", thead);
				// 以下为设置偶数行的样式
				$(this).find("tbody > tr:even").css("background", even);
				// 以下为设置技术行的样式
				$(this).find("tbody > tr:odd").css("background", odd);
				
				// 除了以上方法设置css，同时还可以使用以下方式进行设置
				// 即 选择指定的 css 文件，此时在需要设置的 css 样式较多时使用比较理想
				//$(this).find("thead > tr").addClass("static/css/cssName.css");
				
			}  		
  		});
  		
  		$(function(){
  			$("#hohotable").tableColor("#009ad6", "#afdfe4", "#76becc");
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
