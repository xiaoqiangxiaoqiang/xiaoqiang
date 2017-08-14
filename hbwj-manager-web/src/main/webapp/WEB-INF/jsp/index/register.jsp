<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">
    <head>
        <meta charset="UTF-8">
        <!-- 页面描述 -->
        <meta name="description" content="货比五家官网，由广州市终点站网络科技有限公司开发管理运营。旨在为用户提供更优惠实在的产品，为商家拉拢更多的客户，达到“三赢”。"/>
        <!-- 页面关键词 -->
        <meta name="keywords" content="货比五家,huobiwujia,终点站科技,广州市终点站"/>
        <link type="image/x-icon" rel="shortcut icon" href="${ctx}/images/index/logo.jpg" />
        <link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/css/remodal.css">
        <%-- <link rel="stylesheet" type="text/css" href="${ctx}/remodal-default-theme.css"> --%>
        <title>货比五家官网——huobiwujia.com</title>
    </head>
    <body>
        <!--[if lt IE 10]>
       <p class="notSupportP" id="ie-warming" style="display:none">您当前ie版本过低，为了更好的浏览体验，建议升级至较新版本（<a href='https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads/' target="_blank" class="notSupportA">ie9以上</a>）或更换至其他浏览器（如<a href='http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html' target="_blank" class="notSupportA">谷歌chrome</a>、<a href='http://se.360.cn/' target="_blank" class="notSupportA">360浏览器</a>等）。</p>
        <![endif]-->
        <div class="header">
            <div class="header-logo">
                <a href="http://www.baidu.com"><img src="${ctx}/images/index/nav_logo.jpg" alt="nav_logo" class="head-img"></a>
            </div>
            <div class="header-nav">
                <a class="header-nav-a" href="${ctx}/hbwj/enter/index">首页</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/login">用户登陆</a>
                <a class="header-nav-a active" href="">商家入驻</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/help">帮助中心</a>
            </div>
        </div>

        <div data-remodal-id="modal1" id="modal1">
            <button data-remodal-action="close" class="remodal-close"></button>
            <h1>商家注册</h1>
            <div class="input-div">
                <!--[if lt IE 10]>
                <div class='ie-left-blank'></div>
                <div class="ie-left">手机号：</div>
                <![endif]-->
                <input type="text" class="modal-input" id="username" placeholder="请输入手机号码"/>
                <span class="input-error input-error1">手机号码格式不正确</span>
                <span class="input-error input-error2">该手机号码已被注册</span>
            </div>
            <div class="input-div">
                <!--[if lt IE 10]>
                <div class='ie-left-blank'></div>
                <div class="ie-left">密码：</div>
                <![endif]-->
                <input type="password" class="modal-input" id="password" placeholder="请输入6至16位密码"/>
                <span class="input-error">密码长度在6至16位字符</span>
            </div>
            <div class="input-div">
                <!--[if lt IE 10]>
                <div class='ie-left-blank'></div>
                <div class="ie-left">确认密码：</div>
                <![endif]-->
                <input type="password" class="modal-input" id="password2" placeholder="请重复输入密码"/>
                <span class="input-error">两次输入密码不一致</span>
            </div>
            <div class="input-div">
                <!--[if lt IE 10]>
                <div class='ie-left-blank'></div>
                                <div class="ie-left">验证码：</div>
                                <![endif]-->
                <input type="text" class="modal-input modal-input2" id="code" placeholder="请输入验证码"/>
                <div class="button button1" id="sendCode">发送验证码</div>
                <div class="buttonMask"></div>
                <span class="input-error input-error1">请输入验证码</span>
                <span class="input-error input-error2">请输入接受验证码</span>
                <span class="input-error input-error3">验证码已发送</span>
            </div>
            <div class="input-div input-div2">
                <input type="checkbox" id="accept" /><label for="accept">我已阅读并接受</label><a href="${ctx}/hbwj/enter/rule" class="accept-a">《货比五家服务条款》</a>
                <span class="input-error input-error-a">请先仔细阅读该条款</span>
            </div>
            <div class="input-div input-div3">
                <div class="button button2" id="register">注册</div>
            </div>
        </div>
        <div data-remodal-id="modal2" class="modal2">
            <button data-remodal-action="close" class="remodal-close"></button>
            <h1>注册成功</h1>
            <a href="${ctx}/hbwj/enter/login" class="modal2-a" title="点击此处进入登陆页面">点击此处进入登陆页面</a>
        </div>
        <div data-remodal-id="modal3" class="modal2">
            <button data-remodal-action="close" class="remodal-close"></button>
            <h1>抱歉,注册失败</h1>
        </div>

        <div class="main">
            <div class="main-banner-div">
                <img src="${ctx}/images/index/banner02.jpg" class="banner-img">
                <div class="join-div">
                    <input type="button" class="join-button" value="注册入驻" title="点击进行注册"  id="join"><br>
                    <a href="${ctx}/hbwj/enter/rule" class="join-a2" title="点击查看商家使用手册">查看商家使用手册</a>
                </div>
            </div>
            <div class="main-section">
                <h2 class="main-section-title"><span class="title-span">入驻流程</span></h2>
                <div class="section-div">
                    <img src="${ctx}/images/index/bg_liucheng.jpg" class="section-img2">
                </div>
            </div>
            <div class="main-contact-div">
                <div class="main-contact-left">
                    <div class="contact-figure">
                        <img src="${ctx}/images/index/code1.jpg" class="contact-img">
                        <p class="figcaption">扫码关注</p>
                    </div>
                    <div class="contact-figure">
                        <img src="${ctx}/images/index/code2.jpg" class="contact-img">
                        <p class="figcaption">扫码关注<p>
                    </div>
                </div>
                <div class="main-contact-right">
                    <h3 class="contact-title">联系我们</h3>
                    <p class="contact-p">客服电话：020-29061583</p>
                    <p class="contact-p">商家热线：020-29061583</p>
                    <p class="contact-p">广州市终点站网络科技有限公司</p>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>Copyright&ensp;&copy;&ensp;2017&ensp;huobiwujia.com&ensp;&ensp;All rights reserved.</p>
            <p>粤ICP备15106664号&ensp;&ensp;广州市越秀区环市西路202号&ensp;&ensp;邮编:510010</p>
        </div>
        <script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="${ctx}/js/remodal.js"></script>
        <script>
            var win = window;
            var doc = win.document;
            var input = doc.createElement("input");

            var ie = (function () {
                //"!win.ActiveXObject" is evaluated to true in IE11
                if (win.ActiveXObject === undefined)
                    return null;
                if (!win.XMLHttpRequest)
                    return 6;
                if (!doc.querySelector)
                    return 7;
                if (!doc.addEventListener)
                    return 8;
                if (!win.atob)
                    return 9;
                //"!doc.body.dataset" is faster but the body is null when the DOM is not
                //ready. Anyway, an input tag needs to be created to check if IE is being
                //emulated
                if (!input.dataset)
                    return 10;
                win = null;
                doc = null;
                input = null;
                return 11;
            })();

            fuckIe = false;
            if (ie==9||ie == 8 || ie == 7 || ie == 6) {
                fuckIe = true;
                var warming=$('#ie-warming');
                warming.show(800);
                var t=setTimeout('warming.hide(800);warming=null;clearTimeoout(t);',8000);           
//                alert("您当前ie" + ie + "版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
            }
            
            options1 = {hashTracking: false, closeOnOutsideClick: false};
            option2 = {hashTracking: false};
            var modal1 = $('[data-remodal-id=modal1]').remodal(options1);
            var modal2 = $('[data-remodal-id=modal2]').remodal(option2);
            var modal3 = $('[data-remodal-id=modal3]').remodal(option2);
            options1 = null;
            options2 = null;

            timeInt = "";
            pos = -1;
            //点击入驻绑定事件
            $("#join").click(function () {
                $('#username,#password,#password2,#code').val("").css('border-color', 'silver');
                $("#accept").attr('checked', false);
                $("#modal1 span.input-error").hide();
                if (fuckIe) {
                    $("#modal1").css({'padding-left': "90px", 'padding-right': "60px"});
                }    
                if (timeInt !== "") {
                    clearInterval(timeInt);
                    $('#sendCode').html("发送验证码");
                }
                $('#code1').val("");
                modal1.open();
            });

            $("#modal1").on('focus', 'input.modal-input', function () {
                $(this).css('border-color', 'black');
            });

            //ajax请求服务器
            function doAjax(json, url, callback) {
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: json,
                    dataType: 'JSON',
                    success: function (data) {
                        callback(data);
                    },
                    error: function () {
                    }
                });
            }

            var isRightPhone = false;
            var phone = "";

            $('#code').blur(function () {
                $(this).css('border-color', 'silver');
            });

            //手机号码检测
            $('#username').blur(checkPhone);
            function checkPhone() {
                var elem = $('#username');
                var tel = elem.val();
                if (tel.length < 11 || !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
                {
                    elem.css('border-color', 'red').siblings('span').hide().filter('span.input-error1').show();
                    $('div.buttonMask').show();
                    isRightPhone = false;
                    return false;
                } else {
                    elem.css('border-color', 'silver').siblings('span').hide();
                    doAjax({"phoneNum": tel}, "findFalse", resetBtn);
                    /* resetBtn({'result': 0}); */
                }
            }

            //验证码按钮恢复
            function resetBtn(data) {
                //0:用户不存在 
                if (data.result == "0") {
                    isRightPhone = true;
                    //此时已发送，正在等待中
                    if ($('#sendCode').html().indexOf('s后再发送') !== -1) {
                        return;
                    }
                    $('div.buttonMask').hide();
                    return;
                }
                //1:用户存在 已经注册
                if (data.result == "1") {
                    isRightPhone = false;
                    $("#username").css('border-color', 'red').siblings('span').hide().filter('span.input-error2').show();
                    $('div.buttonMask').show();
                }
            }

            //点击获取验证码
            $('#sendCode').click(sendCode);
            function sendCode() {
                if (pos > 0) {
                    return;
                }
                var elem = $("#sendCode");
                phone = $("#username").val();
                if (phone.length < 11 || !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))) {
                    $("#username").css('border-color', 'red').siblings('span').hide().filter('span.input-error1').show();
                    fuckIe = true ? $('#buttonMask-ie').show(): $('div.buttonMask').show();
//                    $('div#buttonMask').show();
                    return;
                }

