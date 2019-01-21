<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@	page import="java.net.URLDecoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html> 
<head>
	<title>JUNGLE论坛</title>
		<jsp:include page="nav_head.jsp"></jsp:include>
	<jsp:include page="bottom_head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
		href="bootstrap/css/bootstrap-theme.min.css">
		<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
		<link rel="stylesheet" type="text/css" href="css/pagination.css">
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<style type="text/css">
		#middle {
			margin-top: 65px;
			
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
			height: 1050px;
		}
		#mydiv {
			margin-top: 0px;
			height: 600px;
			margin-left: 200px;
		}
		
		#content {
			margin-top: 67px; 
			
		}
		.ss{
			
		}
		h3{
			font-size: 17px;
		}
		b{	
			color:red;
			font-size:17px;
		}
		i{
			color:#4169E1; 
			font-size:14px;
		}
		.col-lg-2 {
		    width: 16.66666667%;
		    margin-left: 30px;
		}
		#aa{
			margin-right: -50px;
		}
		#mian{
			position:absolute;
			width:400px;
			margin-left: -430px;
			margin-top: -235px;
			display: none;	
			
			
		}
		#aa{
			display: none;
		} 
		.panel-body{
			height: 225px;
		}
		#xbody{
			overflow: auto; 
			
		}
		#fud div{
			float: left;
		}
		#nbbj{
			width:340px;
			word-break: break-all;
			word-wrap:break-word;
		 	text-align:right;
		}
		#OpeanSpeack{
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
			border-radius: 5%;
			color:white;
			cursor: pointer;
		}
		#xbody{ 
			background-image: url("images/webs3.jpg");
			
		}
		.web_z{
			
			border-radius: 5%;
			color:white;
		}
		.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
		.indexdiv:HOVER{
			transform: scale(1.03);
			transition:0.5s;  
		}
		ul :HOVER {
			transform: scale(1.05);
			transition:0.5s;  
		}
		h2{
			font-size: 14px;
		}
	</style>
</head>

