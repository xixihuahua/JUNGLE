<%@ page language="java" import="java.util.*,com.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
    <head>
    	<title>JUNGLE登录</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/drag.css" />  
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        
        
        <style>
        	body{
        		background-image: url(images/logobjt1.jpg);
        		background-repeat: no-repeat;
        		background-size: 100%;
        	}
        	a{
        		list-style: none;
        	}
        	#frm{
        		
        	}
        	.login{
        		width:480px;
        		height:400px;
        		margin-top:80px;
				margin-left: -40px;
        		border-radius: 10px;
        	}
        	.glyphicon:FIRST-CHILD{
        		
        		background-color: ;
        		color: white;
        		text-shadow: blue 0px 0px 10px;
        	}
        	.fonttext{
        		color: white;
        	}
        	.username_msg{
        		display: none;
        		position: absolute;
        		top: 15px;
        	}
        	.password_msg{
        		display: none;
        		position: absolute;
        		top: 15px;
        	}
        	.danger{
        		position:relative;
        		top:-19px;
        		height:20px;
        		font-size: large;
        	}
        	.danger>label{
        		font-size:12px;	
        		margin-top:20px;
        		margin-left:20px;
        		display: none;
        	}
        	.glyphicon-ok{
        		margin: auto 10px;
        		color: #4CAE4C;
        		background-color: #F9F9F9;
        	}
        	.input-group{
        		
        		margin: 0px auto;
        		/* margin: 45px auto; */
        	}
        	.glyphicon-remove{
        		margin: auto 10px;
        		color: #D9534F;
        		background-color: #F9F9F9;
        	}
        	.check{
        		margin-top:5px;
        		cursor: pointer;
        		color: #696969;
        		font-family:"黑体";
        	}
        	#submit{
        		font-family:"宋体";
        		font-size: 20px;
        	}
        	#mylogo{
        		width:320px;
        		margin: 100px 50px;
        	}
        	#mylogowen{
        		font-family:"楷体";
        		padding-top:20px;
        		color: white;
        		font-size: 40px;
        	}
        	#mylogowen2{
        		color: white;
        		font-size: 20px;
        	}
        	
			.dbt{
				color: white;
				font-family:"黑体";
				margin-left: -10px;
				cursor: pointer;
			}
			.dntt{
				margin-top: -50px;
			}
			.center{
				margin-top:15px;
				text-align: center;
			}
			label{
				cursor: pointer;
			}
			.btn:HOVER {
				transform: scale(1.2);
				transition:0.7s;
			}
			.login:HOVER {
			transform: scale(1.04);
			border-radius:5%;
			 
			transition:0.7s;
			}
        </style>
       	
    </head>
    <body>
    	<!-- 上部页面 -->
    	<div class="container">
    		<div class="col-md-4">
    			<div id="mylogo">
	    			<img style="width: 100px;height: 100px;" alt="" src="images/jlogo2.png">
	    			<i id="mylogowen">JUNGLE论坛</i>
	    			<div><i id="mylogowen2">热爱生活&nbsp;&nbsp;&nbsp; 热爱编程&nbsp;&nbsp;&nbsp;热爱JUNGLE</i></div>
	    		</div>
	    		
    		</div>
    		
    		<!-- 登录栏 -->
    		<div class="col-md-8">
    				<form id="frm" name="frm" class="col-xs-4 col-xs-offset-4" action="user.do" method="post" onsubmit="return checkForm();">
    		<input name="method" type="hidden" value="queryUserByLogin">
    		<div class="login panel-default " >
    			<div class="panel-heading">
    				<h4 style="margin-left: 130px;">JUNGLE论坛欢迎登录</h4>
    			</div>
    			<div class="panel-body col-xs-12">
    				
    				<div class="input-group input-group-xs col-xs-6 has-success">
						<span class=""></span>
						<input id="username" name="username" class="form-control" type="text" placeholder="用户名" maxlength="12"/>
						<label class="glyphicon glyphicon-ok username_msg"></label>
						<label class="glyphicon glyphicon-remove username_msg"></label>
					</div>
					<div class="danger input-grounp col-xs-6 col-xs-offset-3">
   						<label class="alert-danger">用户名不存在</label>
   					</div>
    				<div class="input-group input-group-xs col-xs-6 has-error">
	    				<span class=""></span>
	    				<input id="password" name="password" class="form-control" type="password" placeholder="密码" maxlength="18"/>
	    				<label class="glyphicon glyphicon-ok password_msg"></label>
	    				<label class="glyphicon glyphicon-remove password_msg"></label>
    				</div>
    				<div class="danger input-grounp col-xs-6 col-xs-offset-3">
    						<label class="alert-danger">密码错误</label>
    				</div>
    				<!-- 滑块 -->
    				<div class="input-grounp col-xs-6">
    					<div class="drag col-xs-offset-5">
						    <div class="bg"></div>
						    <div class="text" onselectstart="return false;">请拖动滑块解锁</div>
						    <div class="btn">&gt;&gt;</div>
						</div>
					</div>
					<!-- END滑块 -->
    				<!-- 登录验证 -->
    				<div class="input-group col-xs-9">
    					<div class="col-xs-8 left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    						<label class="check">
    							<input id="autoLogin" type="checkbox" name="autoLogin" value="autoLogin" checked="checked"/>
    							自动登录
    						</label>
    						<label class="check">
    							<input id="savePassword" type="checkbox" name="savePassword" value="savePassword" checked="checked"/>
    							记住密码
    						</label>
    					</div>
    					<div class="col-xs-4 check">
    						<a href="#">忘记密码?</a>
    					</div>
    				</div>
    				<br>
	    			<div class="input-group col-xs-6" style="margin-top: 0px;">
	    				<input type="submit" id="submit" class="btn btn-success btn-sm btn-block" value="登&nbsp;&nbsp;录">
	    			</div>
    			</div>
    			<div class="panel-footer ">
    				<div class="" style="margin-left: 300px;">
    					<label>&nbsp;&nbsp;</label><br><br>
    					<a href="#" >点此注册</a>
    					<label>&nbsp;|&nbsp;</label>
    					<a href="#" >意见反馈</a>
    					
    				</div>
    			</div>
    		</div>
    		</form>
    		<!-- END登录模板 -->
    		</div>
    		
    	</div>
    	<!-- END上部页面 -->
    	
    	<!-- 下部信息 -->
	   		<div class="dntt container">
			   <div class="row">
			   	
			   	<!-- 四个图标文字信息 -->
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1"> </div>  
			      <div class="col-lg-1 col-md-1"></div>
			      <div class="col-lg-1 col-md-1">
			      <label>
				      	<a href="index.jsp">
					      	<div>
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
			      	<div>
			      		<img alt="二维码登录" src="images/erweima.png" style="width: 30px;height: 35px;">
			      	</div>
			      	<div class="dbt">
			      		二维码登录
			      	</div>
			      </label>
			      </div>
			      <div class="col-lg-1 col-md-1">
			      <label>
			      	<div>
			      		<img alt="关于我们" src="images/men.png" style="width: 30px;height: 35px;">
			      	</div>
			      	<div class="dbt">
			      		关于我们
			      	</div>
			      </label>
			      </div>
			      
			      <div class="col-lg-1 col-md-1">
			      <label>
			      	<div>
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
			   	
			   	<div class="center dbt">
				  	 我只希望，不管三年，五年，或是十年以后。某一天，我们相遇，还能相认。你大喊一声，我想死你了<br>那一刻，我定会泪流满面。我们是朋友，永远的朋友。 
			   	</div>
			   	
			   	<!-- END底部下面的话语 -->
    	<!-- END下部信息 -->
    	<script type="text/javascript" src="js/drag.js"></script>
    	
    	<script type="text/javascript">
       		var drag_flag = false;
       		//检测信息展示
        	function show(ele,i){
        		if(i == 0){
        			ele[0].style.display="inline-block";
        			ele[1].style.display="none";
        		}else{
        			ele[1].style.display="inline-block";
        			ele[0].style.display="none";
        		}
        	}
        	//用户名检查 2~12个 中文、字母、数字、下划线。
        	function checkUsername(){
        		var username = $("#username").val();
        		var flag = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,12}$/.test(username);
        		if(flag){
        			show($(".username_msg"),0);
        			closeUserError();
        		}else{
        			show($(".username_msg"),1);
        		}
        		return flag;
        	}
        	//密码检查 6~12位不能有中文和空格
        	function checkPassword(){
        		var password = $("#password").val();
        		var flag = /[^\u4e00-\u9fa5^\s]{6,18}$/.test(password);
        		if(flag){
        			show($(".password_msg"),0);
        			closeWordError();
        		}else{
        			show($(".password_msg"),1);
        		}
        		return flag;
        	}
        	
        	var as = function(selector){
            return  document.querySelector(selector);
        },
        box = as(".drag"),//容器
        bg = as(".bg"),//背景
        text = as(".text"),//文字
        btn = as(".btn"),//滑块
        success = false,//是否通过验证的标志
        distance = box.offsetWidth - btn.offsetWidth;//滑动成功的宽度（距离）
	    //二、给滑块注册鼠标按下事件
	    btn.onmousedown = function(e){
        //1.鼠标按下之前必须清除掉后面设置的过渡属性
        btn.style.transition = "";
        bg.style.transition = "";

        //说明：clientX 事件属性会返回当事件被触发时，鼠标指针向对于浏览器页面(或客户区)的水平坐标。

        //2.当滑块位于初始位置时，得到鼠标按下时的水平位置
        var e = window.event;//做IE兼容处理
        var downX = e.clientX;

        //三、给文档注册鼠标移动事件
        document.onmousemove = function(e){

            var e = e || window.event;
            //1.获取鼠标移动后的水平位置
            var moveX = e.clientX;

            //2.得到鼠标水平位置的偏移量（鼠标移动时的位置 - 鼠标按下时的位置）
            var offsetX = moveX - downX;

            //3.在这里判断一下：鼠标水平移动的距离 与 滑动成功的距离 之间的关系
            if( offsetX > distance){
                offsetX = distance;//如果滑过了终点，就将它停留在终点位置
            }else if( offsetX < 0){
                offsetX = 0;//如果滑到了起点的左侧，就将它重置为起点位置
            }

            //4.根据鼠标移动的距离来动态设置滑块的偏移量和背景颜色的宽度
            btn.style.left = offsetX + "px";
            bg.style.width = offsetX + "px";

            //如果鼠标的水平移动距离 = 滑动成功的宽度
            if( offsetX == distance){

                //1.设置滑动成功后的样式
                text.innerHTML = "验证通过";
                text.style.color = "#fff";
                btn.innerHTML = "&radic;";
                btn.style.color = "green";
                bg.style.backgroundColor = "lightgreen";
				
                //2.设置滑动成功后的状态
                success = true;
                //成功后，清除掉鼠标按下事件和移动事件（因为移动时并不会涉及到鼠标松开事件）
                btn.onmousedown = null;
                document.onmousemove = null;

                //3.成功解锁后的回调函数
                setTimeout(function(){
                	drag_flag = true;
                },100);
            }
        }
        //四、给文档注册鼠标松开事件
        document.onmouseup = function(e){
            //如果鼠标松开时，滑到了终点，则验证通过
            if(success){
                return;
            }else{
                //反之，则将滑块复位（设置了1s的属性过渡效果）
                btn.style.left = 0;
                bg.style.width = 0;
                btn.style.transition = "left 1s ease";
                bg.style.transition = "width 1s ease";
            }
            //只要鼠标松开了，说明此时不需要拖动滑块了，那么就清除鼠标移动和松开事件。
            document.onmousemove = null;
            document.onmouseup = null;
        }
    }
        	
        	//表单提交检查
        	function checkForm(){
        		if(checkUsername() && checkPassword()&&drag_flag){
        			return true;
        		}if(!drag_flag){
        			alert("请拖动滑块哦！");
        			return false;
        		}
        		return false;
        	}
        	//用户名错误信息展示
        	function openUserError(){
        		$(".danger:first>label")[0].style.display="block";
        	}
        	//用户名错误信息关闭
        	function closeUserError(){
        		$(".danger:eq(0)>label")[0].style.display="none";
        	}
        	//密码错误信息展示
        	function openWordError(){
        		$(".danger:eq(1)>label")[0].style.display="block";
        	}
        	//密码错误信息关闭
        	function closeWordError(){
        		$(".danger:eq(1)>label")[0].style.display="none";
        	}
        	//自动登陆和记住密码判断
        	function checkCookie(){
        		var savePassword = getCookie("savePassword");
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
        		var username = '<%=username%>';
        		var password = '<%=password%>';
        		if(savePassword == "true"){
        			/* 自动填写 */
	        		$("#username")[0].value = username;
	        		$("#password")[0].value = password;
        		}
        	}
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
        	//未通过验证,错误信息检查
        	function check(){
        		var username = '${usernameMsg}';
        		var password = '${passwordMsg}';
        		if(username !=""){
        			if(username == "false"){//判断用户名
        				openUserError();
        			}else if(password == "false"){//判断密码
        				openWordError();
        			}
        			/* 数据回显 */
        			$("#username")[0].value = '${requestScope.username}';
        			$("#password")[0].value = '${requestScope.password}';
        		}else{
        			/* 检查Cookie信息 */
        			checkCookie();
        		}
        	}
        	//自动登陆点击同选记住密码
        	function semiBindSelect1(){
        		if($("#autoLogin")[0].checked){
        			$("#savePassword")[0].checked = true;
        		}
        	}
        	function semiBindSelect2(){
        		if(!$("#savePassword")[0].checked){
        			$("#autoLogin")[0].checked = false;
        		}
        	}
        	$(document).ready(function(){
        		//给用户名框添加改变事件
        		$("#username").change(checkUsername);
        		//给密码框添加改变事件
        		$("#password").change(checkPassword);
        		check();
        	});
        </script>
 	</body>
</html>