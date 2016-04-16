<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>$.extend 定义缺省样式</title>
	<link rel="stylesheet" href="css/css-table.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		// #009ad6  #afdfe4  #76becc
		// 把常用的函数,定义在jquery库中
		$.fn.extend({
			tableColor:function(color){
				// 如果没有传参数,则默认是缺省参数
				color=$.extend({thead:"#009ad6",even:"#afdfe4",odd:"#76becc"},color);
				// 设置 thead, tr:even tr:odd 颜色
				$(this).find("thead > tr").css("background",color.thead);
				$(this).find("tbody > tr:even").css("background",color.even);
				$(this).find("tbody > tr:odd").css("background",color.odd);
			}
		});
		$(function(){
			$("#tt").tableColor({thead:"green"});
		});
	</script>
</head>
<body>
	<table id="tt">
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
