$(document).ready(function(){
	curRow='';	//初始化当前编辑的行
	upRows=[];	//初始化商品属性上传数组
	typeId="";	//初始化商品类别Id
	typeName="";	//初始化商品类别名称
	curImgDiv="";
	imgUrlArr1=[];//上传主图Url数组
	imgUrlArr2=[];//上传附图Url数组
	$("#name").on('keyup',checkName);
	$("#price").on('keyup',checkPrice);
	$("#price").on('blur',toFix);
	$("#number").on('keyup',checkNumber);
	$("#details").on('keyup',checkDetails);

	//收起/显示图片预览框
	$("body").on('click','p.imgDivBtn',function(){
		var id=this.id.substring(0,7);
		$("#"+id).fadeToggle("slow");
		$(this).html()==="收起"?$(this).html("显示"):$(this).html("收起");
	})
	
		//上传主图按钮
	$("#upload1").click(function(){
		uploadIframe();
		curImgDiv="imgDiv1";
	});
	
	//上传附图按钮
	$("#upload2").click(function(){
		alert("sdafsdf");
		uploadIframe();
		curImgDiv="imgDiv2";
	});
	
    //鼠标悬浮显示删除按钮
    $("div.imgDiv").on('mouseover','div.imgWrap',function(e){
    	var event = $.event.fix(e); 
    	var elem = $(event.target);
    	elem.siblings("span.imgDel").show();
    });

	//鼠标移开隐藏删除按钮
	$("div.imgDiv").on('mouseleave','div.imgWrap',function(){
		$("span.imgDel").hide();
	});

	//点击删除图片
	$("div.imgDiv").on('click','span.imgDel',function(e){
		var event = $.event.fix(e); 
		var elem = $(event.target); 
		//获取到图片元素
		var img=elem.parent().next();
		var imgUrl=img[0].src;
		var imgWrap=img.parent();
		//获取当前删除图片的索引;
		var index=imgWrap.index();
		console.log(imgUrlArr);
		imgUrlArr.splice(index,1);
		console.log(index);
		console.log(imgUrlArr);
		var imgDiv=imgWrap.parent();
		console.log(imgDiv[0].id)
		//删除当前图片所在的imgWrap
		imgWrap.off().remove();
		//如果图片全部删除，隐藏imgDiv和收起/展开按钮
		if(imgDiv.children().length===0){
			imgDiv.hide();
			$("#"+imgDiv[0].id+"Btn").hide();
		}else{
			imgDiv.show();
			$("#"+imgDiv[0].id+"Btn").show();
		}
	});
})

//根据传回来的url添加图片
function addImg(url,name){
	var html="";
	html+='<div class="imgWrap">';
	html+=	'<span class="imgDel" title="删除图片">';
	html+=		'<img src="../../../images/cancel.png">';
	html+=	'</span>';
	html+=	'<img src="'+url+'" class="img" title="'+name+'">';
	html+='</div>';
	curImgDiv==="imgDiv1"?imgUrlArr1.push(url):imgUrlArr2.push(url);
	//将图片添加到对应imgDiv并显示
	$(html).appendTo($('div#'+curImgDiv).show());
	$("#"+curImgDiv+"Btn").show();
}

//点击上传按钮打开iframe
function uploadIframe(){
	//先将其他所有iframe删除
	$("div#uploadModal").each(function(){
		$(this).off().remove();
	});
	//再新建一个iframe到模态窗口中
	$('<div id="uploadModal"><iframe src="enterframe" scrolling="yes" width="100%" height="600" frameborder=0></iframe></div>').appendTo(document.body);
	//打开模态窗口
	$("#uploadModal").window({
		title:'上传图片',
		modal:true,
		width:1000,
		// height:800,
		resizable:false,
		maximizable:false,
		minimizable:false,
	});
}

