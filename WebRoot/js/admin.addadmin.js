function  addadmin(){
	
	var addadminval =  $("#addamin").val();
	
	
	
	$.post("user.do",{"method":"addAdmin","addAdmin_user_id":addadminval},function(flag){
		alert(flag);
		$("#yincang").css("display","none");
		alladmin();
	});
}