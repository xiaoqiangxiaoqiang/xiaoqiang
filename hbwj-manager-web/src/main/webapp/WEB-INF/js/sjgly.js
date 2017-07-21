$(document).ready(
		function() {
			height = (document.body.clientHeight - 140) * 0.85 + 60;
			width = $("div.tabsFrame").width();
			isAdd = false; // 定义是添加还是修改
			curPanel = ""; // 定义当前panel
			$("#emp").on("click", function() {
				curPanel = 'empPanel'
				openTag("员工管理");
			});
			$("#goods").on("click", function() {
				curPanel = 'goodsPanel'
				openTag("商品管理");
			});
			$("#order").on("click", function() {
				curPanel = 'orderPanel'
				openTag("商品管理");
			});
			$("#info").on("click", function() {
				curPanel = 'infoPanel'
				openTag("信息管理");
			});
			$("#headClose").on("click", function() {
				Custombox.close('fast');
			});
			$("#save").on("click", save);
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
							if (title === "员工管理") {
								curPanel = "empPanel";
							} else if (title === "商品管理") {
								curPanel = "goodsPanel";
							} else if(title === "订单管理") {
								curPanel = "orderPanel";
							}else{
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
	$("#empPanel").datagrid('options').queryParams = queryParams;
	$("#empPanel").datagrid('reload');

}

// 添加panel
function addPanel(title) {
	if (title == "用户管理") {

		var search = '<div class="searchDiv">手机号：<input type="text" class="search" id="user_name" value="" placeholder="请输入手机号码">&nbsp;&nbsp;<input type="button" onclick="doSearch()" value="搜索"></div>';
	}
	if (title == "商家管理") {
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
		//发送ajax测试员工电话号码是否被注册
			$("#phoneNum").blur(function (){
				alert("sdfsk");
				var userName = $("#phoneNum").val();
				var json ={};
				json.username=userName;
				doAjax(json,"testPhone",addCallback);
			});
		
		$('#empPanel').datagrid({
			// 编写datagrid数据格式
			method : "post",
			url : "findChildEmp",
			fitColumns : true,
			autoRowHeight : false,
			striped : true,
			loadMsg : "<span style='color:red;'>正在加载数据....</span>",
			pagination : true,
			queryParams:{
				user_parent:$("#admin").html(),
    	               },
			singleSelect : false,
			checkOnSelect : true,
			selectOncheck : true,
			pagination : true,
			rownumbers : true,
			pageSize : 10,
			pageList : [ 10, 20, 30 ],
			columns : [ [ {
				field : 'user_id',
				title : '用户id',
				width : '8%',
				align : 'center',
				
			}, {
				field : 'user_name',
				title : '用户名',
				width : '18%',
				align : 'left',
			}, {
				field : 'user_parent',
				title : '父用户',
				width : '12%',
				align : 'center',

			},

			{
				field : 'status',
				title : '用户状态',
				width : '18%',
				align : 'center'
			}, {
				field : 'createTime',
				title : '创建时间',
				width : '7%',
				align : 'center',
				formattime : function(value, row, index) {
					return value + "年";
				},

			}, {
				field : 'updateTime',
				title : '更新时间',
				width : '7%',
				align : 'center',
				formattime : function(value, row, index) {
					return value + "年";
				},
			} ] ],
			loadFilter : function(data) {
				return {
					total : data.total,
					rows : data.rows
				};
			},
			toolbar : [ {
				text : "添加",
				iconCls : 'icon-add',
				handler : function() {
					addUser()
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					editUser()
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-cancel',
				handler : function() {
					delUser()
				}
			} ],
			onClickRow : function(field, row) {
				$('#empPanel').datagrid("unselectAll");// 取消选中当前所有行
				$('#empPanel').datagrid("selectRow", field);// 选中当前点击的行

			},
		});
		
		//商品管理
		$('#goodsPanel').datagrid({
			// 编写datagrid数据格式
			method : "post",
			url : "",
			fitColumns : true,
			autoRowHeight : false,
			striped : true,
			loadMsg : "<span style='color:red;'>正在加载数据....</span>",
			pagination : true,
			queryParams:{
				user_parent:$("#admin").html(),
		               },
			singleSelect : false,
			checkOnSelect : true,
			selectOncheck : true,
			pagination : true,
			rownumbers : true,
			pageSize : 10,
			pageList : [ 10, 20, 30 ],
			columns : [ [ {
				field : 'sku_id',
				title : '商品编号',
				width : '8%',
				align : 'center',
				
			}, {
				field : 'sku_name',
				title : '商品名称',
				width : '18%',
				align : 'left',
			}, {
				field : 'ori_price',
				title : '商品原价',
				width : '12%',
				align : 'center',

			},

			{
				field : 'now_price',
				title : '现价',
				width : '18%',
				align : 'center'
			}
			,

			{
				field : 'sku_amount',
				title : '库存',
				width : '18%',
				align : 'center'
			}
			,

			{
				field : 'sku_num',
				title : '销售量',
				width : '18%',
				align : 'center'
			}, {
				field : 'createTime',
				title : '创建时间',
				width : '7%',
				align : 'center',
				formattime : function(value, row, index) {
					return value + "年";
				},

			}, {
				field : 'updateTime',
				title : '更新时间',
				width : '7%',
				align : 'center',
				formattime : function(value, row, index) {
					return value + "年";
				},
			} ] ],
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
					addProduct()
				}
			}, '-', {
				text : '修改商品',
				iconCls : 'icon-edit',
				handler : function() {
					editProduct()
				}
			}, '-', {
				text : '删除商品',
				iconCls : 'icon-cancel',
				handler : function() {
					delUser()
				}
			}, '-', {
				text : '提交审核',
				iconCls : 'icon-edit',
				handler : function() {
					review()
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
function addProduct(){
	alert("sdfgsad");
	location.href="${ctx}/../../product/index";
	alert("sdgs");
}


//添加用户
function addUser(){
	isAdd = true;
	$("#formUsername").prop("disabled", false);
	$("#textForm").window({
		title : '添加用户',
		modal : true,
		closed : true,
		minimizable : false,
		maximizable : false,
		resizable : false,
		collapsable : false,
		collapsible : false,
		iconCls : 'icon-edit'
	});
	$("#textForm input[type='text']").val("");
	$("#textForm").window('open');
}

//更新用户信息
function editUser() {
	isAdd = false;
	var row = $("#empPanel").datagrid('getSelected');
	alert(row.user_id);
	if (row != null) {
		$("#formUsername").prop("disabled", "disabled"); // 用户名不能修改
		$("#textForm1").window({
			title : '修改用户',
			modal : true,
			closed : true,
			minimizable : false,
			maximizable : false,
			resizable : false,
			collapsable : false,
			collapsible : false,
			iconCls : 'icon-edit'
		});
		$("#textForm1").window('open');
	} else {
		$.messager.alert('提示', '请先选择要修改的用户');
	}
}

// 删除用户
function delUser() {
	var curRow = $("#empPanel").datagrid('getSelected');
	alert(curRow.user_id);
	if (curRow == null) {
		$.messager.alert('提示', '请先选择用户');
	} else {
		$.messager.confirm('删除用户', '确定删除该用户？', function(r) {
			if (r) {
				var json = {};
				json.user_id = curRow.user_id;
				doAjax(json, "deleteSysUser", delCallback);
			}
		});
	}
}

// 点击删除后的回调函数
function delCallback(data) {
	try {
		if (data.result == 0) {
			$.messager.alert('提示', '删除成功！');
			$("#empPanel").datagrid('reload');
			return;
		} else if (data.result == 1) {
			$.messager.alert('提示', '删除失败！');
			return;
		}
	} catch (e) {
		alert("服务器出错： " + e);
	}
}





// 保存
function save() {
	var json = {};
	var url = ""; // 初始化保存地址
	json.curPanel = curPanel;
	json.pageNumber = $("div#" + curPanel + "Page input.pagination-num").val();
	
	if(isAdd){
		var userName = $("#phoneNum").val();
		if(userName==undefined || userName==null || userName==""){
			$.messager.alert('提示', '用户名不能为空！');
			return ;
		}
		json.username = userName;
		var password = $("#passwordReg").val();
		if(password==undefined || password==null || password==""){
			$.messager.alert('提示', '密码不能为空！');
			return ;
		}
		if(password.length<6||password.length>16){
			$.messager.alert('提示', '密码长度在6到16位字符');
			return ;
		}
		
		//获取2次输入的密码
		var pwd = $("#password2Reg").val(); 
		if(pwd==undefined || pwd==null || pwd==""){
			$.messager.alert('提示', '确认密码不能为空！');
			return ;
			
		} 
		if(password!=pwd){
			$.messager.alert('提示', '前后密码不一致！');
			return ;
		}
		json.password =password ;
		//获取父用户的信息
		json.user_parent=$("#admin").html();
		url = "addShopEmp"; // 添加地址
	}else{
		var row = $("#userPanel").datagrid('getSelected');
		var user_id = row.user_id;
		var password = $("#formPassword").val()
		if(password==undefined || password==null || password==""){
			$.messager.alert('提示', '密码不能为空！');
			return ;
		}
		json.username =userName ;
		json.password =password ;
		json.user_id = user_id;
		
		url = "admin/updateComShop"; // 修改地址
	}
	doAjax(json, url, addCallback);
}

//取消按钮
function cancle() {
	$('#textForm').window('close');
}

//添加的回调函数
function addCallback(data) {
	try {
		if (data.result == "0") {
			$.messager.alert('提示','用户名已存在！');
		} else if(data.result == "1"){
			cancle();
			$.messager.alert('提示', '操作成功！');
			$("#empPanel").datagrid('reload');
		}else {
			$.messager.alert('提示', '操作失败！');
		}
	} catch (e) {
		alert("服务器出错： " + e);
	}
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