//                if (phone == '') {
//                    $('div.buttonMask').show();
//                    return;
//                }
                //发送验证码代码...
               doAjax({"phone": phone}, "sendCode", codeBack);
               // codeBack({'code': 1234, 'result': 0});
                elem.siblings('span.input-error').hide().filter('span.input-error3').show();
                pos = 60;
                $('div.buttonMask').show();
                timeInt = setInterval(function () {
                    interval(elem)
                }, 980);//定义定时器	
            }

            function interval(elem) {
                if (pos > 0) {
                    elem.html(pos + "s后再发送");
                    pos--;
                    return;
                }
                if (pos === 0) {
                    elem.html("发送验证码");
                    elem.siblings('span.input-error').hide();
                    $('div.buttonMask').hide();
                    clearInterval(timeInt);
                }
            }

            function codeBack(data) {
                if (data.result == 0) {
                    //表示获取验证码成功
                    phone = $("#username").val();
                    console.log('send code')
                    return;
                }
                if (data.result == 1) {
                    //如果验证码错误
                    alert('发送验证码失败，请稍后再试');
                    return false;
                }
            }

            //密码检测
            $("#password").blur(checkPw);
            function checkPw() {
                var elem = $("#password");
                var ps = elem.val();
                if (ps.length < 6) {
                    elem.css('border-color', 'red').siblings('span').show();
                    return false;
                } else if (ps.length > 16) {
                    elem.css('border-color', 'red').siblings('span').hide();
                    return false;
                } else {
                    elem.css('border-color', 'silver').siblings('span').hide();
                    return true;
                }
            }

            //密码一致检测
            $("#password2").blur(checkPw2);
            function checkPw2() {
                var elem = $("#password2");
                var ps2 = elem.val();
                var ps = $("#password").val();
                if (ps2 !== ps) {
                    elem.css('border-color', 'red').siblings('span').show();
                    return false;
                } else {
                    elem.css('border-color', 'silver').siblings('span').hide();
                    return true;
                }
            }

            //验证码检测
            function checkCode() {
                if ($("#code").val().length !== 4 || phone != $("#username").val()) {
                    $('#code').css('border-color', 'red').siblings('span.input-error').hide().filter('span.input-error2').show();
                    return false;
                } else {
                    $('#code').css('border-color', 'silver').siblings('span.input-error').hide();
                    return true;
                }
            }

            //阅读条款
            function checkAccept() {
                var elem = $('#accept');
                if (elem.prop('checked') == false) {
                    elem.siblings('span.input-error').show();
                    return false;
                } else {
                    elem.siblings('span.input-error').hide();
                    return true;
                }
            }

            //点击注册
            $('#register').click(register);
            function register() {
                if (!isRightPhone) {
                    $('#username').siblings('span.input-error1').show();
                    return;
                } else {
                    $('#username').siblings('span.input-error').hide();
                }
                if (!checkPw() || !checkPw2() || !checkAccept()) {
                    return;
                }

                var json = {};
                json.phone = $("#username").val();
                json.password = $("#password").val();
                json.code = $("#code").val();
                doAjax(json, "userRegister", regCallback);
            }

            //注册结果
            function regCallback(data) {
            	//注册成功
                if (data.result == "0") {
                    modal1.close();
                    modal2.open();
                    //注册失败
                } else if (data.result == "1") {
                    modal3.open();
                } else if (data.result == "2"){
                	//验证码输入有误
                }
            }

        </script>
    </body>
</html>