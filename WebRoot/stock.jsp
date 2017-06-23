<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实时更新</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.wrapper{
  margin-top:200px;
  margin-left:200px;
}
#customers
{
    font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
    width:30%;
    border-collapse:collapse;
  
}
#customers td, #customers th 
{
    font-size:1em;
    border:1px solid #98bf21;
    padding:3px 4px 2px 6px;
}
#customers th 
{
    font-size:1.1em;
    text-align:left;
    padding-top:5px;
    padding-bottom:4px;
    background-color:#A7C942;
    color:#ffffff;
}

#customers tr.alt td 
{
 padding-top:5px;
    padding-bottom:4px;
    color:#000000;
    background-color:#EAF2D3;
}
</style>
	<script type="text/javascript" src="js/my.js"></script> 
    	<script type="text/javascript" src="js/jquery-1.11.0.js"></script> 
<script type="text/javascript">
	function f1(){
	setInterval(update1,5000);
	}
	function update1(){
		//第一步：获取ajax对象
			var xhr=getXhr();
			//alert(xhr);
			//第二步：使用ajax对象发送请求
			xhr.open("get","quoto.do",true);//encodeURI(uri),为了解决ie解析request兼容性问题，为了欺骗ie,encodeURI这个函数，为了解决uri里面中文以utf-8来解析
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4){
					
						//只有readyState=4，ajax对象才获得了从服务器的所有数据
					var text=xhr.responseText;
					//alert(text);
					//利用服务器返回的数据更新当前页面
					//将json字符串转换成js对象组成的数组
					var arr=eval(text);
					//将数组数据取出来，放到表zhong
					var newarr="";
				for(i=0;i<arr.length;i++){
						newarr+="<tr><td>"+arr[i].name
						+"</td><td>"+arr[i].code
						+"</td><td>"+arr[i].price
						+"</td></tr>";
					}
					//alert(html);
					$("#tb1").html(newarr);
					}
					
					}
					xhr.send(null);
	}
</script>
  </head>
  
  <body onload="f1();">
  <div class="wrapper">
   <table id="customers"  method="post" >
<tr>
  <th width=9%>西瓜品种</th>
  <th width=9%>西瓜序号</th>
  <th width=12%>西瓜实时价格</th>
</tr>
<tbody id="tb1">
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="alt">
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="alt">
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="alt">
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="alt">
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr class="alt">
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</div>
</table>
  </body>
</html>
