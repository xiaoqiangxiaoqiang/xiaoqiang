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
        <title>货比五家官网——huobiwujia.com</title>
    </head>
    <body>
        <div class="header">
            <div class="header-logo">
                <a href="http://www.baidu.com"><img src="${ctx}/images/index/nav_logo.jpg" alt="nav_logo" class="head-img"></a>
            </div>
            <div class="header-nav">
                <a class="header-nav-a" href="${ctx}/hbwj/enter/index">首页</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/login">用户登陆</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/register">商家入驻</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/help">帮助中心</a>
            </div>
        </div>
        <div class="main login-main">
            <div class="main-section login">
                <p class="login-head">忘记密码<span class="login-span"><a href='${ctx}/hbwj/enter/login' class="login-a">返回登录</a></span></p>
                <div class="login-left-div" id="login-left-div">
                    <div class="login-div">
                        <!--[if lt IE 10]>
                    <div class="fuck-ie username-ie">手机号码:</div>
                    <![endif]-->
                        <div class="login-input-img" id="name-img"></div>
                        <input class="login-input" id='username' name="username" type='text' placeholder="请输入手机号"/>
                        <span class="input-error error1">手机号码不正确或未注册</span>
                        <!--<span class="input-error error2">用户未注册,请直接注册</span>-->
                    </div>
                    <div class="login-div">
                        <!--[if lt IE 10]>
                    <div class="fuck-ie pw-ie">新的密码:</div>
                    <![endif]-->
                        <div class="login-input-img" id="pw-img"></div>
                        <input class="login-input" id="password" name='password' type="password" placeholder="请输入新密码"/>
                        <span class="input-error error1">密码长度在6至16位</span>
                    </div>
                    <div class="login-div">
                        <!--[if lt IE 10]>
                    <div class="fuck-ie pw2-ie">确认密码:</div>
                    <![endif]-->
                        <div class="login-input-img" id="pw-img"></div>
                        <input class="login-input" id="password2" name='password2' type="password" placeholder="确认密码"/>
                        <span class="input-error error1">两次密码不一致</span>
                    </div>
                    <div class="login-div find-login-div">
                        <!--[if lt IE 10]>
                   <div class="fuck-ie code-ie">验证码:</div>
                   <![endif]-->
                        <input type="text" class="find-code-input" id="code" placeholder="请输入验证码"/>
                        <div class="find-code-button" id="sendCode">发送验证码</div>
                        <div id="buttonMask"></div>
                        <input type="hidden" id="code1" value="" />
                        <span class="input-error input-error1">请输入验证码</span>
                        <span class="input-error input-error2">验证码错误</span>
                        <span class="input-error input-error3">验证码已发送</span>
                    </div>
                    <!--[if lt IE 10]>
                    <div id="buttonMask-ie"></div>
                    <![endif]-->
                    <div class="login-warp">
                        <div id="find" class="button">找回密码</div>
                    </div>
                </div>
                <div class='login-right-div'>
                    <img class="login-img" src="${ctx}/images/index/login.jpg">
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
                        <p class="figcaption">扫码关注</p>
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
                return 11;
            })();
            var fuckIe = false;
            if (ie == 9 || ie == 8 || ie == 7 || ie == 6) {
                fuckIe = true;
//                alert("您当前ie" + ie + "版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
            }

            $("#login-left-div").on('focus', 'input.login-input', function () {
                $(this).parent().css('border-color', 'black');
            });

            //用户是否存在或者手机号码不正确
            var isRightPhone = false;
            var phone = "";
            var pos = -1;

            //手机号码检测
            $('#username').blur(checkPhone);
            function checkPhone() {
                var elem = $('#username');
                var tel = elem.val();
                if (tel.length < 11 || !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel)))
                {
                    elem.siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    fuckIe === true ? $('#buttonMask-ie').show() : $('div#buttonMask').show();
                    isRightPhone = false;
                    return false;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
//                    doAjax({"phoneNum": tel}, "findFalse", resetBtn);
                    resetBtn({'result': 1});
                }
            }

            //验证码按钮恢复
            function resetBtn(data) {
                //1:用户存在,可以发送验证码
                if (data.result == "1") {
                    isRightPhone = true;
                    //此时已发送，正在等待中
                    if ($('#sendCode').html().indexOf('s后再发送') !== -1) {
                        return;
                    }
                    fuckIe === true ? $('#buttonMask-ie').hide() : $('div#buttonMask').hide();
//                    $('div#buttonMask').hide();
                    return;
                }
                //0:用户不存在
                if (data.result == "0") {
                    isRightPhone = false;
                    $("#username").siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    fuckIe === true ? $('#buttonMask-ie').show() : $('div#buttonMask').show();
//                    $('div#buttonMask').show();
                }
            }

            //点击获取验证码
            $('#sendCode').click(sendCode);
            function sendCode() {
                if (pos > 0) {
                    console.log('jujue');
                    return;
                }
                var elem = $("#sendCode");
                phone = $("#username").val();
                if (phone.length < 11 || !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))) {
                    $("#username").siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    fuckIe === true ? $('#buttonMask-ie').show() : $('div#buttonMask').show();
//                    $('div#buttonMask').show();
                    return;
                }

                //发送验证码代码...
