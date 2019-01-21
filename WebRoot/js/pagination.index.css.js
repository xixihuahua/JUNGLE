//定义一页显示多少个
   		var pageSize = 5;
   		//查询总行数
   		$.post("article.do","method=queryArticleTagNum&&article_tag=css",function(rowCount){
    		//等我已经拿到返回值了  在去计算要分页的显示情况
    		$("#css_Pagination").pagination(rowCount, {  
		         callback: cssPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
		         prev_text: '<<  上一页',       //上一页按钮里text  
		         next_text: '下一页  >>',       //下一页按钮里text  
		         items_per_page: pageSize,  //每一页显示条数  
		         num_display_entries: 5,    //省略号中间连续显示的页面
		         current_page: 0,   //当前页索引  
		         num_edge_entries: 2        //省略号两边的页数
		     }); 
    	});
    	
    	function cssPageCallback(pageIndex,jq){
	    	$.post("article.do",{"article_tag":"css","method":"queryArticleByTag","currentPage":pageIndex,"pageSize":pageSize},function(csstaglist){
	    		//获取到数据之后先清除之前的内容
	    		$("#css_main").empty();
	    		$(csstaglist).each(function(){
	    			var new_article_content = Sub_article_content(this.article_content);
	    			$("#css_main").append(
	    					"<div class='indexdiv aw-item active' >"
	    	    			//未加编辑以及删除链接，后期可通过验证用户id与session的用户id决定是否有修改链接
	    	    				+"<a class='aw-user-name hidden-xs' href='user-"
	    	    				+this.user_id+".html' rel='nofollow'><img src="+this.user_head+" alt='加载中' /></a>"
	    	    				+"<div class='aw-question-content'><h4><a style='list-style: none;text-decoration:none;' href='article-"
	    	    				+this.article_id+".html' ><b>"+this.article_title+"</b>  &nbsp;&nbsp;&nbsp;<i class='label label-warning'>"
	    	    				+this.article_tag+"</i></a></h4><a href='article-"
	    	    				+this.article_id+".html' ><i class='has-success'>"+new_article_content+"</i></a><p><a href='user-"
	    	    				+this.user_id+".html' class='aw-user-name'>"+this.user_name+"</a> <span class='text-color-999'>发起了问题 • "
	    	    				+this.agree_number+" 个赞 • "
	    	    				+this.commenter_number+" 个回复 • "
	    	    				+this.article_bro+" 次浏览 • "
	    						+this.article_date+"</span></p></div></div><hr>"
	        				);
	    	    		});
	    	},"json");
    	}
    	//调用函数显示第一页的数据
    	cssPageCallback(0);
    	
    	function Sub_article_content(article_content){
    		if(article_content.length < 10){
    			article_content = "无预览";
    			return article_content;
    		}
    		return article_content.substring(0,50);	
    	}