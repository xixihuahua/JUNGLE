//var article_commenter = function (){
		//定义一页显示多少个
		var pageSize = 3;
		//查询总行数
		//$.post("article.do","method=AllArticleCount",function(rowCount){
		//等我已经拿到返回值了  在去计算要分页的显示情况
		setTimeout(function(){
			var rowCount = $('#commenter_number').html();
			$("#Pagination").pagination(rowCount, {  
		         callback: articlePageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
		         prev_text: '<<  上一页',       //上一页按钮里text  
		         next_text: '下一页  >>',       //下一页按钮里text  
		         items_per_page: pageSize,  //每一页显示条数  
		         num_display_entries: 5,    //省略号中间连续显示的页面
		         current_page: 0,   //当前页索引  
		         num_edge_entries: 2        //省略号两边的页数
		     }); 
		},500);
		
	//});
	
	function articlePageCallback(pageIndex,jq){
    	$.post("comment.do",{"method":"queryCommentByArticleId","article_id":$('#article_id')[0].value,"currentPage":pageIndex,"pageSize":pageSize},function(list){
    		//获取到数据之后先清除之前的内容
    		$("#main").empty();
    		$(list).each(function(){
    			$("#main").append(
    					"<div class='aw-item' ><div class='mod-head'><a class='anchor' ></a><a class='aw-user-img aw-border-radius-5 pull-right' href='user.do?method=findUser&visitedUser_id="+this.user_id+"' ><img src='"+this.user_head+"' alt=''></a>									<div class='title'>" +
    							"<p><a class='aw-user-name' href=user-"+this.user_id+".html' >"+this.user_name+"</a>" +
    									"</p><p class='text-color-999 aw-agree-by hide'>赞同来自:" +
    									"</p></div></div>" +
    									"<div class='mod-body clearfix'>" +
    									"<div class='markitup-box'>"
    									+this.commenter_content+"</div></div>" +
    					"<div class='mod-footer'><div class='meta clearfix'>" +
    					"<span class='text-color-999 pull-right'>"+this.commenter_date.toString().slice(0,19)+"</span>" +
    							"<span class='operate'><a class='agree '  ><i data-placement='right' title='' data-toggle='tooltip' class='icon iconfont icon-icon_good' data-original-title='赞同回复'></i> <b class='count'>0</b></a>" +
    							"</span><span class='operate'><a class='aw-add-comment' data-type='answer' data-comment-count='0' data-first-click='hide' href='javascript:;'><i class='glyphicon glyphicon-pencil'></i> 0</a>" +
    							"</span><div class='more-operate'><div class='btn-group pull-left'>" +
    							"<a class='text-color-999 dropdown-toggle' data-toggle='dropdown'><i class='icon icon-share'></i> 分享" +
    							"<div aria-labelledby='dropdownMenu' role='menu' class='aw-dropdown shareout pull-right'>" +
    							"<ul class='aw-dropdown-list'>" +
    							"<li><a href='http://www.weibo.com' target='_blank'><i class='icon iconfont icon-weibo'></i>新浪微博</a></li>" +
    							"<li><a href='http://www.qzone.com' target='_blank'> <i class='icon iconfont icon-Qzone'></i> QZONE</a></li>" +
    							"<li><a href='http://www.wechat.com' target='_blank'><i class='icon iconfont icon-wechat'></i> 微信</a></li>" +
    							"</ul></div></div></div>" +
    							"</div>" +
    							"</div></div>"
        				);
    	    		});
    	},"json");
	}
	//调用函数显示第一页的数据
	articlePageCallback(0);

//}