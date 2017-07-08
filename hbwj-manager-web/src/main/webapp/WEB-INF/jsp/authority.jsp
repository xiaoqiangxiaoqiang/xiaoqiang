<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——商家审核表</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/sweetalert.css">
	<link type="image/x-icon" rel="shortcut icon" href="${ctx}/images/logo.jpg" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/shenHeBiao.css">
	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script class="resources library" src="${ctx}/js/area.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/js/shenHeBiao.js"></script>
	<script type="text/javascript" src="${ctx}/js/sweetalert.min.js"></script>
	
	<!-- 映入kindEditor 上传图片 -->
	<link rel="stylesheet" href="${ctx}/js/kindeditor/themes/default/default.css" />
    <script src="${ctx}/js/kindeditor/kindeditor.js"></script>
    <script src="${ctx}/js/kindeditor/lang/zh_CN.js"></script>
    
    <!-- 添加easyUI -->
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<header class="header">
		<div class="headerMsg">
			货比五家商家后台管理系统
		</div>
	</header>

	<form class="form"  enctype="multipart/form-data">
		<p class="formHead">商家审核表</p><hr>          
		
		<!-- 隐藏商家的信息 -->
		<input type="hidden"  id ="id" value="${user.getUser_name()}">
		
		<div class="item">
			<span class="must">*</span>
			<span class="ziduan">店主姓名：</span>
			<input type="text" name="name" id="name" placeholder="必填" />
		</div>

		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">店铺名称：</span>
			<input type="text" id="name2" name="name2" placeholder="必填"/>
		</div>

		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">身份证号：</span>
			<input type="text" id="userId" name = "userId" placeholder="必填"/><br/>
		</div>
		
		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">身份证正反照：</span>
			<input  type="text" name="uploadFiles" style="width: 60px;" id="SFZTP" placeholder="点击上传"/>					
			<!-- <span class="notes sfzNotes">(请上传正反身份证照片)</span> -->
			<!-- 拼接身份证的上传回调路径 -->
			<input type="hidden" id="identfy" name="identfy" />
			<!-- 图片预览的位置 -->
			<div class="div"></div>
		</div>

		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">营业执照：</span>
			<select id="yingyeZhizhao">
				<option value="1">企业执照</option>
				<option value="2">个体执照</option>
			</select></span>
			<input type="text" style="width: 60px;" id="YYZZ" placeholder="点击上传"/>
			<span class="notes"></span>			
			<!-- <span class="notes">(请上传营业执照)</span> -->
			<input type="hidden" id="certificate_url">
			<div class="div1"></div>
			
			
		</div>

		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">商标授权书：</span></span>
			<input type="text" style="width: 60px;" id="SBSQS" placeholder="点击上传"/>		
			<!-- <span class="notes">(请上传商标授权书)</span> -->
			<input type="hidden" id="shop_identify">
			<div class="div2"></div>
		</div>

		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">实体门面图：</span>
			<input type="text" style="width: 60px;" id="STMMT" placeholder="点击上传"/>			
			<!-- <span class="notes">(请上传实体门面图)</span> -->
			<input type="hidden" id="shop_url">
			<div class="div3"></div>
		</div>


		<div class="item">
		<span class="must">*</span>
				<span class="ziduan">店铺类型：</span>
				<select id="shopType">
				<option value="0">旗舰店</option>
				<option value="1">专营店</option>
				<option value="2">专卖店</option>					
				<option value="3">个体店</option>
			  <select>
				
		</div>
		
		<div class="item">
		<span class="must">*</span>
				<span class="ziduan">产品类型：</span>
				<input type="button" id="CPLX" onclick='$("#win").window("open")' value="选择类目"/>
				<span id="shopCate" ></span>
		</div>
		
		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">店铺地址：</span>
			<div class="dizhi1">
				<select id="s_province" name="s_province"></select>  
				<select id="s_city" name="s_city" ></select>  
				<select id="s_county" name="s_county"></select>
			</div>
			<textarea class="dizhi2" id="dizhi2" rows="3" placeholder="请补充详细地址..." ></textarea>
		</div>
		
		<div class="item">
		<span class="must">*</span>
			<span class="ziduan">联系电话：</span><input type="text" id="contact" placeholder="必填"> 
		</div>

		<div class="item footerBtn">
			<input type="button" class="button" value="提交" onclick="save()"/>
		</div>
	</form>
	
	<!-- 编写模态窗口 -->
	<div id="win" class="easyui-window" title="商店类别" 
	   data-options="modal:true,closed:true,iconCls:'icon-save'" 
	   style="width: 300px;height: 400px;padding:10px;">
	    <ul id="tree" class="easyui-tree" ></ul>
	</div>


	<footer class="Footer">
		<div class="footerMsg">
			<br/>
			Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights Reserved.<br/>
			联系电话：020-29061583
		</div>		
	</footer>
	
	<script type="text/javascript">
	
	
	
	/*
	 *商家注册商店种类
	*/
	$(document).ready(function(){
		$("#tree").tree({
			url:"${ctx}/hbwj/shop/loadShopCat",
			onClick:function(node,target){
				$("#shopCate").html(node.text);
				
			}
			
		});
		
		KindEditor.ready(function(K){
			var editor = K.editor({
			    uploadJson:"${ctx}/hbwj/shop/upLoadPicture",
			    filePostName:"uploadFiles",
				allowFileManager : true,  //开启多文件上传
				dir:"image"
			});
			
			//选择上传省份证照片的正反面
			K('#SFZTP').click(function () {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						showRemote:false,
						clickFn:function(data){
							var purl="";
							for(var i=0;i<data.length;i++){
								 purl += data[i].url+",";
								$("#identfy").val(purl);
								 var img ='<img style="display:block; width:100px;height: 100px;" alt="" src="'+data[i].url+'">'
								$(".div").html($(".div").html()+img);
							}									
						}
					});
				});
			});
			
			
			//上传商家营业执照图
			K('#YYZZ').click(function () {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						showRemote:false,
						clickFn:function(data){
							var purl="";
							for(var i=0;i<data.length;i++){
								purl += data[i].url+",";
								$("#certificate_url").val(purl);
								 var img ='<img style="display:block; width:100px;height: 100px;" alt="" src="'+data[i].url+'">'
								$(".div1").html($(".div1").html()+img);
							}									
						}
					});
				});
			});
			
			//上传商标授权书
			K('#SBSQS').click(function () {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						showRemote:false,
						clickFn:function(data){
							var purl="";
							for(var i=0;i<data.length;i++){
								purl += data[i].url+",";
								$("#shop_identify").val(purl);
								 var img ='<img style="display:block; width:100px;height: 100px;" alt="" src="'+data[i].url+'">'
								$(".div2").html($(".div2").html()+img);
							}									
						}
					});
				});
			});
			
			
			//实体门面图
			K('#STMMT').click(function () {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						showRemote:false,
						clickFn:function(data){
							var purl="";
							for(var i=0;i<data.length;i++){
								purl += data[i].url+",";
								$("#shop_url").val(purl);
								 var img ='<img style="display:block; width:100px;height: 100px;" alt="" src="'+data[i].url+'">'
								$(".div3").html($(".div3").html()+img);
							}									
						}
					});
				});
			});
		});
		
	})
	
	</script>
	
</body>

</html>