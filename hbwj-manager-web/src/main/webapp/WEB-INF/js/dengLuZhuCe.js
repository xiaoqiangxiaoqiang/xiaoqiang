$(document).ready(function(){
	isRightPhone=false;
			// 绑定显示注册框事件
			$("#registerBtn").on("click",showRegister);
			
			// 绑定显登录框事件
			$("#backLogin").on("click",showLogin);
			
			/*// 登录
			$("#login1").on("click",login);*/
			
			//绑定验证手机号码事件
			$("#phoneNum").on("keyup",checkPhone);
			
			
			//绑定密码验证事件；
			$("#passwordReg").on("keyup",checkPs);
			$("#password2Reg").on("keyup",checkPs2);	
			$("#username").on("keyup",function(){
				showRight($(this));
			})
			$("#password").on("keyup",function(){
				showRight($(this));
			})
			
			
			//绑定注册事件
			$("#doRegister").on("click",register);
			
			//绑定发送验证码事件
			$("#getCodeBtn").on("click",getCode);
			
			//默认不可获取验证码
			// $("#accept").on("click",accept);
			noClick();
			if($.cookie("isRem")=="true"){
				$("#remember").prop("checked",true);
				$("#username").val($.cookie("username"));
				$("#password").val($.cookie("password"));
			}
		})
		
	/**
	 * 写好的js代码	
	 */
		
function check(){
	var elem=$("#username");
	var user=elem.val();
	if(user.length<6){
		showError(elem,"用户名长度太短");
		return false;
	}
	saveCookie();
	return true;
};
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
};




//显示注册框
function showRegister(){
	$("#login").hide();
	$("#register input[type='text'],#register input[type='password']").val("");
	$("#accept").prop("checked",false);
	$("#register span.warming").remove();
	$("#register").css("display","block");
};
//显示登录框
function showLogin(){
	$("#register").hide();
	$("#login input[type='text'],#register input[type='password']").val("");
	$("#login span.warming").remove();
	$("#login").css("display","block");
};

//手机号码检测
function checkPhone(){
	var elem=$("#phoneNum");
	var tel=elem.val();
	if(tel.length<11||!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
	{ 
		showRight(elem);
		showError(elem,"号码格式不正确");
		isRightPhone=false;	
		return;
	}else{
		showRight(elem);
		doAjax({"phoneNum":tel},"findFalse",resetBtn);
	}

	
};
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
};

//密码一致检测
function checkPs2(){
	var elem=$("#password2Reg");
	var ps2=elem.val();
	var ps=$("#passwordReg").val();
	if(ps2!==ps){
		showError(elem,"两次密码不一样");
		return false;
	}else{				
		showRight(elem);
		return true;
	}
};
//密码检测
function checkPs(){
	var elem=$("#passwordReg");
	var ps=elem.val();
	if(ps.length<6){
		showError(elem,"密码至少6字符");
		return false;
	}else if(ps.length>16){
		showError(elem,"密码不超过16字符");
		return false;
	}else{				
		showRight(elem);
		return true;
	}
}

		
/*88888888888888888888888888888888888888           结尾       ***/		
		
		
function logCallback(data){
	
	if(data.result=="0"){
		showError(elem,"用户名不存在");
	}
	if(data.result=="0"){
		showError(elem2,"密码错误");
	}
}	
		
		

//错误提示
function showError(elem,str){
	if(elem.siblings("span.warming").length!==0) return false;
	$("<span class='warming'>"+str+"</span>").insertAfter(elem);
	return false;
}
//正确提示
function showRight(elem){
	elem.siblings("span.warming").remove();
	return true;
}


//验证码按钮恢复

function resetBtn(data){
	//0:用户不存在 
	if(data.result=="0"){
		canClick();
	}
    //1:用户存在 已经注册
	if(data.result=="1"){
		noClick();
	}		
}

//说明该手机已经被注册
function noClick(){
	var btn=$("#getCodeBtn");
	btn.css("cursor","not-allowed");
	btn.attr("disabled","disabled");
	showError($("#phoneNum"),"该手机已被注册");
	isRightPhone=false;
}
//手机号未被注册
function canClick(){
	var btn=$("#getCodeBtn");
	btn.attr("disabled",false);
	btn.css("cursor","pointer");
	isRightPhone=true;
	showRight($("#phoneNum"));
}

//点击获取验证码
function getCode(){
	//发送验证码代码...
	pos=59;
	noClick();
	var elem=$("#getCodeBtn");
	timeInt=setInterval(interval(elem),900);//定义定时器
}

//是否接受服务协议
function checkAccept(){
	if(!$("#accept").prop("checked")){
//		showError($("#acceptA"),"请先阅读该条款");
		return false;
	}else{
//		showRight($("#acceptA"));
		return true;
	}
}

function interval(elem){
	if(pos>0){
		elem.val(pos+"s后再次获取");
		pos--;
		return;
	}
	if(pos===0){
		canClick();
		elem.val("获取验证码");
		clearInterval(timeInt);
	}				
}

//校对验证码
function checkCode(){

	//如果验证码错误
	showError($("#getCodeBtn"),"验证码错误");
	return false;
}

//请求注册
function register(){
	if(!isRightPhone||!checkPs()||!checkPs2()||!checkAccept()){
		return;
	}
	var json={};
	json.phone=$("#phoneNum").val();
	json.password=$("#passwordReg").val();
	doAjax(json,"register",regCallback)
}



function logCallback(data){
	if(data.result=="0"){
		var elem=$("#username");
		showError(elem,"用户名不存在");
		var timeout=setTimeout(showRight(elem),6000);
	}
	if(data.result=="1"){
		var elem=$("#password");
		showError(elem,"密码错误");
	}
	
}


//注册结果
function regCallback(data){
	try{
		if(data.result==="0"){
			return swal({
				title:"注册成功",
				text:"点击确定直接登录",
				confirmButtonText:"确定",
			},function(isConfirm){				
				window.location.href="index";
			});
		}else if(data.result==="1"){
			returnswal({
				title:"注册失败",
				text:"点击确定直接登录",
				confirmButtonText:"确定",
			},function(isConfirm){
			});
		}
	} catch(e){
		alert("注册失败："+e);
	}
}