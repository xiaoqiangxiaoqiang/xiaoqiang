<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>查看商家店铺申请信息</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shenHeShangJiaIframe.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/viewer.min.css" />
</head>
<body>
	<div class="main">
		<p class="title">商家基本信息</p>
		<input type="hidden" id="user_name" value="${review.id}" >
		<div class="wrapDiv">
			<table id="sjInfo" class="table">
				<tr>
					<td class="leftTd">
						<span class="ziduan">店铺名称：</span>
					</td>
					<td class="rightTd">
						<span title="${review.getShop_name()}">${review.getShop_name()}</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">店主姓名：</span>
					</td>
					<td class="rightTd">
						<span title="${review.getName()}">${review.getName()}</span>
					</td> 
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">身份证号：</span>
					</td>
					<td class="rightTd">
						<span title="${review.getIndentifyId()}">${review.getIndentifyId()}</span>
					</td> 
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">营业执照：</span>
					</td>
					<td class="rightTd">
						<span id="zhiZhao"></span>
					</td> 
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">店铺类型：</span>
					</td>
					<td class="rightTd">
						<span id="shopType"></span>
					</td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">主营产品：</span>
					</td>
					<td class="rightTd">
						<span title="${review.getProduct_type()}">${review.getProduct_type()}</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">店铺地址：</span>
					</td>
					<td class="rightTd">
						<textarea  id="address" rows="4" readonly="readonly" title="${review.getShop_addr()}">${review.getShop_addr()}</textarea>
					</td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">联系电话：</span>
					</td>
					<td class="rightTd">
						<span id="tel" title="${review.getChat_info()}">${review.getChat_info()}</span>
					</td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ziduan">申请日期：</span>
					</td>
					<td class="rightTd">
						<span id="date" title='<fmt:formatDate value="${review.getApplyTime()}" pattern="yyyy-MM-dd" />'><fmt:formatDate value="${review.getApplyTime()}" pattern="yyyy-MM-dd" /></span>
					</td>
				</tr>
			</table>
		</div>

		<hr>
		<p class="title">身份证正反照</p>
		<p class="title2">身份证号码：<span title="${review.getIndentifyId()}">${review.getIndentifyId()}</span></p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p class='max'>单击图片放大预览</p>
				<ul id="imgUl1" class="imgUl"></ul>
			</div>
		</div>

		<hr>
		<p class="title">营业执照</p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p>单击图片放大预览</p>
				<ul id="imgUl2" class="imgUl"></ul>
			</div>
		</div>

		<hr>
		<p class="title">商标授权书</p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p class='max'>单击图片放大预览</p>
				<ul id="imgUl3" class="imgUl"></ul>
			</div>
		</div>

		<hr>
		<p class="title">实体门店图</p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p class='max'>单击图片放大预览</p>
				<ul id="imgUl4" class="imgUl"></ul>
			</div>
		</div>
		<div id="resultDiv">
			<hr>
			<p class="title">审核结果</p>
			<div class="wrapDiv">
				<p class="shenHe">
					<input type="radio" id="success" name="result" value='1'/><label for="success">审核通过</label>&ensp;&ensp;<input type="radio" id="fail" name="result" value='0'/><label for="fail">审核不通过</label>
					<div id="reasonDiv">
						<textarea id="failReason" rows="6" placeholder="请输入审核不通过原因，至少20个字"></textarea>
						<span class='warming'>至少20个字</span>
					</div>
				</p>
				<p class="title"><button id="submit" title="提交审核">提&ensp;交</button></p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/viewer-jquery.min.js"></script>
	<script>

		$(document).ready(function(){
		//获取当前文档的高度与宽度
		var width=$(document).width();
		$("div.imgDiv").width(width*0.85+"px");

		//获取身份证、执照图、商标图、门面图url数组
		 var urlStr1 = '${review.getIdentifyUrlA()}';
		 var urlStr2 = '${review.certificate_url}';
		 var urlStr3 = '${review.getShop_identify()}';
		 var urlStr4 = '${review.getShop_url()}';
		var urlArr=[urlStr1,urlStr2,urlStr3,urlStr4];
		console.log(urlArr);
		for(var i=0;i<4;i++){
			var title="";
			switch(i){
				case 0:
				title="身份证图片";
				break;
				case 1:
				title="营业执照图";
				break;
				case 2:
				title="商标授权图";
				break;
				case 3:
				title="实体门店图";
				break;
			}
			var urls=urlArr[i].split(',');
			var length=urls.length;
			//当前imgUl
			var imgUl=$('#imgUl'+(i+1));
			//遍历当前urlArr[i];
			for(var j=0;j<length;j++){
				var img=$('<li><div class="imgWrap"><img src='+urls[j]+' class="img" title="'+title+(j+1)+'" alt="'+title+(j+1)+'"></div><li>');
				img.appendTo(imgUl);
			}
			//分别初始化viewer
			imgUl.viewer({zoomRatio:0.35,minZoomRatio:0.2});
		}

		//店铺类型
		 var shopType=${review.getShop_type()};
		 switch(shopType){
		 	case 0:
		 	$("#shopType").html("旗舰店").attr('title','旗舰店');
		 	break;
	 		case 1:
		 	$("#shopType").html("专营店").attr('title','专营店');
		 	break;
			case 2:
		 	$("#shopType").html("专卖店").attr('title','专卖店');
		 	break;
		 	case 3:
			$("#shopType").html("个体店").attr('title','个体店');
		 	break;
		 }

		//店铺执照
		 var zhiZhao=${review.getReserved1()};
		 switch(shopType){
		 	case 1:
		 	$("#zhiZhao").html("企业执照").attr('title','企业执照');
		 	break;
		 	case 2:
		 	$("#zhiZhao").html("个体执照").attr('title','个体执照');
		 	break;
		 }

		//选择审核结果
		$("#resultDiv").on('click','input',function(){
			if($(this).val()=="0"){
				$('#reasonDiv span.warming').hide();
				$("#reasonDiv").css('display',"inline-block");
				$("#failReason").val("").focus();
			}else{
				$("#reasonDiv").hide(200);
			}
		});
		$("#failReason").blur(function(){
			if($(this).val().length<20){
				$(this).siblings('span.warming').show();
			}else{
				$(this).siblings('span.warming').hide();
			}
		});
	})

//提交
$('#submit').click(function(){
	var json={};
	var url='';
	json.id=$("#user_name").val();
	//审核结果	
	json.result=$("input[type='radio']:checked").val();
	if(json.result===undefined){
		alert('请先进行审核');
		return;
	}else if(json.result==="0"){
		url="refuseAuthority";
		//不通过原因
		json.reserved2=$("#failReason").val();
		if(json.reserved2.length<20){
			$("#failReason").siblings('span.warming').show();
			$("#failReason").focus();
			return;
		}
	}else{
		url='reviewApply';
	}
		$.ajax({
			type : 'POST',
			url : url,
			data : json,
			dataType : 'JSON',
			success : function(data) {
				callback(data);
			},
			error : function(e) {
				alert("系统出错:"+e);
			}
		})
})

//提交后的回调函数
function callback(data){
	if(data.result=="0"){
		//隐藏审核Div,防止用户再次提交审核
		$('#resultDiv').hide();
		alert('提交成功');
		return;
	}else if(data.result=="1"){
		alert('提交失败');
	}else{
		alert('系统异常，请稍后再试');
	}
}
</script>
</body>
</html>