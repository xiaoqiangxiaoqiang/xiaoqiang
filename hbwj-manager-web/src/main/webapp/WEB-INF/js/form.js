$(document).ready(function(){
			// 绑定显示注册框事件
			$("#registerBtn").on("click",showRegister);
			// 绑定显登录框事件
			$("#backLogin").on("click",showLogin);
			//绑定验证手机号码事件
			$("#phoneNum").on("blur",checkPhone);
			//绑定密码验证事件；
			$("#passwordReg").on("blur",checkPs);
			$("#password2Reg").on("blur",checkPs2);			
			//绑定注册事件
			$("#doRegister").on("click",doRegister);
			//绑定发送验证码事件
			$("#getCodeBtn").on("click",getCode);
			//默认不可获取验证码
			noClick();
			if($.cookie("isRem")=="true"){
				$("#remember").prop("checked",true);
				$("#username").val($.cookie("username"));
				$("#password").val($.cookie("password"));
			}
		})

function check(){
	var elem=$("#username");
	var user=elem.val();
	if(user.length<6){
		showError(elem,"用户名长度太短");
		return false;
	}
	saveCookie();
	return true;
}

function saveCookie(){
	if($("#remember").prop("checked")){
		var usernameStr=$("#username").val();
		var passwordStr=$("#password").val();
		$.cookie("username",usernameStr,{expires:7});
		$.cookie("password",passwordStr,{expires:7});
		$.cookie("isRem","true",{expires:7});
	}else{
		$.cookie("isRem","false",{expires:-1});
		$.cookie("username","",{expires:-1});
		$.cookie("password","",{expires:-1});
	}
}

//显示注册框
function showRegister(){
	$("#login").hide(300);
	$("#register input[type='text'],#register input[type='password']").val("");
	$("#register span.warming").remove();
	$("#register").css("display","block");
}
//显示登录框
function showLogin(){
	$("#register").hide();
	$("#login input[type='text'],#register input[type='password']").val("");
	$("#login span.warming").remove();
	$("#login").css("display","block");
}
//错误提示
function showError(elem,str){
	$("<span class='warming'>"+str+"</span>").insertAfter(elem);
	return false;
}
//正确提示
function showRight(elem){
	elem.siblings("span").remove();
	return true;
}
//手机号码检测
function checkPhone(){
	var elem=$("#phoneNum");
	var tel=elem.val();
	if(tel.length<11||!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
	{ 
		if(elem.siblings("span").length!==0) return;
		showError(elem,"号码格式不正确");				
	} else{
		doAjax({phoneNum:tel},"",resetBtn);
		showRight(elem);
	}
} 
//密码检测
function checkPs(){
	var elem=$("#passwordReg");
	var ps=elem.val();
	if(ps.length<6){
		if(elem.siblings("span").length!==0) return;
		showError(elem,"密码至少6字符");
	}else{				
		showRight(elem);
	}
}
//密码一致检测
function checkPs2(){
	var elem=$("#password2Reg");
	var ps2=elem.val();
	var ps=$("#passwordReg").val();
	if(ps2!==ps){
		if(elem.siblings("span").length!==0) return;
		showError(elem,"两次密码不一样");
	}else{				
		showRight(elem);
	}
}
//ajax请求服务器
function doAjax(json,url,callback){
	$.ajax({
		type:'POST',
		url:url,
		data:json,
		dataType:'JSON',
		success:function(data){
			callback(data);
		},
		error:function(){
		}
	})
}
//验证码按钮恢复
function resetBtn(data){
	if(data.result==true){
		canClick();
	}else{
		noClick();
	}
}

function noClick(){
	$("#getCodeBtn").css("cursor","not-allowed");
	$("#getCodeBtn").attr("disabled","disabled");
}
function canClick(){
	$("#getCodeBtn").attr("disabled",false);
	$("#getCodeBtn").css("cursor","pointer");
}
//点击获取验证码
function getCode(){
//发送验证码代码...
pos=59;
noClick();
elem=$("#getCodeBtn");
timeInt=setInterval(interval,900);//定义定时器

}

function interval(){
	console.log(pos);
	if(pos>0){
		elem.val(pos+"s后再次获取");
		pos--;
		return;
	}
	if(pos===0){
		canClick();
		elem.val("获取验证码");
clearInterval(timeInt);//清除定时器
}				
}

//校对验证码
function checkCode(){

}

function doRegister(){
	switch(false){
		case !checkPhone:
		alert("手机号码格式不正确");
		break;
		case !checkPs:
		alert("密码长度要大于6位字符");
		break;
		case !checkPs2:
		alert("两次输入密码不一样");
		break;
		case !checkCode:
		alert("验证码错误");
		break;
	}
}