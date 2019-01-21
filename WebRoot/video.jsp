<%@page import="java.io.File"%>
<%@page import="com.entity.Article,com.entity.Files"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html> 
<head>
	<title>JUNGLE论坛--我的视频</title>
		<jsp:include page="nav_head.jsp"></jsp:include>
	<jsp:include page="bottom_head.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css">
	<link rel="icon" type="image/x-icon" href="images/jlogo2.png"/>
	<link rel="stylesheet" type="text/css" href="css/pagination.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.pagination.js"></script>
	<style type="text/css">
		.box span {
			white-space:nowrap;
		}
		#mydiv {
			margin-top:20px;
			height: 600px;
			margin-left: 200px;
		}
		
		#content {
			margin-top: 67px;
			
		}
		#video{	
			width:100%;
			height:100%;
		}
		.margin-top{
			margin-top: 10px;
		}
		.clear{
			clear: both;
		}
		
		.box{
			height:450px;
			position: relative;
		}
		
		.flex-column {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
             align-items: center;
        }

        .flex-row {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            text-align: left;
        }

        .wrap {
            overflow: hidden;
            width: 680px;
            height: 480px;
            background-color: transparent;
            box-shadow: 0 0 9px #222;
        }

        .wrap .box {
            position: relative;
            width: 100%;
            height:90%;
            background-color: #000000;
            
        }

        .wrap .box span {
            position: absolute;
            top: 10px;
            left: 20px;
            display: block;
            padding: 10px;
            color: red;
        }

        .wrap .send {
            display: flex;
            width: 100%;
            height:10%;
            background-color: #000000;
            overflow:auto;
          	-moz-transition:left 4s linear;
       		-webkit-transition:left 4s linear;
        	-o-transition:left 4s linear;
          
        }

        .wrap .send input {
            width: 40%;
            height: 73%;
            border: 0;
            outline: 0; 
            box-shadow: 0px 0px 5px #d9d9d9;
            text-indent: 1em
        }

        .wrap .send .send-btn {
            width: 100px;
            height: 75%;
            background-color: #fe943b;
            color: #FFF;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
        }

        .wrap .send .send-btn:hover {
            background-color: #4cacdc
        }
		.btn:HOVER {
			transform: scale(1.2);
			transition:0.7s;
		}
		h1,h3{
			font-size: 15px;
		}
	</style>
