//粉丝列表分页
//关注分页 id='fansmain' id='fansPagination'
//定义一页显示多少个
var pageSize = 5;
//查询总行数
$.post("user.do",{"method":"RelationshipUserCount","flag":"fans"},function(rowCount){
	//等我已经拿到返回值了  在去计算要分页的显示情况
	
	$("#fansPagination").pagination(rowCount, {  
         callback: fansPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
         prev_text: '<<  上一页',       //上一页按钮里text  
         next_text: '下一页  >>',       //下一页按钮里text  
         items_per_page: pageSize,  //每一页显示条数  
         num_display_entries: 5,    //省略号中间连续显示的页面
         current_page: 0,   //当前页索引  
         num_edge_entries: 2        //省略号两边的页数
     }); 
});

function fansPageCallback(pageIndex,jq){
	$.post("user.do",{"method":"queryRelationshipUserPage","flag":"fans","currentPage":pageIndex,"pageSize":pageSize},function(list){
		//获取到数据之后先清除之前的内容
		$("#fansmain").empty();
		if(list == ''){
			$("#main").append("<p style='padding: 15px 0' align='center'>没有内容</p>");
		}
		$(list).each(function(){
			$("#fansmain").append(
					"<li class='item_cont'><a style='list-style: none;text-decoration:none;' class='aw-user-name hidden-xs' href='user-"
					+this.user_id+".html' rel='nofollow'><img src="+this.user_head
					+" alt='加载中' /></a><a style='list-style: none;text-decoration:none;' href='user-"+this.user_id+".html' title='"
					+this.user_name+"' target='_blank' class='nick'> "
						+this.user_name+"</a></li>"
			);
		});
	},"json");
}
//调用函数显示第一页的数据
fansPageCallback(0);


