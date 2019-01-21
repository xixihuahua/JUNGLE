<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JUNGLE充值</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
		<link rel="stylesheet" type="text/css" href="css/pagination.css">
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<style type="text/css">
		body {
			background-image: url(images/logobjt2.jpg);
        	background-repeat: no-repeat;
        	background-size: 100%;
		}
		form{
			margin:130px auto;
		}
		.panel{
			height: 300px;
			width: 550px;
		}
		.panel:HOVER {
			transform: scale(1.03);
			transition:0.8s; 
			box-shadow: 2px 2px 2px 3px #DCDCDC;
		}
		button:HOVER {
			transform: scale(1.03);
			transition:0.5s; 
		}
	</style>
  </head>
  
  <body>
    <form id="frm" action="paydemo.jsp" method="post">
    	<div class="panel panel-warning col-xs-6 col-xs-offset-3">
   			<div class="panel-heading">
   				<h3 style="font-family: '黑体'">JUNGLE充值
   				</h3>
   			</div>
    		<div class="panel-body">
    			<label><input type="radio" id="payWay1" name="payWay" value="1"/> 支付宝支付</label>&nbsp;&nbsp;&nbsp;
        		<label><input type="radio" id="payWay2" name="payWay" value="2" checked/> 微信支付</label>
        		<br/>
        		<span class="input-group-addon">支付金额</span><input name="paymoney" id="paymoney" type="text" class="form-control" placeholder="请输入充值金额..."/>
        		<button type="button" id="demoBtn1" class="btn btn-danger" style="width: 490px;margin-top: 30px;">确认支付</button>
        		<a href="left.jsp"><button type="button" class="btn btn-success" style="width: 490px;margin-top: 5px;">返回个人中心</button></a>
    		</div>
		</div>
                
    </form>
    
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$("#demoBtn1").click(function(){
		var paymoney = parseInt($("#paymoney").val());
		var payWay = $("#payWay1").prop("checked") ? "1" : "2";
		if(isNaN(paymoney) || paymoney < 0.1){
			alert("充值金额不合法");
			return;
		}else{
			$("#frm").submit();
			/* location.href = "paydemo.jsp?paymoney="+paymoney+"&payWay="+payWay; */
		}
	});
</script> 
  </body>
</html>
