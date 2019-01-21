//发送ajax请求，并将服务器端返回的数据在suggest DIV中展现。

    function sendRequest() {

	       clearSuggest();//清除智能提示列表suggest DIV中的所有元素
	
	       //取得查询输入框中的数据
	
	       var info = $.trim($('#aw-search-query').val());
	
	       //校验查询输入框中的数据是否为空，如果为空，则不再往服务器端发送请求。
	
	       if(info==""){
	            hiddenSuggest();
	           return;
	       }
	$.post("article.do",{"method":"searchArticle","q":info,"currentPage":1,"pageSize":3},function(searchlist){
			//获取到数据之后先清除之前的内容
			$("#suggest").empty();
			if(searchlist == ''){
				hiddenSuggest();//设置智能提示列表不可见
               
			}else{
				 displaySuggest();//设置智能提示列表可见
			
			$(searchlist).each(function(){
				 
				$("#suggest").append(
		                  "<div class='out' onmouseover='mover(this);' onmouseout='mout(this);' onclick='setSuggest(this)'>"
						+this.article_title+"</div>"
	    				);
		    		});
			}
		},"json");

    }

//点击某个value值时，将该value值设置到查询文本框中。

    function setSuggest(para){
    $('#aw-search-query').val($(para).html());

       hiddenSuggest();

    }

 

//设置智能提示列表不可见

function hiddenSuggest(){

       document.getElementById('suggest').style.display="none";
       
}

//清除suggest DIV中的所有元素

    function clearSuggest(){

       document.getElementById('suggest').innerHTML="";

       }

//鼠标滑过某个value值时，设置当前value值所在DIV高亮显示。

    function mover(){

       this.className="over";

       }

//鼠标离开某个value值时，设置当前value值所在DIV恢复初始显示样式。

    function mout(){

       this.className="out";

       }

    //设置智能提示列表可见

    function displaySuggest(){

       document.getElementById('suggest').style.display="block";

       }

