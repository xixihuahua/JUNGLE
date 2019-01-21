<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	/*String junpath =basePath";
	String junpath2 = request.getSession().getServletContext().getRealPath("");*/
%>
<!DOCTYPE HTML>
<html>
<head>

<title>管理员后台</title>
<jsp:include page="../nav_head.jsp"></jsp:include>
	<jsp:include page="../bottom_head.jsp"></jsp:include>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/bootstrap/css/bootstrap-theme.min.css">
<link rel="icon" type="image/x-icon"
	href="<%=basePath%>/images/jlogo2.png" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/pagination.css">

<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.pagination.js"></script>
<style type="text/css">
#middle {
	background: #DCDCDC;
	background: -moz-linear-gradient(top, #696969 0%, #F8F8FF 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #A9A9A9),
		color-stop(100%, #F8F8FF));
	background: -webkit-linear-gradient(top, #DCDCDC 0%, #F8F8FF 100%);
	background: -o-linear-gradient(top, #696969 0%, #F8F8FF 100%);
	background: -ms-linear-gradient(top, #A9A9A9 0%, #F8F8FF 100%);
	background: linear-gradient(to bottom, #DCDCDC 0%, #F8F8FF 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#A9A9A9',
		endColorstr='#ffffff', GradientType=0);
	height: 680px;
	margin-top: 67px;
}

a {
	list-style: none;
}

#yincang {
	position: absolute;
	height: 390px;
	width: 1100px;
	margin-top: -110px;
	display: none;
}

.adda {
	background: #A9A9A9;
			background: -moz-linear-gradient(top, #DCDCDC 0%, #A9A9A9 100%);
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #DCDCDC),
				color-stop(100%, #A9A9A9)); 
			background: -webkit-linear-gradient(top, #A9A9A9 0%, #A9A9A9 100%);
			background: -o-linear-gradient(top, #A9A9A9 0%, #DCDCDC 100%);
			background: -ms-linear-gradient(top, #ffffff 0%, #A9A9A9 100%);
			background: linear-gradient(to bottom, #ffffff 0%, #DCDCDC 100%);
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
				endColorstr='#DCDCDC', GradientType=0); 
	width: 1090px;
	height: 390px;
	z-index: 25;
	border-radius:4%;
}

.ycs {
	margin-left: 250px;
}

#user_y {
	position: absolute;
	margin-top: -600px;
	margin-left: 200px;
	display: none;
}

#user_y2 {
	position: absolute;
	margin-top: -600px;
	margin-left: 200px;
	display: none;
}

#user_y3 {
	position: absolute;
	margin-top: -600px;
	margin-left: 200px;
	display: none;
}

.up_panel_son {
	height: 520px;
	width: 600px;
}

.up_panel_son2 {
	height: 520px;
	width: 600px;
}

.navbar-fixed-bottom {
	margin-right: 180px;
	margin-left: 220px;
	margin-bottom: 110px;
}

.user_table {
	margin-left: 100px;
}
.zuo_btn :HOVER {
	background-color:whitesomke;
	box-shadow: 2px 2px 2px 3px #DCDCDC;
}
.zuo_btn div{
	box-shadow: 1px 1px 1px 2px #DCDCDC;
}
.panel div{
	border-radius:3%; 
}
.panel :HOVER {
	border-radius:4%;
	border-color:whitesomke;
	box-shadow: 2px 2px 2px 3px #DCDCDC;
}
.btn:HOVER {
	transform: scale(1.2);
	transition:0.7s;
}
</style>
</head>

<body>
	<!-- 引用顶部导航 -->
	<jsp:include page="../nav.jsp" flush="false" />
	<div class="clearfix"></div>
	<!-- END引用顶部导航 -->

	<!-- 中间管理部分 -->
	<div id="middle">


		<!-- 左侧功能显示栏 -->
		<div class="col-lg-2 col-xs-2 col-md-2">
			<div class="panel panel-default">
				<div class="zuo_btn panel-body " style="height: 600px;background-color: whitesmoke;" >

					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne"><img alt="用户管理"
										style="width: 35px;height: 35px;"
										src="<%=path%>/images/user.png"> &nbsp;用户管理 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									<div>
										<button class="btn btn-link" onclick="alluser();">查看用户信息</button>
									</div>
									<div>
										<button class="btn btn-link" onclick="add_user();">新增用户</button>
									</div>
									<div>
										<button class="btn btn-link" onclick="del_user();">移除用户</button>
									</div>
								</div>
							</div>
						</div>

						<div class="panel panel-success">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseTwo"><img alt="文章管理"
										style="width: 35px;height: 35px;"
										src="<%=path%>/images/wenz.png"> &nbsp;文章管理 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">
									<div>
										<button class="btn btn-link" onclick="allarticle();">查看所有文章</button>
									</div>
									<div>
										<button id="c_article_btn" class="btn btn-link">文章操作</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseThree"><img alt="管理员"
										style="width: 35px;height: 35px;"
										src="<%=path%>/images/admint.png"> &nbsp;管理员</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">
									<div>
										<button class="btn btn-link" onclick="alladmin();">查看管理员</button>
									</div>
									<div>
										<button id="deleAdmin_btn" class="addAdmin btn btn-link" onclick="alladmin2();">移除管理员</button>
									</div>
									<div>
										<button id="addAdmin_btn" class="addAdmin btn btn-link" onclick="queradmin();">任命管理员</button>
									</div>
								</div>
							</div>
						</div>

						<div class="panel panel-warning">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseFour"><img alt="其他设置"
										style="width: 35px;height: 35px;"
										src="<%=path%>/images/qita.png"> &nbsp;其他设置</a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse">
								<div class="panel-body">
									<div>
										<button class="btn btn-link">其他设置1</button>
									</div>
									<div>
										<button class="btn btn-link">其他设置2</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END左侧功能显示栏 -->

		<!-- 右侧功能操作栏 -->
		<div class="col-lg-10 col-xs-10 col-md-10">
			<div class="panel panel-success">
				<div class="panel-body">
					<!-- 功能按钮 -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-lg-2 col-xs-2 col-md-2">
								<span style="font-weight: 900;">J U N G L E &nbsp;</span>
							</div>
							<div class="col-lg-4 col-xs-4 col-md-4">
								<input type="text" class="form-control" id="inputSousuo">
							</div>
							<div class="col-lg-4 col-xs-4 col-md-4">
								<button type="button" class="btn btn-success"
									onclick="adminSearch();">查找信息</button>

								<button type="button" class="btn btn-warning">修改信息</button>

								<button type="button" class="btn btn-info"
									onclick="deleArticle();">批量删除</button>
							</div>
							<div class="col-lg-1 col-xs-1 col-md-1">
								<a href="<%=path%>/left.jsp"><button type="button"
										class="btn btn-danger">回到上一页</button></a>
							</div>
						</div>
					</div>
					<!-- END功能按钮 -->
					<!-- 显示搜索框 -->
					<div class="xianshi panel panel-default">
						<div class="panel-body" style="height: 400px;">

							<table id="adminxianshi" class="table table-condensed">

							</table>
						</div>
						<div id="admindd" style="text-align: center;"></div>
					</div>
					<!-- END显示搜索框 -->

				</div>

			</div>
			<!-- 隐藏显示框 -->
			<div id="yincang">
				<div class="ycs panel panel-default navbar-fixed-bottom">
					<div class="adda panel-body">
						<div class="col-lg-4 col-xs-4 col-md-4">
							<input type="text" class="form-control" id="addamin"
								placeholder="请输入用户ID">
						</div>
						<div class="col-lg-4 col-xs-4 col-md-4">
							<button id="admin_btn" type="button" class="btn btn-danger"
								onclick="addadmin();">确认升为管理员</button>
							<button id="admin_btn" type="button" class="btn btn-info"
								onclick="deleAdmin();">移除此管理员</button>
						</div>
						<table id="addadminxianshi" class="table table-condensed">

						</table>
						<div id="addadmin" style="text-align: center;"></div>
					</div>
				</div>
			</div>
			<!-- END隐藏显示框 -->

			<!-- 修改用户信息隐藏框 -->
			<div id="user_y">
				<div class="up_panel navbar-fixed-bottom">
					<div class="panel panel-default">
						<div class="up_panel_son panel-body">
							<div style="margin-left: 880px;margin-bottom: 10px;">
								<button onclick="xsby();" type="button" class="btn btn-primary">X</button>
							</div>

							<table class="user_table table table-condensed">
								<caption>修改用户信息</caption>
								<thead>
									<tr>
										<th>用户属性</th>
										<th>用户信息</th>
									</tr>
								</thead>
								<tbody>
									<tr id="user_name">

									</tr>
									<tr id="user_id">

									</tr>
									<tr id="user_pwd">

									</tr>
									<tr id="user_sex">

									</tr>
									<tr id="user_type">

									</tr>
									<tr id="user_coin">

									</tr>
								</tbody>
							</table>
							<div style="margin-left: 500px;">
								<button id="update_user" type="button" class="btn btn-primary">确认提交修改</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END修改用户信息隐藏框 -->

			<!-- 隐藏移除用户框 -->
			<div id="user_y2">
				<div class="up_panel navbar-fixed-bottom">
					<div class="panel panel-default">
						<div class="up_panel_son2 panel-body">
							<div style="margin-left: 880px;margin-bottom: 10px;">
								<button onclick="xsby2();" type="button" class="btn btn-primary">X</button>
							</div>
							<table class="user_table table table-condensed">
								<caption>移除用户</caption>
								<thead>
									<tr>
										<th>用户属性</th>
										<th>用户信息</th>
									</tr>
								</thead>
								<tbody id="del_table">

								</tbody>
							</table>
							<div id="del_table_buttom" style="text-align: center;"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- END隐藏移除用户框 -->

			<!-- 隐藏新增用户框 -->
			<div id="user_y3">
				<div class="up_panel navbar-fixed-bottom">
					<div class="panel panel-default">
						<div class="up_panel_son2 panel-body">
							<div style="margin-left: 880px;margin-bottom: 10px;">
								<button onclick="xsby3();" type="button" class="btn btn-primary">X</button>
							</div>
							<table class="user_table table table-condensed">
								<caption>新增用户</caption>
								<thead>
									<tr>
										<th>用户属性</th>
										<th>新增用户信息</th>
									</tr>
								</thead>
								<tbody id="del_table">
									<tr>
										<td>用户名</td>
										<td><input class="form-control" style="width: 50%;"
											id="addUser_name"></td>
									</tr>
									<tr>
										<td>用户密码</td>
										<td><input class="form-control" style="width: 50%;"
											id="addUser_pwd"></td>
									</tr>
									<tr>
										<td>用户性别</td>
										<td><input class="form-control" style="width: 50%;"
											id="addUser_sex"></td>
									</tr>
									<tr>
										<td>用户邮箱</td>
										<td><input class="form-control" style="width: 50%;"
											id="addUser_email"></td>
									</tr>
									<tr>
										<td>自定义金币</td>
										<td><input class="form-control" style="width: 50%;"
											id="addUser_coin"></td>
									</tr>
								</tbody>
							</table>
							<div style="margin-left: 500px;">
								<button id="add_user_btn" type="button" class="btn btn-primary">确认注册</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END隐藏新增用户框 -->

		</div>
		<!-- END右侧功能操作栏 -->
	</div>
	<!-- END中间管理部分 -->

	<script type="text/javascript" src="<%=basePath%>/js/admin.search.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/admin.alluser.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/admin.allarticle.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/admin.alladmin.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/admin.addadmin.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/admin.quadmin.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/admin.deleadmin.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/admin.alladmin2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/admin.deluser.js"></script>
	<script type="text/javascript">
	
		allarticle();
		
		var admin_userid;
	
		$(".addAdmin").click(function() {
			if (($("#yincang").css("display")) == "none") {
				$("#yincang").fadeIn("slow");
				$("#yincang").fadeIn(2000);
				$("#yincang").css("display", "block");
			} else {
				$("#yincang").fadeIn("slow");
				$("#yincang").fadeIn(2000);
				$("#yincang").css("display", "none");
			}
		});
		function xsby(){
			$("#user_y").css("display","none");
		}
		function xsby2(){
			$("#user_y2").css("display","none");
		}
		function xsby3(){
			$("#user_y3").css("display","none");
		}
		
		function add_user(){
			if (($("#user_y3").css("display")) == "none") {
				$("#user_y3").fadeIn("slow");
				$("#user_y3").fadeIn(2000);
				$("#user_y3").css("display", "block");
				
			} else {
				$("#user_y3").fadeOut("slow");
				$("#user_y3").fadeOut(2000);
				$("#user_y3").css("display", "none");
			}
		}
		
		function del_user(){
			if (($("#user_y2").css("display")) == "none") {
				$("#user_y2").fadeIn("slow");
				$("#user_y2").fadeIn(2000);
				$("#user_y2").css("display", "block");
				
				alluser2();
				
			} else {
				$("#user_y2").fadeOut("slow");
				$("#user_y2").fadeOut(2000);
				$("#user_y2").css("display", "none");
			}
		}
		
		function xsbtn(user_id) {
			if (($("#user_y").css("display")) == "none") {
				$("#user_y").fadeIn("slow");

				$("#user_y").css("display", "block");
						
				$.ajax({
					url : "user.do",
					data : {
						"method" : "queryUserById",
						"user_id" : user_id
					},
					dataType:"json",
					type : 'post',
					/* async : false, */
					traditional : true,
					success : function(userinfoAdmin) {
					
					$("#user_name").empty();
					$("#user_id").empty();
					$("#user_pwd").empty();
					$("#user_sex").empty();
					$("#user_type").empty();
					$("#user_coin").empty();
					
						$("#user_name").append(
							"<td>用户姓名</td>"+
							"<td><input id='up_userName' class='form-control success' style='width:50%' value="+userinfoAdmin.user_name+"></td>"
						);
						admin_userid = userinfoAdmin.user_id;
						$("#user_id").append(
							"<td>用户ID</td>"+
							"<td>"+userinfoAdmin.user_id+"</td>"
						);
						$("#user_pwd").append(
							"<td>用户密码</td>"+
							"<td><input id='up_userPwd' class='form-control success' style='width:50%' value="+userinfoAdmin.user_pwd+"></td>"
						);
						$("#user_sex").append(
							"<td>用户性别</td>"+
							"<td><input id='up_userSex' class='form-control success' style='width:50%' value="+userinfoAdmin.user_sex+"></td>"
						);
						$("#user_type").append(
							"<td>用户权限</td>"+
							"<td>"+userinfoAdmin.user_type+"</td>"
						);
						$("#user_coin").append(
							"<td>用户金币</td>"+
							"<td><input id='up_userCoin' class='form-control success' style='width:50%' value="+userinfoAdmin.user_coin+"></td>"
						);
						
					}
				});
			} else {
				$("#user_y").fadeIn("slow");
				$("#user_y").fadeIn(2000);
				$("#user_y").css("display", "none");
			}
	
		}
		
		
		function deleArticle() {
			var myArray = new Array();
			var obj = document.getElementsByName('dele_article_id');
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].checked == true) { //如果选中
					myArray.push(obj[i].value);
				}
			}
	
			/* $.post("article.do",{"method":"deleArticle","article_id":myArray},function(flag){
				alert("返回结果"+flag);
			}); */
	
			$.ajax({
				url : "article.do",
				data : {
					"method" : "deleArticle",
					"article_id" : myArray
				},
				type : 'post',
				/* async : false, */
				traditional : true,
				success : function(data) {
					alert(data);
					allarticle();
				}
			});
		}
		/*$(document).on("#admin_btn","click",function(){
			alert("");
		});*/
		/*document.getElementById('admin_btn').onclick = function(){
			alert("");
			document.getElementsByName('dele_article_id').onclick();
		};*/
		function admin_btn(){
			var obj = document.getElementsByName("dele_article_id");
			for (var i = 0; i < obj.length; i++) {
				/*if (obj[i].prop(checked)==true) {
					//alert(true);
					obj[i].prop(checked,false);
				}else{
					//alert(false);
					obj[i].prop(checked,true);
				}*/
				obj[i].click();
			}
		}
			
		
		$("#update_user").click(function(){
			var user_name = $("#up_userName").val();
			var user_pwd = $("#up_userPwd").val();
			var user_sex = $("#up_userSex").val();
			var user_coin = $("#up_userCoin").val();
			var user_id = admin_userid;
			$.ajax({url:"user.do",
				data:{	"method":"updateUser_Admin",
						"user_id":user_id,
						"user_name":user_name,
						"user_pwd":user_pwd,
						"user_sex":user_sex,
						"user_coin":user_coin
				},
				type:"post",
				traditional : true,
				success : function(flag) {
					if(flag == "修改成功"){
						alert(flag);
						xsby();
						alluser();
					}else{
						alert(flag);
					}
				}
			});
		});
		
		$("#add_user_btn").click(function(){
			var user_name = $("#addUser_name").val();
			var user_pwd = $("#addUser_pwd").val();
			var user_sex = $("#addUser_sex").val();
			var user_email = $("#addUser_email").val();
			var user_coin = $("#addUser_coin").val();
			
			$.ajax({url:"user.do",
				data:{	"method":"admin_insertUser",
						"user_id":user_id,
						"user_name":user_name,
						"user_pwd":user_pwd,
						"user_sex":user_sex,
						"user_coin":user_coin,
						"user_email":user_email
				},
				type:"post",
				traditional : true,
				success : function(flag) {
					if(flag == "注册新用户成功"){
						alert(flag);
						xsby3();
						alluser();
					}else{
						alert(flag);
					}
				}
			});
		});
		var user_type = '${userinfo.user_type }';
		if(user_type != 0){
			document.getElementById("addAdmin_btn").className="addAdmin btn btn-link disabled";
			document.getElementById("deleAdmin_btn").className="addAdmin btn btn-link disabled";
			document.getElementById("addAdmin_btn").onclick="";
			document.getElementById("deleAdmin_btn").onclick="";
		}
		document.getElementById("c_article_btn").className="btn btn-link disabled";
	</script>
	<!-- 引用底部导航 -->
	<div class="clearfix"></div>
	<jsp:include page="../bottom.jsp" flush="false" />
	<!-- 引用底部导航 -->
</body>
</html>
