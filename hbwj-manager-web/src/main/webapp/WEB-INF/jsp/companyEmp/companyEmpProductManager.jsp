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
	href="${ctx}/css/shangPinIframe.css">
<link type="image/x-icon" rel="shortcut icon" href="${ctx}/images/logo.jpg" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div id="modalTable">
	</div>
	<table id="shangpinTable"></table>
	
	<script>
		$(document).ready(function(){
			//获取当前文档的高度与宽度
			var height=$(document).height();
			var width=$(document).width();
			curRow="";

			$("#shangpinTable").datagrid({
				width:width,
				height:height,
					url:"findTSpuList",
					method : "post",
					columns:[
								[
								{field : 'spuId',title : '商品编号',width : '',align : 'center',resizable:true,hidden:true,},
								{field : 'spuName',title : '商品名称',width : '15%',align : 'center',resizable:true, 
								formatter: function(value,row,index){
									return '<span  title="'+value+'">'+value+'</span>';
								}}, 
								{field : 'catId',title : '商品分类',width : '5%',align : 'center',resizable:false,
								formatter: function(value,row,index){
									return '<span  title="'+value+'">'+value+'</span>';
								}}, 
								{field : 'branch',title : '商品品牌',width : '10%',align : 'center',resizable:true,
								formatter: function(value,row,index){
									return '<span  title="'+value+'">'+value+'</span>'; 
								}},
								{field : 'productNum',title : '商品货号',width : '8%',align : 'center',resizable:true,
								formatter: function(value,row,index){
									return '<span  title="'+value+'">'+value+'</span>';
								}}, 
								{field : 'oriprice',title : '商品原价(元)',width : '8%',align : 'right',resizable:true,
								formatter: function(value,row,index){
									return '<span  title="'+parseFloat(value/100).toFixed(2)+'">'+parseFloat(value/100).toFixed(2)+'</span>';
								}}, 
								{field : 'nowprice',title : '商品现价(元)',width : '8%',align : 'right',resizable:true,
								formatter: function(value,row,index){
									return '<span  title="'+parseFloat(value/100).toFixed(2)+'">'+parseFloat(value/100).toFixed(2)+'</span>'; 
								}}, 
								{field : 'sellAmount',title : '总销售量(件)',width : '8%',align : 'center',resizable:true,
								},
								{field : 'createtime',title : '创建时间',width : '11%',align : 'center',resizable:true,
								formatter:function(value,row,index){
									return returnTime(value,row,index);
								}}, 
								{field : 'updatetime',title : '更新时间',width : '11%',align : 'center',resizable:true,
								formatter:function(value,row,index){
									if(value==null||value==""){
										return "";
									}
									return returnTime(value,row,index);
								} }, 
								{field : 'status',title : '商品状态',width : '8%',align : 'center',resizable:true,
								formatter: function(value,row,index){
									return returnStatus(value);  
								}}, 
								{field : 'reserved2',title : '不通过的原因',width : '',align : 'center',resizable:true,}]],
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
							$("#shangpinTable").datagrid('reload');
						}
					},'-', {
						text : "查看商品",
						iconCls : 'icon-large-smartart',
						handler : function() {
							view();
						}
					},'-', {
						text : "审核商品",
						iconCls : 'icon-filter',
						handler : function() {
							shenHe();
						}
					},'-', {
						text : '<div class="searchDiv">'+
						'<input type="text" id="spName" placeholder="输入商品名称或商品货号"/>'+
						'<select id="spStatus"><option value="">请选择商品状态</option>'+
						'<option value="0">正常</option><option value="1">审核中</option>'+
						'<option value="2">审核通过</option><option value="3">审核未通过</option>'+
						'<option value="4">已上架</option><option value="5">已下架</option>'+
						'<option value="6">违规</option><option value="7">违规待审</option>'+
						'<option value="8">申诉失败</option><option value="9">申诉成功</option></select>'+
						'<input type="button" value="搜索" id="spSearch" onclick="spSearch()"/></div>',
						iconCls : 'icon-search',
					} ],
					onClickRow : function(index, row){
						if(curRow===row){
							$('#shangpinTable').datagrid("unselectAll");
							curRow="";
						}else{
						curRow=row;//返回当前选中的行
					}
				}
			})
})

 		//时间格式化
 		function returnTime(value,row,index){
 			var time=new Date(parseInt(value));
 			var year=time.getFullYear();
 			var month=time.getMonth()+1;
 			month<10?month="0"+month:"";
 			var date=time.getDate();
 			var hours=time.getHours();
 			var mins=time.getMinutes();
 			var timeStr=year+"/"+month+"/"+date+" "+hours+":"+mins;
 			return '<span  title="'+timeStr+'">'+timeStr+'</span>';  
 		}

 		//商品状态处理
 		function returnStatus(value){
 			var status="";
 			var title="";
 			switch(parseInt(value)){
 				case 0:
 				status="已上传产品";
 				title="商品上传成功，请提交进行审核";
 				break;
 				case 1:
 				status="待审核中";
 				title="正在审核中，请等待审核结果";
 				break;
 				case 2:
 				status="审核通过";
 				title="商品上传成功，待提交进行审核";
 				break;
 				case 3:
 				status="审核未通过";
 				title="商品未能通过审核";
 				break;
 				case 4:
 				status="已上架";
 				title="商品已上架，正在抢购中";
 				break;
 				case 5:
 				status="已下架";
 				title="商品已下架";
 				break;
 				case 6:
 				status="违规";
 				title="商品违规，重新发布请先申诉";
 				break;
 				case 7:
 				status="违规待审";
 				title="已提交违规申诉，正在处理中";
 				break;
 				case 8:
 				status="申诉失败";
 				title="商品违规申诉失败";
 				break;
 				case 9:
 				status="申诉成功";
 				title="商品违规申诉成功，待上架"
 				break;
 				default:
 				status="异常";
 				title="请联系客服";
 			}
 			return '<span  title='+title+'>'+status+'</span>';  
 		}


		//错误提示
		function showError($elem,str){
			//如果已经存在提示，返回
			if($elem.siblings("span.error").length>0){
				return;
			}
			$('<span class="error">'+str+'</span>').insertAfter($elem);
		}

		//正确则去掉错误提示
		function showRight($elem){
			$elem.siblings("span.error").hide();
		}

		//查看商品
		function view(){
			if(curRow==""){
				$.messager.alert("提示","请先选择要查看的商品");
				return;
			}
			alert(curRow.spuId);
			//调用父窗口的方法打开一个新的iframe，并传递商品编号参数
			window.parent.openTag("查看商品"+curRow.spuName.substring(0,4)+"..",true,"",curRow.spuId);
		}

		//审核商品
		function shenHe(){
			if(curRow==""){
				$.messager.alert("提示","请先选择要审核的商品");
				return;
			}else if(curRow.status!=1){
				$.messager.alert("提示","此商品已经审核");
				return;
			}
			//调用父窗口的方法打开一个新的iframe，并传递商品编号参数
			window.parent.openTag("审核商品"+curRow.spuName.substring(0,4)+"..",true,'',curRow.spuId);
		}

		//商品搜索
		function spSearch(){
			//判空
			var searchStr=$("#spName").val();
			//货号正则检测
			if(!(/^([0-9a-zA-Z]+)$/).test(searchStr)){
				$.messager.alert("提示","请输入正确的货号，格式为数字和英文字母");
				return;
			}
			//搜索json
			var json={};
			json.product_num=searchStr;
			json.status=$("#spStatus").val();
			$("#shangpinTable").datagrid('options').queryParams=json;
			$("#shangpinTable").datagrid('reload');
			$("#shangpinTable").datagrid('options').queryParams={};
		}
		
		//ajax请求服务器
		function doAjax(json,url,callback){
			$.ajax({
				type:'POST',
				url:url,
				data:json,
				dataType:'JSON',
				success:function(data){
					callback(data);
				},
				error:function(){
				}
			})
		}

	</script>
</body>
</html>