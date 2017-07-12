<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<title>货比五家——管理员系统</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/chaoJiGuanLiYuan.css">
<link type="image/x-icon" rel="shortcut icon" href="/images/logo.jpg" />
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/sjgly.js"></script>
</head>
<body>
	<header class="header">
		<div class="headerMsg">货比五家商家后台管理系统</div>
		<div class="headerUser">
			<div class="headerText" style="font-size: 20px; color: red;">
				欢迎你:<span id="admin">${user.getUser_name()}</span> <a href=""
					class="exit" title="退出登录" style="font-size: 30px; color: green;">[退出登录]</a>
			</div>
		</div>
	</header>
	<div class="pageContent">
			
		<aside class="leftSide">
			<li class="menuLi">菜单选项</li>
			<button class="leftBtn" id="emp">员工管理</button>
			<button class="leftBtn" id="goods">商品管理</button>
			<button class="leftBtn" id="order">订单管理</button>
			<button class="leftBtn" id="info">信息管理</button>
		</aside>

		<article class="content">
			<div class="tabsFrame">
				<div id="tt" class="easyui-tabs"></div>
			</div>

		</article>

	</div>

	<div class="textForm" id="textForm" style="width: 500px;">
		<form class="register" id="register" style="text-align:center; width: 500px;"  action="" method="post">
		
			<div class="item">
				<label for="phoneNum">手机号码</label><br/>
				<input type="text" class="textin" name="phoneNum" id="phoneNum"  placeholder="请输入手机号" />
			</div>

			<div class="item">
				<label for="passwordReg">密码</label><br/>
				<input type="password" class="textin" name="passwordReg" id="passwordReg" placeholder="请输入6至16位密码"/>
			</div>

			<div class="item">
				<label for="password2Reg">确认密码</label><br/>
				<input type="password" class="textin" name="password2Reg" id="password2Reg" placeholder="请确认密码"/>
			</div>

			<div class="item">
				<label for="code">手机验证码</label><br/>
				<input type="text" class="textin code" id="code" placeholder="请输入验证码"/>
				<input type="button"  name="getCodeBtn" id="getCodeBtn" value="获取验证码" />
			</div>

			<div class="item" style="text-align: center;">
				<input type="button" id="doRegister" class="button" onclick="save()" value="注册" />
				<input type="button" id="backLogin" class="button"  onclick="cancle()" value="取消" />
			</div>
		</form>
	</div>
	
		<div class="textForm" id="textForm1" style="width: 500px;">
		<form class="register" id="register" style="text-align:center; width: 500px;"  action="" method="post">
			<div class="item">
				<label for="phoneNum">手机号码</label><br/>
				<input type="text" class="textin" name="phoneNum" id="phoneNum"  placeholder="请输入手机号" />
			</div>

			<div class="item">
				<label for="passwordReg">密码</label><br/>
				<input type="password" class="textin" name="passwordReg" id="passwordReg" placeholder="请输入6至16位密码"/>
			</div>

			<div class="item" style="text-align: center;">
				<input type="button" id="doRegister" class="button" onclick="save1()" value="注册" />
				<input type="button" id="backLogin" class="button"  onclick="cancle1()" value="取消" />
			</div>
		</form>
	</div>
	

	<footer class="footer">
		<div class="footerMsg">
			<!-- <hr/> -->
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>
</body>
</html>