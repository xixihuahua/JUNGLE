<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML >
<html>
<head>

<title>发表文章页面</title>
<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
	<jsp:include page="nav_head.jsp"></jsp:include>
	<jsp:include page="bottom_head.jsp"></jsp:include>
<!-- 百度富文本框打包 -->
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	
<style type="text/css">
#frm {

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
	text-align: center;
	/* width: 80%; */
	height: 100%;
}

.con {
	margin-top: 80px;
	background-color:#eee;
}
 
/* .panel{
background: #00ff00;
			background: -moz-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #228B22),
				color-stop(100%, #ffffff));
			background: -webkit-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -o-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -ms-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: linear-gradient(to bottom, #00FF00 0%, #228B22 100%);
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00FF00',
				endColorstr='#228B22', GradientType=0);

} */
.panel:FIRST-CHILD{
	background-image: url("images/loginbj.jpg");
}
.panel-warning>.panel-body{
	background-image: url("images/loginbj.jpg");
}
.panel-success{

	height:770px;

}
.panel-body eq(1){
	height: 840px; 
}

/* 文件上传长度调整 */
#uploadFile{
	width: 100px;
	text-align:center;
}
.clear{clear:both;}
.hr{
	margin-top: 0px;
	margin-bottom: 0px;
}
#right_box{
	position:absolute;
	
	display: inline-block;
}
#tags{
	height: 770px;
	width:315px;
	margin-left:-18px;
}
#tags .panel-title{
	margin-left: 1em;
	height: 100%;
}
.text{
	margin:0 auto;
	vertical-align: middle;
	text-align:center;
}
textarea{
	
	height:230px;
}
p{
text-align:center;
}
	.a1{
	text-align:center;
	}
	.btn{
	width:150px;
	height:35px;
	
	}
	#mybtn{
	margin-top:-10px;
	width: 330px;
	height:40px;
	margin-left:-50px;
	}
	#btn3{
	width:300px;
	height:40px;
	margin-top:-10px;
	margin-right:-50px;
	}
	.text{
	border:solid 1px;
	height:300px;
	background-color:#d0e9c6;
	}
	.tx{
	border:solid 1px;
	height:55px;
	width:55px;
	
	}
	.biaoqian{
	border:solid 1px;
	height:300px;
	width:290px;
	
	text-align:left;
	
	background: #00FF00;
			background: -moz-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #228B22),
				color-stop(100%, #ffffff));
			background: -webkit-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -o-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: -ms-linear-gradient(top, #00FF00 0%, #228B22 100%);
			background: linear-gradient(to bottom, #00FF00 0%, #228B22 100%);
			filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00FF00',
				endColorstr='#228B22', GradientType=0);
				color:white;
	
	}
	.badge{
	position:relative;
	margin-top:-15px;
	}
	.panel-title{
	text-align:center;
	}
	.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
	#tags{
		background-image: url("images/bg26.jpg");
		background-repeat: 100%;
	}
</style>
</head>

<body>
	<!-- 引用顶部导航 -->
	<jsp:include page="nav.jsp" flush="false" />
	<!-- END引用顶部导航 -->
	<!-- con为中间内容部分 -->
	<div class="con">
		<div class="col-lg-2 col-md-4 col-8">
		<!-- 中间的第一部分左边面板panel -->
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">个人信息</h3>
				</div>
				<div class="panel-body">
						<p>昵称&nbsp;:&nbsp;${userinfo.user_name }</p><hr>
						<p>金币&nbsp;:&nbsp;${userinfo.user_coin }</p><hr>
						<p>我的积分&nbsp;:&nbsp;${userinfo.user_score }</p><hr>
						<p>粉丝数&nbsp;:&nbsp;${userinfo.fans_number }</p><hr>
						<p>关注数&nbsp;:&nbsp;${userinfo.follow_number }</p><hr>
						<p>我的文章<span class="badge badge-important">99+</span></p><hr>
						<div class="a1" ><a href="#">帮助中心</a><hr></div>
				</div>
			</div>
		</div>
		<!--中间的第二部分中间富文本框 -->
	<form id="frm" name="frm" action="article.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="method" value="insertArticle"/>
		<input type="hidden" name="user_id" id="user_id">
			<div class="col-lg-7 col-md-4">
				<div class="input-group">
				<span class="input-group-addon">@</span> 
				<input type="text"name="article_title" class="form-control" placeholder="请输入文章的标题">
				</div>
				<br>
				<script id="myeditor" type="text/plain"
					style="height: 500px;"></script>
				<input type="hidden" id="article_content" name="article_content">
				<br>
				<input type="button" id="mybtn" class="btn btn-success btn-lg" value="上传本篇文章">
				<a href="index.jsp"><input type="button" id="btn3"  class="btn btn-info btn-lg" value="返回首页"></a>
			</div>
	</form>
		<!-- 中间的第三部分右侧面板 -->
		<div id="right_box" class="col-lg-2 col-md-4 col-8">
			<!-- 标签面板  -->
			<div id="tags" class="panel panel-success">
				<div class="panel-header">
					<h3 class="panel-title">标签栏</h3>
				</div>
				<hr class="hr">
				<div class="panel-body">
					<div class="shuben"><img src="images/logo.jpg" style="width:100%;"></div>
					<hr>
					<div >
					
					<!-- 文件上传 -->
					<div id="UploadFile">
						<input  id="article_file" type="file" name="article_file" form="frm" multiple="multiple">
						<div>
							<input id="article_movie" type="file" name="article_video" style="display:none;" form="frm" accept="video/*">
							<input type="button" class="btn btn-success"  value="上传视频" onclick="document.frm.article_movie.click()" style="color: #000;">
						</div>
						设置下载金币(0~50);
						<input id="file_coin" type="number" name="file_coin" form="frm" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');if(this.value>50)this.value=50;if(this.value<0)this.value=0;}).call(this)" 
							onblur="this.v();" placeholder="金币" min="0" value="0" max="50" maxlength="2">
					</div>
					<p style="margin-top: 100px">选择一种技术</p>
						<label>
							<input type="radio" name="article_tag" value="bootstrap" form="frm" checked="checked">
							bootstrap
						</label>
						
						<label>
							<input type="radio" name="article_tag" value="servlet" form="frm">
						servlet
						</label>
						<label>
							<input type="radio" name="article_tag" value="jdbc" form="frm">
							jdbc
						</label>
						
						<label>
							<input type="radio" name="article_tag" value="javascript" form="frm">
							javascript
						</label>
						<br><br>
						
						<label>
							<input type="radio" name="article_tag" value="json" form="frm">
							json
						</label>
						<label>
							<input type="radio" name="article_tag" value="xml" form="frm">
							xml
						</label>
						<label>
							<input type="radio" name="article_tag" value="sql" form="frm">
							sql
						</label>
						<label>
							<input type="radio" name="article_tag" value="hibernate" form="frm">
							hibernate
						</label>
						<br><br>
							
						<label>
							<input type="radio" name="article_tag" value="MVC" form="frm">
							mysql
						</label>
						<label>
							<input type="radio" name="article_tag" value="servlet" form="frm">
						oracle
						</label>
						<label>
							<input type="radio" name="article_tag" value="jdbc" form="frm">
							sqlServer
						</label>
						<label>
							<input type="radio" name="article_tag" value="spring" form="frm">
							spring
						</label>
						<br><br>
						
						<label>
							<input type="radio" name="article_tag" value="html" form="frm">
							html
						</label>
						<label>
							<input type="radio" name="article_tag" value="css" form="frm">
							css
						</label>
						<label>
							<input type="radio" name="article_tag" value="jquery" form="frm">
							jquery
						</label>
						<label>
							<input type="radio" name="article_tag" value="ajax" form="frm">
							ajax
						</label>
					
						
						<label>
							<input type="radio" name="article_tag" value="java" form="frm">
							java
						</label>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	
	<!-- 引用底部 -->
	<jsp:include page="bottom.jsp" flush="false" />
	<!-- END引用底部 -->
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
    	//加载编辑器
	    var ue = UE.getEditor('myeditor');
		//表单提交检测
		document.getElementById("mybtn").onclick = function(){
	    	 document.getElementById("article_content").value = ue.getContent();
	    	 var user_id = '${userinfo.user_id}';
	    	 var file_coin = $("#file_coin").val();
	    	 if(user_id != ""){
	    	 	document.getElementById("user_id").value = user_id;
	    	 }else{
	    	 	alert("请先登录！"+"-----"+user_id);
	    	 }
	    	 if($("#article_title").val() == ""){
	    		alert("标题不能为空");
	    		return false;
	    	 }
	    	 if($("#article_content").val() == ""){
	    		alert("内容不能为空");
	    		return false;
	    	 }
	    	 frm.submit();
	    };
	    //错误检查
	    function checkError(){
	    	var error = '${error}';
	    	if(error != ""){
	    		alert(error);
	    	}
	    }
	    $(document).ready(function(){
	    	checkError();
	    });
    </script>
</body>
</html>
