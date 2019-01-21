<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
/*p{
	color: white;
}*/
#Dbj {
	width: 100%;
	height: 220px;
	position: absolute;
	background-image: url(images/leftbj1.png);
	background-size: contain; 
}
/*--
	#Dbj2{
	 background: #A9A9A9;
    background: -moz-linear-gradient(top,  #A9A9A9 0%, #ffffff 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#A9A9A9), color-stop(100%,#ffffff));
    background: -webkit-linear-gradient(top,  #A9A9A9 0%,#ffffff 100%);
    background: -o-linear-gradient(top,  #A9A9A9 0%,#ffffff 100%);
    background: -ms-linear-gradient(top,  #A9A9A9 0%,#ffffff 100%);
    background: linear-gradient(to bottom,  #A9A9A9 0%,#ffffff 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#A9A9A9', endColorstr='#ffffff',GradientType=0 );
}
*/
	#Dbj2{
		background-color:whitesmoke;
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
	margin-top: 0px;
	margin-left: 20px;
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
.admin_div{
	margin-top: 55px;
	margin-left: -15px;
	display: none;
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
a{
list-style: none;
text-decoration:none;
}
</style>

</head>

<body>

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
					<div class="col-lg-6 col-xs-6">
					<a href="#" id="head"><img src="${userinfo.user_head }" width="80"
						id="head"></a>
					</div>	
					<div class="admin_div col-lg-6 col-xs-6">
						<label>
							<a href="<%=path %>/admin/admin.jsp"><span class="label label-success">
							<img src="images/admin_bt3.png" style="width: 20px; height: 20px;"/>
								<span class="span_text">超级管理员</span>
							</span></a>
						</label>
					</div>	
						  <br />
					<!-- 数据库：头像的src -->
					<div class="col-lg-12 col-xs-12">
						<div id="grade">
							&nbsp;&nbsp;&nbsp;等级 :&nbsp;&nbsp;&nbsp;
						</div>
					</div>
					<div class="col-lg-12 col-xs-12">
						<div id="score">
							&nbsp;&nbsp;&nbsp;积分:&nbsp;&nbsp;&nbsp;${userinfo.user_score }
						</div>
					</div>
					<div class="clearfix"></div>
					<p style="color:#FFA500">&nbsp;&nbsp;
						<a class="btn" href="pay.jsp" data-toggle="tooltip" title="充值中心"><img src="images/gold9.png" width="30"></a>&nbsp;:&nbsp;&nbsp;<span id="coin" >${userinfo.user_coin }</span>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-success" href="javascript:sign()" id="sign" >点击签到</a></p>
					<a href="#collect">&nbsp;&nbsp;&nbsp;<img alt="收藏" src="images/collect5.png" width="30"></a> <a
						href="#follow"><img alt="关注" src="images/focus3.png" width="30"></a>
					<a href="#fans"><img src="images/fans4.png" width="30"></a> <a
						href="#"></a> <a
						href="set2.jsp"><img src="images/set4.png" width="30"></a>
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
					<!-- 数据库 ：年龄-->
					<tr>
						<td><p class="text-warning">生日</p></td>
						<td><p class="text-warning"><fmt:formatDate value="${userinfo.user_bir }" pattern="yyyy年MM月dd日 " /></p></td>
					</tr>
					<!-- 数据库 ：生日-->
					<tr>
						<td><p class="text-danger">邮箱</p></td>
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
				<li class="active"><a href="#home" data-toggle="tab">我的文章</a></li>
				<li><a href="#collect" data-toggle="tab">我的收藏</a></li>
				<!-- 11-12 -->
				<li><a href="#comment_article" data-toggle="tab">我评论过的文章</a></li>
				<li><a href="#msg" data-toggle="tab">我的消息</a></li>
				<li class="dropdown"><a href="#" id="myTabDrop1"
					class="dropdown-toggle" data-toggle="dropdown">我的互动 <b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
						<li><a href="#follow" tabindex="-1" data-toggle="tab">
								关注</a></li>
						<li><a href="#fans" tabindex="-1" data-toggle="tab">粉丝</a></li>
					</ul></li>
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
				<div class="tab-pane fade in" id="collect">
					<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="collectmain"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="collectPagination"></div>
					<!-- end 文章 -->
				</div>
				<div class="tab-pane fade in" id="comment_article">
					<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="commentmain"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="commentPagination"></div>
					<!-- end 文章 -->
				</div>
				<div class="tab-pane fade in" id="msg">
					<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="msgmain"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="msgPagination"></div>
					<!-- end 文章 -->
				</div>	
				<div class="tab-pane fade in" id="follow">
					<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="followmain"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="followPagination"></div>
					<!-- end 文章 -->
				</div>
				<div class="tab-pane fade" id="fans">
							<ul id="fansmain"></ul>
					  	<div id="fansPagination"></div>
				</div>
				</div>
			</div>
		</div>
		<!-- END右边文章信息展示页面 -->
		</div>
	</div>
	<!-- END中间个人信息页面 -->
	<!-- 分页查询js -->
	<script type="text/javascript" src="js/pagination.left.js" ></script>
	<script type="text/javascript" src="js/pagination.left.follow.js" ></script>
	<script type="text/javascript" src="js/pagination.left.fans.js" ></script>
	<script type="text/javascript" src="js/pagination.left.collect.js" ></script>
	<script type="text/javascript" src="js/pagination.left.comment.js" ></script>
	<script type="text/javascript" src="js/pagination.left.msg.js" ></script>
	<script type="text/javascript">
		//管理员按钮
		var admin_userType = '${userinfo.user_type }';
		if(admin_userType == 0){
			$(".span_text").html("超级管理员");
			$(".admin_div").css("display","block");
		}if(admin_userType == 1){
			$(".span_text").html("管理员");
			$(".admin_div").css("display","block");
		}
	
		//取消关注
			var follow = function follow(id){
				$.post("user.do",{method:'insertRelationship',"user_id":id},function(data){
					if(data == 'true'){
					
					}else{
						followPageCallback(0);
					}
				});
			};
			//收藏
			var collect =	function collect(article_id){
				$.post("article.do",{method:'collectArticle',article_id:article_id},function(data){
					if(data == 'true'){
						
					}else{
						$('#article_'+article_id).remove();
					}
				});
			};
			//签到
			var sign = function sign(){
				$.post("user.do",{method:'signDate'},function(data){
					if(data == '1'){
						alert("今日已签到");
						$('#sign').html("已签到");
					}else if(data == '2'){
						alert("签到成功");
						$('#sign').html("已签到");
						$('#coin').html(parseInt('${userinfo.user_coin}')+10);
					}else{
						alert("签到失败");
						$('#sign').html("点击签到");
					}
				});
			}
			function ifsign(){
				var user_date = '${userinfo.sign_date}'.substring(0,10);
				var date =  new Date();
				var y = 1900+date.getYear();
				var m = "0"+(date.getMonth()+1);
				var d = "0"+date.getDate();
				date_now = y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
				if(!(date_now == (user_date))){
					$('#sign').html("点击签到");
				}else{
					$('#sign').html("已签到");
				}
			}
			ifsign();
			//等级
			for(var i = 0 ;i<('${userinfo.user_score}'/100);i++) {
				$('#grade').append("<span class='glyphicon glyphicon-tree-conifer'></span>");
			}
			//更新读取消息状态
			function clearmsg(para){
				$.post("message.do",{method:'updateMessage',message_id:para},function(data){
					if(data == 'true'){
						
						$('#msg'-para).html("已读");
					}else{
						alert("签到失败");
						$('#msg'-para).html("未读");
					}
				});
			}
			if('${requestScope.payCoin}' != null){
				if('${requestScope.payCoin}' == "true"){
					alert("充值成功");
				}else if('${requestScope.payCoin}' == "false"){
					alert("充值失败");
				}
			}
	</script>
	<!-- end 分页查询 js -->
	<!-- 引用底部 -->
	<div>
		<jsp:include page="bottom.jsp" flush="false" />
	</div>
	<!-- END引用底部 -->
</body>
</html>
