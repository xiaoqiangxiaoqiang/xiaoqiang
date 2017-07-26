<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——员工页面</title>
<link type="image/x-icon" rel="shortcut icon" href="/images/logo.jpg" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
 <link rel="stylesheet" type="text/css" href="${ctx}/css/gongSiYuanGong.css">
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
</head>
	<body>
	<header class="header">
		<div class="headerMsg">货比五家商家后台管理系统</div>
		<div class="headerUser">
			<div class="headerText">
				欢迎你:<span id="loginUser">${user.user_name}</span> 
				<a href="" class="exit" title="退出登录">[退出登录]</a>
			</div>
		</div>
	</header>

	<div class="pageContent">
		<aside class="leftSide">
			<li class="menuLi">菜单选项</li>
			<button class="leftBtn" id="shangJia">商家管理</button>
			<button class="leftBtn" id="shangPin">商品管理</button>
			<button class="leftBtn" id="order">订单管理</button>
			<button class="leftBtn" id="info">信息管理</button>
		</aside>

		<article class="content">
			<div class="tabsFrame">
				<div id="tt" class="easyui-tabs"></div>
			</div>
		</article>
	</div>

	<footer class="footer">
		<div class="footerMsg">
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>

	<script>
		$(document).ready(
			function() {
		//datagrid的高度：窗口的高度-头尾的高度160px
		height = (document.body.clientHeight- 160) * 0.9+50;
		width = $("div.tabsFrame").width();

		$("#shangJia").on("click", function() {
			curUrl="";
			openTag("商家管理");
		});
		$("#shangPin").on("click", function() {
			curUrl="";
			openTag("商品管理");
		});
		$("#order").on("click", function() {
			curUrl="";
			openTag("订单管理");
		});
		$("#info").on("click", function() {
			curUrl="";
			openTag("信息管理");
		});

		//发送ajax测试员工电话号码是否被注册
		$("#phoneNum").blur(function (){
			var userName = $("#phoneNum").val();
			var json ={};
			json.username=userName;
			doAjax(json,"testPhone",addCallback);
		});

			// 设置窗口关闭确认提示框
			$('#tt').tabs({
				width : width,
				height : height,
				//关闭前提示
				onBeforeClose : function(title, index) {
					var target = this;
					$.messager.confirm('提示', '确定关闭 ' + title
						+ " 窗口？", function(r) {
							if (r) {
								var opts = $(target).tabs('options');
								var bc = opts.onBeforeClose;
								opts.onBeforeClose = function() {
								};
								$(target).tabs('close', index);
								opts.onBeforeClose = bc;
							}
						});
					return false;
				},
				// 定义当前页面
				onSelect : function(title) { 
					if (title === "用户管理") {
						curUrl="";
					} else if (title === "商家管理") {
						curUrl="";
					} else if(title === "订单管理") {
						curUrl="";
					}else{
						curUrl="";
					}
				}
			})
			$('#tt').tabs('add', {
				title : '欢迎',
				content : '欢迎进入管理系统！',
				closable : true,
			});
		});

// 点击左侧菜单打开对应标签框
function openTag(title,fromOut,url,arg) {
	//如果是从外部iframe调用该方法，如添加商品
	if(fromOut){
		addPanel(title,url,arg); 
		return;
	}
	// 判断是否存在当前tab panel
	var ifExist = $('#tt').tabs('exists', title); 
	if (ifExist) {
		 // 存在就切换到该panel
		 $('#tt').tabs('select', title);
		} else {
			// 否则就新建一个panel
			addPanel(title); 
		}
	}

// 添加panel
function addPanel(title,url,arg) {
	var str="";
	var frame="";
	switch(title.substring(0,4)){
		case "商家管理":
		frame="companyEmpReview";
		break;
		case "商品管理":
		frame="companyEmpProduct";
		break;
		case "订单管理":
		frame="dingDanIframe.html";
		break;
		case "信息管理":
		frame="xinXiIframe.html";
		break;
		case "查看商家":
		frame="viewAuthorityInfo?id="+arg;
		break;
		case "审核商家":
		frame="ReviewAuthority?id="+arg;
		break;
		case "查看商品":
		frame="companyEmpProductManager?id="+arg;
		break;
		case "审核商品":
		frame="authorityProduct?id="+arg;
		break;
		default:
		return;
	}
	var iframeStr='<iframe src="'+frame+'" scrolling="yes" width="'+(width-3)+'" height="'+(height-35)+'" frameborder=0></iframe>';
	$('#tt').tabs('add', {
		title : title,
		content : iframeStr,
		closable : true,
	});
}
	// ajax请求
	function doAjax(json, url, callback) {
		$.ajax({
			type : 'POST',
			url : url,
			data : json,
			dataType : 'JSON',
			success : function(data) {
				callback(data);
			},
			error : function() {
			}
		})
	}
</script>
</body>
</html>