$(document).ready(function(){
  _init_area();
  var shenfenzhengArr=[],zhizhaoArr=[],shouquanshuArr=[],mendiantuArr=[];
  $("#name").on("keyup",checkName);
  $("#name2").on("keyup",checkName2);
  $("#userId").on("keyup",checkId);
  $("#contact").on("keyup",checkContact);
})

var showArea = function(){
  $('#show').html = "<h3>省" + $('#s_province').val() + " - 市" +  
  $('#s_city').val() + " - 县/区" + 
  $('#s_county').val() + "</h3>"
}
$('#s_county').change(function(){
  showArea();
});

function selectImg(arg){
  var target_elem=document.getElementById(arg);
  var isIE=navigator.userAgent.indexOf("MSIE")>=1?true:false;
  if(isIE){}
    else{
     var num=target_elem.files.length;           
     var container=$("#"+arg+"_imgs");
     var result="";
     for(var i=0;i<num;i++){
      if (!target_elem.value.match(/.jpg|.gif|.png|.bmp/i)){ 
       return alert("上传的图片格式不正确，请重新选择")
     } 
     var reader=new FileReader();
     reader.readAsDataURL(target_elem.files[i]);
     reader.onload=function(e){
       result=result+'<img src="'+this.result+'"/>';
       container.html(result).show();
     }
   } 
 }  
}

function showError(elem,str){
  if(elem.siblings("span.warming").length!==0) return false;
  $("<span class='warming'>"+str+"</span>").insertAfter(elem);
  return false;
}

function showRight(elem){
  elem.siblings("span.warming").remove();
  return true;
}

function checkName(){
  var elem=$("#name");
  if(elem.val().length<2||elem.val().length>4){
    showError(elem,"长度在2到4个字符之间");
    return false;
  }else{
    showRight(elem);
    return true;
  }
}

function checkName2(){
  var elem=$("#name2");
  if(elem.val().length<2||elem.val().length>14){
    showError(elem,"长度在2到14个字符之间");
    return false;
  }else{
    showRight(elem);
    return true;
  }
}

function checkId(){
  var elem=$("#userId");
  var regId=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
  if(elem.val().length<15||!regId.test(elem.val())){
    showError(elem,"身份证不正确");
    return false;
  }else{
    showRight(elem);
    return true;
  }
}

function checkContact(){
  var elem=$("#contact");
  if(elem.val().length<7){
    showError(elem,"电话长度太短");
    return false;
  }else{
    showRight(elem);
    return true;
  }
}

function checkDiZhi(){
  var dizhi="";
  if($("#dizhi2").val()===""||$("#s_province").val()==="省份"||$("#s_city").val()==="地级市"||$("#s_county").val()==="市、县级市"){
    alert("请输入正确地址");
    return false;
  }else{
    dizhi=$("#s_province").val()+$("#s_city").val()+$("#s_county").val()+$("#dizhi2").val();
    return true;
  }
}

function save(){
  if(!checkName()||!checkName2()||!checkId()||!checkContact()||!checkDiZhi()){
    return false;
  }else{

  }
}