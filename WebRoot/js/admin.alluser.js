function alluser(){
	//定义一页显示多少个
			var pageSize = 6; 

			//查询总行数
			$.post("user.do",{"method":"alluserNumber"},function(rowCount){
			$("#admindd").pagination(rowCount, {
		         callback: alluserPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
		         prev_text: '<<  上一页',       //上一页按钮里text  
		         next_text: '下一页  >>',       //下一页按钮里text  
		         items_per_page: pageSize,  //每一页显示条数  
		         num_display_entries: 5,    //省略号中间连续显示的页面
		         current_page: 0,   //当前页索引  
		         num_edge_entries: 2        //省略号两边的页数
		     }); 
			 
		});
			
		function alluserPageCallback(pageIndex,jq){
			
	    	$.post("user.do",{"method":"alluser","currentPage":pageIndex,"pageSize":pageSize},function(searchlist){
	    		
	    		//获取到数据之后先清除之前的内容
	    		$("#adminxianshi").empty();
	    		
	    		$("#adminxianshi").append(
	    				"<tr><td>姓名</td>"
		    			+"<td>头像</td>"
		    			+"<td>用户ID</td>"
		    			+"<td>用户密码</td>"
		    			+"<td>性别</td>"
		    			+"<td>级别</td>"
		    			+"<td>金币</td>"
		    			+"<td>粉丝数</td>"
		    			+"<td>操作</td></tr>"
		    			
	    		);
	    		
	    		$(searchlist).each(function(){
	    			var user_Pwd = userPwd(this.user_type,this.user_pwd);
	    			var usertype = userType(this.user_type);
	    			$("#adminxianshi").append(
	    	    			"<tr><td>"+this.user_name+"</td>"
	    	    			+"<td><img style='width:30px;height:30px;' src='../"+this.user_head+"'></td>"
	    	    			+"<td>"+this.user_id+"</td>"
	    	    			+"<td>"+user_Pwd+"</td>"
	    	    			+"<td>"+this.user_sex+"</td>"
	    	    			+"<td>"+usertype+"</td>"
	    	    			+"<td>"+this.user_coin+"</td>"
	    	    			+"<td>"+this.fans_number+"</td>" 
	    	    			+"<td><button class='xs btn btn-default' style='width:60px;height:32px;text-align:center;' onclick='xsbtn("+this.user_id+");'>修改</button></td></tr>"
	        				);
	    	    		});
	    	},"json");
		}
		//调用函数显示第一页的数据
		alluserPageCallback(0);
		function userType(user_type){
			if(user_type == 0){
				return "超级管理员";
			}else if(user_type == 1){
				return "管理员";
			}else{
				return "用户";
			}
		}
		
		function userPwd(user_type,user_pwd){
		
			if(user_type == '0' || user_type == '1'){
				
				user_pwd = "******";
				return user_pwd;
			}else{
				
				return user_pwd;
			}
		}
}