<body>
	<jsp:include page="nav.jsp" flush="false" />
	<!-- 中间布局 -->
	<div class="fixclear"></div>
	<div id="middle">
		<div class="" id="content">
		<!-- 左边内容栏 -->
		<div class="col-lg-2 col-xs-2 col-md-2">
			<!-- 热门话题 -->
			<div class="aw-mod">
				<div class="mod-head">
					<h2>热门话题</h2>
				</div>
				<hr>
				<div class="mod-body font-size-12">
					<ul id="remen">
						
					</ul>
				</div>
			</div>
			<!-- end 热门话题 -->
		</div>
		<!-- 右边标签页 -->
		<div class="col-lg-7 col-xs-7 col-md-7 ss">
			<!-- 右边标签页 -->
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab">最新 </a></li>
				<li ><a href="#JAVA" data-toggle="tab" onclick="java()">JAVA </a></li>
				<li ><a href="#HTML" data-toggle="tab">HTML </a></li>
				<li ><a href="#CSS" data-toggle="tab">CSS </a></li>
				<li ><a href="#JAVASCRIPT" data-toggle="tab">JAVASCRIPT </a></li>
				<li ><a href="#JQUERY" data-toggle="tab">JQUERY </a></li>	
				<li ><a href="#WEB" data-toggle="tab">WEB </a></li>
				<li ><a href="#search" data-toggle="tab">搜索结果</a></li>
				
			</ul>
			<!-- 标签页内容模块 -->
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
					
				</div>
				
				<div class="tab-pane fade in" id="JAVA">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="java_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="java_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
					
				</div>
				
				<div class="tab-pane fade in" id="HTML">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="html_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="html_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
					
				</div>
				
				<div class="tab-pane fade in" id="CSS">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="css_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="css_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
				</div>
				
				<div class="tab-pane fade in" id="JAVASCRIPT">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="javascript_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="javascript_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
				</div>
				
				<div class="tab-pane fade in" id="JQUERY">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="jquery_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="jquery_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
				</div>
				
				<div class="tab-pane fade in" id="WEB">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="web_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="web_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
				</div>
				
				<div class="tab-pane fade in active" id="search">
					<!-- 内容，从数据库获取 -->
						<!-- 分页文章开始 -->
						<!-- 用户显示文字列表 -->
					  	<div id="search_main"></div>
					  	<!-- 用来显示上一页和下一页 -->
					  	<div id="search_Pagination"></div>
					<!-- end 文章 -->
					<!--end  内容结束 -->
					
				</div>
				
			</div>
		</div>
		<!-- END中间标签页 -->
		
		<!-- 中间右边页 -->
		<div class="col-lg-2 col-xs-2 col-md-2">
			<div id="you">
				<div id="aa" style="width:20px;height:400px;" >
					<div id="OpeanSpeack">
						快乐源自用心
					</div>
					<!-- 聊天室总框架 -->
					 <div id="mian">
						<div class="web_z panel panel-success">
							<!-- 聊天框头部 -->
						    <div class="panel-heading">
						    	<div class="col-lg-9 col-xs-9 col-md-9">
							        <h3 class="panel-title">
							            JUNGLE聊天室
							        </h3>
						        </div>
						        <div class="btn-group col-lg-3 col-xs-3 col-md-3">
								    <button id="open_web_btn" type="button" onclick="openWebSocket();" class="btn btn-success">开启连接</button>
								</div>
								<div class="clearfix"></div>
						    </div>
						    <!-- END聊天框头部 -->
							<!-- 聊天框信息显示框 -->
							<div id="xbody" class="panel-body">
								<ul id="myul">
									<li>
										
									</li>
								</ul>
						 	</div>
						 	<!-- END聊天框信息显示框 -->
						 	<!-- 信息输入和发送按钮框 -->
						 	<div class="clearfix"></div>
						 	<div class="input-group">
			                    <input id="msg" type="text" class="form-control">
			                    <span class="input-group-btn">
			                        <button id="btn" class="btn btn-default" type="button" onclick="add()">发送</button>
			                    </span>
			                </div>
			                <!-- END信息输入和发送按钮框 -->
						</div>
					</div>
				</div>			
			</div>	
		</div>
		<!-- END中间右边页 -->
		<!-- start附加内容 -->
			<!-- 自动登录 -->
			<form id="autoLoginFrm" action="user.do" method="post" style="display:none;">
				<input name="method" type="hidden" value="queryUserByLogin">
				<input id="username" type="hidden" name="username">
				<input id="password" type="hidden" name="password">
				<input id="autoLogin" type="hidden" name="autoLogin">
				<input id="savePassword" type="hidden" name="savePassword">
			</form>
		<!-- end附加内容 -->
	</div>
	</div>
	<div class="clearfix"></div>
	<!-- END中间布局 -->
	<!-- 分页查询js -->
	
	
	
	<script type="text/javascript" src="js/pagination.index.fenye.js" ></script>
	<script type="text/javascript" src="js/pagination.index.html.js" ></script>
	<script type="text/javascript" src="js/pagination.index.css.js" ></script>
	<script type="text/javascript" src="js/pagination.index.javascript.js" ></script>
	<script type="text/javascript" src="js/pagination.index.jquery.js" ></script>
	<script type="text/javascript" src="js/pagination.index.web.js" ></script>
	<script type="text/javascript" src="js/pagination.index.remen.js" ></script>
	<script type="text/javascript" src="js/search.js"></script>
	<script type="text/javascript" src="js/pagination.index.js" ></script>
	
	<script type="text/javascript">
		var ws = null;
    	
    	
    	if('${userinfo }' != ""){
    		$("#aa").css("display","block");
    	}else{
    		$("#aa").css("display","none");
    	}
		
    	function opensocket(){
    		if(WebSocket){
    		//建立连接
    		ws = new WebSocket("ws://192.168.90.105:8888/JUNGLE/JUNGLE");
	    	}else{
	    		alert("这个浏览器好像并不想通话");
	    	}
	    	
	    	//向服务器发送一条问候语
	    	ws.onopen = function(){
	    		//向服务器发送消息
	    		//ws.send("你好！！我是"+${userinfo.user_name });
	    	}
	    	
	    	//接收到服务器返回的问候语
	    	ws.onmessage = function(event){
	    		//调用显示的方法写在页面中
	    		showmsg(event.data);
	    	}
	    	
	    	//显示的方法
	    	function showmsg(msg){
	    		var html = $("#myul").html();
	    		var i=msg.indexOf("<li>");
	    		var msg2 = msg.substring(i);
	    		
	    		var name = msg.substring(0,i);
	    		
	    		if(name == '${userinfo.user_name }'){
	    			var i2=msg2.indexOf("src=");
	    			var i3=msg2.indexOf("style=");
	 				
	 				var head = msg2.substring(i2+4,i3);
	 				
	 				var i4=msg2.indexOf("height:25px;'>");
	    			var i5=msg2.indexOf("</li>");
	 				
	 				var newmsg = msg2.substring(i4+14,i5);
	 				
	 				var msg10 = "<div id='fud'>"
											+"<div id='nbbj'>&nbsp;&nbsp;"+newmsg+"&nbsp;&nbsp;</div>"
											+"<div><img src="+head+" style='width:25px;height:25px;'></div>"
										+"</div>";
	    			html = html + msg10;
	    			$("#myul").html(html);
	    		}else{
	    			html = html + msg2;
	    			$("#myul").html(html);
	    		}
	    	
	    	}
	    	//<li><img src=images/head3.png style='width:25px;height:25px;'>&nbsp;&nbsp;:&nbsp;&nbsp;比好</li>
	    	//按钮的点击事件
	    	$("#btn").click(function(){
	    		//获取用户输入的信息
	    		var msg = $("#msg").val();
	    		//把用户输入的文字信息发送给服务器
	    		ws.send('${userinfo.user_head }'+"%"+'${userinfo.user_name}'+"*"+msg);
	    		//清空输入框
	    		$("#msg").val("");
	    	});
    	}
		
		//webSocket开关
		function openWebSocket(){
    		if($("#open_web_btn").html() == "开启连接"){
    			 open();
    		}else{
    			close();
    		}
    	}
		function open(){
			opensocket();
   			$("#open_web_btn").html("关闭连接");
   			document.getElementById("open_web_btn").className="btn btn-danger";
		}
		
		function close(){
			ws.close();
   			$("#open_web_btn").html("开启连接");
   			document.getElementById("open_web_btn").className="btn btn-success"; 
		}
		
		function scroll(p){
	     var d = document,w = window,o = d.getElementById(p.id),ie6 = /msie 6/i.test(navigator.userAgent);
	     if(o){
	      o.style.cssText +=";position:"+(p.f&&!ie6?'fixed':'absolute')+";"+(p.r?'left':"right")+":0;"+(p.t!=undefined?'top:'+p.t+'px':'bottom:0');
	      if(!p.f||ie6){
	       -function(){
	           var t = 500,st = d.documentElement.scrollTop||d.body.scrollTop,c;
	                 c = st  - o.offsetTop + (p.t!=undefined?p.t:(w.innerHeight||d.documentElement.clientHeight)-o.offsetHeight);
	              c!=0&&(o.style.top = o.offsetTop + Math.ceil(Math.abs(c)/10)*(c<0?-1:1) + 'px',t=10);
	              setTimeout(arguments.callee,t)
	          }() 
	      }
	     }  
	    }
	    scroll({
	     id:'aa'
	    
	    })
	    
	    $("#OpeanSpeack").click(function(){
	    	if($("#mian").css("display")=="none"){
	    		$("#mian").css("display","block");
	    	}else{
	    		$("#mian").css("display","none");
	    	}
	    });
	    
	    
	    function add()
		{
		var div = document.getElementById('xbody');
		div.scrollTop = div.scrollHeight;
		}
		
		
		
		//自动登陆
	    function autoLogin(){
	    	if('${userinfo}' == ""){//已经登陆则不需要自动登陆
	       		var autoLogin = getCookie("autoLogin");
	       		if(autoLogin!=null && autoLogin == "true"){//用户设置了自动登录
	       			//设置登录所需值
	       			$("#autoLogin")[0].value = getCookie("autoLogin");
	       			$("#savePassword")[0].value = getCookie("savePassword");
	       			/* 数据处理 */
	    			<% 
	    				Cookie[] cookies = request.getCookies();
	    				String username = "";
	    				String password = "";
	    				for(int i = 0; i < cookies.length; i++){
	    					if(cookies[i].getName().equals("username")){
	    						username = cookies[i].getValue();
	    					}else if(cookies[i].getName().equals("password")){
	    						password = cookies[i].getValue();
	    					}
	    				}
	    				//
	    				username = URLDecoder.decode(username);
	    				password = URLDecoder.decode(password);
	    			%>
	    			$("#username")[0].value = '<%=username%>';
	       			$("#password")[0].value = '<%=password%>';
	       			//提交表单
	       			$("#autoLoginFrm").submit();
		    	}
       		}
        }
	    //获取Cookie值
	    function getCookie(cookieName) {
		    var strCookie = document.cookie;
		    var arrCookie = strCookie.split("; ");
		    for(var i = 0; i < arrCookie.length; i++){
		        var arr = arrCookie[i].split("=");
		        if(cookieName == arr[0]){
		            return arr[1];
		        }
		    }
		    return "";
	   	}
	   	$(document).ready(function(){
	    	autoLogin();
	    });
	</script>
	<!-- end 分页查询 js -->
	<jsp:include page="bottom.jsp" flush="false" />
</body>
</html>
