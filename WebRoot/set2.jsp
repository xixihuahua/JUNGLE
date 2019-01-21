<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>个人信息修改</title>
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
     <style type = "text/css">
     
     	#bigBg{
    		background-size:contain;
     		position:absolute;
     		z-index:-1;
     	}
     	#bbg{
     		width:1333px;
     		height:660px;
     		display:block;
     	}
     	
     	
    	#set{
    		background-size:contain;
    		width:380px;
    		height:560px;
    		position:absolute;
    		top:50px;
    		left:480px;
    		z-index:1;
    	}
    	b{
    		position:relative;
    		top:-30px;
    		left:40px;
    		font-family: "黑体";
    	}
    	#head{ 
    		width:100px;
    		height:100px;
    		position:relative;
    		top:100px;
    		margin-left: -70px;
    	}
    	.picture{
    		position:absolute;
    		top:50px;
    		left:85px;
    	}
    	.picture img{
    		width:50px;
    		height:50px;
    	}
    	.message{
    		position:relative;
    		top:130px;
    		left:60px;
    		border-collapse: separate;
    		border-spacing:9px 1px;
    	}
    	input{
    		width:80px;
    	}
		b{
			font-size: 20px;
			color: #696969;
		}
    	#back{
   			position:relative;
			top:-212px;
			left:320px;
   		
    	} 	
    	#submit{
    		margin-left: 140px;
    		margin-top: 160px;
    		outline: none;
    		margin-left:100px;
    		width: 200px; 
    	}
    	
    	#picWall{
    		background-size:contain;
			position:absolute;
			top:120px;
			left:100px;
			visibility:hidden;
			z-index:1;
    	}
    	#picWall img{
    		width: 60px;/*设置高度*/
			height:60px;
			padding: 5px;/*设置内边距*/
			background-color: white;/*设置背景颜色*/
			transform: rotate(-10deg);/*设置倾斜角度*/
			margin: 5px;/*设置外边距*/
    	}
       	#picWall img:hover{
/*    		transform: rotate(0deg) scale(1.5);/*设置旋转角度和缩放比例*/			
			z-index: 1;/*设置显示优先级别*/
/*			transition: 1.5s;/*设置显示加载时间*/					
    	} 
    	
    	#picWall2{
    		background-size:contain;
			position:absolute;
			top:120px;
			left:700px;
			visibility:hidden;
			z-index:1;
    	}
    	#picWall2 img{
    		width: 60px;/*设置高度*/
			height:60px;
			padding: 5px;/*设置内边距*/
			background-color: white;/*设置背景颜色*/
			transform: rotate(10deg);/*设置倾斜角度*/
			margin: 5px;/*设置外边距*/
    	}
       	#picWall2 img:hover{
/*    		transform: rotate(0deg) scale(1.5);/*设置旋转角度和缩放比例*/			
			z-index: 1;/*设置显示优先级别*/
