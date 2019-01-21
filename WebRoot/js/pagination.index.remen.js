
var i = 0;
   		
   		$.post("article.do","method=queryArticleByAgreeNumber",function(ArList){
    		$(ArList).each(function(){
    			
    			
    			if(i < 1){
    				$("#remen").append(		
    					"<li class='list-group-item'><a href='article-"+this.article_id+".html'>"+this.article_title+"</a>&nbsp;&nbsp;&nbsp;&nbsp;<span class='label label-danger'>最热</span>&nbsp;&nbsp;<img src='images/huo2.png' style='width:30px;height:25px;' ></li>"		
        			);
    				i++;	
    			}else if(i<3){
    				$("#remen").append(		
        					"<li class='list-group-item'><a href='article-"+this.article_id+".html'>"+this.article_title+"&nbsp;&nbsp;&nbsp;&nbsp;<span class='label label-danger'>最热</span>&nbsp;&nbsp;<img src='images/huo1.png' style='width:25px;height:25px;'></li>"		
        			);
    				i++;
    			}else{
    				$("#remen").append(		 
        				"<li class='list-group-item'><a href='article-"+this.article_id+".html'>"+this.article_title+"</li>"		
            		);
    				i++;
    			}
    			
    		});
    	},"json");
    	