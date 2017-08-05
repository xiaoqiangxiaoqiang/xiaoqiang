<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<title>商家商品审核</title>
<link rel="stylesheet" type="text/css"
	href="../../../css/shenHeShangPinIframe.css" />
<link rel="stylesheet" type="text/css"
	href="../../../css/viewer.min.css" />
<script type="text/javascript" src="../../../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../../../js/viewer-jquery.min.js"></script>
<script type="text/javascript" src="../../../js/chaKanShangPin.js"></script>
</head>
<body>
	<div class="main">
		<p class="title">商品基本信息</p>
		<input type="hidden" id="spuId" value="${spu.spuId}" />
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
					<td class="leftTd"><span class="ziduan" title="商品类别">商品类别：</span>
					</td>
					<td class="rightTd"><span id="typeName"
						title='${spu.getCatId()}'>${spu.getCatId()}</span></td>
				</tr>
				<tr>

					<td class="leftTd"><span class="ziduan" title="商品主标题">商品名称：</span>
					</td>
					<td class="rightTd"><textarea id="name" rows="3"
							title="${spu.getSpuName()}" readonly="readonly">${spu.getSpuName()}</textarea></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ziduan" title="商品品牌">商品品牌：</span>
					</td>
					<td class="rightTd"><span id="brand"
						title='${spu.getBranch()}'>${spu.getBranch()} </span></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ziduan"
						title="当前页面所添加的颜色款式或尺码不同的同一商品，均为同一货号">商品货号：</span></td>
					<td class="rightTd"><span id="huoHao"
						title='${spu.getProductNum()}'>${spu.getProductNum()}</span></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ziduan" title="商品原价">商品原价：</span>
					</td>
					<td class="rightTd"><span id="price1"
						title=<fmt:formatNumber type="number" value="${spu.getOriprice()/100}" maxFractionDigits="2" minFractionDigits="2"/>>
							<fmt:formatNumber type="number" value="${spu.getOriprice()/100}"
								maxFractionDigits="2" minFractionDigits="2" />
					</span>&ensp;元</td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ziduan" title="商品优惠价">商品现价：</span>
					</td>
					<td class="rightTd"><span id="price2"
						title=<fmt:formatNumber type="number" value="${spu.getNowprice()/100}" maxFractionDigits="2" minFractionDigits="2"/>><fmt:formatNumber
								type="number" value="${spu.getNowprice()/100}"
								maxFractionDigits="2" minFractionDigits="2" /></span>&ensp;元</td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ziduan" title="商品副标题">商品卖点：</span>
					</td>
					<td class="rightTd"><textarea id="details" rows="6"
							readonly="readonly" title="${spu.getSellPoint()}">${spu.getSellPoint()}
						</textarea></td>
				</tr>
			</table>
		</div>

		<hr>
		<p class="title">子商品列表</p>
		<div class="wrapDiv" id=wrapDiv1>
			<table id="spSellProps" class="table">
				<tr>
					<td>子商品序号</td>
					<c:if test="${not empty spuInfo.property1}">
						<td>${spuInfo.property1}</td>
					</c:if>
					<c:if test="${not empty spuInfo.property2}">
						<td>${spuInfo.property2}</td>
					</c:if>
					<c:if test="${not empty spuInfo.property3}">
						<td>${spuInfo.property3}</td>
					</c:if>
					<td>库存(件)</td>
				</tr>
				<c:forEach items="${list}" var="sku" varStatus="status">
					<tr>	
						<td>${status.index+1}</td>
						<c:if test="${not empty sku.property1}">
							<td title='${sku.property1}'>${sku.property1}</td>
						</c:if>
						<c:if test="${not empty sku.property2}">
							<td title='${sku.property2}'>${sku.property2}</td>
						</c:if>

						<c:if test="${not empty sku.property3}">
							<td title='${sku.property3}'>${sku.property3}</td>
						</c:if>
						<td title='${sku.skuNum}'>${sku.skuNum}</td>
					</tr>
				</c:forEach>
			</table><br>
			
			<!-- 所有子商品的url拼接字符串 -->
			<input type="hidden" id="imgsStr1" value="${spu.productImages}">
			<!-- spu的商品详情图字符串 -->
			<input type="hidden" id="imgsStr2" value="${spuInfo.productInfo}">
			<input type="hidden" id="props" value='${spuInfo.productParam}'>
			
			<p class="title">商品图片</p>
			<p class="collapse" id="imgDiv1_Btn">收起</p>
			<div id="imgDiv1" class="imgDiv">
				<p class='max'>单击图片放大预览</p>
				<ul id="imgUl1"></ul>
			</div>
		</div>

		<hr>
		<p class="title">商品参数</p>
		<div class="wrapDiv">
			<table id="spProp" class="table"></table>
		</div>
	</div>

	<hr>
	<p class="title">商品详细图</p>
	<div class="wrapDiv">
		<p class="collapse" id="imgDiv2_Btn">收起</p>
		<div id="imgDiv2" class="imgDiv">
			<p class='max'>单击图片放大预览</p>
			<ul id="imgUl2"></ul>
		</div>
	</div>
	<hr>
	
	<div id="resultDiv">
		<p class="title">审核结果</p>
		<div class="wrapDiv">
			<p>
				<input type="radio" id="success" name="result" value='1'/>
				<label for="success">审核通过</label>
				&ensp;&ensp;<input type="radio" id="fail" name="result" value='0'/>
				<label for="fail">审核不通过</label>
				<div id="reasonDiv">
					<textarea id="failReason" rows="6" placeholder="请输入审核不通过原因，至少20个字"></textarea>
					<span class='warming'>至少20个字</span>
				</div>
			</p>
			<p class="title"><button id="submit" title="提交审核">提&ensp;交</button></p>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			//选择审核结果
			$("#resultDiv").on('click','input',function(){
				if($(this).val()=="0"){
					$('#reasonDiv span.warming').hide();
					$("#reasonDiv").css('display',"inline-block");
					$("#failReason").val("").focus();
				}else{
					$("#reasonDiv").hide(100);
				}
			});

			$("#failReason").blur(function(){
				if($(this).val().length<20){
					$(this).siblings('span.warming').show();
				}else{
					$(this).siblings('span.warming').hide();
				}
			});
		});
			
	//提交相应的审核结果
	$('#submit').click(function(){
		alert("test1");
	  var spuId = $("#spuId").val();
	  var json={};
	  json.spu_id=spuId;
	//审核结果	
	json.result=$("input[type='radio']:checked").val();
	if(json.result===undefined){
		alert('请先进行审核');
		return;
	}else if(json.result==="0"){
		//不通过原因
		json.reason=$("#failReason").val();
		if(json.reason.length<20){
			$("#failReason").siblings('span.warming').show();
			$("#failReason").focus();
			return;
		}else{
			$.post('refuseReviewProduct',json,Callback);
		}
	}if(json.result==="1"){
		$.post('passReviewProduct',json,Callback);
	 }
   })
   
   //商品审核回调
   function Callback(data){
		if(data.result=="0"){
			alert("提交成功 ");
			return;
		}
		if(data.result=="1"){
			alert("提示","提交失败! 稍后重试!");
			return;
		}
	}
	 
	</script>
</body>
</html>