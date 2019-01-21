   		//定义一页显示多少个
   		var pageSize = 5;
   		//查询总行数
   		$.post("article.do","method=collectArticleCount",function(rowCount){
    		//等我已经拿到返回值了  在去计算要分页的显示情况
    		$("#collectPagination").pagination(rowCount, {  
		         callback: collectPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
		         prev_text: '<<  上一页',       //上一页按钮里text  
		         next_text: '下一页  >>',       //下一页按钮里text  
		         items_per_page: pageSize,  //每一页显示条数  
		         num_display_entries: 5,    //省略号中间连续显示的页面
		         current_page: 0,   //当前页索引  
		         num_edge_entries: 2        //省略号两边的页数
		     }); 
    	});
    	
    	function collectPageCallback(pageIndex,jq){
	    	$.post("article.do",{"method":"queryCollectArticlePage","currentPage":pageIndex,"pageSize":pageSize},function(list){
	    		//获取到数据之后先清除之前的内容
	    		$("#collectmain").empty();
	    		$(list).each(function(){
	    			var new_article_content = Sub_article_content(this.article_content);
	    			$("#collectmain").append(
	    			"<div class='aw-item active' id='article_"+this.article_id+"'>"
	    			//未加编辑以及删除链接，后期可通过验证用户id与session的用户id决定是否有修改链接
	    				+"<a class='aw-user-name hidden-xs' href='user-"+this.user_id+".html' rel='nofollow'><img src="
	    				+this.user_head+" alt='加载中' /></a>"
	    				+"<div class='aw-question-content'><h1><a style='list-style: none;text-decoration:none;' href='article-"
	    				+this.article_id+".html' ><b>"+this.article_title+"</b>  &nbsp;&nbsp;&nbsp;<i class='label label-warning'>"
	    				+this.article_tag+"</i></a></h4><a href='article-"
	    				+this.article_id+".html' ><i class='has-success'>"+new_article_content+"</i></a><p><a href='javascript:collect("+this.article_id+")' class='pull-right text-color-999'>取消关注</a><p><a href='user-"+this.user_id+".html' class='aw-user-name'>"
	    				+this.user_name+"</a> <span class='text-color-999'>发起了问题 • "
	    				+this.agree_number+" 个赞 • "
	    				+this.commenter_number+" 个回复 • "
	    				+this.article_bro+" 次浏览 • "
						+this.article_date+"</span></p></div><hr></div>"
    				);
	    		});
	    	},"json");
    	}
    	//调用函数显示第一页的数据
    	collectPageCallback(0);
    	
    	function Sub_article_content(article_content){
    		if(article_content.length < 10){
    			article_content = "无预览";
    			return article_content;
    		}
    		return article_content.substring(0,50);	
    	}
