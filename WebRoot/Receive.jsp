<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <% 
  	String orderid = request.getParameter("orderid");
  	
   %>
  <body>
  <%-- <%= orderid%> --%>
  	<div><h3>充值处理</h3></div>
  	<form id="frm" name="frm" action="user.do" method="post">
     	<input type="hidden" name="method" value="payCoin">
     	<input type="hidden" name="orderid" value="<%=orderid %>">
     	<input type="hidden" name="user_id" value='${userinfo.user_id }'>
     </form>
     
     <script type="text/javascript" src="js/jquery.min.js"></script>
     <script type="text/javascript">
     	$("#frm").submit();
     	/* $(document).ready(function(){
	    	$.post("user.do",{"method":"payCoin","user_id":${userinfo.user_id},"orderid":'${orderid }'},function(msg){
	    		if(msg == "true"){
	    			alert("支付成功");
	    		}else{
	    			alert("支付失败");
	    		}
     		});
     	}); */
     	
     </script>
  </body>
</html>