//选择商品类别
$("#selectType").click(function(){	
	$("#typeModal div.wrap").show();
	$("#typeTree").tree({
		        url:"${ctx}/../../../../hbwj/shop/loadShopCat",
				onClick:function(node){
					typeId =node.id;
					typeName=node.text;
				}
			});
	$("#btn1").linkbutton({
		text:'确定',
		onClick:function(){
			$("#typeName").html(typeName).show();
			$("#typeModal").window('close');
		}
	});
	$("#btn2").linkbutton({
		text:'取消',
		onClick:function(){
			$("#typeModal").window('close');
		}
	});
	$("#typeModal").window({
		title:'选择商品类别',
		modal:true,
		width:400,
				// height:500,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				resizable:false,
				shadow:false,
			});
})

//添加商品属性
$("#prop").click(function(){
	curRow="";
	rows=[];
	for(i in upRows){
		rows.push(upRows[i])
	}
	$("#propModal div.wrap").show();
	$("#propTable").datagrid({
		width:400,
				// height:400,
				striped:true,
				singleSelect:true,
				data:rows,
				toolbar: [{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){
						curRow===""?"":$("#propTable").datagrid('endEdit',curRow);	
						$("#propTable").datagrid('appendRow',{
							key:'',
							value:'',
						});
						var len=$("#propTable").datagrid('getData').total;
						curRow=len-1;
						$("#propTable").datagrid('beginEdit',curRow);
					}
				},'-',{
					text:'修改',
					iconCls: 'icon-edit',
					handler: function(){
						if(curRow===""){
							$.messager.alert("提示","请先选中一行再修改");
							return;
						}
						$("#propTable").datagrid('endEdit',curRow);
						$("#propTable").datagrid('beginEdit',curRow);
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						if(curRow===""){
							$.messager.alert("提示","请先选中一行再删除");
							return;
						}
						$.messager.confirm('提示','确认删除该行？',function(r){
							if (r){
								$("#propTable").datagrid('deleteRow',curRow);
								curRow="";	
							}
						});	
					}
				}],
				columns:[[
				{field:'key',title:'商品属性',width:150,editor:'text'},
				{field:'value',title:'商品属性值',width:248,editor:'text'},
				]],
				onClickRow:function(index,row){		//单击选中
					$("#propTable").datagrid('unselectAll');
					if(curRow!==""){
						$("#propTable").datagrid('endEdit',curRow);
					}
					$("#propTable").datagrid('selectRow',index);
					curRow=index;
				},
				onDblClickRow:function(){		//双击修改
					$("#propTable").datagrid('endEdit',curRow);
					$("#propTable").datagrid('beginEdit',curRow);
				}
			})

	$("#propModal").window({
		title:'添加商品属性',
		modal:true,
				// width:400,
				// height:500,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				resizable:false,
				shadow:false,
			});

	$("#btn3").linkbutton({
		text:'确定',
		onClick:function(){
			//取消编辑
			curRow===""?"":$("#propTable").datagrid('endEdit',curRow);
			//获取当前所有行数据
			var getData=$("#propTable").datagrid('getData');
			var len=getData.total;
			var rows=getData.rows;
			//如果数据为空，显示原来所有数据；返回
			if(len===0){
				$.messager.alert('提示','商品属性不能为空');
				//显示原来所有数据
				showTable(upRows);			
				return;
			}
			//遍历，如果有属性为空，显示原来数据；返回
			for(var i=0;i<len;i++){
				if(rows[i].key===""||rows[i].value===""){
					$.messager.alert('提示','属性或属性值不能为空');
					$("#propTable").datagrid('selectRow',i);
					//显示原来所有数据
					showTable(upRows);
					return;
				}
			}
			//数据没问题，显示新数据，并写入到上传数组；
			upRows=[];
			showTable(rows,true);
			$("#propModal").window('close');
			// console.log(upRows);
		}
	});
	$("#btn4").linkbutton({
		text:'取消',
		onClick:function(){
			curRow="";
			$("#propModal").window('close');
			console.log(upRows);
		}
	});
})

