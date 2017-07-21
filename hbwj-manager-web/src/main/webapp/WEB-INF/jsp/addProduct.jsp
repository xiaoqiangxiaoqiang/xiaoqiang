<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<title>商品添加</title>

<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<!-- 添加easyUI -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/tjShangPinIframe.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/viewer.min.css" />

<link rel="stylesheet" type="text/css"
	href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
<script type="text/javascript"
	src="${ctx}/js/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/viewer-jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/sweetalert.css">
<script type="text/javascript" src="${ctx}/js/sweetalert.min.js"></script>
</head>
<body>
	<div class="main">
		<p class="title">商品基本信息</p>
		<input type="hidden" id="id" value="${review.id}">
		<!-- 店主姓名-->
		<input type="hidden" id="name" value="${review.name}">
		<!-- 店铺名称 -->
		<input type="hidden" id="shop_name" value="${review.shop_name}">
		<div class="wrapDiv">
			<div id="typeModal">
				<div class="wrap">
					<ul id="typeTree" class="easyui-tree"></ul>
					<div class="treeBtn">
						<a id="btn1"></a> <a id="btn2"></a>
					</div>
				</div>
			</div>
			<table id="spInfo" class="table">
				<tr>
					<td class="leftTd"><label for="type"> <span
							class="must">*</span><span class="ziduan" title="商品类别">商品类别：</span>
					</label></td>
					<td class="rightTd"><span id="typeName"></span> <input
						type="button" id="selectType" class="button" value="选择类别">
						<input type="hidden" id="typeId"> <span
						class='warming warming3'>请选择商品类别</span></td>
				</tr>
				<tr>

					<td class="leftTd"><label for="name"> <span
							class="must">*</span><span class="ziduan" title="商品主标题">商品名称：</span>
					</label></td>
					<td class="rightTd"><textarea id="productName" rows="3"
							placeholder="商品主标题，请输入5至40位字符"></textarea> <span
						class='warming warming1'>长度在5至40位字符</span></td>
				</tr>
				<tr>
					<td class="leftTd"><label for="brand"> <span
							class="must">*</span><span class="ziduan" title="商品品牌">商品品牌：</span>
					</label></td>
					<td class="rightTd"><input type="text" id="brand"
						placeholder="请输入商品品牌" /> <span class='warming'>商品品牌不能为空</span></td>
				</tr>
				<tr>
					<td class="leftTd"><label for="huoHao"> <span
							class="must">*</span><span class="ziduan"
							title="当前页面所添加的颜色款式或尺码不同的同一商品，均为同一货号">商品货号：</span>
					</label></td>
					<td class="rightTd"><input type="text" id="huoHao"
						placeholder="请输入商品货号" /> <span class='warming'>格式为数字或字母组成，至少4位字符</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd"><label for="price1"><span
							class="must">*</span><span class="ziduan" title="商品原价">商品原价：</span></label>
					</td>
					<td class="rightTd"><input type="number" id="price1" min="0"
						placeholder="请输入原价" />&ensp;元 <span class='warming'>请输入正确的价格</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd"><label for="price2"><span
							class="must">*</span><span class="ziduan" title="商品优惠价">商品现价：</span></label>
					</td>
					<td class="rightTd"><input type="number" id="price2" min="0"
						placeholder="请输入优惠价" />&ensp;元 <span class='warming'>请输入正确的价格</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd"><label for="details"><span
							class="must">*</span><span class="ziduan" title="商品副标题">商品卖点：</span></label>
					</td>
					<td class="rightTd"><textarea id="details" rows="6"
							placeholder="商品副标题，请输入商品优惠介绍、商品细节、卖点、特色等...至少20个字符"></textarea> <span
						class='warming warming2'>至少20个字符</span></td>
				</tr>
			</table>
		</div>

		<hr>
		<p class="title">商品销售属性</p>
		<p class="title">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">2M </span>,每件商品只上传<span class="imgLink2">1</span>张图片
			</a>
		</p>
		<br />
		<div class="wrapDiv" id=wrapDiv1>
			<p class="collapse" id="spSellProps_Btn">收起</p>
			<table id="spSellProps" class="table"></table>
			<br />
			<p class="collapse" id="imgDiv1_Btn">收起</p>
			<div id="imgDiv1" class="imgDiv">
				<p class="delNotes">要删除图片请直接删除对应商品</p>
			</div>
		</div>

		<hr>
		<p class="title">商品参数</p>
		<p class="title">
			<input type="button" id="propBtn" class="button" value="添加参数">
		</p>
		<div class="wrapDiv">
			<div id="propModal">
				<div class="wrap">
					请添加商品参数与参数值，如：<br>
					<table>
						<tr>
							<td>型号：6s</td>
							<td>上市时间：2015年9月</td>
						</tr>
						<tr>
							<td>相机像素：1300W</td>
							<td>电池容量：1800mAh</td>
						</tr>
					</table>
					<table id="propTable"></table>
					<div class="treeBtn">
						<a id="btn3"></a> <a id="btn4"></a>
					</div>
				</div>
			</div>
			<p class="collapse" id="spProp_Btn">收起</p>
			<table id="spProp" class="table"></table>
		</div>

		<hr>
		<p class="title">商品详细图</p>
		<p class="title">
			<input type="button" id="upBtn2" class="button" value="上传详细图">
		</p>
		<p class="title">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">2M</span>，最多上传<span class="imgLink2">8</span>张图片
			</a>
		</p>
		<div class="wrapDiv">
			<div id="imgDiv2" class="imgDiv"></div>
			<div id="bottom">
				<a id="save" class="easyui-linkbutton">&ensp;确&ensp;定&ensp;</a>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							//获取当前文档的高度与宽度
							var height = $(document).height();
							var width = $(document).width();
							var mainHeight = $("div.main").height();
							var mainWidth = $("div.main").width();
							console.log(height + " ," + width + " ,"
									+ mainHeight + " ," + mainWidth);
							$("div#bottom").css({
								'left' : (width - 55) / 2 + "px",
								'top' : '20px'
							});
							$("table#spInfo").show();
							$("table#spProp,div.imgDiv,p.collapse").width(
									width * 0.85 + "px");
							//设置imgDiv2居中
							$("div#imgDiv2").css('left',
									(width * 0.15 - 6) / 2 + "px");
							maxNum = 0; //剩余上传张数
							curRow = ''; //初始化当前编辑的行
							upRows = []; //初始化商品属性上传数组
							curImgDiv = "";//当前上传图片Div
							sku = [];//sku数组
							imgUrlArr1 = [];
							imgUrlArr2 = [];
							add = 1;//创建ul的id自动增加

							//收起/显示图片预览框
							$("body").on(
									'click',
									'p.collapse',
									function() {
										var index = this.id.indexOf("_");
										var id = this.id.substring(0, index);
										$("#" + id).fadeToggle("slow");
										$(this).html() === "收起" ? $(this).html(
												"显示") : $(this).html("收起");
									})

							//鼠标悬浮显示删除按钮
							$("div#imgDiv2").on(
									'mouseover',
									'div.imgWrap2',
									function(e) {
										var event = $.event.fix(e);
										var elem = $(event.target);
										console.log(elem[0].nodeName);
										elem[0].nodeName === "IMG" ? elem
												.siblings("div.imgDel").show()
												: elem.find("div.imgDel")
														.show();
									});

							//鼠标移开隐藏删除按钮
							$("div#imgDiv2").on('mouseleave', 'div.imgWrap2',
									function() {
										$("div.imgDel").hide();
									});

							//点击删除图片
							$("div#imgDiv2").on(
									'click',
									'div.imgDel',
									function(e) {
										var event = $.event.fix(e);
										var elem = $(event.target);
										//获取到图片元素
										var img = elem.next();
										var imgUrl = img[0].src;
										var imgWrap = img.parent();
										//当前图片索引
										var index = imgWrap.index();
										var imgDiv = $(imgWrap.parentsUntil(
												'div.imgDiv').parent()[0]);
										// console.log(imgDiv[0].id);
										// console.log('索引为:'+index+"  title:"+img[0].title);
										// 从数组中删除对应的Url
										imgUrlArr2.splice(index, 1);
										// console.log(imgUrlArr1);
										//删除当前图片所在的imgWrap
										imgWrap.off().parent().parent()
												.remove();
										//如果图片全部删除，隐藏imgDiv和收起/展开按钮
										if (imgDiv.children().length === 0) {
											imgDiv.hide();
										} else {
											imgDiv.show();
										}
										$("div#bottom").css(
												'top',
												$("div#imgDiv2").height() + 75
														+ "px");
									});
						})

		//选择商品类别
		$("#selectType").click(function() {
			$("#typeModal div.wrap").show();
			$("#typeTree").tree({
				lines : true,
				url : 'loadShopCategroy',
				onClick : function(node) {
					if (node.id == 1) {
						$.messager.alert('提示', '请选择子分类');
						return;
					}
					typeId = node.id;
					typeName = node.text;
				}
			});
			$("#btn1").linkbutton({
				text : '确定',
				onClick : function() {
					//点击确认发送ajax请求去查询出相对应的模板
					var url = "findModal"
					var json = {};
					json.catId = typeId;
					doAjax(json, url, selectCallback);
					$("#typeId").val(typeId);
					$("#typeName").html(typeName);
					showRight($("#selectType"));
					$("#typeModal").window('close');
				}
			});

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

			//成功回调的函数
			function selectCallback(data) {
				console.log(data);
				sellProps = data;
				addSellProps();
			}

			$("#btn2").linkbutton({
				text : '取消',
				onClick : function() {
					$("#typeModal").window('close');
				}
			});
			$("#typeModal").window({
				title : '选择商品类别',
				modal : true,
				width : 400,
				collapsible : false,
				minimizable : false,
				maximizable : false,
				resizable : false,
				shadow : false,
			});
		})

		//根据传回来的url添加图片
		function addImg(url, name) {
			var html = "";
			var str = curImgDiv.substring(6, 7);
			html += '<ul id="ul'+add+'" class="imgUl"><li class="imgLi"><div class="imgWrap'+str+'">';
			html += '<div class="imgDel" title="删除图片">';
			/* 			html += '<img src="../../../images/cancel.png">'; */
			html += '</div>';
			html += '<img src="'+url+'" class="img'+str+'" title="'+name+'">';
			if (curImgDiv === "imgDiv1") {
				var json = {};
				json.url = url;
				sku.push(json);
				var length = sku.length;
				html += '<p class="sp">商品' + length + '</p>';
			} else {
				imgUrlArr2.push(url);
			}
			;
			html += '</div></li></ul>';
			//将图片添加到对应imgDiv并显示
			$(html).appendTo($("div#imgDiv" + str).show());
			//显示收起/显示按钮
			$("#" + curImgDiv + "_Btn").html("收起").show();
			//将Url添加到数组
			// curImgDiv==="imgDiv1"?imgUrlArr1.push(url):imgUrlArr2.push(url);
			$("#ul" + add).viewer({
				toolbar : false,
				zoomRatio : 0.35,
				minZoomRatio : 0.2
			});
			add++;
			//重新设置底部按钮的位置
			$("div#bottom").css('top', $("div#imgDiv2").height() + 75 + "px");
		}

		//点击上传按钮打开iframe
		function uploadIframe() {
			//先将其他所有iframe删除
			$("div#uploadModal").each(function() {
				$(this).off().remove();
			});
			//再新建一个iframe到模态窗口中
			$(
					'<div id="uploadModal"><iframe src="loadIframe" scrolling="yes" width="100%" height="600" frameborder=0></iframe></div>')
					.appendTo(document.body);
			//打开模态窗口
			$("#uploadModal").window({
				title : '上传图片',
				modal : true,
				width : 1000,
				// height:800,
				resizable : false,
				maximizable : false,
				minimizable : false,
			});
		}

		//传递当前剩余图片数量
		function getMaxNum() {
			return maxNum;
		}

		//根据选择的商品类别添加销售属性
		function addSellProps() {
			//销售属性个数
			var propLength = sellProps.length;
			//每行td个数
			var tdLength = propLength.length + 5;
			if (propLength !== 0) {
				//第一行tr下的销售属性td
				var tdHead = '';
				//销售属性输入框的td
				var tdProp = '';
				for (var i = 0; i < propLength; i++) {
					tdHead += '<td class="sellProp"><span class="must">*</span>'
							+ sellProps[i] + '</td>';
					tdProp += '<td><input type="text"  class="spSellProp" style="min-width:260px;height:18px;"/></td>';
				}
			}
			var trHead = '<tr><td><img src="../../../images/edit_add.png" onclick="addSp(event)" title="添加商品" style="margin:0 10px;cursor:pointer"></td><td>序号</td>'
					+ tdHead
					+ '<td><span class="must">*</span>商品库存(件)</td><td></td></tr>';
			trProp = '<tr><td>'
					+ '<img src="../../../images/edit_remove.png" onclick="removeSp(event)" title="删除商品" style="margin:0 10px;cursor:pointer">'
					+ '</td><td><input type="text" readonly="true" class="xuHao" value="1" style="max-width:30px;padding-left:10px;height:18px"></td>'
					+ tdProp
					+ '<td><input type="number" class="kuCun" style="max-width:140px;height:18px;"></td><td><input type="button" class="upSpImg" value="上传图片" title="上传图片" onclick="upSpImg(event)" style="cursor:pointer"></td></tr>';
			$("#spSellProps").html(trHead + trProp).show();
		}

		//添加新商品
		function addSp(e) {
			$('#spSellProps tbody').append(trProp);
			//更改序号
			var xuhaoTd = $("#spSellProps tr:gt(0) td:nth-child(2)");
			for (var i = 0; i < xuhaoTd.length; i++) {
				$(xuhaoTd[i]).find('input.xuHao').val(i + 1);
			}
		}

		//删除商品
		function removeSp(e) {
			var eve = $.event.fix(e);
			var elem = eve.target;
			var tr = $(elem).parentsUntil('tr').parent();
			var index = tr.index();
			if (index === 1) {
				$.messager.alert("提示", "至少添加一款商品");
				return;
			}
			//将sku数组里面对应的json删除
			if (index <= sku.length) {
				sku.splice(index - 1, 1);
			}
			//img解绑事件
			tr.find("img").each(function(i, item) {
				$(item).removeAttr("onclick")
			});
			tr.remove();
			//将对应的预览图删除
			$($('#imgDiv1 .imgWrap')[index - 1]).remove();
			//更改序号
			var xuhaoTd = $("#spSellProps tr:gt(0) td:nth-child(2)");
			var len1 = xuhaoTd.length;
			for (var i = 0; i < len1; i++) {
				$(xuhaoTd[i]).find('input.xuHao').val(i + 1);
			}
			//更改预览图名称
			var imgP = $("#imgDiv1 .imgWrap p.sp");
			var len2 = imgP.length;
			for (var j = 0; j < len2; j++) {
				$(imgP[j]).html("商品" + (j + 1));
			}
		}

		//上传主图
		function upSpImg(e) {
			var eve = $.event.fix(e);
			var elem = eve.target;
			//获取tr的index
			var index = $(elem).parent().parent().index();
			var length = sku.length;
			if (index > length + 1) {
				$.messager.alert('提示', "请先上传商品" + (length + 1) + "的图片");
				$("#spSellProps").find('tr')[length + 1].scrollIntoView(true);
				return;
			}
			//如果sku数组里面已经存在图片Url，那么就不能上传
			if (sku[index - 1] && sku[index - 1].url != "") {
				$.messager.alert('提示', "该商品已经上传图片");
				return;
			}
			//还能上传的数量
			maxNum = 1;
			uploadIframe();
			curImgDiv = "imgDiv1";
		};

		//上传详细图按钮
		$("#upBtn2").click(function() {
			//已经上传成功的数量
			var curImgLength = imgUrlArr2.length;
			//还能上传的数量
			maxNum = 8 - curImgLength;
			uploadIframe();
			curImgDiv = "imgDiv2";
		});

		//检测名称
		$("#name").blur(checkName);
		function checkName() {
			var elem = $("#name");
			if (elem.val().length < 5 || elem.val().length > 40) {
				showError(elem); //显示错误提示
				return false;
			} else {
				showRight(elem); //清除错误提示
				return true;
			}
		}

		//检测品牌
		$("#brand").blur(checkBrand);
		function checkBrand() {
			var elem = $("#brand");
			if (elem.val().length < 1) {
				showError(elem); //显示错误提示
				return false;
			} else {
				showRight(elem); //清除错误提示
				return true;
			}
		}

		//检测货号
		$("#huoHao").blur(checkHuoHao);
		function checkHuoHao() {
			var elem = $("#huoHao");
			if (elem.val().length < 4 || !(/^([0-9a-zA-Z]+)$/).test(elem.val())) {
				showError(elem); //显示错误提示
				return false;
			} else {
				showRight(elem); //清除错误提示
				return true;
			}
		}

		//绑定事件
		$("#wrapDiv1").on('blur', 'input', function() {
			var elem = $(this);
			var style = elem.attr('class');
			if (style == "spSellProp") {
				checkSellProp(elem);
			} else if (style == "kuCun") {
				checkKuCun(elem);
			}
			// switch(style){
			// 	case 'spSellProp':
			// 	checkSellProp(elem);
			// 	break;
			// 	case "kuCun":
			// 	checkKuCun(elem);
			// 	break;
			// }
		})

		//检测价格
		$('#price1,#price2').keyup(function() {
			checkPrice($(this));
		});
		function checkPrice(elem) {
			if (/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/
					.test(elem.val())) {
				showRight(elem);
				return true;
			} else {
				showError(elem);
				return false;
			}
		}

		//小数点两位数填充
		$('#price1,#price2').blur(function() {
			toFix($(this));
		});
		function toFix(elem) {
			if (checkPrice(elem)) {
				elem.val(parseFloat(elem.val()).toFixed(2));
			}
		}

		//检测库存
		function checkKuCun(elem) {
			if (/^[0-9]*[1-9][0-9]*$/.test(elem.val()) && elem.val() > 0) {
				showRight(elem);
				return true;
			} else {
				showError(elem);
				return false;
			}
		}

		//检测销售属性
		function checkSellProp(elem) {
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}

		//检测商品描述
		$("#details").blur(checkDetails);
		function checkDetails() {
			var elem = $("#details");
			if (elem.val().length < 20) {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}

		//添加商品属性
		$("#propBtn")
				.click(
						function() {
							// showError($("#propBtn"));
							// return;
							curRow = "";
							rows = [];
							for (i in upRows) {
								rows.push(upRows[i])
							}
							$("#propModal div.wrap").show();
							$("#propTable")
									.datagrid(
											{
												width : 450,
												// height:400,
												striped : true,
												singleSelect : true,
												data : rows,
												toolbar : [
														{
															text : '添加',
															iconCls : 'icon-add',
															handler : function() {
																curRow === "" ? ""
																		: $(
																				"#propTable")
																				.datagrid(
																						'endEdit',
																						curRow);
																$("#propTable")
																		.datagrid(
																				'appendRow',
																				{
																					key : '',
																					value : '',
																				});
																var len = $(
																		"#propTable")
																		.datagrid(
																				'getData').total;
																curRow = len - 1;
																$("#propTable")
																		.datagrid(
																				'beginEdit',
																				curRow);
															}
														},
														'-',
														{
															text : '修改',
															iconCls : 'icon-edit',
															handler : function() {
																if (curRow === "") {
																	$.messager
																			.alert(
																					"提示",
																					"请先选中一行再修改");
																	return;
																}
																$("#propTable")
																		.datagrid(
																				'endEdit',
																				curRow);
																$("#propTable")
																		.datagrid(
																				'beginEdit',
																				curRow);
															}
														},
														'-',
														{
															text : '删除',
															iconCls : 'icon-cancel',
															handler : function() {
																if (curRow === "") {
																	$.messager
																			.alert(
																					"提示",
																					"请先选中一行再删除");
																	return;
																}
																$.messager
																		.confirm(
																				'提示',
																				'确认删除该行？',
																				function(
																						r) {
																					if (r) {
																						$(
																								"#propTable")
																								.datagrid(
																										'deleteRow',
																										curRow);
																						curRow = "";
																					}
																				});
															}
														} ],
												columns : [ [ {
													field : 'key',
													title : '商品参数',
													width : 180,
													editor : 'text'
												}, {
													field : 'value',
													title : '商品参数值',
													width : 250,
													editor : 'text'
												}, ] ],
												onClickRow : function(index,
														row) { //单击选中
													$("#propTable").datagrid(
															'unselectAll');
													if (curRow !== "") {
														$("#propTable")
																.datagrid(
																		'endEdit',
																		curRow);
													}
													$("#propTable").datagrid(
															'selectRow', index);
													curRow = index;
												},
												onDblClickRow : function() { //双击修改
													$("#propTable").datagrid(
															'endEdit', curRow);
													$("#propTable")
															.datagrid(
																	'beginEdit',
																	curRow);
												}
											})
							$('.datagrid-cell').css('font-size', '16px');
							$("#propModal").window({
								title : '添加商品参数',
								modal : true,
								collapsible : false,
								minimizable : false,
								maximizable : false,
								resizable : false,
								shadow : false,
							});

							$("#btn3")
									.linkbutton(
											{
												text : '确定',
												onClick : function() {
													//取消编辑
													curRow === "" ? "" : $(
															"#propTable")
															.datagrid(
																	'endEdit',
																	curRow);
													//获取当前所有行数据
													var getData = $(
															"#propTable")
															.datagrid('getData');
													var len = getData.total;
													var rows = getData.rows;
													//如果数据为空，显示原来所有数据；返回
													if (len === 0) {
														$.messager.alert('提示',
																'商品参数不能为空');
														//显示原来所有数据
														showTable(upRows);
														return;
													}
													//遍历，如果有属性为空，显示原来数据；返回
													for (var i = 0; i < len; i++) {
														if (rows[i].key === ""
																|| rows[i].value === "") {
															$.messager
																	.alert(
																			'提示',
																			'参数或参数值不能为空');
															$("#propTable")
																	.datagrid(
																			'selectRow',
																			i);
															//显示原来所有数据
															showTable(upRows);
															return;
														}
													}
													//数据没问题，显示新数据，并写入到上传数组；
													upRows = [];
													showTable(rows, true);
													$("#propModal").window(
															'close');
												}
											});
							$("#btn4").linkbutton({
								text : '取消',
								onClick : function() {
									curRow = "";
									$("#propModal").window('close');
									console.log(upRows);
								}
							});
						})

		//更新table
		function showTable(arr, ifToUprows) {
			if (arr.length === 0) {
				return;
			}
			var tr = '';
			// 数组长度
			var length = arr.length;
			//取整
			var s = Math.floor(length / 3);
			//取余
			var y = length % 3;
			for (var i = 0; i < s; i++) {
				//是否更新上传数组数据
				ifToUprows === true ? upRows.push(arr[3 * i], arr[3 * i + 1],
						arr[3 * i + 2]) : "";
				//每行3对数据
				tr += '<tr><td class="key">'
						+ arr[3 * i].key
						+ ':</td><td class="value" title="'+arr[3*i].value+'">'
						+ arr[3 * i].value
						+ '</td><td class="key">'
						+ arr[3 * i + 1].key
						+ ':</td><td class="value" title="'+arr[3*i+1].value+'">'
						+ arr[3 * i + 1].value
						+ '</td><td class="key">'
						+ arr[3 * i + 2].key
						+ ':</td><td class="value" title="'+arr[3*i+2].value+'">'
						+ arr[3 * i + 2].value + '</td></tr>';
			}
			//如果余数不为0.只有2种情况，无需循环，直接具体值比较
			if (y === 1) {
				upRows.push(arr[3 * s]);
				tr += '<tr><td class="key">'
						+ arr[3 * s].key
						+ ':</td><td class="value" title="'+arr[3*s].value+'">'
						+ arr[3 * s].value
						+ '</td><td class="key"></td><td class="value"></td><td class="key"></td><td class="value"></td></tr>';
			} else if (y === 2) {
				upRows.push(arr[3 * s], arr[3 * s + 1]);
				tr += '<tr><td class="key">'
						+ arr[3 * s].key
						+ ':</td><td class="value" title="'+arr[3*s].value+
		'">'
						+ arr[3 * s].value
						+ '</td><td class="key">'
						+ arr[3 * s + 1].key
						+ ':</td><td class="value" title="'+arr[3*s+1].value+'">'
						+ arr[3 * s + 1].value
						+ '</td><td class="key"></td><td class="value"></td></tr>'
			}
			$("#spProp").html(tr).show();
			$("#spProp_Btn").html("收起").show();
		}

		//正确显示
		function showRight(elem) {
			elem.siblings("span.warming").hide();
			elem.css("border", "");
		}

		//错误显示
		function showError(elem) {
			elem.css("border", "1px solid red");
			elem.siblings("span.warming").show();
		}

		//检测商品类别
		function checkType() {
			if (typeName === "") {
				showError($("#selectType"));
				return false;
			} else {
				showRight($("#selectType"));
				return true;
			}
		}

		//检测属性
		function checkProp() {
			if (upRows.length <= 0) {
				$.messager.alert("提示", "请先输入商品参数");
				return false;
			} else {
				return true;
			}
		}

		//检测图片
		function checkPhoto() {
			if (imgUrlArr2.length === 0) {
				$.messager.alert("提示", "请上传商品详细图片");
				return false;
			} else {
				return true;
			}
		}

		//点击提交按钮
		$("#save").click(save);
		function save() {

			//数据检测
			/* 			switch (false) {
			 case checkType():
			 $("#selectType")[0].scrollIntoView(true);
			 return;
			 case checkBrand():
			 $("#brand")[0].scrollIntoView(true);
			 return;
			 case checkHuoHao():
			 $("#huoHao")[0].scrollIntoView(true);
			 return;
			 case checkName():
			 $("#name")[0].scrollIntoView(true);
			 return;
			 case checkPrice($("#price1")):
			 $("#price1")[0].scrollIntoView(true);
			 return;
			 case checkPrice($("#price2")):
			 $("#price2")[0].scrollIntoView(true);
			 return;
			 case checkDetails():
			 $("#details")[0].scrollIntoView(true);
			 return;
			 case checkProp():
			 $("#propBtn")[0].scrollIntoView(true);
			 return;
			 case checkPhoto():
			 return;
			 } */

			var trs = $("#spSellProps tr:gt(0)");
			//已添加的商品总数
			var trsLength = trs.length;
			//如果商品总数大于图片数
			if (trsLength > sku.length) {
				$.messager
						.alert('提示', '请先填写商品' + (sku.length + 1) + '信息以及上传图片');
				return;
			}

			//收集销售属性和主图url到spu
			imgUrlArr1 = [];
			var json = {};
			//商家账号id 即电话号码
			json.id = $("#id").val();
			//店家的店家的姓名
			json.shoper_name = $("#name").val();
			//商家的店名
			json.seller_name = $("#shop_name").val();
			//遍历每行tr下面的字段，添加到对应sku的json
			for (var i = 0; i < trsLength; i++) {
				var inputs = $(trs[i]).find('input[type!="button"]');
				//给每个sku添加对应销售属性
				var propLength = sellProps.length;
				for (var j = 0; j < propLength; j++) {
					var val = inputs[j + 1].value;
					//如果值为空
					if (val == "") {
						showError($(inputs[j + 1]));
						inputs[j + 1].scrollIntoView(true);
						return;
					}
					//spu的属性数组收集属性
					json["property" + (j + 1)] == undefined ? json["property"
							+ (j + 1)] = [] : "";
					//不存在就push
					json["property" + (j + 1)].indexOf(val) < 0 ? json["property"
							+ (j + 1)].push(val)
							: '';
					//sku添加属性
					sku[i]["property" + (j + 1)] = val;
				}
				//是否插入图片到imgUrlArr;
				var add = true;
				// 如果有多个sku，就要进行重复检测
				if (i > 0) {
					var curSku = sku[i];
					//其他所有sku循环
					for (var p = 0; p < i; p++) {
						//如果当前sku的销售属性与之前相同，就不添加图片
						if (curSku.property1 === sku[p].property1) {
							add = false;
						}
						var pos = false;
						//每个sku的销售属性循环
						for (var q = 0; q < propLength; q++) {
							if (curSku["property" + (q + 1)] === sku[p]["property"
									+ (q + 1)]) {
								pos = true;
							} else {
								pos = false;
								break;
							}
						}
						if (pos) {
							showError($(inputs[1]));
							inputs[1].scrollIntoView(true);
							$.messager.alert("提示", '商品' + (i + 1) + '与商品'
									+ (p + 1) + '重复');
							return;
						}
					}
				}
				add === true ? imgUrlArr1.push(sku[i].url) : "";
				//sku库存检测
				var kc = inputs[propLength + 1];
				if (!checkKuCun($(kc))) {
					kc.scrollIntoView(true);
					return;
				}
				sku[i].kuCun = parseInt(kc.value);
			}
			json.typeId = typeId;//产品的分类id
			json.huoHao = $("#huoHao").val();//商品货号
			json.productName = $("#productName").val();//商品名称
			json.pinPai = $("#brand").val();//商品品牌
			json.yuanJia = parseFloat($("#price1").val()) * 100;//价格转化为分
			json.xianJia = parseFloat($("#price2").val()) * 100;
			json.details = $("#details").val();//商品描述 即商品的卖点
			json.props = JSON.stringify(upRows); //商品属性详情
			json.imgUrl1 = imgUrlArr1.join(',');//商品详细图url拼接
			json.imgUrl2 = imgUrlArr2.join(',');//商品详细图url拼接
			json.sellProps = JSON.stringify(sellProps);//销售属性字段数组，选择商品类别时传过来的
			var str1 = new Date().getTime();
			var str2 = String(Math.random()).substring(6, 7);
			var str3 = String(Math.random()).substring(6, 7);
			var str4 = String(Math.random()).substring(6, 7);
			json.spuId = str1 + str2 + str3 + str4;
			//生成skuId;
			var skuLength = sku.length;
			for (var k = 0; k < skuLength; k++) {
				//具体sku
				var obj = sku[k];
				id = "";
				//遍历每个属性来生成id
				for (var l = 0; l < sellProps.length; l++) {
					//第一个属性为A，
					var propStr = "";
					switch (l) {
					case 0:
						propStr = 'A';
						break;
					case 1:
						propStr = 'B';
						break;
					case 2:
						propStr = 'C'
						break;
					default:
						propStr = '';
					}
					var valueIndex = json["property" + (l + 1)]
							.indexOf(obj["property" + (l + 1)]);
					valueIndex < 10 ? valueIndex = "0" + valueIndex : "";
					id += propStr + valueIndex;
				}
				sku[k].skuId = json.spuId + id;
			}
			json.sku = JSON.stringify(sku);
			//将json的property1、property2……属性的数组值转成数组字符串
			for (var z = 0; z < sellProps.length; z++) {
				json["property"+(z+1)] = JSON.stringify(json["property"+(z+1)]);
			}
			//发送ajax请求后台的的路径
			var url = "addProduct";
			doAjax(json, url, callback);
			console.log(json);

		}

		//ajax请求服务器
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
					alert("系统异常  稍后重试！")
				}
			});
		}

		// 成功回调函数
		function callback(data) {
			if(data.result=="0"){
				return swal({
					title:"添加成功",
					confirmButtonText:"确定",
				},function(isConfirm){				
					window.history.go(-1);
				});
			}
			
			if(data.result=="1"){
				return swal({
					title:"添加失败",
					confirmButtonText:"确定",
				});
			}
		}
	</script>
</body>
</html>