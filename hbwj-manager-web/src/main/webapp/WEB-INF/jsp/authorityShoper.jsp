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
<link type="image/x-icon" rel="shortcut icon"
	href="${ctx}/images/logo.jpg" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/shenHeBiao.css">
<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
<script class="resources library" src="${ctx}/js/area.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/shenHeBiao.js"></script>
<script type="text/javascript" src="${ctx}/js/sweetalert.min.js"></script>

<!-- 映入kindEditor 上传图片 -->
<link rel="stylesheet"
	href="${ctx}/js/kindeditor/themes/default/default.css" />
<script src="${ctx}/js/kindeditor/kindeditor.js"></script>
<script src="${ctx}/js/kindeditor/lang/zh_CN.js"></script>

<!-- 添加easyUI -->
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
<!--引入viewer.js  -->
<link rel="stylesheet" href="${ctx}/css/viewer.min.css">
<script src="${ctx}/js/viewer-jquery.min.js"></script>
</head>
<body>
	<header class="header">
		<div class="headerMsg">货比五家商家后台管理系统</div>
	</header>
	
	<form class="form" enctype="multipart/form-data">
		<p class="formHead">商家审核表</p>
		<hr>

		<!-- 隐藏商家的信息 -->
		<input type="hidden" id="id" value="${review.getId()}">

		<div class="item">
			<span class="must">*</span> <span class="ziduan">店主姓名：</span> <input
				type="text" name="name" id="name" value="${review.getName()}" />
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">店铺名称：</span> <input
				type="text" id="name2" name="name2" value="${review.getShop_name()}" />
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">身份证号：</span> <input
				type="text" id="userId" name="userId"
				value="${review.getIndentifyId()}" /><br />
		</div>

		<div class="item">
		
			<span class="must">*</span> <span class="ziduan">身份证正反照：</span>
			<!-- 图片预览的位置 -->
			<ul id='div' class="div imgUl"></ul>
			<c:if test="${not empty review.getIdentifyUrlA()}">
				<script type="text/javascript">
					var url = "${review.getIdentifyUrlA()}";
					var urls = url.split(",")
					for (var i = 0; i < urls.length; i++) {
						var img = '<li class="imgLi"><img class="img" alt="" src="'+urls[i]+'"></li>'
						$("#div").html($("#div").html() + img);
					}
					$("#div").viewer();
				</script>
			</c:if>
			
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">营业执照：</span> <span
				id="reserved1"></span>
			<c:if test="${review.getReserved1()}==1">
				<script type="text/javascript">
					$("#reserved1").html("企业执照");
				</script>

			</c:if>

			<c:if test="${review.getReserved1()}==2">
				<script type="text/javascript">
					$("#reserved1").html("个体执照");
				</script>
			</c:if>
			<input type="hidden" id="certificate_url">
			<ul id ="div1" class="imgUl"></ul>
			<c:if test="${not empty review.getCertificate_url()}">
				<script type="text/javascript">
					var url = "${review.certificate_url}";
					var urls = url.split(",")
					for (var i = 0; i < urls.length; i++) {
						var img = '<li class="imgLi"><img class="img" alt="" src="'+urls[i]+'"></li>'
						$("#div1").html($("#div1").html() + img);
					}
					$("#div1").viewer();
				</script>
			</c:if>

		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">商标授权书：</span> <input
				type="hidden" id="shop_identify">
			<div id ="div2" class="imgUl"></div>
			<c:if test="${not empty review.getShop_identify()}">
				<script type="text/javascript">
					var url = "${review.getShop_identify()}";
					var urls = url.split(",")
					for (var i = 0; i < urls.length; i++) {
						var img = '<li class="imgLi"><img class="img" alt="" src="'+urls[i]+'"></li>'
						$("#div2").html($("#div2").html() + img);
					}
					$("#div2").viewer();
				</script>
			</c:if>
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">实体门面图：</span> <input
				type="hidden" id="shop_url">
			<div id="div3" class="imgUl"></div>
			<c:if test="${not empty review.getShop_url()}">
				<script type="text/javascript">
					var url = "${review.getShop_url()}";
					var urls = url.split(",")
					for (var i = 0; i < urls.length; i++) {
						var img = '<li class="imgLi"><img class="img" alt="" src="'+urls[i]+'"></li>'
						$("#div3").html($("#div3").html() + img);
					}
					$("#div3").viewer();
				</script>
			</c:if>
		</div>


		<div class="item">
			<span class="must">*</span> <span class="ziduan">店铺类型：</span> <span
				id="shop_type"></span>
			<c:if test="${review.getShop_type()}==0">
				<script type="text/javascript">
					$("#shop_type").val("旗舰店");
				</script>
			</c:if>
			<c:if test="${review.getShop_type()}==1">
				<script type="text/javascript">
					alert("${review.getShop_type()}");
					$("#shop_type").val("专营店");
				</script>
			</c:if>
			<c:if test="${review.getShop_type()}==2">
				<script type="text/javascript">
					$("#shop_type").val("专卖店");
				</script>
			</c:if>
			<c:if test="${review.getShop_type()}==3">
				<script type="text/javascript">
					$("#shop_type").val("个体店");
				</script>
			</c:if>

		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">产品类型：</span> <input
				type="button" id="CPLX" onclick='$("#win").window("open")'
				value="选择类目" /> <span id="shopCate">${review.getProduct_type()}</span>
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">店铺地址：</span>
			<textarea class="dizhi2" id="dizhi2" rows="3"></textarea>
			<c:if test="${not empty review.getShop_addr()}">
				<script type="text/javascript">
					var kk = '${review.getShop_addr()}';
					$("#dizhi2").val(kk);
				</script>

			</c:if>

		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">联系电话：</span><input
				type="text" id="contact" value="${review.getChat_info()}">
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">申请日期：</span><input
				type="text" id="contact" value="${review.getApplyTime()}">
		</div>

		<div class="item">
			<span class="must">*</span> <span class="ziduan">审核不通过的原因：</span>
			<textarea class="dizhi2" id="reserved2" rows="3"
				placeholder="填写审核不通过的原因......"></textarea>
		</div>


		<div class="item footerBtn">
			<input type="button" class="button" value="审核通过"
				onclick="passAuthority()" /> <input type="button" class="button"
				value="审核不通过" onclick="noPassAuthority()" />
		</div>
	</form>
