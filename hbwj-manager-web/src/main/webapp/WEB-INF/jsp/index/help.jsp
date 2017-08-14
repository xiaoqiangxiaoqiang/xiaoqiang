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
                <a href="http://www.baidu.com"><img src="${ctx}/images/index/nav_logo.jpg" alt="nav_logo" class='head-img'></a>
            </div>
            <div class="header-nav">
                <a class="header-nav-a" href="${ctx}/hbwj/enter/index">首页</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/login">商家登陆</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/register">商家入驻</a>
                <a class="header-nav-a active" href="${ctx}/hbwj/enter/help">帮助中心</a>
            </div>
        </div>
        <div class="main">
            <div class="main-banner-div">
                <img src="${ctx}/images/index/banner03.jpg" class="banner-img">
            </div>

            <div class="main-ques-ans-div">
                <div class="main-ques" id="main-ques">
                    <p class="ques-head">常见问题</p>
                    <div class="ques-head-side"></div>
                    <canvas id="ques-head-canvas" width="30" height="18"></canvas>
                    <p class="ques-title">交易问题</p>
                    <ul class="ques-ul">
                        <li class="ques-li active">>我拍下来的商品什么时候发货？</li>
                        <li class="ques-li">>已拍下的商品未发货如何退换？</li>
                        <li class="ques-li">>没有收到货/商家发错了地址怎么办？</li>
                        <li class="ques-li">>收到商品有问题怎么办？</li>
                        <li class="ques-li">>如何联系商家客服？</li>
                        <li class="ques-li">>收到的商品能退换货吗？</li>
                    </ul>
                    <p class="ques-title">退款&售后</p>
                    <ul class="ques-ul">
                        <li class="ques-li">>退换货流程</li>
                        <li class="ques-li">>退换货规则</li>
                        <li class="ques-li">>7天无理由退换货</li>
                    </ul>
                    <p class="ques-title">联系我们</p>
                    <ul class="ques-ul">
                        <li class="ques-li">>如何联系货比五家客服？</li>
                    </ul>
                </div>
                <div class="main-ans">
                    <p class="ans-head">
                        <span id="ans-title">交易问题</span>
                        <span id="ans-question">>我拍下来后的商品什么时候发货？</span>
                    </p>
                    <div id="ans-content0" class="ans-content">
                        <p class="ans-p">货比五家商城您拍下 成功后除特殊商品外，商家将在48小时内发货。以下情况除外：</p>
                        <p class="ans-p">1.预售及其他特殊情形商品，商品会在约定发货时间内安排发货，发货时间以商家商品描述页面为准;</p>
                        <p class="ans-p">2.海淘直供类目产品，将在拍下后7天内安排发货;</p>
                        <p class="ans-p">3.抽奖类目产品，系统会在抽奖日自动抽取获奖用户，一等奖用户将会安排发货，二等奖用户系统将会全额退款并赠送代金券，具体活动规则请查看抽奖活动详情页。
                        </p>
                    </div>
                    <div id="ans-content1" class="ans-content">
                        <p class="ans-p">未超过发货时间的订单退款，请联系货比五家平台客服。</p>
                    </div>
                    <div id="ans-content2" class="ans-content">
                        <p class="ans-p">买家可在已发货订单里查看物流单号，并点击查看物流，查看发货信息。物流信息不准确
                            可以联系卖家客服核实并要求处理，若商家拒绝处理，可以要求货比五家客服介入处理。</p>
                    </div>
                    <div id="ans-content3" class="ans-content">
                        <p class="ans-p">买家可以先联系卖家客服，并提供实物图片确认问题是否属实。如果确认商品问题，或无法说明商品是否合格，卖家应与买家协商解决；若因商品问题商家拒绝处理，可以要求货比五家客服介入处理。</p>
                    </div>
                    <div id="ans-content4" class="ans-content">
                        <p class="ans-p">1.在货比五家APP中商品详情里面点击“客服”，可直接联系商家。</p>
                        <p class="ans-p">2.也可在货比五家APP订单详情里面“联系卖家”。</p>
                    </div>
                    <div id="ans-content5" class="ans-content">
                        <p class="ans-p">货比五家商城支持7天无理由退换货，在不影响第二次销售的情况下，可以要求商家无理由退换货。因为商品的特殊性，7天无理由退换货不支持生鲜/虚拟/海淘直供等类目。</p>
                    </div>
                    <div id="ans-content6" class="ans-content">
                        <p class="ans-p">请您务必先通过微信公众号寻找货比五家客服或者直接与商家客服联系，说明退换货原因。</p>
                        <p class="ans-p">1.若商品符合退换货规则条件，客服将会为您提供商家退货地址和退货流程，买家未联系客服自行退货导致商家无法收到产品，商家有权不予处理。</p>
                        <p class="ans-p">2.若商品符合退换货规则条件，卖家不提供退货地址，买家可联系货比五家官方客服介入处理。货比五家不支付退货到付，在您没有和卖家协商好货到付款时，请联系物流公司取回货物，拿回货物后重新退货，运费买家自行承担。</p>
                    </div>
                    <div id="ans-content7" class="ans-content">
                        <p class="ans-p">1.买家须在签收商品之日起7天内（按照物流签收后的第二天零时起计算时间，满168小时为7天）向商家提出退换货。</p>
                        <p class="ans-p">2.买家申请退款金额不得高于已实际付款金额。</p>
                        <p class="ans-p">3.若买家退换原因为7天无理由退货，买家需承担退货运费。</p>
                        <p class="ans-p">4.若产品因质量问题、发错、丢件等形式导致退换货，运费全部由商家承担。</p>
                        <p class="ans-p">5.若因个人原因对水产肉类/新鲜蔬果、熟食等食品进行拒收，商家有理由拒绝对买家进行退款。</p>
                        <p class="ans-p">6.若买家收到产品后超过7天未联系商家或平台客服处理退换货需求，商家有权不予处理。</p>
                        <p class="ans-p">7.若买家自收到商品之日起7天内根据卖家或系统提供的退货地址进行无理由退货，卖家收到所退商品之日起3天内（按照物流签收后的第二天零时起计算时间，满72小时为3天）未有异议但并未退款的，货比五家介入后有权对买家进行退款。</p>
                        <p class="ans-p">8.若买家要求换货，商家须在收到所退产品起3天内（按照物流签收后的第二天零时起计算时间，满72小时为3天）安排换货，逾期未发出换货货比五家有权介入处理。</p>
                        <p class="ans-p">9.关于拒收：若为无理由拒签，运费应由买家承担。有理拒签的情况包括但不仅限于以下几种：a、在卖家未发货前，买家已申请退款表示取消订单，后未经买家同意而卖家强行发货所导致的买家拒签；b、买家验货时发现货物破损，或商品不符，然后拒签。</p>
                    </div>
                    <div id="ans-content8" class="ans-content">
                        <p class="ans-p">七天无理由退换货是指消费者在货比五家购物后，在签收货物后7天内，如因主观原因要求退换货，可以提出“7天无理由退换货”的申请（部分商品及类目除外），并且买家退货的货物不得影响卖家的二次销售。若因个人原因对水产肉类/新鲜蔬果/熟食等食品进行拒收，商家有理由拒绝对买家进行退款。</p>
                        <table class="ans-table">
                            <tr>
                                <td class="ans-table-td1">支持七天无理由退换货类目</td>
                                <td class="ans-table-td2">不支持七天无理由退换货类目</td>
                            </tr>
                            <tr>
                                <td class="ans-table-td3">
                                    <ul class="ans-table-ul">
                                        <li>奶粉/营养品/辅食</li><li>零食/坚果</li>
                                        <li>茶/咖啡/冲饮</li><li>彩妆/美妆</li>
                                        <li>美容护肤/美体/精油</li><li>服饰</li>
                                        <li>个人护理/保健/按摩器材</li>
                                    </ul>
                                </td>
                                <td class="ans-table-td3">
                                    <ul class="ans-table-ul">
                                        <li>电影/赛事/演出</li>
                                        <li>珠宝/钻石/金银首饰</li>
                                        <li>酒类</li>
                                        <li>果蔬/熟食/水产肉类</li>
                                        <li>成人用品/避孕/计生用品</li>
                                        <li>网络店铺代金券/优惠券</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                        <p class="ans-p">若此类商品详情页出现“7天退换”标识，则支持七天无理由退换货。</p>
                    </div>
                    <div id="ans-content9" class="ans-content">
                        <p class="ans-p">一、在线联系货比五家客服</p>
                        <p class="ans-p">&ensp;&ensp;1.微信搜索货比五家(huobiwujia)来关注“货比五家”微信公众号	</p>
                        <p class="ans-p">&ensp;&ensp;2.点击公众号的“客户服务”，选择“联系平台客服”</p>
                        <p class="ans-p">&ensp;&ensp;3.输入您的问题，我们将在第一时间为您解答</p>
                        <p class="ans-p">&ensp;&ensp;4.在线客服时间：9.00-22.00</p>
                        <p class="ans-p">二、电话联系货比五家客服</p>
                        <p class="ans-p">&ensp;&ensp;1.客服电话：020-29061583</p>
                        <p class="ans-p">&ensp;&ensp;2.商家热线：020-29061583</p>
                        <p class="ans-p">&ensp;&ensp;3.客服时间：9.00-20.00</p>
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
//            if (ie==9||ie == 8 || ie == 7 || ie == 6) {
//                alert("您当前ie" + ie + "版本过低，部分网页无法正常显示，建议升级至较新版本（ie9以上）或更换其他较新浏览器");
//            }
            if (ie != 8 && ie != 7) {
                var cxt = $("#ques-head-canvas")[0].getContext("2d");
                cxt.beginPath();
                cxt.moveTo(30, 0);
                cxt.lineTo(30, 14);
                cxt.lineTo(0, 0);
                cxt.fillStyle = '#d23037';
                cxt.fill();
            }

            $("#main-ques").on('click', 'li.ques-li', function (e) {
                var lis = $("#main-ques li.ques-li").removeClass('active');
                $(".ans-content").hide();
                var event = $.event.fix(e);
                var elem = $(event.target).addClass('active');
                var index = lis.index(elem);
                if (index < 6) {
                    $("#ans-title").html("交易问题");
                } else if (index < 9) {
                    $("#ans-title").html("退款&售后");
                } else {
                    $("#ans-title").html("联系我们");
                }
                $("#ans-question").html(elem.html());
                $("#ans-content" + index).show();
            })
        </script>
    </body>
</html>