<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="UTF-8">
<!-- 页面描述 -->
<meta name="description"
	content="货比五家官网，由广州市终点站网络科技有限公司开发管理运营。旨在为用户提供更优惠实在的产品，为商家拉拢更多的客户，达到“三赢”。" />
<!-- 页面关键词 -->
<meta name="keywords" content="货比五家,huobiwujia,终点站科技,广州市终点站" />
<link type="image/x-icon" rel="shortcut icon"
	href="${ctx}/images/index/logo.jpg" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<title>货比五家官网——huobiwujia.com</title>
</head>
<body>
	<div class="header">
		<div class="header-logo">
			<a href="http://www.baidu.com"><img
				src="${ctx}/images/index/nav_logo.jpg" alt="nav_logo"
				class="head-img"></a>
		</div>
		<div class="header-nav">
			<a class="header-nav-a" href="${ctx}/hbwj/enter/index">首页</a> <a
				class="header-nav-a active" href="">用户登陆</a> <a class="header-nav-a"
				href="${ctx}/hbwj/enter/register">商家入驻</a> <a class="header-nav-a"
				href="${ctx}/hbwj/enter/help">帮助中心</a>
		</div>
	</div>
	<div class="main login-main">
		<div class="main-section login">
			<p class="login-head">
				用户登陆<span class="login-span">还没账号?<a
					href='${ctx}/hbwj/enter/register' class="login-a">立即注册入驻</a></span>
			</p>
			<div class="login-left-div" id="login-left-div">
				<form action="${ctx}/hbwj/enter/userLogin" method="post">
					<div class="login-div">
						<!--[if lt IE 10]>
                    <div class="fuck-ie pw2-ie">手机号:</div>
                    <![endif]-->

						<div class="login-input-img" id="name-img"></div>
						<input class="login-input" id='username' name="username"
							type='text' placeholder="输入手机号" /> <span
							class="input-error error1">请输入正确手机号</span> <span
							class="input-error error2">用户不存在</span>
					</div>
					<div class="login-div">
						<!--[if lt IE 10]>
                    <div class="fuck-ie pw2-ie">密码:</div>
                    <![endif]-->
						<div class="login-input-img" id="pw-img"></div>
						<input class="login-input" id="password" name='password'
							type="password" placeholder="密码" /> <span
							class="input-error error1">密码长度在6至16位</span> <span
							class="input-error error2">密码错误</span>
					</div>
					<p class="login-p">
						<input type="checkbox" id="remember" /><label for="remember">记住用户名和密码</label><a
							href="${ctx}/hbwj/enter/forget" class="forget-a">忘记密码?</a>
					</p>
					<div class="login-warp">
						<div id="login" class="button">登陆</div>
						<!--<div id="buttonMask"></div>-->
					</div>
				</form>
			</div>
			<div class='login-right-div'>
				<img class="login-img" src="${ctx}/images/index/login.jpg">
			</div>
		</div>

		<div class="main-contact-div">
			<div class="main-contact-left">
				<div class="contact-figure">
					<img src="${ctx}/images/index/code1.jpg" class="contact-img">
					<p class="figcaption">扫码关注</p>
				</div>
				<div class="contact-figure">
					<img src="${ctx}/images/index/code2.jpg" class="contact-img">
					<p class="figcaption">扫码关注</p>
				</div>
			</div>
			<div class="main-contact-right">
				<h3 class="contact-title">联系我们</h3>
				<p class="contact-p">客服电话：020-29061583</p>
				<p class="contact-p">商家热线：020-29061583</p>
				<p class="contact-p">广州市终点站网络科技有限公司</p>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>Copyright&ensp;&copy;&ensp;2017&ensp;huobiwujia.com&ensp;&ensp;All
			rights reserved.</p>
		<p>粤ICP备15106664号&ensp;&ensp;广州市越秀区环市西路202号&ensp;&ensp;邮编:510010</p>
	</div>
	<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.cookie.js"></script>
	<script>
            var win = window;
            var doc = win.document;
            var input = doc.createElement("input");

            var ie = (function () {
                //"!win.ActiveXObject" is evaluated to true in IE11
                if (win.ActiveXObject === undefined)
                    return null;
                if (!win.XMLHttpRequest)
                    return 6;
                if (!doc.querySelector)
                    return 7;
                if (!doc.addEventListener)
                    return 8;
                if (!win.atob)
                    return 9;
                //"!doc.body.dataset" is faster but the body is null when the DOM is not
                //ready. Anyway, an input tag needs to be created to check if IE is being
                //emulated
                if (!input.dataset)
                    return 10;
                return 11;
            })();
            
            if (ie==9||ie == 8 || ie == 7 || ie == 6) {
//                alert("您当前ie" + ie + "版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
            }

            //读取cookie
            if ($.cookie("isRem") == "true") {
                $("#remember").prop("checked", true);
                $("#username").val($.cookie("username"));
                $("#password").val($.cookie("password"));
            }

            //记住密码
            $("#remember").on('click', saveCookie);
            function saveCookie() {
                if ($("#remember").prop("checked")) {
                    var usernameStr = $("#username").val();
                    var passwordStr = $("#password").val();
                    $.cookie("username", usernameStr, {expires: 7, path: '/', secure: false});
                    $.cookie("password", passwordStr, {expires: 7, path: '/', secure: false});
                    $.cookie("isRem", "true", {expires: 7, path: '/', secure: false});
                    console.log($.cookie('isRem'));
                } else {
                    $.cookie("isRem", "false", {expires: -1});
                    $.cookie("username", "", {expires: -1});
                    $.cookie("password", "", {expires: -1});
                }
            }

            $("#login-left-div").on('focus', 'input.login-input', function () {
                $(this).parent().css('border-color', 'black');
            });

            //手机号码检测
            $('#username').blur(checkPhone);
            function checkPhone() {
                var elem = $('#username');
                var tel = elem.val();
                if(tel=="admin"){
                	return true;
                }
                if (tel.length < 11 || !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
                {
                    elem.siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    return false;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
                    return true;
                }
            }

            //密码检测
            $('#password').blur(checkPw);
            function checkPw() {
                var elem = $('#password');
                var pw = elem.val();
                if (pw.length < 6 || pw.length > 16)
                {
                    elem.siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    return false;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
                    return true;
                }
            }

            //登陆
            $('#login').click(function () {
            	if (!checkPhone() || !checkPw()) {
                    return;
                }
                saveCookie();
               $("form").submit();
            })

            function callback(data) {
                if (data.result == "0") {
//                    $('#buttonMask').hide();
                    var elem = $("#username");
                    elem.siblings('span').hide().filter('span.error2').show().parent().css('border-color', 'red');
                    return;
                }
                //密码错误
                if (data.result == "1") {
//                    $('#buttonMask').hide();
                    var elem = $("#password");
                    elem.siblings('span').hide().filter('span.error2').show().parent().css('border-color', 'red');
                    return;
                }
                if (data.result == '3') {

                }
            }
        </script>
</body>
</html>