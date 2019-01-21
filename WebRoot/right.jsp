<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML>
<html>
  <head>
    <title>JUNGLE个人展示朋友圈</title>
    
          <link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
	
	.bk{
		background-image:url(images/show.jpeg);
		height:800px;
		margin-top:-80px;
		background-repeat:no-repeat;
		background-size:100%;
	}
	.ss{
	height:250px; 
	width:400px;
	margin-left:150px;
	font-size:14px;
	line-height:0.8;
	color:black;
	}
	.panel-info{
	margin-top:147px;
	height:700px;
	}
	.content{
	height:400px;
	margin-top:-50px;
	margin-left:20px;
	}
	.panel-title{
	text-align:center;
	font-family:"黑体";
	font-size:28px;;
	}
	.dy{
	height:600px;
	width:400px;;
	background-color:white;
	color:orange;
	}
	.life{
	font-size:20px;
	text-align:center;
	font-family:"楷体";
	color:orange;
	}
	.nr{
	color:black;
	}
	.con{
	margin-left:40px;
	}
	.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
	</style>
  </head>
  
  <body>
    <!-- 引用导航 -->
    <div>
	<jsp:include page="nav.jsp" flush="false" />
	</div>
	<!-- END引用导航 -->
	<!-- 导航背景图 -->
	
	
<div>
		<div class="bk">
		<div class="ss">
				<div class="panel-info">
	    			<div class="panel-heading">
	        			<h1 class="panel-title">个人展示朋友圈</h1>
	    			</div>
	   				 <div class="dy">
						<div class="con"><p>昵&nbsp;称：&nbsp;&nbsp;小公主</p>
						<p>性&nbsp;别：&nbsp;&nbsp;&nbsp;女</p>
						<p>年&nbsp;龄：&nbsp;&nbsp;&nbsp;18</p>
						<p>生&nbsp;日：&nbsp;&nbsp;&nbsp;2000.2.23</p>
						<p>住&nbsp;址：&nbsp;&nbsp;&nbsp;北京</p>
						<p>爱&nbsp;好：&nbsp;&nbsp;&nbsp;健身、攀岩、美食、射箭、旅游。。。</p>
						<p>个性签名：好看的皮囊大多一致，有趣的灵魂万里挑一。</p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;知音难觅，寻得一知己实属乐事。</p></div>
					<hr>
					<div class="photo">
					<h1 class="life">我的生活照</h1>
					 <div id="myCarousel" class="carousel slide">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" 
			            class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner">
			        <div class="item active">
			            <img src="images/photo4.jpg" alt="First slide" style="width: 100%;">
			            <div class="carousel-caption">照片1</div>
			        </div>
			        <div class="item">
			            <img src="images/photo5.jpg" alt="Second slide" style="width: 100%;">
			            <div class="carousel-caption">照片2</div>
			        </div>
			        <div class="item">
			            <img src="images/photo6.jpg" alt="Third slide" style="width: 100%;">
			            <div class="carousel-caption">照片3</div>
			        </div>
			        <div class="item">
			            <img src="images/photo7.jpg" alt="Third slide" style="width: 100%;">
			            <div class="carousel-caption">照片4</div>
			        </div>
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			            <span class="sr-only">Previous</span>
			        </a>
			        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			            <span class="sr-only">Next</span>
			        </a>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</div>
 <script type="text/javascript">
		$('#myCarousel').carousel({//自动轮播
		    interval: 2000
		});
	</script>
<div class="content">
<div class="nr col-xs-3">热点讨论<br>
	<p>quyan发表了帖子：         半小时前<br>
	<a>公司要求的保密规则，我该如何实施，需要加哪些设备？</a>
	<hr>
	<p>xqw12345发表了帖子： 一天前<br>
	<a>菜鸟求指教，有人做过商城的运维吗？</a>
	<hr>
	<p>kkkk11111发表了帖子： 两天前<br>
	<a>华为交换机DHCP</a>
	<hr>
	<p>jasdf发表了帖子： 两天前<br>
	<a>分享一下上周公司的vsan的故障。</a>
	</p>
</div>
<div class=" nr col-xs-3">版主推荐<br><br>
	<a>新版网工技能网谱，你都掌握了吗？</a>
	<hr>
	<a>10招彻底解决无线AP故障</a>
	<hr>
	<a>因为什么选择IT这条路，又是什么让你一直坚持下来？</a>
	<hr>
	<a>技术转管理，我们终将成为终将讨厌的人？</a>
	<hr>
	<a>我来告诉你，一个草根程序员如何进入BAT？</a>
</div>
<div class=" nr col-xs-3">视频课程<br><br>
	<a>企业级Zabbix监控系列二Zabbix3.4</a>
	<hr>
	<a>Ansible+Jenkins自动化可视化运维</a>
	<hr>
	<a>2018软考信息系统项目管理师之考前必看</a>
	<hr>
	<a>测试工程师课程-web基础</a>
	<hr>
	<a>图解python视频教程（基础篇）</a>
</div>
<div class="nr col-xs-3" >IT大本营<br><br>
	<a>庆祝国庆，致敬改革开放40周年。</a>
	<hr>
	<a>小任老师访谈录-保持销售冠军的秘密</a>
	<hr>
	<a>项目管理知识体系（系统集成，高项）</a>
	<hr>
	<a>php进修资料：菜鸟变凤凰</a>
	<hr>
	<a>JNCIE SP 备战心得（大侠唐在飞）</a>
</div>
</div>
<!-- 引用底部 -->
	<div>
		<jsp:include page="bottom.jsp" flush="false" />
	</div>
	<!-- END引用底部 -->
  </body>
</html>
