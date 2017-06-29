<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——商家审核表</title>
	<link type="image/x-icon" rel="shortcut icon" href="/images/logo.jpg" />
	<link rel="stylesheet" type="text/css" href="/css/shenHeBiao.css">
	<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/js/shenHeBiao.js"></script>
	<script class="resources library" src="/js/area.js" type="text/javascript"></script>
</head>
<body>
	<header class="header">
		<div class="headerMsg">
			货比五家商家后台管理系统
		</div>
	</header>

	<form class="form">
		<p>商家审核表</p><hr>          

		<div class="item">
			<span class="ziduan">店主姓名：</span><input type="text" name="name" id="name" placeholder="必填" />
		</div>

		<div class="item">
			<span class="ziduan">店铺名称：</span><input type="text" id="name2" placeholder="必填"/>
		</div>

		<div class="item">
			<span class="ziduan">身份证号：</span><input type="text" id="userId" placeholder="必填"/><br/>
			<input type="file" accept="image/*" id="shenfenzheng" 
			onchange="selectImg('shenfenzheng')" multiple />
			<span class="notes">(请上传正反身份证照片)</span>
			<div id="shenfenzheng_imgs" class='container'></div>
		</div>

		<div class="item">
			<span class="item_left">
				<span class="ziduan">店铺类型：</span>
				<select id="shopType">
					<option value="类型1">类型1</option>
					<option value="类型2">类型2</option>
					<option value="类型3">类型3</option>
				</select>
			</span>
			<span class="item_right">
				<span class="ziduan">产品类型：</span>
				<select id="productType">
					<option value="类型1">类型1</option>
					<option value="类型2">类型2</option>
					<option value="类型3">类型3</option>
				</select>
			</span>
		</div>

		<div class="item">
			<span class="ziduan">营业执照：</span>
			<select id="yingyeZhizhao">
				<option value="qiye">企业执照</option>
				<option value="geti">个体执照</option>
			</select>
			<span class="notes"></span>
			<input type="file" accept="image/*" id="zhizhao" onchange="selectImg('zhizhao')" multiple />
			<span class="notes">(请上传营业执照)</span>
			<div id="zhizhao_imgs" class="container"></div>
		</div>

		<div class="item">
			<span class="ziduan">商标授权书：</span>
			<input type="file" accept="image/*" id="shouquanshu" onchange="selectImg('shouquanshu')" multiple />
			<span class="notes">(请上传商标授权书)</span>
			<div id="shouquanshu_imgs"  class="container"></div>
		</div>

		<div class="item">
			<span class="ziduan">实体门面图：</span>
			<input type="file" accept="image/*" id="menmiantu" onchange="selectImg('menmiantu')" multiple />
			<span class="notes">(请上传实体门面图)</span>
			<div id="menmiantu_imgs" class="container"></div>
		</div>

		<div class="item">
			<span class="ziduan">店铺地址：</span>
			<div class="dizhi1">
				<select id="s_province" name="s_province"></select>  
				<select id="s_city" name="s_city" ></select>  
				<select id="s_county" name="s_county"></select>
			</div>
			<textarea class="dizhi2" id="dizhi2" rows="3" placeholder="请补充详细地址..."></textarea>
		</div>

		<div class="item">
			<span class="ziduan">联系电话：</span><input type="text" id="contact" placeholder="必填"> 
		</div>

		<div class="item footerBtn">
			<input type="button" class="button" value="提交" onclick="save()"/>
		</div>
	</form>

	<footer class="footer">
		<div class="footerMsg">
			<br/>
			Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights Reserved.<br/>
			联系电话：020-29061583
		</div>		
	</footer>

</body>
</html>