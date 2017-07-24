
$(document).ready(function(){
		//获取当前文档的高度与宽度
		var width=$(document).width();
		$("div.imgDiv").width(width*0.85+"px");

		//获取身份证、执照图、商标图、门面图url数组
		// var urlStr1 = "${review.getIdentifyUrlA()}";
		// var urlStr2 = "${review.certificate_url}";
		// var urlStr3 = "${review.getShop_identify()}";
		// var urlStr4 = "${review.getShop_url()}";
		urlStr1="http://img05.tooopen.com/images/20150412/tooopen_sy_118141423291.jpg,http://img.taopic.com/uploads/allimg/140326/235113-1403260G01561.jpg";
		urlStr2="http://scimg.jb51.net/allimg/150415/14-15041511223U18.jpg,http://img.taopic.com/uploads/allimg/130331/240460-13033106243430.jpg";
		urlStr3="http://pic.qiantucdn.com/01/61/38/93bOOOPIC15.jpg,http://img2.3lian.com/2014/c7/4/d/4.jpg";
		urlStr4="http://pic.58pic.com/58pic/11/15/53/43g58PICz9B.jpg,http://e.hiphotos.baidu.com/lvpics/h=800/sign=678b8cabccfc1e17e2bf81317a91f67c/279759ee3d6d55fb96d94d9b6e224f4a20a4dd6b.jpg";
		var urlArr=[urlStr1,urlStr2,urlStr3,urlStr4];
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
		// var shopType=${review.getShop_type()};
		// switch(shopType){
		// 	case 0:
		// 	$("#shopType").val("旗舰店").attr('title','旗舰店');
		// 	break;
		// 	case 1:
		// 	$("#shopType").val("专营店").attr('title','专营店');
		// 	break;
		// 	case 2:
		// 	$("#shopType").val("专卖店").attr('title','专卖店');
		// 	break;
		// 	case 3:
		// 	$("#shopType").val("个体店").attr('title','个体店');
		// 	break;
		// }

		//店铺执照
		// var zhiZhao=${review.getReserved1()};
		// switch(shopType){
		// 	case 1:
		// 	$("#zhiZhao").val("企业执照").attr('title','企业执照');
		// 	break;
		// 	case 2:
		// 	$("#zhiZhao").val("个体执照").attr('title','个体执照');
		// 	break;
		// }

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
		}
	}
	console.log(json);
	callback({'result':'1'});
	// $.post('url',json,callback);
})

//提交后的回调函数
function callback(data){
	if(data.result=="1"){
		//隐藏审核Div,防止用户再次提交审核
		$('#resultDiv').hide();
		alert('提交成功');
		return;
	}else{
		alert('提交失败');
	}
}