<footer class="Footer">
		<div class="footerMsg">
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>
	

	<script type="text/javascript">
	$(document).ready(function(){
		var min_height=document.body.clientHeight-70;
		var height=$("form.form").height()+70;
		$("footer.Footer").css("top",height>min_height?(height+"px"):(min_height+"px"));
		var width=document.body.clientWidth;
		$("form.form").css("left",(width-700)/2+"px");
	})
		
		
		//审核通过按钮功能
		 function passAuthority(){
			 var json = {};
				json.id = $("#id").val();
				alert("审核通过");
				doAjax(json, "reviewApply", callBack);
				
			};
	
	
			//审核通过回调的函数
	    function callBack(){
		    	try {
					if (data.result === "0") {
						return swal({
							title : "提交审核成功！",
							text : "点击确认回到主页",
							confirmButtonText : "确定",
						}, function(isConfirm) {
							window.history.back(-1);
						});
					} else if (data.result === "1") {
						returnswal({
							title : "提交信息失败",
							text : "稍后再试!",
							confirmButtonText : "确定",
						}, function(isConfirm) {
						});
					}
				} catch (e) {
					alert("提交信息失败：" + e);
				}
			}
			
		//审核不通的按钮功能
		function noPassAuthority(){
			alert("");
			//获取审核不通过是的必须要填写的原因
			var reserved2=$("#reserved2").val();
			alert(reserved2);
			if(reserved2==undefined || reserved2=="" || reserved2==null){
				return swal({
					title : "温馨提示",
					text : "请输入审核不通的意见",
					confirmButtonText : "确定",
				});
				return ;
			}
			var json = {};
			//获取主键的id
			json.id = $("#id").val();
			//获取审核不通过的意见
			json.reserved2 =reserved2;
			doAjax(json, "refuseAuthority", refuseBack);
			
		}
		
		//审核不通过时 的回调函数
		function  refuseBack(data){
			
			try {
				if (data.result === "0") {
					return swal({
						title : "提交审核成功！",
						text : "点击确认回到主页",
						confirmButtonText : "确定",
					}, function(isConfirm) {
						window.history.back(-1);
					});
				} else if (data.result === "1") {
					returnswal({
						title : "提交信息失败",
						text : "稍后再试!",
						confirmButtonText : "确定",
					}, function(isConfirm) {
					});
				}
			} catch (e) {
				alert("提交信息失败：" + e);
			}
		}
		
			
			//ajax请求服务器 公用的方法
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
						alert("提交信息失败!" + e);
					}
				})
			};
	</script>

</body>

</html>