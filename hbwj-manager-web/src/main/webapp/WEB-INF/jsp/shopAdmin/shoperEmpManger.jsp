<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>货比五家——管理员系统</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/shopAdmin.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/yuanGongIframe.css" />
	<link type="image/x-icon" rel="shortcut icon" href="${ctx}/css/images/logo.jpg" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery-easyui-1.5.2/themes/icon.css" />
	<script type="text/javascript" src="${ctx}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/js/sjgly.js"></script>
</head>
<body>
	<div id="modalTable">
	<input type="hidden" id="user_name" value="${user.getUser_name()}">
		<table id="addTable">
			<tr>
				<td class="leftTd"><label for="username">用户名:</label></td>
				<td class="rightTd">
					<input type="text" id="username" class="textin" placeholder="请输入手机号">
					<p class="error1">请输入正确的手机号</p>
					<p class="error1" id="used">该手机号码已被注册</p>
				</td>
			</tr>
			<tr>
				<td class="leftTd"><label for="password">密码:</label></td>
				<td class="rightTd">
					<input type="password" id="password" class="textin"  placeholder="请输入密码,6至20位字符" >
					<p class="error1">密码长度在6至20位字符</p>
				</td>
			</tr>
			<tr>
				<td class="leftTd"><label for="password2">确认密码:</label></td>
				<td class="rightTd">
					<input type="password" id="password2" class="textin"  placeholder="重复输入密码" >
					<p class="error1">两次输入密码不一致</p>
				</td>
			</tr>
			<tr>
				<td class="leftTd"><label for="code">手机验证码:</label></td>
				<td class="rightTd">
					<input type="text" class="textin" id="code" placeholder="请输入验证码"/>
					<input type="button"  name="getCodeBtn" id="getCodeBtn" disabled="true" value="获取验证码" />
				</td>
			</tr>
			<tr>
				<td class="bottom" 	colspan="2";>
					<input type="button" id="saveAdd" class="button" value="确定" />&ensp;&ensp;
					<input type="button" id="cancelAdd" class="button"  value="取消" />
				</td>
			</tr>
		</table>

		<table id="editTable">
			<tr>
				<td class="leftTd"><label for="usernameEdit">用户名:</label></td>
				<td class="rightTd">
					<input type="text" id="usernameEdit" class="textin">
				</td>
			</tr>			
			<tr>
				<td class="leftTd"><label for="passwordEdit">新密码:</label></td>
				<td class="rightTd">
					<input type="password" id="passwordEdit" class="textin"  placeholder="新密码长度在6至20位字符">
					<p class="error1">密码长度在6至20位字符</p>
				</td>
			</tr>
			<tr>
				<td class="leftTd"><label for="passwordEdit2">确认密码:</label></td>
				<td class="rightTd">
					<input type="password" id="passwordEdit2" class="textin"  placeholder="确认密码">
					<p class="error1">两次输入密码不一致</p>
				</td>
			</tr>
			<tr>
				<td class="bottom" 	colspan="2">
					<input type="button" id="saveEdit" class="button" value="确定" />
					&ensp;&ensp;
					<input type="button" id="cancelEdit" class="button" value="取消" />
				</td>
			</tr>
		</table>
	</div>
	<table id="yuangongTable"></table>
	<script>
		$(document).ready(function(){
			//获取当前文档的高度与宽度
			var height=$(document).height();
			var width=$(document).width();
			curRow="";
			$("#yuangongTable").datagrid({
				width:width,
				height:height,
				queryParams:{"user_parent":$("#user_name").val()},
				 url:"findChildEmp",
				method : "post",
				columns:[[
				{field : 'user_id',title : '用户id',width : '15%',align : 'center',resizable:true,}, 
				{field : 'user_name',title : '用户名',width : '15%',align : 'center',resizable:true,
				formatter: function(value,row,index){
					return '<span  title="'+value+'">'+value+'</span>';
				}}, 
				{field : 'user_parent',title : '所属',width : '15%',align : 'center',resizable:true,
				formatter: function(value,row,index){
					return '<span  title="'+value+'">'+value+'</span>';
				}},
				{field : 'status',title : '用户状态',width : '15%',align : 'center',resizable:true,
				formatter: function(value,row,index){
					if(row.status==4){
						return "正常";
					}
				}}, 
				{field : 'createTime',title : '创建时间',width : '20%',align : 'center',resizable:true,
				formatter:function(value,row,index){
					return returnTime(value,row,index);
				}},
				{field : 'updateTime',title : '更新时间',width : '20%',align : 'center',resizable:true,
				formatter:function(value,row,index){
					return returnTime(value,row,index);
				}}, 
				]],
				autoRowHeight : true,
				striped : true,
				loadMsg : "<span style='color:red;'>正在加载数据....</span>",
				pagination : true,
				// queryParams:{},
				singleSelect : true,
				checkOnSelect : true,
				selectOncheck : true,
				pagination : true,
				rownumbers : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				// loadFilter : function(data) {
				// 	return {
				// 		total : data.total,
				// 		rows : data.rows
				// 	};
				// },
				toolbar : [ {
					text : "刷新",
					iconCls : 'icon-reload',
					handler : function() {
						$("#yuangongTable").datagrid('reload');
					}
				},'-', {
					text : "添加",
					iconCls : 'icon-add',
					handler : function() {
						add();
					}
				}, '-', {
					text : '修改',
					iconCls : 'icon-edit',
					handler : function() {
						edit();
					}
				}, '-', {
					text : '删除',
					iconCls : 'icon-cancel',
					handler : function() {
						del();
					}
				} , '-', {
					text : '<div class="searchDiv">'+
					'<input type="text" id="ygPhone" placeholder="请输入手机号码"/>'+
					'<input type="button" value="搜索" id="ygSearch" onclick="ygSearch()"/></div>',
					iconCls : 'icon-search',
				} ],
				onClickRow : function(index, row) {
					if(curRow===row){
						$('#shangpinTable').datagrid("unselectAll");
						curRow="";
					}else{
						curRow=row;//返回当前选中的行
					}
				},
			});			
		})
		
		//时间格式化
		function returnTime(value,row,index){
			var time=new Date(parseInt(value));
			var year=time.getFullYear();
			var month=time.getMonth()+1;
			month<10?month="0"+month:"";
			var date=time.getDate();
			var hours=time.getHours();
			var mins=time.getMinutes();
			var timeStr=year+"/"+month+"/"+date+" "+hours+":"+mins;
			return '<span  title="'+timeStr+'">'+timeStr+'</span>';  
		}

		//错误提示
		function showError($elem,str){
			$elem.siblings("p.error1").css('display','inline').siblings('#used').hide();
		}

		//正确则去掉错误提示
		function showRight($elem){
			$elem.siblings("p.error1").hide();
		}

		//手机号码搜索
		function ygSearch(){
				// 获取用户名 采用模糊
				var v_userName =$("#ygPhone").val();
				var queryParams = $('#yuangongTable').datagrid('options').queryParams;
				queryParams.user_name = v_userName;
				$("#yuangongTable").datagrid('options').queryParams = queryParams;
				$("#yuangongTable").datagrid('reload');
				queryParams.user_name="";
		}

		//添加员工
		function add(){
			showRight($("#addTable input.textin"));
			$("input.textin").val("");
			//显示模态窗口
			$("#addTable").window({
				modal:true,
				title:'添加员工',
				maximizable:false,
				minimizable:false,
				resizable:false,
			});
		}

		//输入用户名时进行手机号码异步检测
		$("#username").blur(function(){
			//手机号码初始化为false
			isRightPhone=false;
			var tel=$(this).val();
			//手机号码正则检测
			if(tel.length<11||!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
			{ 
				showError($(this));
				isRightPhone=false;		
			} else{
				// showRight($(this));
				// 如果格式正确就进行数据库手机验证
				doAjax({"username":tel},"testPhone",resetBtn);
			}
		})

		//发送验证码按钮是否可点击
		function resetBtn(data){
			if(data.result=="1"){
				//手机号可用则恢复按钮
				showRight($("#username"));
				isRightPhone=true;
				$("#getCodeBtn").attr("disabled",false).css("cursor","pointer");
			}else{
				//手机号码不可用禁用按钮
				$("p#used").css('display','inline').siblings("p.error1").hide();
				$("#getCodeBtn").css("cursor","not-allowed").attr("disabled",true);
			}
		}

		//点击发送验证码
		$("#getCodeBtn").click(function(){
			//发送验证码代码...
			pos=3;
			var a="11";
			var $this=$(this);
			$this.css("cursor","not-allowed").attr("disabled",true);
			timeInt=setInterval(function(){interval($this)},980);
		}) 

		//定时器
		function interval(elem){
			if(pos>0){
				elem.val(pos+"s后再次获取");
				pos--;
				return;
			}
			if(pos===0){
				elem.attr("disabled",false).css("cursor","pointer");
				elem.val("获取验证码");
				clearInterval(timeInt);
				//回收pos
				pos=null;
			}				
		}

		//密码检测
		$("#password").blur(function(){
			var pw=$(this).val();
			if(pw.length<6){
				isRightPw=false;
				showError($(this));
				return;
			}else{
				isRightPw=true;
				showRight($(this));
			}
		})

		//密码一致检测
		$("#password2").blur(function(){
			var pw2=$(this).val();
			if(pw2!==$("#password").val()){
				isRightPw2=false;
				showError($(this));
				return;
			}else{
				isRightPw2=true;
				showRight($(this));
			}
		})

		//保存添加
		$("#saveAdd").click(function saveAdd(){
			//如果有一个不正确，就返回
			if(!isRightPhone||!isRightPw||!isRightPw2){
				return;
			}else{
				var json={};
				json.username=$("#username").val();
				json.password=$("#password").val();
				json.user_parent=$("#user_name").val();
				var url="addShopEmp";
				doAjax(json,url,saveAddCallBack);
				
			}
		})
		
		//添加员工的成功回调函数
		function saveAddCallBack(data){
			if(data.result=="0"){
				$.messager.alert("提示","添加员工成功！");
				//关闭添加员工的窗口
				$("#addTable").window('close');
				$("#yuangongTable").datagrid('reload');
			}else if(data.result=="1"){
				$.messager.alert("提示","添加员工失败！");
			} else{
				$.messager.alert("提示","系统异常 稍后重试！");
			}
			
		}
		
		
		
		//取消添加
		$("#cancelAdd").click(function cancelAdd(){
			$("#addTable").window('close');
		})
		

		//修改员工密码
		function edit(){
			if(curRow===""){
				$.messager.alert("提示","请先选择要修改的用户");
				return;
			}
			showRight($("#editTable input.textin"));
			$("input.textin").val("");
			//用户名不可修改
			$("#usernameEdit").val(curRow.user_name).attr('readonly',true);
			//显示模态窗口
			$("#editTable").window({
				modal:true,
				title:'修改员工',
				maximizable:false,
				minimizable:false,
				resizable:false,
			});
		}

		//新密码检测
		$("#passwordEdit").blur(checkNewPw);
		function checkNewPw(){
			var $this=$("#passwordEdit");
			if($this.val().length<6||$this.val().length>20){
				showError($this);
				return false;
			}else{
				showRight($this);
				return true;
			}
		}

		//确认密码检测
		$("#passwordEdit2").blur(checkNewPw2);
		function checkNewPw2(){
			var $this=$("#passwordEdit2");
			if($this.val()!==$("#passwordEdit").val()){
				showError($this);
				return false;
			}else{
				showRight($this);
				return true;
			}
		}

		//保存修改
		$("#saveEdit").click(function saveEdit(){
			if(!checkNewPw()||!checkNewPw2()){
				return false;
			}
			//获取某行
			var row = $('#yuangongTable').datagrid('getSelected');
			var json={};
			//获取主键id
			var user_id = row.user_id;
			json.user_id=user_id;
			json.username=$("#username").val();
			json.password=$("#passwordEdit").val();
			var url="updateSysUser";
			doAjax(json,url,saveEditCallback);
		})

		//保存修改回调函数
		function saveEditCallback(data){
			if(data.result=="0"){
				$.messager.alert("提示","用户 "+curRow.user_name+" 修改密码成功");
				$('#editTable').window('close');
				$('#yuangongTable').datagrid('unselectAll');
				$("#yuangongTable").datagrid('reload');
				return;
			}else if(data.result=="1"){
				$.messager.alert("提示","用户 "+curRow.user_name+" 修改密码失败！");
				$("#editTable").window('close');
				$('#yuangongTable').datagrid('unselectAll');
				$("#yuangongTable").datagrid('reload');
				return;
			}else{
				$.messager.alert("提示","系统异常 稍后重试！");
			}
		}

		//取消修改
		$("#cancelEdit").click(function cancelEdit(){
			$("#editTable").window('close');
		})
		
		//删除员工
		function del(){
			if(curRow===""){
				$.messager.alert("提示","请先选择要修改的用户");
				return;
			}
			$.messager.confirm('提示','确定删除该用户？',function(r){
				if (r){
					//ajax异步删除
					var json={}
					json.user_id=curRow.user_id;
					doAjax(json,"deleteSysUser",delCallback);
				}
			});
		}

		//删除后的回调函数
		function delCallback(data){
			if(data.result=="0"){
				$.messager.alert("提示","删除成功！");
				//取消选中
				curRow="";
				$('#empPanel').datagrid("unselectAll");
				//重新加载数据
				$("#yuangongTable").datagrid("reload");
			} else if(data.result=="1"){
				$.messager.alert("提示","删除失败！");
				$('#empPanel').datagrid("unselectAll");
				//重新加载数据
				$("#yuangongTable").datagrid("reload");
			}else{
				$.messager.alert("提示","系统异常 稍后重试！");
			}
		}

		//ajax请求服务器
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
	</script>
</body>
</html>