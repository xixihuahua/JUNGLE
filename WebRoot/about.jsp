<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>JUNGLE关于我们</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/drag.css" />  
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<style type="text/css">
		.nav{
		height:450px;
		width:110%;
		background-color:#ccc;
		background-image:url(images/about.jpg);
		}
		.dbt{
				color: white;
				font-family:"黑体";
				margin-left: -10px;
				cursor: pointer;
				margin-top: 5px;
			}
			.dntt{
				margin-top: -50px;
			}
			.center{
				margin-top:15px;
				text-align: center;
			}
			.footer{
			background-color:#ccc;
			height:300px;
			width:100%;
			}
			.st{
			position:relative;
			margin-left: 900px;
			margin-top:-250px;
			}
			.d1{
			margin-top:100px;
			}
			.wenzi{
			text-align:center;
			}
			.jieshuyu{
			text-align:right;
			}
			.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
	</style>
  </head>
  
  <body>
    <div class="nav">
    	
    	<h1 style="color:green">关于JUNGLE论坛</h1>
    	<br>
      	<p class="lead">JUNGLE论坛致力于文章上传下载，坚持分享、开放的互联网精神
      	</p><br><br><br>
      	<h3>阅读是人类进步的阶梯</h3>
      	<h3>let's go! 快来加入我们吧</h3>
      	<div class="st"><img src="images/jlogo2.png"></div>
      
    </div>
    <div class="content">
    	<h2 classs="dabiao">关于我们</h2>
    	<hr>
    	<div class="wenzi">
    	<p>JUNGLE网站的发展历程</p>
    	
   			 <p>创建于2018年。起因是国内没有较好的关于论坛的上传和交流渠道.</p>
   			 <p>因此，我们对JUNGLE文章进行了翻译整理，
    			          方便更多热爱写作的大师们来分享、交流自己在世界观、价值观、人生观方面的心得。</p>
    	</div>
    	<hr>
    	<h2 id="dabiao">展示你的作品</h2>
    	
    	<div class="wenzi">
			<p>你是论坛粉丝吗？你想做受欢迎的作家吗？你想让你的文章被所有人看见吗？那就把你的文章上传到JUNGLE吧！</p>
			<p>投稿凡是经过确认被采用的，我们会将文章发表介绍展示到“JUNGLE优站精选”列表中，并有机会在 BJUJNGLE的首页进行推荐。</p>
			
		<p>
			                      请发邮件到下面的邮箱，并在邮件标题上注明（JUNGLE论坛作品提交 -- 网站名称或网址）。
			<br>                                        
			                              应聘请联系我们Mail： <a href="mailto:admin@bootcss.com">admin@bootcss.com</a>
		</p>
		</div>
		<hr>
    	<h2 id="dabiao">加入我们</h2>
    	
    	<div class="wenzi">
			<p>JUNGLE论坛致力于优秀文章推广，坚持分享、开放的互联网精神，旨在为广大读者、作者提供交流的平台，如果你和我们有相同的目标，我们乐意一起携手前行。</p>
			<p>如果你也热爱文章写作、热爱 阅读，有一颗创业的心，欢迎和我们联系，更欢迎你加入我们的团队！</p>
			<p>Mail: <a href="mailto:admin@bootcss.com">admin@bootcss.com</a></p>
			<br>
    </div>
   <br><br>
    <div class="footer">
    	<div class="col-ma-6 col-lg-6">
    		<h4><img src="images/jlogo2.png"></h4>
    		<p>我们一直致力于为广大读者提供更多的优质文章！</p>
    	</div>
    	<!-- 下部信息 -->
	   		<div class="dntt container">
			   <div class="row">
			   	
			   	<!-- 四个图标文字信息 -->
			      
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1">
			      <label>
				      	<a href="index.jsp">
					      	<div class="d1">
					      		<img alt="回到首页" src="images/shouyemin.png" style="width: 30px;height: 35px;">
					      	</div>
					      	<div class="dbt">
					      		回到首页
					      	</div>
				      	</a>
			      </label>
			      </div> 
			      <div class="col-lg-1 col-md-1">
			      <label>
			      	<div class="d1">
			      		<img alt="二维码登录" src="images/erweima.png" style="width: 30px;height: 35px;">
			      	</div>
			      	<div class="dbt">
			      		二维码登录
			      	</div>
			      </label>
			      </div>
			      <div class="col-lg-1 col-md-1">
			      <label>
			      	<div class="d1">
			      		<img alt="关于我们" src="images/men.png" style="width: 30px;height: 35px;">
			      	</div>
			      	<div class="dbt">
			      		关于我们
			      	</div>
			      </label>
			      </div>
			      
			      <div class="col-lg-1 col-md-1">
			      <label>
			      	<div class="d1">
			      		<img alt="遇到问题" src="images/nan.png" style="width: 30px;height: 35px;">
			      	</div>
			      	<div class="dbt">
			      		遇到问题
			      	</div>
			      </label>
			      </div>
			      
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1"></div>        
			   </div>
			   	<!-- END四个图标文字信息 -->
			   	
			   	
			</div>
			<!-- 底部下面的话语 -->
			   	<div class="jieshuyu">
			   	<p>
				  	      我只希望，不管三年，五年，或是十年以后。某一天，我们相遇，还能相认。你大喊一声，我想死你了</p>
				
				  <p>
				  那一刻，我定会泪流满面。我们是朋友，永远的朋友。 
			   </p>
    			</div>

  </body>
</html>
