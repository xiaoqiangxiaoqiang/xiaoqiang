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

<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />

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
			<button class="leftBtn" id="goods">商品管理</button>
			<button class="leftBtn" id="order">订单管理</button>
		</aside>

		<article class="content">
			<div class="tabsFrame">
				<div id="tt" class="easyui-tabs"></div>
			</div>

		</article>

	</div>
	<footer class="footer">
		<div class="footerMsg">
			<!-- <hr/> -->
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>
	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript" src="${ctx}/js/sjyg.js"></script>
</body>
</html>