<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——员工页面</title>
	<link rel="stylesheet" type="text/css"
	href="${ctx}/css/chaoJiGuanLiYuan.css">
<link type="image/x-icon" rel="shortcut icon" href="/images/logo.jpg" />
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
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
			<button class="leftBtn" id="user">商家店铺审核管理</button>
			<button class="leftBtn" id="seller">商家商品审核管理</button>
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
			<!-- <hr/> -->
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>
	
	<!-- 脚本 -->
	<script type="text/javascript">
	$(document).ready(
			function() {
				height = (document.body.clientHeight - 140) * 0.85 + 60;
				// height=500;
				width = $("div.tabsFrame").width();
				// console.log(height+","+width);
				isAdd = false; // 定义是添加还是修改
				curPanel = ""; // 定义当前panel
				$("#user").on("click", function() {
					curPanel = 'shoperPanel'
					openTag("商家店铺审核管理");
				});
				$("#seller").on("click", function() {
					curPanel = 'shopPanel'
					openTag("商家商品审核管理");
				});
				$("#info").on("click", function() {
					curPanel = 'infoPanel'
					openTag("信息管理");
				});
				$("#headClose").on("click", function() {
					Custombox.close('fast');
				});
				$("#cancle").on("click", cancle);

				// 设置窗口关闭确认提示框
				$('#tt').tabs(
						{
							width : width,
							height : height,
							onBeforeClose : function(title, index) {
								var target = this;
								$.messager.confirm('Confirm', '确定关闭 ' + title
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
							onSelect : function(title) { // 定义当前页面
								if (title === "商家店铺审核管理") {
									curPanel = "shoperPanel";
								} else if (title === "商家商品审核管理") {
									curPanel = "shopPanel";
								} else {
									curPanel = "infoPanel";
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
	function openTag(str) {
		var ifExist = $('#tt').tabs('exists', str); // 判断是否存在当前tab panel
		if (ifExist) {
			$('#tt').tabs('select', str); // 存在就切换到该panel
		} else {
			addPanel(str); // 否则就新建一个panel
			// doAjax({"curPanel":curPanel,"pageNumber":"1"},"",refreshList);

		}
	}
	// 根据用户名来查询用户
	function doSearch() {
		// 获取用户名
		var v_userName = $("#user_name").val();
		var queryParams = $('#userPanel').datagrid('options').queryParams;
		queryParams.user_name = v_userName;
		$("#shoperPanel").datagrid('options').queryParams = queryParams;
		$("#shoperPanel").datagrid('reload');

	}

	// 添加panel
	function addPanel(title) {
		if (title == "商家店铺审核管理") {

			var search = '<div class="searchDiv">手机号：<input type="text" class="search" id="user_name" value="" placeholder="请输入手机号码">&nbsp;&nbsp;<input type="button" onclick="doSearch()" value="搜索"></div>';
		}
		if (title == "商家商品审核管理") {
			var kk = '<div class="searchDiv">商家状态:<select><option value="0">正常</option><option value="1">商铺审核通过</option><option value="2">商铺审核未通过</option></select></div>&nbsp;&nbsp;<input class="class" type="button" value="搜索">';
			var search = '<div class="searchDiv">手机号：<input type="text" class="search" value="" placeholder="请输入手机号码"></div>'
					+ kk;
		}
		var contentStr = '' + search + '' + '<table id="' + curPanel + '"></table>'
				+ '<div id="' + curPanel
				+ 'Page" style="background:#efefef;border:1px solid #ccc;"></div>';
		$('#tt').tabs('add', {
			title : title,
			content : contentStr,
			closable : true,
		});

		/***************************************************************************
		 * xiaoqiang
		 */

		$(function() {
			
			 //商家管理页面内容
			$('#shoperPanel').datagrid({
				// 编写datagrid数据格式
				method : "post",
				url : "findTShopReviewList",
				fitColumns : true,
				autoRowHeight : false,
				striped : true,
				loadMsg : "<span style='color:red;'>正在加载数据....</span>",
				pagination : true,
				singleSelect : false,
				checkOnSelect : true,
				selectOncheck : true,
				pagination : true,
				rownumbers : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				columns : [ [ {
					field : 'id',
					title : '用户账号',
					width : '8%',
					align : 'center',
					
				}, {
					field : 'name',
					title : '商家姓名',
					width : '18%',
					align : 'left',
				}, {
					field : 'indentifyId',
					title : '商家省份证号',
					width : '12%',
					align : 'center',

				},

				{
					field : 'product_type',
					title : '产品类型',
					width : '18%',
					align : 'center'
				}, {
					field : 'chat_info',
					title : '商家电话',
					width : '7%',
					align : 'center',

				}, {
					field : 'shop_name',
					title : '商家店名',
					width : '7%',
					align : 'center',			
				} , {
					field : 'shop_addr',
					title : '商家地址',
					width : '7%',
					align : 'center',			
				}, {
					field : 'apply_status',
					title : '商家审核状态',
					width : '7%',
					align : 'center',			
				} , {
					field : 'applyTime',
					title : '申请时间',
					width : '7%',
					align : 'center',			
				}, {
					field : 'passApply',
					title : '通过时间',
					width : '7%',
					align : 'center',			
				} ,{
					field : 'reserved1',
					title : '营业执照类型',
					width : '7%',
					align : 'center',			
				} 
				,{
					field : 'reserved2',
					title : '未通过原因',
					width : '7%',
					align : 'center',			
				} 
				] ],
				loadFilter : function(data) {
					return {
						total : data.total,
						rows : data.rows
					};
				},
				toolbar : [  {
					text : '店铺审核',
					iconCls : 'icon-edit',
					handler : function() {
						editUser()
					}
				}, '-', {
					text : '查看详情',
					iconCls : 'icon-cancel',
					handler : function() {
						delUser()
					}
				} ],
				onClickRow : function(field, row) {
					$('#shoperPanel').datagrid("unselectAll");// 取消选中当前所有行
					$('#shoperPanel').datagrid("selectRow", field);// 选中当前点击的行

				},
			});
			
		});

	}

	
	// 取消按钮
	function cancle() {
		$('#textForm').window('close');
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
	
	function editUser(){
		//获取某行的主键id便于查找
		var curRow = $("#shoperPanel").datagrid('getSelected');
		alert(curRow.id);
		var id =curRow.id;
		//转接到商家资料审核页面
		window.location.href ="reviewShoper?id="+id;
	
	}
	
	</script>
	
	
</body>
</html>