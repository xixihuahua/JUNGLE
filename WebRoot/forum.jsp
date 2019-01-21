<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    
    <title>板块详情</title>
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
			#middle {
				margin-top: 65px;
				background: #DCDCDC;
			}
		</style>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>
  </head>
  
  <body>
  	<jsp:include page="nav.jsp" flush="false" />
  	<!-- 中间布局 -->
	<div class="fixclear"></div>
	<input type="hidden" id = 'topic_val' value='<%=request.getParameter("topic") %>' />
	<div class="aw-container-wrap" id="middle" >
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
				<div class="col-sm-12 col-md-9 aw-main-content">
					<div class="aw-mod aw-topic-detail-title">
						<div class="mod-body">
							<img src="http://wenda.bootcss.com/static/common/topic-mid-img.png" alt="bootstrap">
							<h2 class="pull-left" id="title" ><%=request.getParameter("topic") %> </h2>
							<div class="aw-topic-operate text-color-999">
															</div>
						</div>
					</div>

					<div class="aw-mod aw-topic-list-mod">
						<div class="mod-head">
							<div id="myTab" class="tabbable">
								<!-- tab 切换 -->
								<ul id="myTab" class="nav nav-tabs aw-nav-tabs hidden-xs">
									<li class="active"><a href="#all" data-toggle="tab">全部内容</a></li>
									<li><a href="#about" id="i_about" data-toggle="tab">关于话题</a></li>
									</ul>
									
								<!-- end tab 切换 -->
							</div>
						</div>
						
						<div class="mod-body">
							<!-- tab 切换内容 -->
							<div class="tab-content">
								<div class="tab-pane fade in" id="about">
									<!-- 内容，从数据库获取 -->
										<!-- 话题详情开始 -->
										<p id="detail"></p>
										<!-- end 话题详情 -->
									<!--end  内容结束 -->
									
								</div>
								<div class="tab-pane fade in active" id="all">
									<!-- 推荐问题 -->
									<!-- end 推荐问题 -->
									<div class="aw-mod">
										<div class="mod-body">
											<!-- 内容，从数据库获取 -->
									<!-- 分页文章开始 -->
									<!-- 用户显示文字列表 -->
							  		<div id="main"><p style='padding: 15px 0' align='center'>没有内容</p></div>
							  		<!-- 用来显示上一页和下一页 -->
									<!-- end 文章 -->
									<!--end  内容结束 -->
										</div>
										<div class="mod-footer">
												<div id="Pagination"></div>
										</div>
									</div>
								</div>

								<div class="tab-pane" id="articles">
									<!-- 动态首页&话题精华模块 -->
									<div class="aw-mod">
										<div class="mod-body">
											<div class="aw-common-list" id="c_articles_list">
																							</div>
										</div>
										<div class="mod-footer">
											<a class="aw-load-more-content" id="bp_articles_more" auto-load="false" data-page="2">
												<span>更多...</span>
											</a>
										</div>
									</div>
									<!-- end 动态首页&话题精华模块 -->
								</div>

								<div class="tab-pane" id="favorite">
									<!-- 动态首页&话题精华模块 -->
									<div class="aw-mod aw-feed-list" id="c_favorite_list"><p style="padding: 15px 0" align="center">没有内容</p></div>
									<!-- end 动态首页&话题精华模块 -->

									<!-- 加载更多内容 -->
									<a class="aw-load-more-content disabled" id="bp_favorite_more" data-page="0">
										<span>没有更多了</span>
									</a>
									<!-- end 加载更多内容 -->
								</div>

								<div class="tab-pane" id="about">
									<div class="aw-topic-detail-about text-color-666 markitup-box">
																			</div>
								</div>
							</div>
							<!-- end tab 切换内容 -->
						</div>
					</div>
				</div>

				<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs">
					<!-- 话题描述 -->
					<div class="aw-mod aw-text-align-justify">
						<div class="mod-head">
							<h3>话题描述</h3>
						</div>
						<div class="mod-body">
													</div>
					</div>
					<!-- end 话题描述 -->

					<div class="aw-mod topic-about">
						<div class="mod-head">
							<h3>相关话题</h3>
						</div>
						<div class="mod-body" data-type="topic">
							<div class="aw-topic-bar" data-type="topic" data-id="5">
								<div class="tag-bar clearfix">
																</div>
							</div>
						</div>
					</div>
					
					<!-- 最佳回复者 -->
										<div class="aw-mod">
						<div class="mod-head">
							<h3>最热文章</h3>
						</div>

						<div class="mod-body" id="remen">
											
						</div>
					</div>
										<!-- end 最佳回复者 -->

					<!-- xx人关注该话题 -->
					<!-- 
						<div class="aw-mod topic-status">
						<div class="mod-head">
							<h3><span></span> 人关注该话题</h3>
							</div>
							<div class="mod-body">
								<div id="focus_users" class="aw-border-radius-5"><a href="left.jsp"><img src="images/no_head.png" alt="加载中"></a>  </div>
							</div>
						</div>
					 -->
					<!-- end xx人关注该话题 -->

					<!-- 话题修改记录 -->
										<!-- end 话题修改记录 -->

									</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/pagination.forum.js"></script>
	<script type="text/javascript" src="js/pagination.index.remen.js"></script>
	<script type="text/javascript" src="js/topic.detail.js"></script>
	<script type="text/javascript">
		var num= toNum($('#topic_val'));
		$('#detail').html(topics[num]);
	</script>
</div>
	<jsp:include page="bottom.jsp" flush="false" />
  </body>
</html>
