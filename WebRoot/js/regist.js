/**检测信息展示
 * @param ele input元素
 * @param flag(布尔值) 要展示正确/错误信息
 */
function show(ele,flag){
	var tagEle = $(ele).parent().find("label");
	if(flag){//正确让√显示 ×隐藏
		tagEle[0].style.display="inline-block";
		tagEle[1].style.display="none";
	}else{//反之
		tagEle[1].style.display="inline-block";
		tagEle[0].style.display="none";
	}
}
//用户名检查(#username) 用户名为2-10位中文、字母、数字、下划线
function checkUsername(){
	var username = $("#username").val();
	var flag = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}$/.test(username);
	if(flag){
		//用户名正确调用
		show($("#username")[0],true);
	}else{
		//用户名错误调用
		show($("#username")[0],false);
	}
	return flag;
}
//密码检查(.password) 6~18位不能有中文和空格
function checkPassword(ele){
	var password = ele.value;
	var flag = /^[^\u4e00-\u9fa5^\s]{6,18}$/.test(password);
	if(flag){
		//密码正确调用
		show(ele,true);
	}else{
		//密码错误调用
		show(ele,false);
	}
	return flag;
}
//全密码检查
function checkPasswordAll(){
	var flag;
	//每当密码发生改变，
	if($("#password2").val() == ""){//为空 只判定一次密码是否正确
		checkPassword($("#password1")[0]);
		flag=false;//二次密码仍需要输入
	}else{//不为空,先判定一次密码,再判断二次密码且二次密码与一次相同
		checkPassword($("#password1")[0]);
		if(checkPassword($("#password2")[0])&&($("#password2").val()==$("#password1").val())){
			show($("#password2")[0],true);
			flag=true;
		}else{
			show($("#password2")[0],false);
			flag=false;
		}
	}
	return flag;
}
//邮箱检查
function checkEmail(){
	var Email = $("#Email").val();
	var flag = /^\S+@\S+$/.test(Email);
	if(flag){
		//邮箱正确调用
		show($("#Email")[0],true);
	}else{
		//邮箱错误调用
		show($("#Email")[0],false);
	}
	return flag;
}

//提交表单检查
function checkForm(){
	//用户名检查&&全密码检查&&邮箱验证&&验证码验证
	if(checkUsername()&&checkPasswordAll()&&checkEmail()&&checkMailCode()){
		//表单通过调用
		alert("表单提交成功！");
		return true;
	}else{
		//表单不通过调用
		alert("请完善表单内容！");
		return false;
	}
}


$(document).ready(function(){
	//给用户名框添加改变事件
	$("#username").change(checkUsername);
	//给密码框添加改变事件
	$("#password1").change(checkPasswordAll);
	$("#password2").change(checkPasswordAll);
	//给邮箱框添加改变事件
	$("#Email").change(checkEmail);
	//发送验证码按钮点击事件添加
	$("#getMailCode").click(code_Button);
	/* check(); */
});