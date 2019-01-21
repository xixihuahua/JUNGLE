<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
  <head>
    <title>regist.html</title>
	
   <meta name="keywords" content="keyword1,keyword2,keyword3">
	<meta name="description" content="this is my page">
	<meta name="content-type" content="text/html; charset=UTF-8">
    
   <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/regist.js" charset="utf-8"></script>
	<style type="text/css">
	
	.bk{
		background-image:url(images/reg_bt3.jpg);
		height:690px;
		background-repeat:no-repeat; 
		background-size:120%; 
		padding-top:50px;
		
	}
	.bk :HOVER{ 
		background-color: #DCDCDC; 
		box-shadow:2px 2px 2px 2px 2px #696969;
		border-radius: 5%;
	} 
	.panel-title{
	 color:#38B0DE;
	 text-align:center;
	 font-size:20px;
	 opacity:0.8;
	}
	input{
	height:34px;
	}
	
	.panel{
	width:500px; 
	height:430px;
	margin:0 auto; 
	background-color:#F0F8FF;
	border-radius: 4%;
	}   
	.checkbox{
		size:30px;
		margin-top:-35px;
		margin-left:45px;
		position: relative;
	}
	.icheck{
	margin-top:35px;
	margin-left:20px;
	}
.checkbox >input{
margin-top:-5px;
opacity:1;
}
	.checkmsg{
		display:none;
		position:absolute;
		margin-left:-20px;
		top: 10px;
		z-index: 10;
	}
	.glyphicon-ok{
        		color: #4CAE4C;
    }
    .glyphicon-remove{
        		color: #D9534F;
    }
    .mail{
    	width:145px;
    	opacity:1; 
    }
    .tip{
    	position:absolute;
    	margin-left:35px;
		color: gray;
	}
	.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
	}
	.panel:HOVER { 	  
			transform: scale(1.03);
			transition:0.7s;
	}
	</style>

  </head>
  
  <body>
  <div class="bk">
    <div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">欢迎新用户注册 <a style="margin-left: 240px;" href="index.jsp"><button class="btn btn-info">返回首页</button></a></h3>
    </div>
    <div class="panel-body">
    <form class="bs-example bs-example-form" role="form" action="user.do" method="post" onsubmit="return checkForm();" name="myform">
        <input name="method" type="hidden" value="insertUser"/>
        <div class="input-group" >
            <span class="input-group-addon">1</span>
            <input id="username" type="text" name='username' class="form-control " placeholder="请输入用户名" maxlength="10">
            <label class="glyphicon glyphicon-ok checkmsg"></label>
			<label class="glyphicon glyphicon-remove checkmsg"></label>
        	
        </div>
        <div class="tip">用户名是2-18位的中英文，不能含空格</div>
    <br>
        <div class="input-group">
       		 <span class="input-group-addon">2</span>
            <input id="password1" type="password" name='password' class="form-control col-xs-6" placeholder="请输入密码" maxlength="18">
            <label class="glyphicon glyphicon-ok checkmsg"></label>
			<label class="glyphicon glyphicon-remove checkmsg"></label>
        </div>
        <div class="tip">密码是6-18位数字，不能含空格</div>
      <br>
        <div class="input-group">
       		<span class="input-group-addon">3</span>
            <input id="password2" type="password" name='pwd2' class="form-control" placeholder="确认二次密码" maxlength="18">
            <label class="glyphicon glyphicon-ok checkmsg"></label>
			<label class="glyphicon glyphicon-remove checkmsg"></label>
        </div>
        <div class="tip">两次密码输入必须完全一致</div>
       <br>
        <div class="input-group">
            <span class="input-group-addon">4</span>
            <input id="Email" name="email" type="email" class="form-control" maxlength="18" placeholder="请输入邮箱" >
            <label class="glyphicon glyphicon-ok checkmsg"></label>
			<label class="glyphicon glyphicon-remove checkmsg"></label>
        </div>
        <div class="tip">可以使用网易云,QQ等邮箱账号</div>
        <br>
        <div class="input-group">
       		<span class="input-group-addon">5</span>
            <input type="text" id="mailCode" class="col-xs-8" maxlength="8" placeholder="请输入邮箱验证码">
            <label class="glyphicon glyphicon-ok checkmsg"></label>
			<label class="glyphicon glyphicon-remove checkmsg"></label>
           	<a id="getMailCode" class="btn mail btn-info" role="button">获取邮箱验证码</a>
            	<!--  <button type="button" class="btn btn-link">获取验证码</button>-->
        </div>
        
        <br>
       <div class="col-xs-12">
             		<div class="checkbox">
                  <input type="checkbox" name="rememberMe" required >
                  <div class="icheck">同意遵循<a href="contract.jsp">JUNGLE协议</a>请务必仔细阅读本协议</div>
              </div>
		</div>
        <button id="b2" class="btn btn-info btn-lg btn-block">立即注册</button>
    </form>
   </div>
   </div>
    
