<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE HTML>
<html>
<head>

<title>发现话题</title>

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
#middle {
	margin-top: 65px; height : 680px;
	background: #DCDCDC;
	background: -moz-linear-gradient(top, #696969 0%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #A9A9A9),
		color-stop(100%, #ffffff));
	background: -webkit-linear-gradient(top, #DCDCDC 0%, #ffffff 100%);
	background: -o-linear-gradient(top, #696969 0%, #ffffff 100%);
	background: -ms-linear-gradient(top, #A9A9A9 0%, #ffffff 100%);
	background: linear-gradient(to bottom, #DCDCDC 0%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#A9A9A9',
		endColorstr='#ffffff', GradientType=0);
	height: 680px;
}

.container {
	padding-top: 50px;
}
.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
}
</style>

</head>

<body>
	<!-- 引用顶部 -->
	<jsp:include page="nav.jsp" flush="false" />
	<!-- END引用顶部 -->
	
	<!-- 中间布局 -->
	<div id="middle">
		<div class="container">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<img style="width: 30px;height: 25px;" src="images/huati.png">&nbsp;&nbsp;热门话题
						</h2>
					</div>
					<div class="panel-body">
						<div class="aw-mod aw-topic-list">
							<div class="mod-body clearfix">
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-bootstrap" data-id="5">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="5"> <a class="text"
											href="article-topic-bootstrap">Bootstrap</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Bootstrap是美国Twitter公司的设计师...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-servlet" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-servlet">Servlet</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Servlet 教程 Servlet 为创建基于...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-jdbc" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-jdbc">JDBC</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>JDBC是一种用于执行SQL语句的Java API...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-javascript" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-javascript">Javascript</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>JavaScript一种直译式脚本语言，是一种动态...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-json" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-json">JSON</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>JSON是一种轻量级的数据交换格式。它基于...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-xml" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-xml">XML</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>XML 指可扩展标记语言,它是一种标记语言...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-sql" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-sql">SQL</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>结构化查询语言，简称SQL，是一种特殊目的...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-ssm" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-ssm">SSM</a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>SSM框架集由Spring、MyBatis两个开源框架...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-hibernate" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-hibernate">Hibernate  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Hibernate是一个开放源代码的对象关系映射框架...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-mysql" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-mysql">MySql  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>MySQL 是最流行的关系型数据库管理系统之一...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div> 
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-oracle" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-oracle">Oracle  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Oracle是甲骨文公司的一款关系数据库管理系统...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-sqlserver" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-sqlserver">Sql&nbsp;Server  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>SQL Server是Microsoft 公司推出的关系型数据库管理系统...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-spring" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-spring">Spring  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Spring是一个开放源代码的设计层面框架...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-html" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-html">HTML  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>HTML,超级文本标记语言...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-css" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-css">CSS  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>层叠样式表是一种用来表现HTML...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-jquery" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-jquery">JQuery  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>jQuery是一个快速、简洁的JavaScript框架...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-ajax" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-ajax">AJAX  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Ajax,是指一种创建交互式网页应用的网页开发技术...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-structs" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-structs">Struts  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Struts是Apache软件基金会赞助的一个开源项目...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-java" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-java">JAVA  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>Java是一门面向对象编程语言...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
								<div class="aw-item">
									<!-- 话题图片 -->
									<a class="img aw-border-radius-5"
										href="article-topic-mvc" data-id="933">
										<img
										src="images/topic-mid-img.png"
										alt="" />
									</a>
									<!-- end 话题图片 -->
									<p class="clearfix">
										<!-- 话题内容 -->
										<span class="topic-tag" data-id="933"> <a class="text"
											href="article-topic-mvc">MVC  </a>
										</span>
										<!-- end 话题内容 -->
									</p>
									<p class="text-color-999">
										<span>MVC,是一种软件设计典范...</span>
									</p>
									<p class="text-color-999">共xx篇文章，xx个讨论</p>
								</div>
							</div>
							<div class="mod-footer clearfix"></div>
						</div>
						<!-- end 我关注的话题 -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END中间布局 -->
	<div class="clearfix"></div>
	<!-- 引用底部 -->
	<jsp:include page="bottom.jsp" flush="false" />
	<!-- END引用底部 -->
</body>
</html>
