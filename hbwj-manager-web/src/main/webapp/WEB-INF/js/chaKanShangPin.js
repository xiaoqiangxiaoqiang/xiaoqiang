
$(document).ready(function(){
		//获取当前文档的宽度
		var width=$(document).width();
		$("table#spInfo").show();
		$("table#spProp,div.imgDiv,p.collapse").width(width*0.85+"px");

		//收起/显示图片预览框
		$("body").on('click','p.collapse',function(){
			var index=this.id.indexOf("_");
			var id=this.id.substring(0,index);
			$("#"+id).fadeToggle("slow");
			$(this).html()==="收起"?$(this).html("显示"):$(this).html("收起");
		})
		//获取所有sku的图片url字符串，转成数组
		imgArr1=$("#imgsStr1").val().split(',');
		for(var i=0,len=imgArr1.length;i<len;i++){
			var title=$("#spSellProps tr").eq(i+1).find('td').eq(1).html();
			showImg(imgArr1[i],title,"imgDiv1",i);
		}
		//spu的商品详情图的url拼接字符串，转成数组
		var imgArr2=$("#imgsStr2").val().split(',');
		for(var i=0,len=imgArr2.length;i<len;i++){
			showImg(imgArr2[i],"商品详情图"+(i+1),"imgDiv2");
		}
	    
		//显示参数
		var props=$("#props").val();
		console.log(props);
		console.log(JSON.parse(props));
		showTable(JSON.parse(props));
	/*	showSku(spu.sku,spu.sellProps);*/
		/*showTable(spu.props);*/
		//显示详细图片

		//图片浏览插件
		$("ul#imgUl1,ul#imgUl2").viewer({zoomRatio:0.35,minZoomRatio:0.2});
		//选择审核结果
		$("#resultDiv").on('click','input',function(){
			$(this).val()=="0"?$("#failReason").val("").show(300):$("#failReason").hide(200);
		})		
		$("#spSellProps").show();
	})

//显示图片
function showImg(url,title,curImgDiv,index){
	var html="";
	if(curImgDiv==="imgDiv1"){
		html+='<li><div class="imgWrap">';
		html+=	'<img src="'+url+'" class="img" title="'+title+'" alt="'+title+'">';
		html+='<p class="sp">商品'+(index+1)+'</p></div></li>';
		$(html).appendTo($('ul#imgUl1'));
	}else{
		html+='<li><div class="imgWrap2">';
		html+=	'<img src="'+url+'" class="img2" title="'+title+'" alt="'+title+'">';
		html+='</div></li>';
		$(html).appendTo($('ul#imgUl2'));
	}
	//将图片添加到对应imgDiv并显示
	$('div#'+curImgDiv).show();
	//显示收起/显示按钮
	$("#"+curImgDiv+"_Btn").html("收起").show();
}


//显示参数
function showTable(arr){
	if(arr.length===0){
		return;
	}
	var tr='';
	// 数组长度
	var length=arr.length;
	//取整
	var s=Math.floor(length/3);
	//取余
	var y=length%3;
	for(var i=0;i<s;i++){
		//是否更新上传数组数据
		// ifToUprows===true?upRows.push(arr[3*i],arr[3*i+1],arr[3*i+2]):"";
		//每行3对数据
		tr +='<tr><td class="key">'+
		arr[3*i].key+':</td><td class="value" title="'+arr[3*i].value+'">'+arr[3*i].value+'</td><td class="key">'+
		arr[3*i+1].key+':</td><td class="value" title="'+arr[3*i+1].value+'">'+arr[3*i+1].value+'</td><td class="key">'+
		arr[3*i+2].key+':</td><td class="value" title="'+arr[3*i+2].value+'">'+arr[3*i+2].value+'</td></tr>';
	}
	//如果余数不为0.只有2种情况，无需循环，直接具体值比较
	if(y===1){
		// upRows.push(arr[3*s]);
		tr+='<tr><td class="key">'+arr[3*s].key+':</td><td class="value" title="'+arr[3*s].value+'">'+arr[3*s].value+'</td><td class="key"></td><td class="value"></td><td class="key"></td><td class="value"></td></tr>';
	}else if(y===2){
		// upRows.push(arr[3*s],arr[3*s+1]);
		tr+='<tr><td class="key">'+arr[3*s].key+':</td><td class="value" title="'+arr[3*s].value+
		'">'+arr[3*s].value+
		'</td><td class="key">'+arr[3*s+1].key+':</td><td class="value" title="'+arr[3*s+1].value+'">'+arr[3*s+1].value+'</td><td class="key"></td><td class="value"></td></tr>'
	}
	$("#spProp").html(tr).show();
	$("#spProp_Btn").html("收起").show();
}
