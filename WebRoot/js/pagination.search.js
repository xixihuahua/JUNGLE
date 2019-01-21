//定义一页显示多少个
var pageSize = 3;

var AllRowCount = 0;

var q=$('#q').val().trim();
//查询总行数
$.post("article.do",{"method":"searchArticleCount","q":q },function(rowCount){
	if(rowCount == 0){
		$("#article_Pagination").empty();
	}
	//等我已经拿到返回值了  在去计算要分页的显示情况
	$("#article_Pagination").pagination(rowCount, {  
         callback: searchArticlePageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
         prev_text: '<<  上一页',       //上一页按钮里text  
         next_text: '下一页  >>',       //下一页按钮里text  
         items_per_page: pageSize,  //每一页显示条数  
         num_display_entries: 5,    //省略号中间连续显示的页面
         current_page: 0,   //当前页索引  
         num_edge_entries: 2        //省略号两边的页数
     }); 
	
});

function searchArticlePageCallback(pageIndex,jq){
	$.post("article.do",{"method":"searchArticle","q":q,"currentPage":pageIndex,"pageSize":pageSize},function(searchlist){
		//获取到数据之后先清除之前的内容
		$("#article_main").empty();
		if(searchlist == ''){
			$("#article_Pagination").append("<p style='padding: 15px 0' align='center'>没有内容</p></div>");
		}
		$(searchlist).each(function(){
			
			var new_article_content = Sub_article_content(this.article_content);
			
			$("#article_main").append(
					"<div class='aw-item active' >" 
	    			//未加编辑以及删除链接，后期可通过验证用户id与session的用户id决定是否有修改链接
	    				+"<a class='aw-user-name hidden-xs' href='user-"
	    				+this.user_id+".html' rel='nofollow'><img src="+this.user_head+" alt='加载中' /></a>"
	    				+"<div class='aw-question-content'><h4><a href='article-"
	    				+this.article_id+".html' ><b>"+this.article_title+"</b>  &nbsp;&nbsp;&nbsp;<i class='label label-warning'>"
	    				+this.article_tag+"</i></a></h4><a href='article-"
	    				+this.article_id+".html' ><i class='has-success'>"+new_article_content+"</i></a><p><a href='user-"
	    				+this.user_id+".html' class='aw-user-name'>"+this.user_name+"</a> <span class='text-color-999'>发起了问题 • "
	    				+this.agree_number+" 个赞 • "
	    				+this.commenter_number+" 个回复 • "
	    				+this.article_bro+" 次浏览 • "
						+this.article_date+"</span></p></div></div>"	
    				);
	    		});
	},"json");
}
//调用函数显示第一页的数据
searchArticlePageCallback(0);

function Sub_article_content(article_content){
	if(article_content.length < 10){
		article_content = "无预览";
		return article_content;
	}
	return article_content.substring(0,50);	
}


//----------查询用户----------//
//查询总行数
$.post("user.do",{"method":"searchUserCount","q":q },function(rowCount){
	if(rowCount==0){
		$("#user_Pagination").empty();
	}
	//等我已经拿到返回值了  在去计算要分页的显示情况
	$("#user_Pagination").pagination(rowCount, {  
       callback: searchUserPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
       prev_text: '<<  上一页',       //上一页按钮里text  
       next_text: '下一页  >>',       //下一页按钮里text  
       items_per_page: pageSize,  //每一页显示条数  
       num_display_entries: 5,    //省略号中间连续显示的页面
       current_page: 0,   //当前页索引  
       num_edge_entries: 2        //省略号两边的页数
   }); 
	
});

function searchUserPageCallback(pageIndex,jq){
	$.post("user.do",{"method":"searchUserByName","q":q,"currentPage":pageIndex,"pageSize":pageSize},function(searchlist){
		//获取到数据之后先清除之前的内容
		
		$("#user_main").empty();
		if(searchlist == ''){
			$("#user_main").append("<p style='padding: 15px 0' align='center'>没有内容</p></div>");
		}
		$(searchlist).each(function(){
				$("#user_main").append(
						"<div class='aw-item'><a href='user-"+this.user_id+".html' class='aw-user-img'   >"
						+"<img src='"+this.user_head+"' alt=' ' height='40px' ></a><p class='aw-title'><a href='user-"
						+this.user_id+".html' target='_blank'><span class='aw-text-color-red'>"+
						this.user_name+"</span></a> </p> <p class='aw-text-color-666'> <span>" +
						"<i class='icon icon-prestige'></i>等级"+this.user_grade+"	</span>" +
						"<span><i class='icon icon-agree'></i>关注 "+this.follow_number+"</span>" +
						"<span><i class='icon icon-thank'></i>粉丝 "+this.fans_number+"</span></p></div>"
	  				);
	    		});
	},"json");
}

searchUserPageCallback(0);

//-----------全部-------------//
