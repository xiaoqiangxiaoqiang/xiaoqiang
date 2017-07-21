<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>审核商家Iframe</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/shenHeShangJiaIframe.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/viewer.min.css" />
</head>
<body>
	<div class="main">
		<p class="title">商家基本信息</p>
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
						<span id="date" title="${review.getApplyTime()}">${review.getApplyTime()}</span>
					</td>
				</tr>
			</table>
		</div>

		<hr>
		<p class="title">身份证正反照</p>
		<p class="title2">身份证号码：<span>${review.getIndentifyId()}</span></p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p>单击图片放大预览</p>
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
				<p>单击图片放大预览</p>
				<ul id="imgUl3" class="imgUl"></ul>
			</div>
		</div>

		<hr>
		<p class="title">实体门店图</p>
		<div class="wrapDiv">
			<div class="imgDiv">
				<p>单击图片放大预览</p>
				<ul id="imgUl4" class="imgUl"></ul>
			</div>
		</div>

		<div id="resultDiv">
			<hr>
			<p class="title">审核结果</p>
			<div class="wrapDiv">
				<p>
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
	<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/js/viewer-jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/shenHeShangJia.js"></script>
</body>
</html>