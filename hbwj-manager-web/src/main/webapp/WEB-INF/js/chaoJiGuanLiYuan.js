$(document).ready(function(){
	height=document.body.clientHeight-140;
			// height=500;
			width=$("div.tabsFrame").width();
			// console.log(height+","+width);
			isAdd=false;
			curPanel="";
			$("#user").on("click",function(){
				curPanel='userPanel'
				openTag("用户管理");
				// console.log(height);
			});
			$("#seller").on("click",function(){
				curPanel='sellerPanel'
				openTag("商家管理");
			});
			$("#info").on("click",function(){
				curPanel='infoPanel'
				openTag("信息管理");
			});
			$("#headClose").on("click",function(){
				Custombox.close('fast');
			});
			$("#save").on("click",save);
			$("#cancle").on("click",cancle);


			//设置窗口关闭确认提示框
			$('#tt').tabs({
				width:width,
				height:height,
				onBeforeClose: function(title,index){
					var target = this;
					$.messager.confirm('Confirm','确定关闭 '+title+" 窗口？",function(r){
						if (r){
							var opts = $(target).tabs('options');
							var bc = opts.onBeforeClose;
							opts.onBeforeClose = function(){};  		
							$(target).tabs('close',index);
							opts.onBeforeClose = bc;  		
						}
					});
					return false;			
				},
				onSelect:function(title){   //定义当前页面
					if(title==="用户管理"){
						curPanel="userPanel"; 
					}else if(title==="商家管理"){
						curPanel="sellerPanel";
					}else{
						curPanel="infoPanel";
					}
				}
			})	
			$('#tt').tabs('add',{
				title:'欢迎',
				content:'欢迎进入管理系统！',
				closable:true,
			});
		});

		//点击左侧菜单打开对应标签框
		function openTag(str){
			var ifExist=$('#tt').tabs('exists',str); //判断是否存在当前tab panel
			if(ifExist){
				$('#tt').tabs('select',str); //存在就切换到该panel

			}else{
				addPanel(str);		//否则就新建一个panel

			}	
		}

		//添加panel
		function addPanel(title){
			var contentStr=	'<table id="'+curPanel+'"></table>'+'<div id="'+curPanel+'Page" style="background:#efefef;border:1px solid #ccc;"></div>';				
			$('#tt').tabs('add',{
				title:title,
				content:contentStr,
				closable:true,
			});
			var fieldArr=[];
			switch (title){
				case "用户管理":
				fieldArr=[
				{field:'name',title:'用户名',width:150,resizable:true,align:'center'},
				{field:'password',title:'密码',width:150,resizable:true,align:'center'},
				{field:'admin',title:'管理员',width:100,resizable:true,align:'center'}];
				break;
				case "商家管理":
				fieldArr=[
				{field:'name',title:'用户名',width:150,resizable:true,align:'center'},
				{field:'password',title:'密码',width:150,resizable:true,align:'center'},
				{field:'status',title:'状态',width:100,resizable:true,align:'center'}];
				break;
				case "信息管理":
				fieldArr=[
				{field:'name',title:'111',width:150,resizable:true,align:'center'},
				{field:'password',title:'222',width:150,resizable:true,align:'center'},
				{field:'status',title:'333',width:100,resizable:true,align:'center'}];
				break;
			}
			$('#'+curPanel).datagrid({
					// url:'datagrid_data.json',  
					height:height-33-30,
					width:width-2,
					singleSelect:true,
					// rownumbers:true,
					// collapsible:true,
					striped:true,
					toolbar: [{
						text:"添加",
						iconCls: 'icon-add',
						handler: function(){
							addUser()
						}
					},'-',{
						text: '修改', 
						iconCls: 'icon-edit', 
						handler: function(){
							editUser()
						}
					},'-',{
						text: '删除', 
						iconCls: 'icon-cancel', 
						handler: function(){
							delUser()
						}
					}
					],
					onDblClickRow:function (rowIndex, rowData) {
						editUser();
					},
					columns:[fieldArr],
					data: [
					{name:'value11', password:'value12',status:'已审批'},
					{name:'value91', password:'value922',status:'正常'},
					{name:'value21', password:'value22',admin:'是'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					{name:'value21', password:'value22',admin:'否'},
					
					
					{name:'value21', password:'value22',admin:'否'},
					// {name:'value21', password:'value22',admin:'否'},
					// {name:'value21', password:'value22',admin:'否'},
					// {name:'value21', password:'value22',admin:'否'}
					],
				});
			$("#"+curPanel+"Page").pagination({
				total:100,
					// pageList:[15],
					buttons: [{
						iconCls:'icon-go',
						handler:function(){
							var pageVal=$("div#"+curPanel+"Page input.pagination-num").val();
							if(isNaN(pageVal)||pageVal<1||(pageVal%1)!==0){
								return;
							}
					// alert($(this).val()+"  "+curPanel);
					$("#"+curPanel).datagrid({data:
						[{name:'qqq', password:'aaa',admin:'是'}]
					});
					$("#"+curPanel+"Page").pagination({total:200,pageNumber:pageVal});
					// $("#"+curPanel+"Page").pagination('select', 2);
					// doAjax({'page':$(this).val(),'id':curPanel},"url",refreshList);
				}
			}],
			pageSize:20,
			layout:['first','prev','manual','next','last','info'],
			onSelectPage:function(pageNumber,pageSize){
				alert(pageNumber+"  "+curPanel);
			},
		});
		}


		function refreshList(data){

		}
		//添加用户 
		function addUser(){
			isAdd=true;
			$("#formUsername").prop("disabled",false);
			if(curPanel==="userPanel"){
				$("#textForm div.item").eq(3).show();
				$("#textForm div.item").eq(2).hide();
				$("#formAdmin").val("1");  
			}else if(curPanel==="sellerPanel"){
				$("#textForm div.item").eq(2).show();
				$("#textForm div.item").eq(3).hide();
				$("#formUserStatus").val("0"); 
			}else{
			}
			$("#textForm").window({
				title:'添加用户',
				modal:true,
				closed:true,
				minimizable:false,
				maximizable:false,
				resizable:false,
				collapsable:false,
				collapsible:false,
				iconCls:'icon-edit'
			});
			$("#textForm input[type='text']").val("");
			$("#textForm").window('open');
		}

		//修改用户
		function editUser(){
			isAdd=false;
			var row = $("#"+curPanel).datagrid('getSelected');
			if (row !=null) {
				$("#formUsername").val(row.name);
				$("#formPassword").val(row.password);
				if(curPanel==="userPanel"){
					$("#formAdmin").val(row.admin==="是"?"1":"0");
					$("#textForm div.item").eq(3).show();
					$("#textForm div.item").eq(2).hide();  
				}else if(curPanel==="sellerPanel"){
					var statusVal="";
					if(row.status==="正常"){
						statusVal="0";
					}else if(row.status==="已审批"){
						statusVal="1";
					}else{
						statusVal="2";
					}
					$("#formUserStatus").val(statusVal);
					$("#textForm div.item").eq(2).show();
					$("#textForm div.item").eq(3).hide();
				}else{
				}
				$("#formUsername").prop("disabled","disabled");  //用户名不能修改
				$("#textForm").window({
					title:'修改用户',
					modal:true,
					closed:true,
					minimizable:false,
					maximizable:false,
					resizable:false,
					collapsable:false,
					collapsible:false,
					iconCls:'icon-edit'
				});
				$("#textForm").window('open');
			} else {
				$.messager.alert('提示','请先选择要修改的用户');
			}				

		}

		//删除用户
		function delUser(){
			var curRow = $("#"+curPanel).datagrid('getSelected');
			if(curRow==null){
				$.messager.alert('提示','请先选择用户');
			}else{
				$.messager.confirm('删除用户', '确定删除该用户？', 
					function(r){
						if (r){						
							doAjax({"data":curRow},"url",delCallback);
						}
					});
			}	
		}

		//点击删除后的回调函数
		function delCallback(data){
			try{
				if(data.result==0){
					$.messager.alert('提示','删除失败');
				}else if(data.result==1){
					//刷新请求..
					$.messager.alert('提示','删除成功');
				} 
			}catch(e){
				alert("服务器出错： "+e);
			}
		}

		//保存
		function save(){
			var json={};
			var url="";    //初始化保存地址
			json.username=$("#formUsername").val();
			json.password=$("#formPassword").val();
			if(curPanel==="userPanel"){
				json.admin=$("formAdmin").val()
			}else if(curPanel==="sellerPanel"){
				json.status=$("#formStatus").val();
			}
			if(isAdd){
				url="";  //添加地址
			}else{
				url="";   //修改地址
			}
			doAjax(json,url,addCallback);
		}

		function addCallback(data){
			try{
				if(data.result=="1"){
					cancle();
					// 刷新
					// refreshList();
					$.messager.alert('提示','操作成功');
				}else{
					$.messager.alert('提示','操作失败');
				}
			} catch(e){
				alert("服务器出错： "+e);
			}
		}
		//取消
		function cancle(){
			$('#textForm').window('close');
		}
		//ajax请求
		function doAjax(json,url,callback){
			$.ajax({
				type:'POST',
				url:url,
				data:json,
				dataType:'JSON',
				success:function(data){
					callback(data);
				},
				error:function(){
				}
			})
		}