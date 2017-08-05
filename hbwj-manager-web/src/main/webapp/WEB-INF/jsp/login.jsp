<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——登录注册页面</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/dengLuZhuCe.css">
	<link type="image/x-icon" rel="shortcut icon" href="${ctx}/images/logo.jpg" />
	<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/js/dengLuZhuCe.js"></script>
	<script type="text/javascript" src="${ctx}/js/sweetalert.min.js"></script>
	
</head>
<body>
<!--[if lt IE 9]>
    <p class="notSupportP">您当前ie版本过低，部分网页功能无法正常显示，建议升级至较新版本（<a href='https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads/' target="_blank" class="notSupportA">ie9以上</a>）或更换至其他浏览器（如<a href='http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html' target="_blank" class="notSupportA">谷歌chrome</a>、<a href='http://se.360.cn/' target="_blank" class="notSupportA">360浏览器</a>等）。</p>
     <![endif]-->
	<header class="header">
		<div class="headerMsg">
			货比五家商家后台管理系统
		</div>
	</header>
	<article>
		<div class="imgDiv">
			<img src="${ctx}/images/bgLeft.jpg" class="leftImg" alt="货比五家">
		</div>

		<form class="login" id="login" action="${ctx}/hbwj/enter/login"  method="post" >
			<p>用户登录</p>

			<div class="item">
				<label for="username">用户名</label><br/>
				<input type="text" class="textin" name="username" id="username" placeholder="请输入手机号码"/>
			</div>

			<div class="item">
				<label for="password">密码</label><br/>
				<input type="password" class="textin" name="password" id="password" placeholder="请输入6至16位密码"/><br/>
				<a href="" class="forgetPw">忘记密码？</a>
			</div>

			<div class="item">
				<input type="checkbox" name="remember" id="remember" /><label for="remember"><span class="rem">
				记住用户名和密码</span></label>
			</div>


			<div class="item">
				<!-- <input type="botton" class="button" id="login1" name="login" value="登录" /> -->
				<input type="submit" class="button" id="login1" name="login" value="登录" onclick="javascript:return true"/>
				<input type="button" id="registerBtn" class="button" name="registerBtn" value="注册" />
			</div>
		</form>

		<form class="register" id="register" action="" method="post">
			<p>用户注册</p>

			<div class="item">
				<label for="phoneNum">手机号码</label><br/>
				<input type="text" class="textin" name="phoneNum" id="phoneNum" placeholder="请输入手机号" />
			</div>

			<div class="item">
				<label for="passwordReg">密码</label><br/>
				<input type="password" class="textin" name="passwordReg" id="passwordReg" placeholder="请输入6至16位密码"/>
			</div>

			<div class="item">
				<label for="password2Reg">确认密码</label><br/>
				<!-- 隐藏返回的验证码 -->
				<input type="password" class="textin" name="password2Reg" id="password2Reg" placeholder="请确认密码"/>
			</div>

			<div class="item">
				<label for="code">手机验证码</label><br/>
				<input type="hidden" id="code1" value=""/>
				<input type="text" class="textin code" id="code" placeholder="请输入验证码"/>
				
				<input type="button"  name="getCodeBtn" id="getCodeBtn" value="获取验证码" />
			</div>

			<div class="item">
				<input type="checkbox" name="accept" id="accept" />
				<label for="accept" class="acceptLab">我已阅读并接受</label><a class="accept" href="http://www.baidu.com" id="acceptA">货比五家服务条款</a>
			</div>

			<div class="item">
				<input type="button" id="doRegister" class="button" name="doRegister" value="确认注册" />
				<input type="button" id="backLogin" class="button" name="backLogin" value="返回登录" />
			</div>
		</form>
	</article>

	<footer class="footer">
		<div class="footerMsg">
			<!-- <hr/> -->
			<br/>
			Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Right Reserved.<br/>
			联系电话：020-29061583
		</div>		
	</footer>
	<c:if test="${ not empty message}">
		<script type="text/javascript">		  
		  showError( $("#password"),"密码错误!");		
	</script>
	</c:if>
	
	<c:if test="${ not empty massage}">
		<script type="text/javascript">		  
		  showError( $("#username"),"用户不存在!");		
	</script>
	</c:if>
</body>
</html>