</div>

	 
<script type="text/javascript">
    	var uflag = false;//用户名的全局变量
    	var pflag = false;//密码的全局变量
    	var pflag2 = false;//再次密码的全局变量
  		var mailCode;
  		
  		//请求发送验证码(#getMailCode)
		function code_Button(){
			//在邮箱正确情况下才干事
			if(checkEmail()){
				//禁用按钮
				$("#getMailCode").attr("disabled","disabled");
				//禁用时间
				var time = 60;
				//计时器，每秒调用一次
				t = window.setInterval(function(){
					$("#getMailCode").text(--time+"后再次启用");
					if(time == 0){//倒计时结束移除计时器恢复点击和文字
						time=60;
						$("#getMailCode").removeAttr("disabled");
						$("#getMailCode").text("获取邮箱验证码");
						window.clearInterval(t);
					}
				}, 1000);
				//用ajax访问后台发送验证码
				$.post("user.do",{"inbox":$("#Email").val(),"method":"sendMail"},function(result){
					
					mailCode=result;
				});
			}
		}
		
		
		
    	//验证码检查
       	function checkMailCode(){
       		//获取session验证码
       		if((mailCode == null)||(mailCode == "")){//如果为空
       			alert("验证码失效,请重新发送--------"+mailCode);
       			return false;
       		}else{//不为空
       			if($("#mailCode").val() == mailCode){//验证码相同
       				show($("#mailCode")[0],true);
       				return true
       			}else{
       				$("#mailCode")[0].value = "";//清空用户输入
       				show($("#mailCode")[0],false);
       				alert($("#mailCode").val()+"----"+mailCode)
       				return false;
       			}
       		}
       	}
    	/*2. 写前端注册验证 失去焦点的时候验证（附加，点击提交的时候判断所有是否合法）*/
    	/*document.frm.username.onblur = function(){
    		var uspan = this.parentNode.getElementsByTagName("span")[0];
    		if(this.value == null || this.value.replace(/^\s*|\s*$/g,"") == ""){
    			uspan.innerHTML = "用户名不能为空";
    			uflag = false;
    		}else if(!/^.{2,10}$/.test(this.value)){//else if(/^[^\u4e00-\u9fa5a]{2,16}$/.test(this.value))
    			uspan.innerHTML = "用户名必须是2-16位";
    			uflag = false;
    		}else{
    			uspan.innerHTML = "";
    			uflag = true;
    		}
    	};*/
    	
    	/*document.frm.pwd.onblur = function(){
    		var pspan = this.parentNode.getElementsByTagName("span")[0];
    		if(this.value == null || this.value.replace(/^\s*|\s*$/g,"") == ""){
    			pspan.innerHTML = "密码不能为空";
    			pflag = false;
    		}else if(!/^[^\u4e00-\u9fa5a]{6,18}$/.test(this.value)){
    			pspan.innerHTML = "密码必须是6-18位";
    			pflag = false;
    		}else{
    			pspan.innerHTML = "";
    			pflag = true;
    		}
    		verPwd2();
    	};*/
    	
    	/*document.frm.pwd2.onblur = verPwd2;
    	
    	function verPwd2(){
    		var pspan2 = document.frm.pwd2.parentNode.getElementsByTagName("span")[0];
    		if(this.value != document.frm.pwd.value ){
    			pspan2.innerHTML = "两次输入密码必须一致";
    			pflag2 = false;
    		}else{
    			pspan2.innerHTML = "";
    			pflag2 = true;
    		}
    	};*/
    	
    	
    	//点击提交
    	/*document.frm.sub_btn.onclick = function(){
    		if(uflag && pflag && pflag2){
    			document.frm.submit();
    		}else{
    			alert("请填写正确的注册信息");
    		}
    	};*/
    	/*START 11月8日更新 */
		function backData(){
			if('${error}' != ""){
				alert('${error}');
				$("#username")[0].value = '${requestScope.username}';
				$("#password1")[0].value = '${requestScope.password}';
				$("#password2")[0].value = '${requestScope.password}';
				$("#Email")[0].value = '${requestScope.email}';
			}
		}
    	$(document).ready(function(){
    		backData();
    	});
    	/*END 11月8日更新  */
    </script>
  </body>
</html>
