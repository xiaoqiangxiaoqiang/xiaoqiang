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
        <title>货比五家官网首页——huobiwujia.com</title>
    </head>
    <body>
        <div class="header">
            <div class="header-logo">
                <a href="http://www.baidu.com"><img src="${ctx}/images/index/nav_logo.jpg" alt="nav_logo" class='head-img'></a>
            </div>
            <div class="header-nav">
                <a class="header-nav-a active" href="">首页</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/login">用户登陆</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/register">商家入驻</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/help">帮助中心</a>
            </div>
        </div>
        <div class="main">
            <div class="main-banner-div">
                <img src="${ctx}/images/index/banner01.jpg" class="banner-img">
            </div>
            <div class="main-section">
                <h2 class="main-section-title"><span class="title-span">公司简介</span></h2>
                <div class="section-div">
                    <div class="section-imgWrapper">
                        <img class="section-img" src="${ctx}/images/index/bg_jieshao.png" style="width: 90%">
                    </div>
                    <div class="section-pWrapper">
                    
                    
                        <p class="section-p">
                            广州市终点站网络科技有限公司坐落于广州市越秀区环市西路美博运动城721
                            室。由一批IT界资深人士创立，公司聚集了互联网业界精英，我们是一只年轻且
                            充满激情的团队，既富有科技发展的时代节奏，又蕴含了无穷的创新精神。</p>
                    </div>
                </div>
            </div>
            <div class="main-section">
                <h2 class="main-section-title"><span class="title-span">企业理念</span></h2>
                <div class="section-div">
                    <div class="section-pWrapper">
                        <p class="section-p">
                            终点站网络科技秉承客户至上、服务至上的经营理念，以卓越的网络服务品
                            质、专业的 技术服务实力、职业的客户服务团队保障您在21世纪的信息高速路上
                            驰骋。坚持以稳 固与发展、求实与创新的精神，尊重人才、注重技术，使用户在
                            享受信息科技发展最 新成果的同时不断获得最大的收益，为推动中国信息产业的
                            发展、促进知识经济的崛起作出最大的贡献。
                        </p>
                    </div>
                    <div class="section-imgWrapper">
                        <img class="section-img" src="${ctx}/images/index/bg_linian.jpg">
                    </div>
                </div>
            </div>
            <div class="main-section">
                <h2 class="main-section-title"><span class="title-span">经营范围</span></h2>
                <div class="section-div">
                    <div class="section-imgWrapper">
                        <img class="section-img" src="${ctx}/images/index/bg_fanwei.jpg">
                    </div>
                    <div class="section-pWrapper">
                        <p class="section-p">
                            经营范围：商品信息咨询服务；信息科技咨询服务；信息电子技术服务；信息技术咨询服务；互联网商品销售（许可审批类商品除外）；互联网商品零售（许可审批类商品除外）；商品批发贸易（许可审批类商品除外）；商品零售贸易（许可审批类商品除外）。
                        </p>
                    </div>
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
//            if (ie==9||ie == 8 || ie == 7 || ie == 6) {
//                alert("您当前ie" + ie + "版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
//            }
        </script>
    </body>
</html>