</head>
<body>
	<jsp:include page="nav.jsp" flush="false" />
	<div class = "fixclear"></div>
	<!-- 中间布局 -->
	<input type="hidden" value="${article.article_id }" id ="article_id">
		<div class="aw-container-wrap" id="content">
			<!-- 容器 -->
			<div class="container">
				<!-- 整个内容块-->
				<div class="row">
					<!-- 清除浮动内容块 -->
					<div class="aw-content-wrap clearfix">
						<!-- 左部话题内容 -->
						<div class="col-sm-12 col-md-9 aw-main-content">
							<!-- 话题推荐bar -->
							<!-- 话题推荐bar -->
							<!-- 话题bar/标签bar -->
								<div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="question">
									<div class="tag-bar clearfix">
										<span class="topic-tag">
											<a href="##" class="text">${article.article_tag }	</a>
										</span>
									</div>
								</div>
							<!-- end 话题bar -->
							<!-- 具体话题 -->
							<div class="aw-mod aw-question-detail aw-item">
								<!--头部，标题 -->
								<div class="mod-head">
									<h1>
										<!--
                                        	作者：804762373@qq.com
                                        	时间：2018-10-30
                                        	描述：需修改，通过文章id获取标题
                                        -->
										${article.article_title }						
									</h1>
								</div>
								<!-- 视频 -->
								<div class="wrap flex-column">
									<div class="box">
										<video id="video" class="col-xs-12" src='${video}' autoplay="autoplay" controls="controls" preload="auto" loop>
	    								</video>
	    							</div>
	    							<div class="send flex-row">
								      	<input type="text" class="con" placeholder="弹幕发送~(^v^)~*">
								        <div class="send-btn">发送</div>
							     	</div>
    							</div>
								<!-- 内容 -->
								<div class="mod-body">
									<div>
										简介：
									</div>
									<div class="content markitup-box">
										<!-- 文章内容开始 -->
										${article.article_content }
										<!-- end 文章内容结束 -->
									</div>
								</div>
								
								<!--底部，包括时间 ，添加评论按钮，分享按钮 -->
								<div class="mod-footer">
									<div class="meta">
										<span class="text-color-999">${fn:substring(article.article_date , 0, 19)}	</span>
											<!--
                                            	作者：804762373@qq.com
                                            	时间：2018-10-30
                                            	描述：跳转评论操作，可以onclick事件，加载评论
                                            -->
										<!-- 投票栏 -->
										<span class="operate"  >
												<a class="aw-add-comment " onclick="collect()">
												<i data-placement="right" data-toggle="tooltip" class="icon iconfont icon-star" id="collect" data-original-title="收藏"></i></a>
											</span>
											<span class="operate">
												<a class="aw-add-comment " onclick="agree()">
												<i data-placement="right" data-toggle="tooltip" class="icon iconfont icon-icon_good" data-original-title="点赞"></i> <b class="count" id="agree_article">${article.agree_number }</b></a>
											</span>
											<span class="operate">
												<a class="aw-add-comment" data-id="1141" data-type="answer" data-comment-count="0" data-first-click="hide" href="#commentEdit">
													<i class="glyphicon glyphicon-pencil"></i> 
													添加评论
												</a>
											</span>
											<!-- end 投票栏 -->

										<div class="pull-right more-operate">
											<a class="text-color-999 dropdown-toggle" data-toggle="dropdown">
												<!--
                                                	作者：804762373@qq.com
                                                	时间：2018-10-30
                                                	描述：可设置为复制链接地址
                                                -->
												<i class="glyphicon glyphicon-share"></i>分享 </a>
											<div aria-labelledby="dropdownMenu" role="menu" class="aw-dropdown shareout pull-right">
												<ul class="aw-dropdown-list">
													<li>
														<a href="http://www.weibo.com" target="_blank" ><i class="icon iconfont icon-weibo"></i>新浪微博</a>
													</li>
													<li>
														<a href="http://www.qzone.com" target="_blank" > <i class="icon iconfont icon-Qzone"></i> QZONE</a>
													</li>
													<li>
														<a href="http://www.wechat.com" target="_blank" ><i class="icon iconfont icon-wechat"></i> 微信</a>
													</li>
												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
							
							
							<!-- 问题详细模块  -->
							<div class="aw-mod aw-question-comment">
								<div class="mod-head">
									<ul class="nav nav-tabs aw-nav-tabs active">
										<!--
                                        	作者：804762373@qq.com
                                        	时间：2018-10-30
                                        	描述：回复个数，后台获取
                                        -->
										<h2 class="hidden-xs" > <span id ="commenter_number">${article.commenter_number }</span> 个评论</h2>
									</ul>
							</div>
								<div class="mod-body aw-feed-list">
									<!-- 分页文章开始 -->
										<!-- 用户显示文字列表 -->
									  	<div id="main"></div>
									  	<!-- 用来显示上一页和下一页 -->
									  	<div id="Pagination"></div>
									<!-- end 文章 -->
							</div>
							
							<div class="mod-footer">
								<div class="aw-load-more-content hide" id="load_uninterested_answers">
								<span class="text-color-999 aw-alert-box text-color-999" href="javascript:;" tabindex="-1" onclick="AWS.alert('被折叠的回复是被你或者被大多数用户认为没有帮助的回复');">为什么被折叠?</span>
								<a href="javascript:;" class="aw-load-more-content"><span class="hide_answers_count">0</span> 个回复被折叠</a>
							</div>
							<div class="hide aw-feed-list" id="uninterested_answers_list"></div>
						</div>
					</div>
				
							<!-- end 问题详细模块 -->
							<!-- 回复编辑器 -->
							<!--
                            	作者：804762373@qq.com
                            	时间：2018-10-30
                            	描述：如果未登录时，显示块
                            -->
							<div id="regist_login" class="aw-mod aw-replay-box">
								<a name="answer_form"></a>
								<p align="center">要回复问题请先
									<!--
                                    	作者：804762373@qq.com
                                    	时间：2018-10-30
                                    	描述：跳转登陆或注册
                                    -->
									<a href="login.jsp">登录</a>或
									<a href="regist.jsp">注册</a>
								</p>
							</div>
							<!-- 回复编辑器本体 -->
							<div id="commentEdit" class="panel panel-info">
								<div class="panel-header">
									<div class=" margin-top panel-title"><h1 class="glyphicon glyphicon-edit ">评论栏</h1></div>
								</div>
								<div class="panel-body">
								
									<textarea id="Edit" class="col-xs-8 col-xs-offset-2" rows="6" maxlength="400"></textarea>
								</div>
								<div class=" col-lg-2 col-lg-offset-5 margin-top">
									<button id="commentEdit_commit" class="btn btn-default btn-block">发表评论</button>
								</div>
							</div>
							<!-- end 回复编辑器 -->
						</div>
						<!-- 侧边栏 -->
						<div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
							<!-- 发起人 -->
							<div class="aw-mod">
								<div class="mod-head">
									<h3>发布者</h3>
								</div>
								<div class="mod-body">
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<!-- 链接指向用户博客首页 用户头像 -->
											<a href="##"><img src="${article.user_head }" class="aw-user-name" id="user_head" alt="用户头像"></a>
										</dt>
										<dd class="pull-left">
											<!-- 已修改 -->
											<a class="aw-user-name" href="user-${article.user_id }.html" id="user_name">${article.user_name }</a>
											<p></p>
										</dd>
									</dl>
								</div>
							</div>
							<!-- end 发起人 -->

							<!-- 相关问题 -->
							<div class="aw-mod">
								<div class="mod-head">
									<h3>相关</h3>
								</div>
								<div class="mod-body font-size-12">
									<ul>
										<li>-
											<!--
                                            	作者：804762373@qq.com
                                            	时间：2018-10-30
                                            	描述：链接数据库获取，内容数据库获取
                                            -->
											<a href="##">利用foreach,js获取链接，数量8-10个为宜</a>
										</li>
										
									</ul>
								</div>
							</div>
							<!-- end 相关问题 -->

							<!-- 问题状态 -->
							<div class="aw-mod question-status">
								<div class="mod-head">
									<h3>视频状态</h3>
								</div>
								<div class="mod-body">
									<ul>
										<!--
                                        	作者：804762373@qq.com
                                        	时间：2018-10-30
                                        	描述：数据库获取
                                        -->
										<li>最新活动: <span class="aw-text-color-blue">2018-09-20 11:11</span></li>
										<li>观看: <span class="aw-text-color-blue">${article.article_bro }</span></li>
										<li>收藏: <span class="aw-text-color-blue">${article.collection_number }</span> 人</li>
										<!--
                                        	作者：804762373@qq.com
                                        	时间：2018-10-30
                                        	描述：数据库获取用户头像等信息
                                        -->
										<li class="aw-border-radius-5" id="focus_users">
											<a href="##"><img src="images/no_head.png" class="aw-user-name" data-id="2577" alt="用户头像"></a>
										</li>
									</ul>
								</div>
							</div>
							<!-- end 问题状态 -->
							<!-- start资源下载 -->
							<div>
								<form id="frm_downFile" action="file.do" method="post" style="diaplay:none">
									<input type="hidden" name="method" value="download">
									<input id="user_id" type="hidden" name="user_id">
									<input id="file_id" type="hidden" name="file_id">
								</form>
								<div class="panel panel-default">
									<div class="panel-header text-center">
										<h3>资源下载</h3>
									</div>
									<div id="downFileDiv" class="panel-body">
									
									</div>
									
								</div>
							</div>
							<!-- end资源下载 -->
						</div>
						<!-- end 侧边栏 -->
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="js/pagination.article.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
	//1.获取元素
    var oBox = document.querySelector('.box');   //获取.box元素
    var oCon = document.querySelector('.con');   //获取input框
    var oBtn = document.querySelector('.send-btn');   //获取发送按钮
    var cW = oBox.offsetWidth;   //获取box的宽度
    var cH = oBox.offsetHeight-100;   //获取box的高度
    var message = '';   //弹幕内容初始化
    oBtn.onclick = send;   //点击发送
    oCon.onkeydown = function (e) {
        e = e || window.event;
        if (e.keyCode === 13) {
            //回车键
            send();
        }
    };
    function send() {
        //获取oCon的内容
        if (oCon.value.length <= 0 || (/^\s+$/).test(oCon.value)) {
            alert('请输入弹幕');
            return false;
        }
        message = oCon.value;
        //生成标签
        createEle(message);   //执行节点创建模块
        //存入历史
        console.log(message);
        oCon.value = '';   //收尾工作清空输入框
    }
    function createEle(txt) {
        //动态生成span标签
        
        var oMessage = document.createElement('span');   //创建标签
        oMessage.innerHTML = txt;   //接收参数txt并且生成替换内容
        oMessage.style.left = cW + 'px';  //初始化生成位置x
        oMessage.style.border = "2px solid #"+(~~(Math.random() * (1 << 24))).toString(16);
        oBox.appendChild(oMessage);   //把标签塞到oBox里面
        
        roll.call(oMessage, {
            //call改变函数内部this的指向
            timing: ['linear'],//, 'ease-out'][~~(Math.random() * 2)],
            color:  '#' + (~~(Math.random() * (1 << 24))).toString(16) ,
            top: random(0, cH) ,
            fontSize: random(16, 22)
        });	
    }
    function roll(opt) {
        //弹幕滚动
        
        //如果对象中不存在timing 初始化
        opt.timing = opt.timing || 'linear';
        opt.color = opt.color || '#fff';
        opt.top = opt.top || 0;
        opt.fontSize = opt.fontSize || 16;
        this._left = parseInt(this.offsetLeft);   //获取当前left的值
        this.style.color = opt.color;   //初始化颜色
        this.style.top = opt.top + 'px';
        this.style.fontSize = opt.fontSize + 'px';
        this.timer = setInterval(function () {
            if (this._left <= -this.offsetWidth) {
                clearInterval(this.timer);   //终止定时器
                this.parentNode.removeChild(this);
                return;   //终止函数
            }
            this._left += -2;
           /*  switch (opt.timing) {
                case 'linear':   //如果匀速
                    this._left += -2;
                    break;
                case 'ease-out': 
                    this._left += (0 - this._left) * .01;
                    break;
            } */
            this.style.left = this._left + 'px';
        }.bind(this), 1000 / 60);
    }
    function random(start, end) {
        //随机数封装
        return start + ~~(Math.random() * (end - start));
    }
    var aLi = document.querySelectorAll('li');   //10

    function forEach(ele, cb) {
        for (var i = 0, len = aLi.length; i < len; i++) {
            cb && cb(ele[i], i);
        }
    }
    forEach(aLi, function (ele, i) {
        ele.style.left = i * 100 + 'px';
    });
    //产生闭包
    var obj = {
        num: 1,
        add: function () {
            this.num++;   //obj.num = 2;
            (function () {
                console.log(this.num);
            });
        }
    };
    obj.add();  //window
	</script>
	<script type="text/javascript">
		var minLength = 10;
		//判断是否收藏，如果收藏，则收藏图标为以收藏，且禁用onclick事件
		$.post("article.do",{method:"ifCollect",article_id:'${article.article_id}'},function(data){
			if(data == 'true'){
				$('#collect').prop("class","icon iconfont icon-shoucang");
			}else{
				$('#collect').prop("class","icon iconfont icon-star");
			}
		});
		//点赞
		var agree =	function agree(){
				$.post("article.do",{method:'agreeArticle',article_id:'${article.article_id}'},function(data){
					$('#agree_article').html(data);
				});
			};
			//收藏
			var collect =	function collect(){
				$.post("article.do",{method:'collectArticle',article_id:'${article.article_id}'},function(data){
					if(data == 'true'){
						$('#collect').prop("class","icon iconfont icon-shoucang");
					}else{
						$('#collect').prop("class","icon iconfont icon-star");
					}
				});
			};
		//根据用户登录打开评论栏
		if('${userinfo}' != ""){
			$("#commentEdit")[0].style.display = "block";
			$("#regist_login")[0].style.display = "none";
		}else{
			$("#commentEdit")[0].style.display = "none";
			$("#regist_login")[0].style.display = "block";
		}
		//提交评论
		function commentAjax(){
			var content = $.trim($("#Edit").val());
			if(content == 'null' || content =='' ){
				alert("请输入内容后提交");
			}else{
				$.post("comment.do",{method:"insertComment",article_id:'${article.article_id}',comment_content:content,user_id:'${userinfo.user_id}'},function(data){
			   		$('#commenter_number').html(data);
			   		window.location.reload();
			   	});
			}
    	}
		//浏览次数+1
    	function browseAjax(){
    		var article_id = '${article.article_id}';
    		$.post("article.do",{"method":"browseArticle","article_id":article_id},function(arg){
    			//备用
    		});
    	}
    	//点击下载
    	function downFile(){
    		if(downFileCheck()){
    			var file_id=($(this).parent()[0].id+"").substring(5);
    			$("#file_id")[0].value = file_id;
    			$("#user_id")[0].value = '${userinfo.user_id}';
    			$("#frm_downFile").submit();
    		}
    	}
    	//下载文件检查
    	function downFileCheck(){
    		if('${userinfo.user_id}' == ""){
    			alert("请先登录");
    			return false;
    		}else{
    			if(confirm("将要扣除相应的金币(已购买的文章不会重复扣除),继续请点击确认键")){
    				return true;
    			}else{
    				return false;
    			}
    		}
    	}
    	//下载文件栏
    	function FileDiv(){
    		var files = ${files};
    		if(files.length>0){
		   		for(var i = 0; i < files.length; i++){
		   			$("#downFileDiv").append(
		   				"<div id='files"+files[i].file_id+"'>"+
			   				"<a class='File'>"+
								files[i].file_title+
								"<i class='glyphicon glyphicon-save'></i>"+
							"</a>"+
							"<label>"+
								"<span>"+files[i].file_coin+"</span>"+
								"金币"+
							"</label>"+
						"</div>"
					);
		   		}
    		} 
    	}
    	$("#commentEdit_commit").click(commentAjax);
		$(document).ready(function(){
			//浏览+1
    		browseAjax();
    		//下载点击
    		$("#downFileDiv").on("click",".File",downFile);
    		//文件栏加载
    		FileDiv();
    	});
		//评论空格处理
    	function checkWord(Str){
			Str = Str.replace(/\s+/g," ");//空格归一
			Str = Str.replace(/^\s/,"");//去前空格
			Str = Str.replace(/\s$/,"");//去后空格
			return Str;
		}
		</script>
	<!-- END中间布局 -->
	<jsp:include page="bottom.jsp" flush="false" />
</body>
</html>
