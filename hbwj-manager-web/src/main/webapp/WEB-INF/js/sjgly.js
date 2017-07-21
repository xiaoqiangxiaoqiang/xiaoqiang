$(document).ready(
		
	function() {
		//datagrid的高度：窗口的高度-头尾的高度160px
		height = (document.body.clientHeight- 160) * 0.9+50;
		width = $("div.tabsFrame").width();

		/*var user_parent =${user.getUser_name()};*/
		
		$("#emp").on("click", function() {
			curPanel = 'empPanel';
			curUrl="shoperEmpManager";
			openTag("员工管理",false,curUrl);
		});
		$("#goods").on("click", function() {
			curPanel = 'goodsPanel';
			curUrl="";
			openTag("商品管理",false,curUrl);
		});
		$("#order").on("click", function() {
			curPanel = 'orderPanel';
			curUrl="";
			openTag("订单管理",false,curUrl);
		});
		$("#info").on("click", function() {
			curPanel = 'infoPanel';
			curUrl="";
			openTag("信息管理",false,curUrl);
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
					if (title === "员工管理") {
						curPanel = "empPanel";
						curUrl="shoperEmpManager";
					} else if (title === "商品管理") {
						curPanel = "goodsPanel";
						curUrl="";
					} else if(title === "订单管理") {
						curPanel = "orderPanel";
						curUrl="";
					}else{
						curPanel = "infoPanel";
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
function openTag(title,fromOut,curUrl,arg) {
	//如果是从外部iframe调用该方法，如添加商品
	if(fromOut){
		addPanel(title,curUrl,arg); 
		return;
	}
	// 判断是否存在当前tab panel
	var ifExist = $('#tt').tabs('exists', title); 
	if (ifExist) {
		 // 存在就切换到该panel
		 $('#tt').tabs('select', title);
		} else {
			// 否则就新建一个panel
			addPanel(title,curUrl); 
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
function addPanel(title,curUrl,arg) {
	var str="";
	var frame="";
	switch(title.substring(0,4)){
		case "员工管理":
		frame=curUrl;
		str='<div class="searchWrap"><div class="searchDiv">手机号：<input type="text" class="search" id="user_name" value="" placeholder="请输入手机号码">'+
		'</div><input type="button" onclick="doSearch()" value="搜索"></div>';
		break;
		case "商品管理":
		frame="shangPinIframe.html";
		str='<div class="searchWrap"><div class="searchDiv">手机号：<input type="text" class="search" value="" placeholder="请输入手机号码"></div>';
		str+='<div class="searchDiv">商家状态:<select><option value="0">正常</option><option value="1">商铺审核通过</option>'
		+'<option value="2">商铺审核未通过</option></select></div><input class="class" type="button" value="搜索"></div>';
		break;
		case "订单管理":
		frame="dingDanIframe.html";
		break;
		case "信息管理":
		frame="xinXiIframe.html";
		break;
		case "添加商品":
		frame="tjShangPinIframe.html";
		break;
		default:
		return;
	}
	var iframeStr='<iframe src="'+frame+'" scrolling="yes" width="'+(width-3)+'" height="'+(height-35)+'" frameborder=0></iframe>'
	var contentStr =str+ '<table id="' + curPanel + '"></table>';
	// + '<div id="' + curPanel+ 'Page" style="background:#efefef;border:1px solid #ccc;"></div>';
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