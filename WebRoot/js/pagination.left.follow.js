//关注分页 id='followmain' id='followPagination'
//定义一页显示多少个
var pageSize = 5;
//查询总行数
$.post("user.do",{"method":"RelationshipUserCount","flag":"follow"},function(rowCount){
	//等我已经拿到返回值了  在去计算要分页的显示情况
	
	$("#followPagination").pagination(rowCount, {  
         callback: followPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
         prev_text: '<<  上一页',       //上一页按钮里text  
         next_text: '下一页  >>',       //下一页按钮里text  
         items_per_page: pageSize,  //每一页显示条数  
         num_display_entries: 5,    //省略号中间连续显示的页面
         current_page: 0,   //当前页索引  
         num_edge_entries: 2        //省略号两边的页数
     }); 
});

function followPageCallback(pageIndex,jq){
	$.post("user.do",{"method":"queryRelationshipUserPage","flag":"follow","currentPage":pageIndex,"pageSize":pageSize},function(list){
		//获取到数据之后先清除之前的内容
		$("#followmain").empty();
		if(list == ''){
			$("#main").append("<p style='padding: 15px 0' align='center'>没有内容</p>");
		}
		$(list).each(function(){
			$("#followmain").append(
					"<li class='list-group-item' id=' "+this.user_id+" '><a style='list-style: none;text-decoration:none;' class='aw-user-name hidden-xs' href='user/"
					+this.user_id+".html' rel='nofollow'><img src="+this.user_head
					+" alt='加载中' /></a><a style='list-style: none;text-decoration:none;' href='user-"+this.user_id+".html' title='"+this.user_name+"' target='_blank' class='nick'> "
						+this.user_name+"</a> <a style='list-style: none;text-decoration:none;' class='btn btn-success pull-right' id='"+this.user_id+"-btn' onclick='follow("+this.user_id+")' >取消关注</a></li>"
			);
		});
	},"json");
}
//调用函数显示第一页的数据
followPageCallback(0);

