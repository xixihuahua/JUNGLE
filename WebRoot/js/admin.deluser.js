function alluser2(){
	//定义一页显示多少个
			var pageSize = 5;

			//查询总行数
			$.post("user.do",{"method":"alluserNumber"},function(rowCount){
			$("#del_table_buttom").pagination(rowCount, {
		         callback: deluserPageCallback,  //回调函数  用来加载某一页的数据的Ajax的方法
		         prev_text: '<<  上一页',       //上一页按钮里text  
		         next_text: '下一页  >>',       //下一页按钮里text  
		         items_per_page: pageSize,  //每一页显示条数  
		         num_display_entries: 5,    //省略号中间连续显示的页面
		         current_page: 0,   //当前页索引  
		         num_edge_entries: 2        //省略号两边的页数
		     }); 
			 
		});
			
		function deluserPageCallback(pageIndex,jq){
			
	    	$.post("user.do",{"method":"alluser","currentPage":pageIndex,"pageSize":pageSize},function(searchlist){
	    		
	    		//获取到数据之后先清除之前的内容
	    		$("#del_table").empty();
	    		
	    			$("#del_table").append(
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
		    			
		    			
		    			if(this.user_type != "0" && (this.user_type != "1")){
		    				
		    				var usertype = userType(this.user_type);
			    			$("#del_table").append(
			    	    			"<tr><td>"+this.user_name+"</td>"
			    	    			+"<td><img style='width:30px;height:30px;' src='../"+this.user_head+"'></td>"
			    	    			+"<td>"+this.user_id+"</td>"
			    	    			+"<td>"+this.user_pwd+"</td>"
			    	    			+"<td>"+this.user_sex+"</td>"
			    	    			+"<td>"+usertype+"</td>"
			    	    			+"<td>"+this.user_coin+"</td>"
			    	    			+"<td>"+this.fans_number+"</td>"
			    	    			+"<td><button class='xs btn btn-default' style='width:60px;height:32px;text-align:center;' onclick='del_btn("+this.user_id+");'>移除</button></td></tr>" 
			        		);
			    		}
		    	    });
	    			
	    		
	    		
	    		
	    	},"json");
		}
		//调用函数显示第一页的数据
		deluserPageCallback(0);
		function userType(user_type){
			if(user_type == 0){
				return "超级管理员";
			}else if(user_type == 1){
				return "管理员";
			}else{
				return "用户";
			}
		}
		
		
		
}

function del_btn(user_id){
	$.ajax({
		url:"user.do",
		data:{
			"method":"deleteUser_Admin",
			"user_id":user_id,
		},
		type:"post",
		success : function(flag) {
			if(flag == "移除用户成功"){
				alert(flag);
				del_user();
				alluser();
			}else{
				alert(flag);
			}
		}
	});
}
