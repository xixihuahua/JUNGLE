<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<!-- 导航 -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Login -->
			<form class="navbar-form navbar-left aw-btn-nav" role="search">
				<div class="navbar-header">
					<a class="navbar-brand" href="<%=path %>/index.jsp">JUNGLE论坛</a>
				</div>
			</form>
			<!-- ENDLogin -->
			
			<!-- 搜索框 -->
				<div class="aw-search-box  hidden-xs hidden-sm">
					
					<form class="navbar-search aw-btn-nav" action="search.jsp" id="global_search_form" method="post">
						<input class="form-control search-query" type="text" onkeyup="sendRequest()" onclick="hiddenSuggest()" placeholder="搜索问题、话题或人" autocomplete="off" name="q" id="aw-search-query">
						<span title="搜索" id="global_search_btns" onclick="$('#global_search_form').submit();"><i class="glyphicon glyphicon-search" ></i></span>
						 <div class="dropdown-menu" id="suggest" style="display:none;width:100%">
						 </div>
					</form>
				</div>
				<!-- end 搜索框 -->
			<!-- END搜索框 -->
			<div class="navbar-form navbar-left">
				<a href="<%=path %>/discover.jsp"><button type="submit" class="btn btn-default btn-warning navbar-btn"><span class="glyphicon glyphicon-th-list">&nbsp;发现话题</span></button></a>
				<a href="<%=path %>/publish.jsp"><button type="button" class="btn btn-default navbar-btn btn-danger "><span class="glyphicon glyphicon-pencil">&nbsp;提起新话题</span></button></a>
			</div>
			<p class="navbar-text navbar-left" style="line-height:34px">在线人数为：<%=SessionCount.getActiveSessions() %><p>
			
				<!-- 登录注册按钮 -->
			 <div id="myDL" class="nav navbar-nav navbar-right">
					<!-- 登陆&注册栏 -->
			<!-- 		<span>
						<a class="register btn btn-normal btn-success" href="regist.jsp"><span class="glyphicon glyphicon-user">&nbsp;注册</span></a>
						<a class="login btn btn-normal btn-primary" href="login.jsp"><span class="glyphicon glyphicon-log-in">&nbsp;登录</span></a>
					</span>
					
			
			</div>  -->
			<!-- end 登陆&注册栏 -->
			 <form class="navbar-form navbar-right" role="search">
				<div class="btn-group">
					<c:choose>
						<c:when test="${empty sessionScope.userinfo }" >
							<a href="<%=path %>/login.jsp"><button type="button" class="btn btn-default  btn-primary">
							<span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</button></a>
							<a href="<%=path %>/regist.jsp"><button type="button" class="register btn btn-normal btn-success">
							<span class="glyphicon glyphicon-user"></span>&nbsp;注册</button></a>
						</c:when>
						<c:otherwise>
							<div class="btn-group">
								<div class="navbar-left"><img alt="" style="width: 40px;height: 35px;" src="<%=path %>/${sessionScope.userinfo.user_head }"></div>
								
								<div class="w4 navbar-left">
								    <img class="buy-icno" style="width: 100px;height: 160px" src="<%=path %>/images/bzlogo.png">
								</div>
								
								<button type="button" class="btn btn-default btn btn-primary"><span>欢迎&nbsp;${sessionScope.userinfo.user_name }</span></button>
								<button type="button" class="btn btn-default dropdown-toggle btn btn-info" 
										data-toggle="dropdown">
									<span class="caret"></span>
									<span class="sr-only">切换下拉菜单</span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="<%=path %>/left.jsp">个人中心</a></li>
									<li><a href="left.jsp#msg">我的消息<span class="badge badge-important" id="message"></span></a></li>
									<li><a href="left.jsp#fans">我的粉丝</a></li>
									<li class="divider"></li>
									<li><a href="<%=path %>/user.do?method=logout">退出登录</a></li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div> 
			</form> 
						<!-- END登录注册按钮 -->
			<script type="text/javascript" src="js/search.tip.js"></script>
			<script type="text/javascript" >
				//查询总行数
		   		$.post("message.do",{"method":"messageCount"},function(count){
		   			if(count>0){
		   				$('#message').html(count);
		   			}
		    	});
			</script>
			<!-- END登录注册按钮 -->
			</div>
		</div>
	</nav>
	<!-- END导航 -->