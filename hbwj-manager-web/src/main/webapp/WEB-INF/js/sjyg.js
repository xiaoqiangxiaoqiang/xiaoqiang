$(document).ready(
		function() {
			var win = window;
			 var doc = win.document;
			 var input = doc.createElement ("input");

			 var ie = (function (){
			 //"!win.ActiveXObject" is evaluated to true in IE11
			 if (win.ActiveXObject === undefined) return null;
			 if (!win.XMLHttpRequest) return 6;
			 if (!doc.querySelector) return 7;
			 if (!doc.addEventListener) return 8;
			 if (!win.atob) return 9;
			 //"!doc.body.dataset" is faster but the body is null when the DOM is not
			 //ready. Anyway, an input tag needs to be created to check if IE is being
			 //emulated
			 if (!input.dataset) return 10;
			 return 11;
			 })();
			 if(ie==8||ie==7||ie==6){
			     alert("您当前ie"+ie+"版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
			 }
			height = (document.body.clientHeight - 140) * 0.85 + 60;
			width = $("div.tabsFrame").width();
			isAdd = false; // 定义是添加还是修改
			curPanel = ""; // 定义当前panel
			
			$("#goods").on("click", function() {
				curPanel = 'goodsPanel'
				openTag("商品管理");
			});
			$("#order").on("click", function() {
				curPanel = 'orderPanel'
				openTag("订单管理");
			});
			$("#headClose").on("click", function() {
				Custombox.close('fast');
			});
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
							if (title === "商品管理") {
								curPanel = "goodsPanel";
							} else if(title === "订单管理") {
								curPanel = "orderPanel";
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

// 添加panel
function addPanel(title) {
	if (title == "商品管理") {

		var search = '<div class="searchDiv">手机号：<input type="text" class="search" id="user_name" value="" placeholder="请输入手机号码">&nbsp;&nbsp;<input type="button" onclick="doSearch()" value="搜索"></div>';
	}
	if (title == "订单管理") {
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
		
		$('#goodsPanel').datagrid({
			// 编写datagrid数据格式
			method : "post",
			url : "",
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
				field : 'goods_id',
				title : '商品编号',
				width : '8%',
				align : 'center',
				
			},{
				field : 'goods_name',
				title : '商品名',
				width : '18%',
				align : 'left',
			},{
				field : 'sell_point',
				title : '商品买点',
				width : '18%',
				align : 'left',
			},{
				field : 'goods_price',
				title : '商品价格',
				width : '18%',
				align : 'left',
			},{
				field : 'goods_num',
				title : '商品数量',
				width : '18%',
				align : 'left',
			},{
				field : 'shopStatus',
				title : '商品审核状态',
				width : '18%',
				align : 'left',
			},{
				field : 'status',
				title : '商品状态',
				width : '18%',
				align : 'left',
			},{
				field : 'createTime',
				title : '上传时间',
				width : '18%',
				align : 'left',
			},{
				field : 'updateTime',
				title : '更新时间',
				width : '18%',
				align : 'left',
			}
			] ],
			loadFilter : function(data) {
				return {
					total : data.total,
					rows : data.rows
				};
			},
			toolbar : [ {
				text : "添加商品",
				iconCls : 'icon-add',
				handler : function() {
					addUser()
				}
			}, '-', {
				text : '修改商品',
				iconCls : 'icon-edit',
				handler : function() {
					editUser()
				}
			}, '-', {
				text : '删除商品',
				iconCls : 'icon-cancel',
				handler : function() {
					delUser()
				}
			} ],
			onClickRow : function(field, row) {
				$('#goodsPanel').datagrid("unselectAll");// 取消选中当前所有行
				$('#goodsPanel').datagrid("selectRow", field);// 选中当前点击的行

			},
		});
		$(".datagrid-toolbar").append($("#datagridsearch"));
		$(".datagrid-toolbar").css("height", "auto");
		
	});
}


    //添加商品
function addUser(){
	//重定向到商品添加页面
	window.location.href = "addShop";
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