//更新table
function showTable(arr,ifToUprows){
	if(arr.length===0){
		return;
	}
	var tr='<tr><td>商品属性</td><td>属性值</td></tr>';
	var len=arr.length;
	for( var i=0;i<len;i++){
		var irow=arr[i];
		//是否更新上传数组数据
		ifToUprows===true?upRows.push(irow):"";
		tr +='<tr><td>'+irow.key+'</td><td>'+irow.value+'</td></tr>'
	}
	$("#propShow").html(tr);
}

//正确显示
function showRight(elem){
	elem.siblings("span.warming").remove();
	return true;
}

//错误显示
function showError(elem,str){
	if(elem.siblings("span.warming").length!==0) return false;
	$("<span class='warming'>("+str+")</span>").insertAfter(elem);
	return false;
}

//检测商品类别
function checkType(){
	if(typeId===""){
		showError($("#selectType"),"请先选择类别");
		return false;
	}else{
		showRight($("#selectType"));
		return true;
	}
}

//检测名称
function checkName(){
	var elem=$("#name");
	if(elem.val().length<5||elem.val().length>20){
		showError(elem,"商品名称长度不对");   //显示错误提示
		return false;
	}else{
		showRight(elem);	//清除错误提示
		return true;
	}
}

//检测价格
function checkPrice(){
	var elem=$("#price");
	if(/^\d+(\.\d+)?$/.test(elem.val())||elem.val()>0){
		showRight(elem);
		return true;
	}else{
		showError(elem,"请输入正确价格");
		return false;
	}
}

//小数点两位数填充
function toFix(){
	if(checkPrice()){
		var elem=$("#price");
		elem.val(parseFloat(elem.val()).toFixed(2));
	}
}

//检测库存
function checkNumber(){
	var elem=$("#number");
	if(/^[0-9]*[1-9][0-9]*$/.test(elem.val())){
		showRight(elem);
		return true;
	}else{
		showError(elem,"请输入正确库存");
		return false;
	}
}

//检测属性
function checkProp(){
	if(upRows.length<=0){
		$.messager.alert("提示","请先输入商品属性");
		return false;
	}else{
		return true;
	}
}

//检测商品描述
function checkDetails(){
	var elem=$("#details");
	if(elem.val().length<20){
		showError(elem,"至少20个字符");
		return false;
	}else{
		showRight(elem);
		return true;
	}
}

//检测主图
function checkPhoto1(){
	if(imgUrlArr1.length===0){
		return false;
	}
}

//检测附图
function checkPhoto2(){
	if(imgUrlArr2.length===0){
		return false;
	}
}

//点击提交按钮
function save(){	
	//如果检测为错，显示在视野中
	switch(false){
		case checkType():
		$("div.item")[0].scrollIntoView(true);
		return;
		case checkName():
		$("div.item")[1].scrollIntoView(true);
		return;
		case checkPrice():
		$("div.item")[2].scrollIntoView(true);
		return;
		case checkNumber():
		$("div.item")[3].scrollIntoView(true);
		return;
		case checkProp():
		$("div.item")[4].scrollIntoView(true);
		return;
		case checkPhoto1():
		$("div.item")[5].scrollIntoView(true);
		return;
		case checkDetails():
		$("div.item")[6].scrollIntoView(true);
		return;
		case checkPhoto2():
		$("div.item")[8].scrollIntoView(true);
		return;
	}
	//上传主图地址URL拼接
	var urlString1="";
	for(key in imgUrlArr1){
		urlString1 +=","+imgUrlArr1[key];
	}
	var urlString2="";
	for(key in imgUrlArr2){
		urlString2 +=","+imgUrlArr2[key];
	}
	var json={};
	json.typeName=typeName;//商品类别
	json.name=$("#name").val();//名称
	json.price=$("#price").val();//单价
	json.number=$("#number").val();//库存
	json.prop=upRows;//商品属性
	json.details=$("#details").val();//商品描述
	json.extra=$("#extra").val();//商品备注
	json.urlString1=urlString1;//商品主图url
	json.urlString2=urlString2;//商品附图url
	
	$.ajax({
		type:'POST',
		url:'',
		data:json,
		dataType:'json',
		success:function(data){},
		error:function(e){
			alert("出错:"+e);
		}
	})
}