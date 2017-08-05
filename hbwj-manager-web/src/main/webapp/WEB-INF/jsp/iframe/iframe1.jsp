<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>上传图片iFrame</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/upload/zyupload-1.0.0.min.css" type="text/css">
</head>
<body>
	<input type="hidden"  id ="up" value="${user_name}"/> 
	<div id="imgUpload" class="zyupload"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/upload/zyupload.basic-1.0.0.min.js"></script>
	<script>
		$(document).ready(function(){
			//获取当前还能上传的张数
			maxNum=window.parent.getMaxNum();
			//默认限制20张
			if(maxNum==undefined||maxNum==null){
				maxNum=20;
			}
			$("#imgUpload").zyUpload({
					width            :   "950px",                 // 宽度
					height           :   "",                 	  // 高度
					itemWidth        :   "200px",                 // 文件项的宽度
					itemHeight       :   "150px",                 // 文件项的高度
					url              :   "upLoadPicture?user_name="+$("#up").val(),              // 上传文件的路径
					fileType         :   ["jpg","png","bmp","jpeg"],// 上传文件的类型
					fileSize         :   2*1024*1024,                // 上传文件的大小
					multiple         :   true,                    // 是否可以多个文件上传
					dragDrop         :   false,                   // 是否可以拖动上传文件
					tailor           :   false,                   // 是否可以裁剪图片
					del              :   true,                    // 是否可以删除文件
					finishDel        :   false,  				  // 是否在上传文件完成后删除预览
					/* 外部获得的回调接口 */
					onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
						console.info("当前选择了以下文件：");
						console.info(selectFiles);
						var sel="";
						for(var i=0;i<selectFiles.length;i++){
							sel+="【"+selectFiles[i].name+"】; ";
						}
						$("#uploadInf").html("新添加文件："+sel);
						var all="";
						for(var i=0;i<allFiles.length;i++){
							all+="【"+allFiles[i].name+"】;";
						}						
						$("#uploadInf").html($("#uploadInf").html()+"<br/>所有待上传文件："+all);
						var info='单张图片大小不得超过<span style="color:red">2M</span>。您还能上传<span style="color:red">'+maxNum+'</span>张图片。'+'当前已选中'+selectFiles.length+'张文件';
						$("#status_info").html(info);
					},
					onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
						console.info("当前删除了此文件：");
						console.info(file.name);
					},
					onSuccess: function(file, response){          // 文件上传成功的回调方法
						console.info("此文件上传成功：");
						console.info(file.name);
						maxNum>0?maxNum--:maxNum=0;
						$("#uploadInf").append("<p>【" + file.name + "】上传成功</p>");
						var info='单张图片大小不得超过<span style="color:red">2M</span>，您还能上传<span style="color:red">'+maxNum+'</span>张图片';
						$("#status_info").html(info);
						//回传设置图片URL和title
						var data=JSON.parse(response);
						window.parent.addImg(data.url,file.name);

					},
					onFailure: function(file, response){         // 文件上传失败的回调方法
						console.info("此文件上传失败：");
						console.info(file.name);
						$("#uploadInf").append("<p>【" + file.name + "】上传失败</p>");
					},
					onComplete: function(response){           	  // 上传完成的回调方法
						console.info("文件上传完成");
						console.info(response);
					}
				});	
			
			var info='单张图片大小不得超过<span style="color:red">2M</span>，您还能上传<span style="color:red">'+maxNum+'</span>张图片';
			$("#status_info").html(info);
			// 绑定上传点击事件
			$(".upload_btn").off('click').bind("click", function(e){
				console.log(ZYFILE.funReturnNeedFiles().length);
					// 判断当前是否有文件需要上传
					if(ZYFILE.funReturnNeedFiles().length === 0){
						return alert("请先选中文件再点击上传");
					}else if(ZYFILE.funReturnNeedFiles().length>maxNum){
						return alert("图片数量超过限制,当前只能上传"+maxNum+"张图片");
					}else{
						$("#fileSubmit").click();
					}
				});
		})
	</script>
</body>
</html>