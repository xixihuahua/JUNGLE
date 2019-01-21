//关注分页 id='followmain' id='followPagination'
//定义一页显示多少个
var pageSize = 5;
//查询总行数
$.post("message.do",{"method":"messageCount"},function(rowCount){
	//等我已经拿到返回值了  在去计算要分页的显示情况
	
	$("#msgPagination").pagination(rowCount, {  
         callback: msgPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
         prev_text: '<<  上一页',       //上一页按钮里text  
         next_text: '下一页  >>',       //下一页按钮里text  
         items_per_page: pageSize,  //每一页显示条数  
         num_display_entries: 5,    //省略号中间连续显示的页面
         current_page: 0,   //当前页索引  
         num_edge_entries: 2        //省略号两边的页数
     }); 
});

function msgPageCallback(pageIndex,jq){
	$.post("message.do",{"method":"queryMessage","currentPage":pageIndex,"pageSize":pageSize},function(list){
		//获取到数据之后先清除之前的内容
		$("#msgmain").empty();
		if(list == ''){
			$("#msgmain").append("<p style='padding: 15px 0' align='center'>没有内容</p>");
		}
		$(list).each(function(){
			var ifread = "";
			if(this.msg_type==0){
				ifread="未读";
			}else{
				ifread="已读";
			}
			$("#msgmain").append(
					"<li class='list-group-item' id=' "+this.user_id+" '><a style='list-style: none;text-decoration:none;' class='aw-user-name hidden-xs' href='user/"
					+this.user_id+".html' rel='nofollow'><img src="+this.user_head
					+" alt='加载中' /></a><a style='list-style: none;text-decoration:none;' href='user-"+this.user_id+".html' title='"+this.user_name+"' target='_blank' class='nick'> "
						+this.user_name+"</a> 评论了您的 <a style='list-style: none;text-decoration:none;' href='article-"+this.article_id+".html' onclick='clearmsg("+this.msg_id+")'>"+this.article_title+" </a> 文章 <span class='pull-right' id=' msg-"+this.msg_id+"'>"+ifread+"<span></li>"
			);
		});
	},"json");
}
//调用函数显示第一页的数据
msgPageCallback(0);

