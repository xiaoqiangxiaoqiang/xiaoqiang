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
<title>货比五家——商家审核表</title>
<link type="image/x-icon" rel="shortcut icon" href="./images/logo.jpg" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/shenHeBiao.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/viewer.min.css">
</head>
<body>
<!--[if lt IE 9]>
    <p class="notSupportP">您当前ie版本过低，部分网页功能无法正常显示，建议升级至较新版本（<a href='https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads/' target="_blank" class="notSupportA">ie9以上</a>）或更换至其他浏览器（如<a href='http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html' target="_blank" class="notSupportA">谷歌chrome</a>、<a href='http://se.360.cn/' target="_blank" class="notSupportA">360浏览器</a>等）。</p>
     <![endif]-->
	<header class="header">
		<div class="headerMsg">货比五家商家后台管理系统</div>
	</header>

	<!-- 隐藏商家的信息 -->
	<input type="hidden" id="id" value="${user.getUser_name()}">
	<div class="formDiv" id="formDiv">
		<p class="formHead">商家审核表</p>
		<hr>

		<table class="formTable">
			<tr>
				<td class="leftTd"><label for="name"> <span
						class="must">*</span> <span class="ziduan">店主姓名：</span>
				</label></td>
				<td class="rightTd"><input type="text" class="textin" id="name" />
					<span class="warming">姓名不得为空</span></td>
			</tr>
			<tr>
				<td class="leftTd"><label for="name2"> <span
						class="must">*</span> <span class="ziduan">店铺名称：</span>
				</label></td>
				<td class="rightTd"><input type="text" class="textin"
					id="name2" /> <span class="warming">店铺名称不得为空</span></td>
			</tr>
			<tr>
				<td class="leftTd"><label for="phone"> <span
						class="must">*</span> <span class="ziduan">手机号码：</span>
				</label></td>
				<td class="rightTd"><input type="text" class="textin"
					id="phone"> <span class="warming">请输入正确手机号</span></td>
			</tr>
			<tr>
				<td class="leftTd"><label for="userId"> <span
						class="must">*</span> <span class="ziduan">身份证号：</span>
				</label></td>
				<td class="rightTd"><input type="text" class="textin"
					id="userId" /> <span class="warming">请输入正确身份证号码</span></td>
			</tr>
			<tr>
				<td class="leftTd"><span class="must">*</span> <span
					class="ziduan">营业执照：</span></td>
				<td class="rightTd"><select id="yingyeZhizhao">
						<option value="">选择执照类型</option>
						<option value="1">企业执照</option>
						<option value="2">个体执照</option>
				</select> <span class="warming">请选择营业执照类型</span></td>
			</tr>
			<tr>
				<td class="leftTd"><span class="must">*</span> <span
					class="ziduan">店铺类型：</span></td>
				<td class="rightTd"><select id="shopType">
						<option value="">选择店铺类型</option>
						<option value="0">旗舰店</option>
						<option value="1">专营店</option>
						<option value="2">专卖店</option>
						<option value="3">个体店</option>
				</select> <span class="warming">请选择店铺类型</span></td>
			</tr>
			<tr>
				<td class="leftTd"><span class="must">*</span> <span
					class="ziduan">主营产品：</span></td>
				<td class="rightTd"><span id="shopCate"></span> <input
					type="button" id="selectType" value="选择类目" /> <span
					class="warming">请选择主营产品类型</span></td>
			</tr>
			<tr>
				<td class="leftTd"><span class="must">*</span> <span
					class="ziduan">所在地区：</span></td>
				<td class="rightTd">
					<div class="dizhi1" id="dizhi1">
						<select id="s_province" name="s_province"></select>   <select
							id="s_city" name="s_city"></select>   <select id="s_county"
							name="s_county"></select>
					</div> <span class="warming">请选择所在地区</span>
				</td>
			</tr>
			<tr>
				<td class="leftTd"><label for=""> <span class="must">*</span>
						<span class="ziduan">详细地址：</span>
				</label></td>
				<td class="rightTd"><textarea class="dizhi2" id="dizhi2"
						rows="4" placeholder="请补充详细地址..."></textarea> <span
					class="warming warming1">请输入详细地址</span></td>
			</tr>
		</table>

		<hr>
		<p class="title">身份证照(正反两面)</p>
		<p class="imgUpNotes">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">5M</span>，只能上传<span class="imgLink2">2张(一正一反)</span>身份证图片
			</a>
		</p>
		<p class="button">
			<input type="button" class="upButton" id="up1" value="上传照片">
		</p>
		<div id="imgDiv1" class="imgDiv"></div>

		<hr>
		<p class="title">营业执照</p>
		<p class="imgUpNotes">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">5M</span>，最多上传<span class="imgLink2">4</span>张图片
			</a>
		</p>
		<p class="button">
			<input type="button" class="upButton" id="up2" value="上传照片">
		</p>
		<div id="imgDiv2" class="imgDiv"></div>

		<hr>
		<p class="title">商标授权照</p>
		<p class="imgUpNotes">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">5M</span>，最多上传<span class="imgLink2">4</span>张图片
			</a>
		</p>
		<p class="button">
			<input type="button" class="upButton" id="up3" value="上传照片">
		</p>
		<div id="imgDiv3" class="imgDiv"></div>

		<hr>
		<p class="title">店铺实体照</p>
		<p class="imgUpNotes">
			<a href="http://www.tuhaokuai.com/image?b2" target="_blank"
				class="imgLink" title="在线压缩图片">支持<span class="imgLink2">JPG,JPEG,PNG,BMP</span>格式图片，单张图片大小不得超过<span
				class="imgLink2">5M</span>，最多上传<span class="imgLink2">6</span>张图片
			</a>
		</p>
		<p class="button">
			<input type="button" class="upButton" id="up4" value="上传照片">
		</p>
		<div id="imgDiv4" class="imgDiv"></div>

		<div id="typeDiv">
			<ul id="typeTree"></ul>
			<p class="treeBtn">
				<input type="button" onclick="typeSave()" value="确定">&ensp;&ensp;
				<input type="button" onclick="typeCancel()" value="取消">
			</p>
		</div>
		<p class="button bottom">
			<input type="button" id="submit" value="提交">
		</p>
	</div>

	<footer class="Footer">
		<div class="footerMsg">
			<br /> Copyright &copy;2017 &nbsp;广州终点站网络科技有限公司 &nbsp;All Rights
			Reserved.<br /> 联系电话：020-29061583
		</div>
	</footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
	<script class="resources library"
		src="${pageContext.request.contextPath}/js/area.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/viewer-jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var win = window;
					 var doc = win.document;
					 var input = doc.createElement ("input");

					 var ie = (function (){
					 //"!win.ActiveXObject" is evaluated to true in IE11
					 if (win.ActiveXObject === undefined) return null;
					 if (!win.XMLHttpRequest) return 6;
					 if (!doc.querySelector) return 7;
					 if (!doc.addEventListener) return 8;
					 if (!win.atob) return 9;
					 //"!doc.body.dataset" is faster but the body is null when the DOM is not
					 //ready. Anyway, an input tag needs to be created to check if IE is being
					 //emulated
					 if (!input.dataset) return 10;
					 return 11;
					 })();
					 if(ie==8||ie==7||ie==6){
					     alert("您当前ie"+ie+"版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
					 }
					add = 1;
					imgArr1 = [];
					imgArr2 = [];
					imgArr3 = [];
					imgArr4 = [];
					//初始化选择地址
					_init_area();
					//绑定上传图片事件
					$("#formDiv").on('click', '.upButton', function() {
						var index = $(this).attr('id').substring(2);
						imgDiv = "imgDiv" + index;
						switch (index) {
						case '1':
							maxNum = 2 - imgArr1.length;
							break;
						case '2':
							maxNum = 4 - imgArr2.length;
							break;
						case '3':
							maxNum = 4 - imgArr3.length;
							break;
						case '4':
							maxNum = 6 - imgArr4.length;
							break;
						}
						uploadIframe();
					})

					//鼠标悬浮显示删除按钮
					$("div#formDiv").on(
							'mouseenter',
							'div.imgWrap',
							function(e) {
								var event = $.event.fix(e);
								var elem = $(event.target);
								elem[0].nodeName == "DIV" ? elem.find(
										"div.imgDel").show() : elem.siblings(
										"div.imgDel").show();
							});

					//鼠标移开隐藏删除按钮
					$("div#formDiv").on('mouseleave', 'div.imgWrap',
							function() {
								$("div.imgDel").hide();
							});

					//点击删除图片
					$("div#formDiv").on(
							'click',
							'div.imgDel',
							function(e) {
								var event = $.event.fix(e);
								var elem = $(event.target);
								//获取到ul元素
								var ul = elem.parent().parent();
								var imgDiv_ = $("#" + imgDiv);
								//当前ul索引
								var index = imgDiv_.find('ul.imgUl').index(ul);
								console.log('当前图片ul索引为：' + index);
								var index2 = parseInt(imgDiv.substring(6));
								var tempArr = [ imgArr1, imgArr2, imgArr3,
										imgArr4 ];
								console.log("删除之前的arr:"+tempArr[index2 - 1]);
								console.log("删除的url:"+elem.siblings('img')[0].src);
								//对应的数组中删除图片url
								tempArr[index2 - 1].splice(index, 1);
								console.log("删除之后的arr:"+tempArr[index2 - 1]);
								elem.off();
								//删除ul
								ul.remove();
								//如果图片全部删除，隐藏imgDiv
								imgDiv_.find('ul.imgUl').length == 0 ? imgDiv_
										.hide() : imgDiv_.show();
								temArr = [];
							});
				})

		//选择产品类型
		$("#selectType").click(function() {
			//选择分类初始化列表
			$("#typeTree").tree({
				url : "loadShopCat",
				onClick : function(node, target) {
					type = node.text;
				}
			});
			//显示模态窗口
			$("#typeDiv").show().window({
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

		//选择分类确定按钮
		function typeSave() {
			$("#shopCate").html(type);
			$("#typeDiv").window('close');
		}
		//选择分类取消按钮
		function typeCancel() {
			$("#typeDiv").window('close');
		}

		function showRight(elem) {
			$(elem).css("border", "").siblings("span.warming").hide();
		}
		function showError(elem) {
			$(elem).css("border", "1px solid red").siblings("span.warming")
					.show();
		}

		//上传图片
		function uploadIframe() {
			//先将其他所有iframe删除
			$("div#uploadModal").each(function() {
				$(this).remove();
			});
			var user_name = $("#id").val();
			//再新建一个iframe到模态窗口中
			$(
					'<div id="uploadModal"><iframe src="enterIframe?user_name='+user_name+'"  scrolling="yes" width="100%" height="600" frameborder=0></iframe></div>')
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

		//根据传回来的url添加图片
		function addImg(url, name) {
			var index = parseInt(imgDiv.substring(6));
			var html = "";
			html += '<ul id="ul'+add+'" class="imgUl">';
			html += '<div class="imgWrap">';
			html += '<div class="imgDel" title="删除图片"></div>';
			html += '<img src="'+url+'" class="img" title="'+name+'" title="'+name+'">';
			html += '</div></ul>';
			//将图片添加到对应imgDiv并显示
			$(html).appendTo($("div#" + imgDiv).show());
			var tempArr = [ imgArr1, imgArr2, imgArr3, imgArr4 ];
			console.log('添加前的arr:'+tempArr[index - 1]);
			console.log('添加的url：'+url);
			tempArr[index - 1].push(url);
			console.log('添加后的arr:'+tempArr[index - 1]);
			$("#ul" + add).viewer({
				toolbar : false,
				zoomRatio : 0.35,
				minZoomRatio : 0.2
			});
			add++;
			temp = null;
		}

		//姓名检测
		$("#name").blur(checkName);
		function checkName() {
			var elem = $("#name");
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//店铺名称检测
		$("#name2").blur(checkName2);
		function checkName2() {
			var elem = $("#name2");
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//手机号码检测
		$("#phone").blur(checkPhone);
		function checkPhone() {
			var elem = $("#phone");
			if (!(/^1(3|4|5|7|8)[0-9]\d{8}$/).test(elem.val())) {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//身份证号码检测
		$("#userId").blur(checkId);
		function checkId() {
			var elem = $("#userId");
			if (!(/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/)
					.test(elem.val())) {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//检测营业执照
		// $("#yingyeZhizhao").blur(checkZhiZhao);
		function checkZhiZhao() {
			var elem = $("#yingyeZhizhao");
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//检测店铺类型
		// $("#shopType").blur(checkType);
		function checkShopType() {
			var elem = $("#shopType");
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//检测产品类型
		function checkType() {
			if ($("#shopCate").html() == "") {
				showError($("#selectType"));
				return false;
			} else {
				showRight($("#selectType"));
				return true;
			}
		}
		//检测地区
		// $("#dizhi1").blur(checkDizhi1);
		function checkDizhi1() {
			if ($("#s_county").val() == "市、县级市" || $("#s_city").val() == "地级市"
					|| $("#s_province").val() == "省份") {
				showError($("#dizhi1"));
				return false;
			} else {
				showRight($("#dizhi1"));
				return true;
			}
		}
		//检测详细地址
		$("#dizhi2").blur(checkDizhi2);
		function checkDizhi2() {
			var elem = $("#dizhi2");
			if (elem.val() == "") {
				showError(elem);
				return false;
			} else {
				showRight(elem);
				return true;
			}
		}
		//检测身份证照
		//检测营业执照
		//检测授权书
		//检测实体图
		function checkPhotos() {
			var str = "";
			switch (true) {
			case imgArr1.length !== 2:
				str = "身份证正反照片";
				break;
			case imgArr2.length === 0:
				str = "营业执照照片";
				break;
			case imgArr3.length === 0:
				str = "商标授权照片";
				break;
			case imgArr4.length === 0:
				str = "店铺实体照片";
				break;
			default:
				var pass = true;
			}
			if (pass == undefined) {
				$.messager.alert('提示', "请先上传" + str);
				return false;
			} else {
				return true;
			}
		}

		$("#submit").click(
				function() {
					switch (false) {
					case checkName():
						$("#name")[0].scrollIntoView(true);
						return;
					case checkName2():
						$("#name2")[0].scrollIntoView(true);
						return;
					case checkPhone():
						$("#phone")[0].scrollIntoView(true);
						return;
					case checkId():
						$("#userId")[0].scrollIntoView(true);
						return;
					case checkZhiZhao():
						$("#yingyeZhizhao")[0].scrollIntoView(true);
						return;
					case checkShopType():
						$("#shopType")[0].scrollIntoView(true);
						return;
					case checkType():
						$("#selectType")[0].scrollIntoView(true);
						return;
					case checkDizhi1():
						$("#dizhi1")[0].scrollIntoView(true);
						return;
					case checkDizhi2():
						$("#dizhi2")[0].scrollIntoView(true);
						return;
					case checkPhotos():
						return;
					}
					$.messager.confirm('提示', '确认提交审核？', function(r) {
						if (r) {
							$("#submit").attr('disabled', 'disabled');
							var json = {};
							json.id = $("#id").val();
							json.name = $("#name").val();
							json.name2 = $("#name2").val();
							json.indentifyId = $("#userId").val();
							json.shopType = $("#shopType").val();
							json.contact = $("#phone").val();
							json.shopCate = $("#shopCate").html();
							json.dizhi = $("#s_province").val()
									+ $("#s_city").val() + $("#s_county").val()
									+ $("#dizhi2").val();
							json.reserved1 = $("#yingyeZhizhao").val();
							json.identfy = imgArr1.join(',');
							json.certificate_url = imgArr2.join(',');
							json.shop_identify = imgArr3.join(',');
							json.shop_url = imgArr4.join(',');
							console.log("img1:"+imgArr1);
							console.log("img2:"+imgArr2);
							console.log("img3:"+imgArr3);
							console.log("img4:"+imgArr4);
							console.log(json);
							$.ajax({
								type : 'POST',
								url : 'Apply',
								data : json,
								dataType : 'JSON',
								success : function(data) {
									callback(data);
								},
								error : function(e) {
									alert("出错:" + e);
								}
							});
						}
					});
				})

		function callback(data) {
			if (data.result == "0") {
				$.messager.alert('提示', '提交成功，我们会尽快审核');
				return;
			} else if (data.result == "1") {
				$.messager.alert('提示', '提交失败，请稍后再试');
				$("#submit").attr('disabled', false);
				return;
			} else {
				$.messager.alert('提示', '系统异常，请稍后再试');
			}
		}
	</script>
</body>

</html>