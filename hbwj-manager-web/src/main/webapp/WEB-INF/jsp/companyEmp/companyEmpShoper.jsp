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
	href="${ctx}/css/shangJiaIframe.css">
<link type="image/x-icon" rel="shortcut icon" href="${ctx}/images/logo.jpg" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="shangJiaTable"></table>
	<script>
		$(document).ready(function(){
			//获取当前文档的高度与宽度
			var height=$(document).height();
			var width=$(document).width();
			curRow="";
			$("#shangJiaTable").datagrid({
				width:width,
				height:height,
				url : "findTShopReviewList",
				method : "post",
				columns:[[
				{field : 'id',title : '用户账号',width : '160',align : 'center',resizable:true,
				formatter: function(value,row,index){
						return '<span  title="'+value+'">'+value+'</span>';
					}}, 
				{field : 'name',title : '商家姓名',width : '120',align : 'center',resizable:true,
				formatter: function(value,row,index){
					return '<span  title="'+value+'">'+value+'</span>';
				}},
				{field : 'shop_name',title : '商家店铺名称',width : '160',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return '<span  title="'+value+'">'+value+'</span>';
							}},
				{field : 'indentifyId',title : '商家身份证号',width : '200',align : 'center',resizable:true,
				formatter: function(value,row,index){
					return '<span  title="'+value+'">'+value+'</span>';
				}},
				{field : 'product_type',title : '主营产品类型',width : '160',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return '<span  title="'+value+'">'+value+'</span>';
				}},
				{field : 'shop_type',title : '店铺类型',width : '160',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return returnShopType(value,row,index);
				}},
				{field : 'reserved1',title : '营业执照类型',width : '160',align : 'center',resizable:true,
						formatter: function(value,row,index){
							return returnZhiZhao(value,row,index);
					}},
				{field : 'apply_status',title : '店铺状态',width : '160',align : 'center',resizable:true,
				formatter: function(value,row,index){
					return returnStatus(value);  
				}}, 
				{field : 'applyTime',title : '提交审核时间',width : '160',align : 'center',resizable:true,
				formatter:function(value,row,index){
					return returnTime(value,row,index);
				}},
				{field : 'passApply',title : '审核时间',width : '160',align : 'center',resizable:true,
				formatter:function(value,row,index){
						return returnTime(value,row,index);
				}},

				{field : 'reserved2',title : '未通过原因',width : '260',align : 'center',resizable:true,
					formatter: function(value,row,index){
						if(row.apply_status =="3"){
							return '<span  title="'+value+'">'+value+'</span>';
						}else{
							return "";
						}
						
				}},
				{field : 'shop_addr',title : '商家地址',width : '260',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return '<span  title="'+value+'">'+value+'</span>';
				}},
				]],			
				autoRowHeight : true,
				striped : true,
				loadMsg : "<span style='color:red;'>正在加载数据....</span>",
				pagination : true,
				queryParams:{},
				singleSelect : true,
				checkOnSelect : true,
				selectOncheck : true,
				pagination : true,
				rownumbers : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				loadFilter : function(data) {
					return {
				 		total : data.total,
				 		rows : data.rows
				 	};
				 },
				toolbar : [ {
					text : "刷新",
					iconCls : 'icon-reload',
					handler : function() {
						$("#shangJiaTable").datagrid('reload');
					}
				},'-', {
					text : "查看商家",
					iconCls : 'icon-add',
					handler : function() {
						view();
					}
				}, '-', {
					text : '审核商家',
					iconCls : 'icon-edit',
					handler : function() {
						shenHe();
					}
				}, '-', {
					text : '<div class="searchDiv">'+
					'<input type="text" id="sjPhone" placeholder="输入手机号"/>&ensp;'+
					'<select id="sjStatus"><option value="">请选择店铺状态</option>'+
					'<option value="1">待审核</option><option value="2">审核通过</option>'+
					'<option value="3">审核未通过</option><select>'+
					'<input type="button" value="搜索" id="sjSearch" onclick="sjSearch()"/></div>',
					iconCls : 'icon-search',
				}],
				onClickRow : function(index, row) {
					if(curRow===row){
						$('#shangJiaTable').datagrid("unselectAll");
						curRow="";
					}else{
						curRow=row;//返回当前选中的行
					}
				},
			});			
		})

		//商家状态处理
		function returnStatus(value){
			var status="";
			var title="";
			switch(parseInt(value)){
				case 1:
					status="待审核";
					title="待审核";
				break;
				case 2:
					status="审核通过";
					title="审核通过";
					break;
				case 3:
					status="审核未通过";
					title="审核未通过";
					break;
				default:
				status="其他";
				title="异常";
			}
			return '<span  title='+title+'>'+status+'</span>';  
		}

		//时间格式化
		function returnTime(value,row,index){
			var time=new Date(parseInt(value));
			var year=time.getFullYear();
			var month=time.getMonth()+1;
			month<10?month="0"+month:"";
			var date=time.getDate();
/* 			var hours=time.getHours(); */
/* 			var mins=time.getMinutes(); */
			var timeStr=year+"/"+month+"/"+date+" ";
			return '<span  title="'+timeStr+'">'+timeStr+'</span>';  
		}

		//执照类型
		function returnZhiZhao(value,row,index){
			var title="";
			var status="";
			switch(parseInt(value)){
			case 1:
				status=title="企业执照";
				break;			
			case 2:
			    status=title="个体执照";
			    break;
			}
			return '<span  title='+title+'>'+status+'</span>'; 
		}
		
		//店铺类型
		function returnShopType(value,row,index){
			var title="";
			var status="";
			switch(parseInt(value)){
			case 0:
				status=title="旗舰店";
				break;		
			case 1:
			    status=title="专营店";
			    break;
			case 2:
			    status=title="专卖店";
			    break;
			case 3:
			    status=title="个体店";
			    break;
			}
			return '<span  title='+title+'>'+status+'</span>'; 
		}
		
		//错误提示
		function showError($elem){
			$elem.siblings("p.error1").css('display','inline');
		}

		//正确则去掉错误提示
		function showRight($elem){
			$elem.siblings("p.error1").hide();
		}

		//商家搜索
		function sjSearch(){
			var user_name=$("#sjPhone").val();
			var apply_status=$("#sjStatus").val();
			$("#shangJiaTable").datagrid('options').queryParams ={'user_name':user_name,'apply_status':apply_status};
			$("#shangJiaTable").datagrid('reload');
			$("#shangJiaTable").datagrid('options').queryParams={};
		}


		//查看商家
		function view(){
			if(curRow===""){
				$.messager.alert("提示","请先选择要查看的商家");
				return;
			}
			//跳转路径
			var url='';
			window.parent.openTag("查看商家"+curRow.name,true,url,curRow.id);
		}

		//审核商家
		function shenHe(){
			if(curRow===""){
				$.messager.alert("提示","请先选择要审核的商家");
				return;
			}else if(curRow.apply_status!=1){
 				$.messager.alert("提示","此商家已被审核");
				return; 
			}
			//跳转路径
			var url='';
			window.parent.openTag("审核商家"+curRow.name,true,url,curRow.id);
		}
		//ajax请求服务器
		function doAjax(json,url,callback){
			$.ajax({
				type:'POST',
				url:url,
				data:json,
				dataType:'JSON',
				success:function(data){
					callback!=undefined?callback(data):'';
				},
				error:function(){
				}
			})
		}
	</script>
</body>
</html>