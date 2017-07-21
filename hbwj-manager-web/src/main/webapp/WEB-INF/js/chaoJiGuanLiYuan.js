$(document).ready(
		function() {
			height = (document.body.clientHeight - 140) * 0.85 + 60;
			// height=500;
			width = $("div.tabsFrame").width();
			// console.log(height+","+width);
			isAdd = false; // 定义是添加还是修改
			curPanel = ""; // 定义当前panel
			$("#user").on("click", function() {
				curPanel = 'userPanel'
				openTag("用户管理");
			});
			$("#seller").on("click", function() {
				curPanel = 'sellerPanel'
				openTag("商家管理");
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
							if (title === "用户管理") {
								curPanel = "userPanel";
							} else if (title === "商家管理") {
								curPanel = "sellerPanel";
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
	$("#userPanel").datagrid('options').queryParams = queryParams;
	$("#userPanel").datagrid('reload');
	queryParams.user_name="";

}

// 添加panel
function addPanel(title) {
	if (title == "用户管理") {

		var search = '<div class="searchDiv">手机号：<input type="text" class="search" id="user_name" value="" placeholder="请输入手机号码">&nbsp;&nbsp;<input type="button" onclick="doSearch()" value="搜索"></div>';
	}
	if (title == "商家管理") {
		var kk = '<div class="searchDiv">店铺审核状态:<select  id="status"><option value="0">全部</option><option value="1">待审核</option><option value="2">审核通过</option><option value="3">审核未通过</option></select></div>&nbsp;&nbsp;<input class="class" type="button" onclick="doSearchInfo()" value="搜索">';
		var search = '<div class="searchDiv">手机号：<input type="text" id="user_name" class="search" value="" placeholder="请输入手机号码"></div>'
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

		$('#userPanel').datagrid({
			// 编写datagrid数据格式
			method : "post",
			url : "findUserList",
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
				$('#userPanel').datagrid("unselectAll");// 取消选中当前所有行
				$('#userPanel').datagrid("selectRow", field);// 选中当前点击的行

			},
		});
		$(".datagrid-toolbar").append($("#datagridsearch"));
		$(".datagrid-toolbar").css("height", "auto");
		
		
		 //商家管理页面内容
		$('#sellerPanel').datagrid({
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
				title : '店铺审核状态',
				width : '7%',
				align : 'center',
				formatter:function formatPrice(val,row){
					alert(val);
					if (val==1){
						return '待审核';
					} 
					if (val==2){
						return '审核通过';
					}
					if (val==3){
						return '审核不通过';
					} 
				},
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
			toolbar : [ '-------------------',{
				text : '店铺审核',
				iconCls : 'icon-edit',
				handler : function() {
					editReview()
				}
			}, '--------------------', {
				text : '查看详情',
				iconCls : 'icon-cancel',
				handler : function() {
					findInfo()
				}
			} ],
			onClickRow : function(field, row) {
				$('#userPanel').datagrid("unselectAll");// 取消选中当前所有行
				$('#userPanel').datagrid("selectRow", field);// 选中当前点击的行

			},
		});
		
	});
}


//多重条件查询
function doSearchInfo(){
	// 获取用户名
	var v_userName = $("#user_name").val();
	var v_status = $("#status").val();
	    alert(v_status);
	var queryParams = $('#sellerPanel').datagrid('options').queryParams;
	queryParams.user_name = v_userName;
	queryParams.apply_status = v_status;
	$("#sellerPanel").datagrid('options').queryParams = queryParams;
	$("#sellerPanel").datagrid('reload');
	queryParams.user_name="";
	queryParams.apply_status = "";
}

//商家店铺审核
function  editReview(){
	//获取某行的主键id便于查找
	var curRow = $("#sellerPanel").datagrid('getSelected');
	alert(curRow.id);
	var id =curRow.id;
	//新建一个iframe
	window.parent().add("商家审核",true,id);
	//转接到商家资料审核页面
/*	window.location.href ="reviewShoper?id="+id;*/
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
	var row = $("#userPanel").datagrid('getSelected');
	$("#formUsername").val("")
	$("#formPassword").val("")
	if (row != null) {
		if(row.status=="0"){
			$("#formUsername").val(row.user_name);
		}else{
			$.messager.alert('提示', '不能对商家进行修改');
			return;
		}
		$("#formUsername").prop("disabled", "disabled"); // 用户名不能修改
		$("#textForm").window({
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
		$("#textForm").window('open');
	} else {
		$.messager.alert('提示', '请先选择要修改的用户');
	}
}

// 删除用户
function delUser() {
	var curRow = $("#userPanel").datagrid('getSelected');
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
			$("#userPanel").datagrid('reload');
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
		var userName = $("#formUsername").val()
		if(userName==undefined || userName==null || userName==""){
			$.messager.alert('提示', '用户名不能为空！');
			return ;
		}
		json.username = userName;
		var password = $("#formPassword").val()
		if(password==undefined || password==null || password==""){
			$.messager.alert('提示', '密码不能为空！');
			return ;
		}else if(password.length<6||password.length>16){
			$.messager.alert('提示', '密码长度在6到16位字符');
			return ;
		}
		json.password =password ;
		json.user_id = user_id;
		url = "addComShop"; // 添加地址
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
		url = "updateComShop"; // 修改地址
	}
	doAjax(json, url, addCallback);
}

function addCallback(data) {
	try {
		if (data.result == "0") {
			$.messager.alert('提示', '用户名已存在！');
		} else if(data.result == "1"){
			cancle();
			$.messager.alert('提示', '操作成功！');
			$("#userPanel").datagrid('reload');
		}else {
			$.messager.alert('提示', '操作失败！');
		}
	} catch (e) {
		alert("服务器出错： " + e);
	}
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