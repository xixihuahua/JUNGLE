<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>个人中心页面</title>
<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">
	<jsp:include page="nav_head.jsp"></jsp:include>
	<jsp:include page="bottom_head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap-theme.min.css">
<link rel="icon" type="image/x-icon" href="images/jlogo2.png" />
	<link rel="stylesheet" type="text/css" href="css/pagination.css">
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>

<style type="text/css">
	body {
		
	}
	
	p{
		color: white;
	}
	#Dbj {
		width: 100%;
		height: 220px;
		position: absolute;
		background-image: url(images/leftbj1.png);
		background-size: contain; 
	}
	#Dbj2{
		 background: #DCDCDC;
	    background: -moz-linear-gradient(top,  #DCDCDC 0%, #ffffff 100%);
	    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#A9A9A9), color-stop(100%,#ffffff));
	    background: -webkit-linear-gradient(top,  #DCDCDC 0%,#ffffff 100%);
	    background: -o-linear-gradient(top,  #DCDCDC 0%,#ffffff 100%);
	    background: -ms-linear-gradient(top,  #DCDCDC 0%,#ffffff 100%);
	    background: linear-gradient(to bottom,  #DCDCDC 0%,#ffffff 100%);
	    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#DCDCDC', endColorstr='#ffffff',GradientType=0 );
	}
	
	.left {
		/*	background: url(images/bg.jpg) no-repeat;   */
		background-size: contain;
		height: 560px;
	}
	
	.container {
		margin-top: 175px;
	}
	#zy{
		margin-top: 50px;
	}
	.picture {
		margin-left: 3px;
		margin-bottom: 20px;
	}
	
	#head {
		margin-bottom: 10px;
		margin-top: px;
		margin-left: 20px;
	}
	.table>tbody>tr{
	    border:0px;
	    }
	.message {
		margin-left: 45px;
		margin-bottom: 40px;
		border-collapse: separate;
		border-spacing: 7px 1px;
	}
	b{
		color:red;
	}
	#follow_content{
		margin-top:45px;
		margin-right:15px;
	}
	.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
	}
	b{
	font-size: 16px;
}
.label{
	font-size: 12px;
}
</style>

</head>

<body>
	<input type="hidden" value="${requestScope.userinfo.user_id }" id="user_id" >
	<!-- 引用导航 -->
	<jsp:include page="nav.jsp" flush="false" />
	<!-- END引用导航 -->
	<div id="Dbj"></div>
	<div class="clearfix"></div>
	<!-- 中间个人信息页面 -->
	<div id="Dbj2">
	<div class="container">
		<!-- 左边个人信息展示页面 -->
		<div class="col-lg-4 col-xs-4">
			<div class="left"> 
				<div class="picture">
					<div ><img alt="" src="${userinfo.user_head }" width="100px">
					<a class="btn btn-default pull-right btn-lg" id="follow_content"  onclick="follow()"> <span class="glyphicon glyphicon-heart-empty" id="follow-btn">关注</span> </a>
					</div>
				</div>
				<div class=" class="table-responsive"">
					<table class="table">
				    <tbody>
			    	 <tr class="success">
				        <th>文章</th>
				        <th>粉丝</th>
				        <th>关注</th></tr>
				      <tr>
				        <td id="article_count">0</td>
				        <td>${userinfo.fans_number }</td>
				        <td>${userinfo.follow_number }</td></tr>
				    </tbody>
				  </table>
				</div>
				<table class="message">
					<tr>
						<td><p class="text-primary">昵称</p></td>
						<td><p class="text-primary">${userinfo.user_name }</p></td>
					</tr>
					<!-- 数据库: 昵称-->
					<tr>
						<td><p class="text-success">性别</p></td>
						<td><p class="text-success">${userinfo.user_sex }</p></td>
					</tr>
					<!-- 数据库 ：性别 -->
					<tr>
						<td><p class="text-info">年龄</p></td>
						<td><p class="text-info">18</p></td>
					</tr>
					<tr>
						<td><p class="text-danger">联系邮箱</p></td>
						<td><p class="text-danger">${userinfo.user_email }</p></td>
					</tr>
					<!-- 数据库 ：邮箱-->
				</table>
			</div>
		</div>
		<!-- END左边个人信息展示页面 -->
		
		<!-- 右边文章展示页面 -->
		<div id="zy">
		<div style="margin-left: -40px;" class="col-lg-8 col-xs-8">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab">Ta的文章</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="Pagination"></div>
					<!-- end 文章 -->
				</div>
			</div>
			
		</div>
		<!-- END右边文章信息展示页面 -->
		</div>
	</div>
	<!-- END中间个人信息页面 -->
	<!-- 分页查询js -->
		<script type="text/javascript" src="js/pagination.visited.js" ></script>
		<script type="text/javascript">
			//是否关注
			$.post("user.do",{method:"ifFollow",user_id:$('#user_id')[0].value},function(data){
				if(data == 'true'){
					$('#follow-btn').prop("class","glyphicon glyphicon-heart");
					$('#follow-btn').html("已关注");
				}else{
					$('#follow-btn').prop("class","glyphicon glyphicon-heart-empty");
					$('#follow-btn').html("关注");
				}
			});
			//关注
			var follow = function follow(){
				$.post("user.do",{method:'insertRelationship',user_id:$('#user_id')[0].value},function(data){
					if(data == 'true'){
						$('#follow-btn').prop("class","glyphicon glyphicon-heart");
						$('#follow-btn').html("已关注");
					}else{
						$('#follow-btn').prop("class","glyphicon glyphicon-heart-empty");
						$('#follow-btn').html("关注");
					}
				});
			};
		</script>	
	<!-- end 分页查询 js -->
	<!-- 引用底部 -->
	<div>
		<jsp:include page="bottom.jsp" flush="false" />
	</div>
	<!-- END引用底部 -->
</body>
</html>
