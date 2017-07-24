<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>商品管理Iframe</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/shangPinIframe.css" />
	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div id="modalTable">
	</div>
	<table id="shangpinTable"></table>
	<div id="editKc">
		<table id="kcTable">
			<tr>
				<td class="leftTd tableHead">商品货号：</td>
				<td class="rightTd"><span id="huoHao"></span></td>
			</tr>
			<tr>
				<td class="leftTd tableHead">商品货号：</td>
				<td class="rightTd"><span id="name"></span></td>
			</tr>
		</table>
		<table id="editKcTable"></table>
		<p class="bottom">
			<input type="button" id="editKcSave" class="button" value="确定" />
			&ensp;&ensp;
			<input type="button" id="editKcCancel" class="button" value="取消" />
		</p>
	</div>


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
						return returnTime(value,row,index);
					} }, 
					{field : 'status',title : '商品状态',width : '8%',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return returnStatus(value);  
					}},
					{field : 'pdc_setting',title : '商品操作',width : '10%',align : 'center',resizable:true,
					formatter: function(value,row,index){
						return '<input type="button" value="提交审核" onclick="submit()">';  
					}}]],
					autoRowHeight : true,
					striped : true,
					loadMsg : "<span style='color:red;'>正在加载数据....</span>",
					pagination : true,
					// queryParams:{},
					singleSelect : true,
					checkOnSelect : true,
					selectOncheck : true,
					pagination : true,
					rownumbers : true,
					pageSize : 10,
					pageList : [ 10, 20, 30 ],
					// loadFilter : function(data) {
					// 	return {
					// 		total : data.total,
					// 		rows : data.rows
					// 	};
					// },
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
						text : "添加商品",
						iconCls : 'icon-add',
						handler : function() {
							add();
						}
					}, '-', {
						text : '修改商品',
						iconCls : 'icon-edit',
						handler : function() {
							editProduct();
						}
					}, '-', {
						text : '修改库存',
						iconCls : 'icon-large-shapes',
						handler : function() {
							editKuCun();
						}
					}, '-', {
						text : '申诉商品',
						iconCls : 'icon-man',
						handler : function() {
							shenSu();
						}
					},'-', {
						text : '删除商品',
						iconCls : 'icon-cancel',
						handler : function() {
							del();
						}
					} , '-', {
						text : '<div class="searchDiv">'+
						'<input type="text" id="spName" placeholder="输入商品名称或商品货号"/>'+
						'<select id="spStatus"><option value="0">请选择商品状态</option>'+
						'<option value="1">审核通过</option><option value="2">审核未通过</option>'+
						'<option value="3">未审核</option></select>'+
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

 		//提交审核
 		function submit(){
 			if(curRow.status!=0){
 				$.messager.alert('提示','商品当前状态不能进行审核');
 				return;
 			}
 			$.messager.confirm('提示','确定提交审核？',function(r){
 				if (r){
 					doAjax(row.spuId,"",submitCallback);
 				}
 			});					
 		}


 		//时间格式化
 		function returnTime(value,row,index){
 			if(value==null){
 				return "";
 			}
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
 				status="正常";
 				title="商品上传成功，请提交进行审核";
 				break;
 				case 1:
 				status="审核中";
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

 		//提交审核回调
 		function submitCallback(data){
 			//提交审核成功
 			if(data.result=="1"){
 				$.messager.alert('提示','已提交审核，请等待审核结果');
 				$("#shangpinTable").datagrid('reload');
 			}else{
 				$.messager.alert('提示','提交审核失败，请重新提交');
 			}
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
			//调用父窗口的方法打开一个新的iframe，并传递商品编号参数
			var curUrl ="../product/lookProduct";
			window.parent.openTag("查看商品"+curRow.spuName.substring(0,4)+"..",true,curUrl,curRow.spuId);
		}

		//添加商品
		function add(){
			//从父窗口调用方法新建tab
			window.parent.openTag("添加商品",true,"../product/lookIframe");
		}

		//修改商品
		function editProduct(){
			if(curRow==""){
				$.messager.alert("提示","请先选择要修改的商品");
				return;
			}
			//调用父窗口的方法打开一个新的iframe，并传递商品编号参数
			//curUrl 编写当前的额路径
			//调用父窗口的方法打开一个新的iframe，并传递商品编号参数
			var curUrl ="../product/updateProduct";
			window.parent.openTag("查看商品"+curRow.spuName.substring(0,4)+"..",true,curUrl,curRow.spuId);
		}

		//修改库存
		function editKuCun(){
			if(curRow==""){
				$.messager.alert("提示","请先选择要修改的商品");
				return;
			}
			//获取当前选中商品的id
			var spuId=curRow.spuId;
			// $.ajax({  
			// 	type : "post",  
			// 	url : "",  
			// 	data : {'pdc_id':pdc_id},  
			// 	async : false,  
			// 	success : function(data){  
			// 		editKcCallback(data);
			// 	},
			// 	error:function(e){
			// 		alert("数据加载出错");
			// 	},
			// }); 
			data={'sku':[{'property1':'长款','property2':'32','kuCun':66,'skuId':"111"},{'property1':'长款','property2':'30','kuCun':18,'skuId':"222"},{'property1':'短款','property2':'29','kuCun':29,'skuId':"333"}],
			'sellProps':["款式","尺码"]};
			editKcCallback(data)
		}

		//修改库存请求数据的回调函数
		function editKcCallback(data){
			$("#huoHao").html(curRow.productNum).attr('title',curRow.productNum);
			$("#name").html(curRow.spuName).attr('title',curRow.spuName);
			var tr="<tr class='trHead'><td class='td1 tableHead'>子商品序号</td>";
			var propsLen=data.sellProps.length;
			var skuLen=data.sku.length;
			//外循环sku数组个数，也就是tr行数
			for(var i=0;i<skuLen+1;i++){
				//内循环sku的销售属性个数
				for(var j=0;j<propsLen;j++){
					//i=0:第一次时来生成第一行tr表头
					if(i===0){
						tr+='<td class="td2 tableHead">'+data.sellProps[j]+'</td>';
						//属性个数都遍历完，结束该行tr
						j==propsLen-1?tr+="<td class='td3 tableHead'>库存</td></tr>":"";	
					}else{
						tr+='<td class="td2" title='+data.sku[i-1]["property"+(j+1)]+'>'+data.sku[i-1]["property"+(j+1)]+'</td>';
						//属性个数都遍历完，结束该行tr
						j==propsLen-1?tr+="<td class='td3'><input type='number' class='kuCun' id='sku"+i+"' data-skuId='"+data.sku[i-1].skuId+"' min=0 value='"+data.sku[i-1].kuCun+"'' /></td></tr>":"";
					}				
				}
				i<skuLen?tr+='<tr><td class="td1">'+(i+1)+'</td>':"";
			}
			$("#editKcTable").html(tr).show();
			// $("#editKc").show();
			$("#editKc").window({
				modal:true,
				title:'修改商品库存',
				minimizable:false,
				maximizable:false,
				resizable:false,
			})
			console.log($("#sku1").attr('data-skuId')+";"+$("#sku2").val()+";"+$("#sku3").val());
		}

		//鼠标滑过高亮该行
		$("#editKc").on('mouseenter','#editKcTable tr',function(e){
			var eve=$.event.fix(e);
			var elem=eve.target;
			var tr=elem.nodeName=="TD"?$(elem).parent():$(elem).parent().parent();
			tr.addClass('highlight').siblings().removeClass('highlight');
		})

		$("#editKc").on('mouseleave','#editKcTable tr',function(e){
			var eve=$.event.fix(e);
			var elem=eve.target;
			var tr=elem.nodeName=="TD"?$(elem).parent():$(elem).parent().parent();
			tr.removeClass('highlight');
		})

		//修改库存保存
		$("#editKcSave").click(editKcSave);
		function editKcSave(){
			var json={};
			var skuArr=[];
			var length=$("#editKcTable tr:gt(0)").length;
			for(var i=0;i<length;i++){
				var input=$("#sku"+(i+1));
				if(!( /^[0-9]\d*$/).test(input.val())){
					$.messager.alert('提示','商品'+(i+1)+'的库存数不正确');
					return;
				}
				var sku={}
				sku.skuId=input[0].dataset.skuid;
				sku.kuCun=input.val();
				skuArr.push(sku);
			}
			json.spuId=curRow.spuId;
			json.sku=skuArr;
			console.log(json);
		}

		//修改库存取消
		$("#editKcCancel").click(editKcCancel);
		function editKcCancel(){
			$("#editKc").window('close');
		}

		//申诉商品
		function shenSu(){
			if(curRow==""){
				$.messager.alert("提示","请先选择要申诉的商品");
				return;
			}
			$.messager.confirm('提示','确定对该商品进行申诉？',function(r){
				if (r){
					//ajax异步删除
					doAjax(curRow,"",shenSuCallback);
				}
			});
		}

		//申诉回调函数
		function shenSuCallback(data){
			if(data.result=="1"){
				$.messager.alert('提示','提交申诉成功,我们将尽快处理');
					//重新加载
					$("#shangpinTable").datagrid('reload');
				}else{
					$.messager.alert('提示','提交申诉失败');
				}
			}

		//删除商品
		function del(){
			if(curRow===""){
				$.messager.alert("提示","请先选择要删除的商品");
				return;
			}
			$.messager.confirm('提示','确定删除该商品？',function(r){
				if (r){
					//ajax异步删除
					doAjax(curRow,"",delCallback);
				}
			});
		}

		//删除后的回调函数
		function delCallback(data){
			if(data.result=="1"){
				$.messager.alert("提示","删除成功");
				//取消选中
				curRow="";
				$('#shangpinTable').datagrid("unselectAll");
				//重新加载数据
				$('#shangpinTable').datagrid("reload");
			}else{
				$.messager.alert("提示","删除失败");
			}
		}

		//商品搜索
		function spSearch(){
			//判空
			var serachStr=$("#spName").val();
			if(serachStr==""){
				$.messager.alert("提示","请先输入检索字段");
				return;
			}
			//搜索json
			var json={};
			json.searchStr=searchStr;
			//货号正则检测
			(/^([0-9a-zA-Z]+)$/).test(elem.val())?json.isHuoHao=true:json.isHuoHao=false;
			json.status=$("#spStatus").val();

		}

		//保存添加
		$("#saveAdd").click(function saveAdd(){
			//如果有一个不正确，就返回
			if(!isRightPhone||!isRightPw||isRightPw2){
				return;
			}else{
				var json={};
				json.username=$("#username").val();
				json.password=$("#password").val();
			}
		})
		
		//取消添加
		$("#cancelAdd").click(function cancelAdd(){
			$("#addTable").window('close');
		})
		

		//修改员工密码
		function edit(){
			if(curRow===""){
				$.messager.alert("提示","请先选中一行再修改");
				return;
			}
			$("input.textin").val("");
			//用户名不可修改
			$("#usernameEdit").val(curRow.user_name).attr('readonly',true);
			//显示模态窗口
			$("#editTable").window({
				modal:true,
				title:'修改员工',
				maximizable:false,
				minimizable:false,
				resizable:false,
			});
		}

		//保存修改
		$("#saveEdit").click(function saveEdit(){
			var json={};
			json.username=$("#username").val();
			json.passwordOld=$("#passwordOld").val();
			json.password=$("#password").val();
			json.password2=$("#password2").val();
			if(json.password.length<6){
				$.messager.alert("提示","密码长度太短，至少6位字符");
				return;
			}
			if(json.password!==json.password2){
				$.messager.alert("提示","两次密码不一致，请重新输入");
				return;
			}
			doAjax(json,"",saveEditCallback);
		})

		//保存修改回调函数
		function saveEditCallback(data){
			if(data.result=="0"){
				$.messager.alert("提示","原密码错误，请重新输入");
				return;
			}else if(data.result=="1"){
				$("#editTable").window('close');
				$.messager.alert("提示","用户 "+curRow.user_name+" 修改密码成功");
				return;
			}else{
				$.messager.alert("提示","修改密码失败");
			}
		}

		//取消修改
		$("#cancelEdit").click(function cancelEdit(){
			$("#editTable").window('close');
		})

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