/*			transition: 1.5s;/*设置显示加载时间*/					
    	} 
    	.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
    	
    	
    	
     	
    	
    </style>
    <script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    	function select_pic(img){											//修改头像的src
			var head = document.getElementById("head");
			var src = img.getAttribute("src");
			head.src = src;
			var h_pic = document.getElementById("h_picPath");
			h_pic.setAttribute("value", src);
		}
    	
    	function select_bg(img){											//修改背景的url
			var set = document.getElementById("set");
			var src = img.getAttribute("src");
			var value ="url("+src+") no-repeat";
			set.style.background = value;
			set.style.backgroundSize = "contain";
			var h_bg = document.getElementById("h_bgPath");
			h_bg.setAttribute("value", src);
		}
    
    </script>
  </head>
  
  <body>
  	<div id = "bigBg">
  		<img id = "bbg" src = "images/bigBg1.jpg" />
  	</div> 
    <div id="set">
    		
    		<b><img src="images/xiu.png" style="width: 30px;height: 35px;">请修改您的个人信息</b>
    		<img id = "head" src = "images/head1.jpg"  >
	  	
	  	<input name="method" type="hidden" value="changeMessage">
	  	<form id="frm" name="frm"  action="user.do" method="post" >																<!-- 数据提交地址 -->
		  	<input name="method" type="hidden" value="changeMessage">
		  	<table class="message">
				<tr><td>昵称</td><td><input class="form-control"  type = "text" name = "uname" value = "" /></td></tr>				<!-- 数据库 -->
	  			<tr><td>性别</td><td><input class="form-control" type = "text" name = "sex" value = "" /></td></tr>				<!-- 数据库 -->
		 		<tr><td>年龄</td><td><input class="form-control" type = "text" name = "age" value = "" /></td></tr>				<!-- 数据库 -->
		 		<tr><td>生日</td><td><input class="form-control" type = "date" name = "birth" value = "" /></td></tr>				<!-- 数据库 -->
		  		<tr><td>邮箱</td><td><input class="form-control" type = "text" name = "email" value = "" /></td></tr>				<!-- 数据库 -->
		  	</table>
		  	
		  	<input id = "h_picPath" type = "hidden" name = "head" value = "images/head1.jpg">								<!-- 头像地址 -->
		  	<button id="submit" class="btn btn-danger btn-sm">修改信息</button>								
	  	</form> 
	  	<a id = "back" href = "left.jsp"><img  src = "images/back.png" width="30" ></a>	
   </div>
   <div id="picWall" >
   		
   		
	   		<img src="images/head1.jpg" ondblclick = "select_pic(this)" />
			<img src="images/head2.png" ondblclick = "select_pic(this)"/>
			<img src="images/head3.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head4.png" ondblclick = "select_pic(this)" />
			<img src="images/head5.png" ondblclick = "select_pic(this)"/>
			<img src="images/head6.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head7.png" ondblclick = "select_pic(this)" />
			<img src="images/head8.png" ondblclick = "select_pic(this)"/>
			<img src="images/head9.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head10.png" ondblclick = "select_pic(this)"/>
			<img src="images/head11.png" ondblclick = "select_pic(this)" />
			<img src="images/head13.png" ondblclick = "select_pic(this)" /><br />	
			<img src="images/head14.png" ondblclick = "select_pic(this)" />
			<img src="images/head15.png" ondblclick = "select_pic(this)"/>
			<img src="images/head16.png" ondblclick = "select_pic(this)" /><br />
		
   </div>
    <div id="picWall2" >
   		
   		
	   		<img src="images/head1.jpg" ondblclick = "select_pic(this)" />
			<img src="images/head2.png" ondblclick = "select_pic(this)"/>
			<img src="images/head3.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head4.png" ondblclick = "select_pic(this)" />
			<img src="images/head5.png" ondblclick = "select_pic(this)"/>
			<img src="images/head6.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head7.png" ondblclick = "select_pic(this)" />
			<img src="images/head8.png" ondblclick = "select_pic(this)"/>
			<img src="images/head9.png" ondblclick = "select_pic(this)" /><br />
			<img src="images/head10.png" ondblclick = "select_pic(this)"/>
			<img src="images/head11.png" ondblclick = "select_pic(this)" />
			<img src="images/head13.png" ondblclick = "select_pic(this)" /><br />	
			<img src="images/head14.png" ondblclick = "select_pic(this)" />
			<img src="images/head15.png" ondblclick = "select_pic(this)"/>
			<img src="images/head16.png" ondblclick = "select_pic(this)" /><br />
		
   </div>
  </body>
   <script type="text/javascript">

		$("#head").bind("click",function(){										//单击头像，可显示或隐藏头像选择墙
			var picWall = $("#picWall");
			var picWall2 = $("#picWall2");
			var flag = picWall.css("visibility");
			if(flag == "hidden"){
				picWall.css("visibility","visible");
				picWall2.css("visibility","visible");
			}else{
				picWall.css("visibility","hidden");
				picWall2.css("visibility","hidden");
			}
		})	
		$("#set").bind("dblclick",function(){									//双击设置界面，显示或隐藏背景选择强
			var bgWall = $("#bgWall");
			var flag = bgWall.css("visibility");
			if(flag == "hidden"){
				bgWall.css("visibility","visible");
			}else{
				bgWall.css("visibility","hidden");
			}
		})
		
		var i = 1;
	 	window.setInterval(function(){
	 		var bigBg = $("#bigBg");
	 		var pic = $("#bbg");
    		pic.fadeOut(3000);
    		window.setTimeout(function(){
    			i++;
	    		i = i > 7 ? 1 : i;
	    		var src = "images/bigBg"+i+".jpg";
	    		pic.attr("src",src);
	    		bigBg.css("position","absolute");
	    		bigBg.css("z-index","-1");
    		}, 3000);
    		
    		pic.fadeIn(3000);
    	}, 9000); 
    </script>
</html>