//                doAjax({"phone": phone}, "sendCode", codeBack);
                codeBack({'code': 1234, 'result': 0});
                elem.siblings('span.input-error').hide().filter('span.input-error3').show();
                pos = 15;
                fuckIe === true ? $('#buttonMask-ie').show() : $('div#buttonMask').show();
                $('div#buttonMask').show();
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
                    fuckIe === true ? $('#buttonMask-ie').hide() : $('div#buttonMask').hide();
//                    $('div#buttonMask').hide();
                    clearInterval(timeInt);
                }
            }

            //发送验证码回调
            function codeBack(data) {
                if (data.result == 0) {
                    alert('已发送验证码');
                    //表示获取验证码成功
                    var code = data.code;
                    $("#code1").val(code);
                    phone = $("#username").val();
                    return;
                }
                if (data.result == 1) {
                    //如果验证码错误
                    alert('发送验证码失败，请稍后再试');
                    return false;
                }
            }

            //验证码检测
            function checkCode() {
                if ($("#code").val().length < 4 || $("#code1").val() != $("#code").val() || phone != $("#username").val()) {
                    $('#code').css('border-color', 'red').siblings('span.input-error').hide().filter('span.input-error2').show();
                    return false;
                } else {
                    $('#code').css('border-color', 'silver').siblings('span.input-error').hide();
                    return true;
                }
            }

            //密码检测
            $('#password').blur(checkPw);
            function checkPw() {
                var elem = $('#password');
                var pw = elem.val();
                if (pw.length < 6 || pw.length > 16)
                {
                    elem.siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    return false;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
                    return true;
                }
            }

            //确认密码检测
            $('#password2').blur(checkPw2);
            function checkPw2() {
                var elem = $('#password2');
                var pw = elem.val();
                if (pw !== $("#password").val())
                {
                    elem.siblings('span').hide().filter('span.error1').show().parent().css('border-color', 'red');
                    return false;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
                    return true;
                }
            }

            //点击找回
            $('#find').click(find);
            function find() {
                var elem = $('#username');
                if (!isRightPhone) {
                    //手机号码未注册，提示先注册
                    elem.css('border-color', 'red').siblings('span').hide().filter('span.error1').show();
                    return;
                } else {
                    elem.siblings('.input-error').hide().parent().css('border-color', 'silver');
                }
                if (!checkPw() || !checkPw2() || !checkCode()) {
                    return;
                }
                var json = {};
                json.phone = $("#username").val();
                json.password = $("#password").val();
                json.code = $("#code").val();
//                doAjax(json, "register", regCallback);
                findCallback({'result': 1});
            }

            //找回密码结果
            function findCallback(data) {
                if (data.result == "0") {

                } else if (data.result == "1") {
                    console.log('find!');
                }
            }
        </script>
    </body>
</html>