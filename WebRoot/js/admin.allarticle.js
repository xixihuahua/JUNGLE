function allarticle(){
	
		//定义一页显示多少个
		var pageSize = 6;
		//查询总行数
		$.post("article.do","method=AllArticleCount",function(rowCount){
		//等我已经拿到返回值了  在去计算要分页的显示情况
		
		$("#admindd").pagination(rowCount, {  
	         callback: allarticlePageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
	         prev_text: '<<  上一页',       //上一页按钮里text  
	         next_text: '下一页  >>',       //下一页按钮里text  
	         items_per_page: pageSize,  //每一页显示条数  
	         num_display_entries: 5,    //省略号中间连续显示的页面
	         current_page: 0,   //当前页索引  
	         num_edge_entries: 2        //省略号两边的页数
	     }); 
	});
	
	function allarticlePageCallback(pageIndex,jq){
	
    	$.post("article.do",{"method":"queryAllArticlePage","currentPage":pageIndex,"pageSize":pageSize},function(list){
    	
    		//获取到数据之后先清除之前的内容
    		$("#adminxianshi").empty();
    		
    		$("#adminxianshi").append(
    				"<tr><td>发表作者头像</td>"
    				+"<td></td>"
	    			+"<td>发表作者</td>"
	    			+"<td>作者ID</td>"
	    			+"<td>文章标题</td>"
	    			+"<td>文章分类</td>"
	    			+"<td>发表时间</td>"
	    			+"<td><button onclick='admin_btn();' style='width:60px;height:30px;' class='btn btn-info'>反选</button></td></tr>"
    		);
    		
    		
    		$(list).each(function(){

    			$("#adminxianshi").append(
    	    			//未加编辑以及删除链接，后期可通过验证用户id与session的用户id决定是否有修改链接
    	    				"<tr><td><a class='aw-user-name hidden-xs' href='user.do?method=findUser&visitedUser_id="
    	    				+this.user_id+"' rel='nofollow'><img src='../"+this.user_head+"'/></a><td>"
    	    				+"<td>"+this.user_name+"</a></td>"
    	    				+"<td>"+this.user_id+"</td>"
    	    				+"<td><a href='article.do?method=queryArticleByArticleId&article_id="+this.article_id+"' ><b>"+this.article_title+"</b>  <i class='label label-warning'></td>"
    	    				+"<td>"+this.article_tag+"</a>" 
    	    				+"<td><a href='article.do?method=queryArticleByArticleId&article_id="+this.article_id+"' ><i class='has-success'></i></a><a href='user.do?method=findUser&visitedUser_id="+this.user_id+"' class='aw-user-name'>"+this.article_date+"</td>"
    	    				+"<td><input name='dele_article_id' type='checkbox'   value="+this.article_id+"></a>"
    					);
    	    		});
    	},"json");
	}
	//调用函数显示第一页的数据
	allarticlePageCallback(0);
	
	
}