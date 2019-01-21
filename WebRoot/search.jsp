<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>搜索结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<jsp:include page="nav_head.jsp"></jsp:include>
	<jsp:include page="bottom_head.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
		<link rel="stylesheet" type="text/css" href="css/pagination.css">
		<style type="text/css">
			#detail{
				margin:10px;
			}
			.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
		</style>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>

  </head>
  
  <body>
    <jsp:include page="nav.jsp" flush="false" />
    <input type="hidden" id='q' value='<%=request.getParameter("q") %>' >
    <div class="clearfix"></div>
    <div class="aw-container-wrap">
	    <div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="aw-global-tips">
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="aw-content-wrap clearfix">
					<div class="col-sm-12 aw-main-content">
						<div class="aw-mod aw-mod-search-result">
							<div class="mod-head">
								<div class="tabbable">
									<ul class="nav nav-tabs aw-nav-tabs active" id="list_nav">
										<li><a href="#users" data-toggle="tab">用户</a></li>
										<!-- 
											<li><a href="#topics" data-toggle="tab">话题</a></li>
											<li><a href="#questions" data-toggle="tab">问题</a></li>
											<li class="active"><a href="#all" data-toggle="tab">全部</a></li>
										 -->
										<li  class="active"><a href="#articles" data-toggle="tab">文章</a></li>
										
										<h2 class="hidden-xs">
											<p>搜索 - <%=request.getParameter("q") %> </span>
											</p>
										</h2>
									</ul>
								</div>
							</div>
							<div class="mod-body">
								<div class="tab-content">
									<div class="tab-pane" id="all">
										
										<div id="main"></div>
									  	<!-- 用来显示上一页和下一页 -->
									  	<div id="Pagination"></div>
										<!-- end 加载更多内容 -->
									</div>
									<div class="tab-pane active" id="articles">
										
										<div id="article_main"></div>
									  	<!-- 用来显示上一页和下一页 -->
									  	<div id="article_Pagination"></div>
										<!-- end 加载更多内容 -->
									</div>
									<div class="tab-pane" id="users">
										
										<div id="user_main"></div>
									  	<!-- 用来显示上一页和下一页 -->
									  	<div id="user_Pagination"></div>
										<!-- end 加载更多内容 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/pagination.search.js"></script>
    <div class="clearfix"></div> 
    <jsp:include page="bottom.jsp" flush="false" />
  </body>
</html>
