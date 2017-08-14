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
                <a class="header-nav-a" href="${ctx}/hbwj/enter/login">商家登陆</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/register">商家入驻</a>
                <a class="header-nav-a" href="${ctx}/hbwj/enter/help">帮助中心</a>
            </div>
        </div>
        <div class="main login-main">
            <div class="main-section rule">
                <p class="rule-head-p">货比五家服务条款</p>
                <p class="rule-p">
                    欢迎您与广州终点站网络有限公司（下称“货比五家”）共同签署订立《货比五家服务条款》（以下称“本条款”）并使用货比五家平台（见下述定义条款）服务！
                </p>
                <p class="rule-p">
                    <span class="rule-bold-span">【审慎阅读】</span>本服务条款具有合同效力，<span class="rule-bold-span">请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识，建议您应重点阅读。</span>如对条款有任何疑问，可向货比五家客服咨询。 
                </p>
                <p class="rule-p">
                    <span class="rule-bold-span">【条款内容】本服务条款内容包括条款正文及所有货比五家已经发布的或将来可能发布的各类规则、公告等，所有规则均视为本条款不可分割的一部分，与条款正文具有同等法律效力；规则与本条款正文约定不一致的，以最新发布的内容为准。用户在使用货比五家提供的各项服务时，承诺接受并遵守本条款和相关规则。</span>
                </p>
                <ul class="rule-ul">
                    <li class="rule-li">
                        <p class="rule-title-p">一、定义</p>
                        <ul class="rule-ul">
                            <li class="rule-li rule-content">
                                <p class="rule-p">1.1“货比五家服务条款”是指用户与货比五家订立的旨在约定登录使用本网站、订单交易支付货款、收取商品、退货退款等整个商品/服务交易过程的权利义务的书面合同。</p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">1.2 “货比五家平台”是指包括货比五家网站（域名为 www.huobiwujia.com）、“货比五家”APP等各类客户端。</p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">1.3 “货比五家平台服务”是指货比五家基于互联网包括货比五家网站、APP客户端等在内的各种形态（包括未来技术发展出现的新服务形态）向用户提供的各项服务总称，包括:</p>
                                <p class="rule-2-p">1.3.1 向用户展示卖家在货比五家平台上销售的商品；</p>
                                <p class="rule-2-p">1.3.2 向用户提供通过货比五家平台向卖家下订单、支付货款、查询物流状况、申请退货、调解等服务；</p>
                                <p class="rule-2-p">1.3.3 向用户提供链接并展示淘宝、天猫等平台上的店铺、卖家及其售卖的商品。</p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.4 “货比五家平台规则”是指在所有货比五家平台规则频道等已经发布和后续发布的全部规则、解读、公告等内容。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.5 “用户”是指因生活消费需要在货比五家平台购买、使用商品或者接受服务的货比五家注册会员。但是自然人、法人和其他组织以营利为目的而购买使用货比五家商品或者接受服务的除外。“用户”也称为“买家”。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.6 “同一用户”是指使用相同身份认证信息、相同支付方式、相同IP地址，或经货比五家核查判定多个货比五家会员账户的实际控制人为同一人的，均视为同一用户。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.7 “货比五家账户”是指用户申请注册在货比五家取得的独占编号（编号之间互不相同）。账户所有权归属于货比五家，账户使用权属于用户。货比五家依照发布的规则有权限制、冻结或终止用户的货比五家账户使用。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.8 “商品”是货比五家通过本网站/客户端向用户推荐并进行销售的具体商品/服务的统称。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.9 “订单”是指由货比五家平台结帐程序生成的记录买家通过本网站向卖家所购买的商品/服务的名称、品牌、价款、折扣、物流等交易信息的文件，该文件将被用作与用户购买有关的询问、请求和争议的依据和参考。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    1.10 包括但不限于以下场景可能被货比五家定义为“恶拍行为”：
                                </p>
                                <p class="rule-2-p">
                                    1.10.1 地址不祥，无法发货：用户付款成功订单，收货地址不全或有误，导致商家无法发货，且收货电话无法联系上用户；
                                </p>
                                <p class="rule-2-p">
                                    1.10.2 商家同行恶意竞争：同行商家恶意竞争，批量拍下商品，拍下申请退款，或恶意售后，收货电话无法接通等行为。
                                </p>
                            </li>
                        </ul>
                    </li>
                    <li class="rule-li">
                        <p class="rule-title-p">二、用户注册</p>
                        <ul class="rule-ul">
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.1 用户理解并承诺其具有完全民事行为能力，有资格自主订立本条款；或者虽不具有完全民事权利能力和行为能力，但经其法定代理人同意并由其法定代理人代理注册及应用货比五家服务。如因用户不具备主体资格而导致的一切后果，由用户及用户的监护人自行承担。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.2 用户可通过登录本网站/客户端的注册页面注册用户账号并设置相应的登录密码；货比五家账号（即用户ID）的所有权归货比五家，用户完成注册申请手续后，获得货比五家账号的使用权。
                                </p>
                            </li><li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.3 用户理解并同意，用户有义务保持注册信息的真实性及有效性。在注册后，如发现用户以虚假信息骗取账号名称注册，或其账号头像、简介等注册信息存在违法和不良信息的，货比五家有权不经通知单方采取限期改正、暂停使用、注销登记、收回等措施。
                                </p>
                            </li><li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.4 每个手机号码、每个邮箱、每个支付账号、每个IP地址、每个收货地址等仅对应一个用户账号，包含但不限于以下行为，可能判定为恶意注册：
                                </p>
                                <p class="rule-2-p">
                                    2.4.1 以同一手机号码注册多个账户；
                                </p>
                                <p class="rule-2-p">
                                    2.4.2 多个账户使用同一收货地址；
                                </p>
                                <p class="rule-2-p">
                                    2.4.3 多个账号使用相同支付账号;
                                </p>
                                <p class="rule-2-p">
                                    2.4.4 多个账号使用相同IP地址。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.5 用户应妥善保管其货比五家账户及密码信息，未经货比五家同意，不得向他人转让、出售、处分给他人使用。通过货比五家账户完成的操作、行为或承诺均视为用户本人行为，由用户承担全部责任。由于用户账户关联用户信用信息，仅当有法律明文规定、司法裁定或经货比五家同意，并符合货比五家平台规则规定的用户账户转让流程的情况下，用户可进行账户转让。用户账户一经转让，该账户项下权利义务一并转移。<span class="rule-bold-span">除此之外，用户的账户不得以任何方式转让，否则由此产生的一切责任均由用户自行承担；</span>
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.6 用户理解并同意，货比五家可以通过邮件、短信电话等形式，向在本站注册、购物用户、收货人发送订单、物流信息、促销活动等信息。尽管如此，用户有权通过网站和APP的操作，退订货比五家发送的促销活动信息。为向用户提供购物、发货、售后服务，用户理解并同意，货比五家将向用户搜集姓名、地址、手机号码等个人信息，用户同意其提供的注册资料真实、准确、完整、合法有效，用户个人信息如有变动的，应及时更新个人信息。货比五家有权通过具有相应资质的征信机构、银行卡绑定等方式，对用户提交的身份信息的真实性进行验证。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    2.7 如用户遗忘密码或者密码被他人修改，用户可按照货比五家公布的账号及密码找回规则进行找回；或者在第一时间联系货比五家的客服协助找回，但货比五家不保证一定可以找回。
                                </p>
                            </li>
                        </ul>
                    </li>
                    <li class="rule-li">
                        <p class="rule-title-p">三、用户行为</p>
                        <ul class="rule-ul">
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    用户理解并同意在使用货比五家服务时严格遵守以下义务：
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.1 不得传输或发表煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.2 不得利用本站从事洗钱、窃取商业秘密、窃取个人信息等违法犯罪活动；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.3 不得干扰本站的正常运转，不得侵入本站及国家计算机信息系统；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.4 不得传输或发表任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.5 不得传输或发表损害国家社会公共利益和涉及国家安全的信息资料或言论；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.6 不得发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.7 不得恶意扰乱卷皮交易秩序或恶意敲诈商家；
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    3.8 其他不合货比五家平台规则的行为或言论。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    如用户违反本条或相关服务条款的规定，货比五家有权视用户的行为性质，有权采取包括但不限于中止服务、限制使用、回收货比五家帐号、追究法律责任等措施。
                                </p>
                            </li>
                        </ul>
                    </li>
                    <li class="rule-li">
                        <p class="rule-title-p">四、货比五家的权利和义务</p>
                        <ul class="rule-ul">
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.1 如用户不具备本条款约定的注册资格，则货比五家有权拒绝用户进行注册，对已注册的用户有权注销其货比五家用户账号，货比五家因此而遭受损失的有权向前述用户或其监护人主张赔偿。同时，货比五家保留其他任何情况下决定是否接受用户注册的权利以及保留账号的所有权。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.2 货比五家发现账户使用者并非账户初始注册人时，有权中止该账户的使用。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.3 货比五家通过技术检测、人工抽检等检测方式合理怀疑用户提供的信息错误、不实、失效或不完整时，有权通知用户更正、更新信息或中止、终止为其提供货比五家服务。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.4 货比五家有权在发现货比五家上显示的任何商品信息存在明显错误时，对信息予以更正。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.5 用户付款成功前，货比五家有权视情况决定接受商家委托对订单内容作出变更，如用户接受变更后的内容则用户可确认订单及付款，如用户不接受变更后内容则有权取消订单。用户付款成功后，如确因情况变化导致商家需对订单内容作出变更的，货比五家有权视情况决定接受商家委托单方对订单内容作出变更，如用户接受变更则按变更后的订单内容进行消费，如用户不接受变更则用户有权取消订单并要求全额退款。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.6 货比五家保留修改、中止或终止货比五家服务的权利，货比五家行使前述权利将按照法律规定的程序及方式告知用户。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.7 货比五家应当采取必要的技术手段和管理措施保障货比五家的正常运行，并提供必要、可靠的交易环境和交易服务，维护交易秩序。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.8 货比五家有权在本条款履行期间及本协议终止后保留用户的注册信息、身份信息及用户应用货比五家服务期间的全部交易或与交易相关的信息，但不得非法使用该等信息。同时，货比五家对上述信息依法承担保密义务。如因货比五家故意导致信息泄露而造成用户损失的，货比五家应承担与其过错相应的责任。    
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.9 货比五家有权单独对商家、商品（服务）的准入和监督制定、修改、完善规则和协议，以提高更优的服务。
                                </p>
                            </li>
                            <li class="rule-li rule-content">
                                <p class="rule-p">
                                    4.10 货比五家依据营销促销或运营需要，可能向用户发放优惠劵或积分，具体用劵规则、积分规则以实际营销活动或运营为准。
                                </p>
                            </li>

                            <li class="rule-li">
                                <p class="rule-title-p">五、订单</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            5.1 在用户下订单时，请用户仔细确认所购商品的名称、价格、数量、型号、规格、尺寸、联系地址、电话、收货人等信息。收货人与用户本人不一致的，收货人的行为和意思表示视为用户的行为和意思表示，用户应对收货人的行为及意思表示的法律后果承担连带责任。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">5.2 除法律另有强制性规定外，双方约定如下：本站上销售方展示的商品和价格等信息仅仅是交易信息的发布，用户下单时须填写用户希望购买的商品数量、价款及支付方式、收货人、联系方式、收货地址等内容；系统生成的订单信息是计算机信息系统根据用户填写的内容自动生成的数据，仅是用户向销售方发出的要约邀请；销售方收到用户的订单信息后，只有在销售方将用户在订单中订购的商品从仓库实际直接向用户发出时（ 以商品出库为标志），方视为用户与销售方之间就实际出库的商品建立了订单；如果用户在一份订单里订购了多种商品并且销售方只给用户发出了部分商品时，用户与销售方之间仅就实际直接向用户发出的商品建立了交易关系；只有在销售方实际直接向用户发出了订单中订购的其他商品时，用户和销售方之间就订单中其他已实际直接向用户发出的商品才成立交易关系。</span>
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">5.3 由于市场变化及各种合理商业努力难以控制因素的影响，货比五家无法保证用户提交的订单信息中希望购买的商品都会有货；如用户拟购买的商品，发生缺货，销售方申请取消订单的，货比五家有权评估是否取消订单或卖家存在虚假促销的行为。如卖家存在虚假促销的行为，货比五家有权要求销售方予以赔偿。</span>
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">5.4 用户自身恶拍行为导致货比五家介入处理的，用户理解并确认接受货比五家的处理方案。
                                                如因地址不祥，订单处于未发货状态，货比五家或商家无法联系上用户的，货比五家有权以订单异常进行关单；如商家已发货，按售后标准流程处理。 如经确认为商家同行恶拍，货比五家有权通知商家选择不发货并采取相关措施。</span>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">六、交易争议处理</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            用户在货比五家平台交易过程中与商家发生争议的，任何一方均有权选择以下途径解决：
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            1.与争议相对方自主协商；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            2.使用货比五家平台提供的争议调处服务；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">如用户选择使用货比五家平台的争议调处服务，则表示用户认可货比五家平台的客服作为独立的第三方根据其所了解到的争议事实并依据货比五家平台规则所作出的调处决定（包括调整相关订单的交易状态、判定将争议款项的全部或部分支付给交易一方或双方等）。
                                                如用户对调处决定不满意，用户仍有权采取其他争议处理途径解决争议，但通过其他争议处理途径未取得终局决定前，用户仍应先履行调处决定。</span>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">七、知识产权</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            7.1 货比五家对本网站的内容享有全部知识产权或合法授权，包括但不限于编码、商标、服务标志、商号、图形、美术品、照片、肖像、文字内容、音频片断、按钮图标已及计算机软件、标识、数码下载、数据汇编都是货比五家或其内容提供者的财产，受到中华人民共和国相关法律法规的保护 
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            7.2 用户仅在符合本网站使用目的的前提下被许可浏览和使用本网站，即以个人名义浏览信息和购买供个人使用商品的目的。其他方式的使用都是被严格禁止的，包括但不限于复制、修改、销售、传送、再版、删除、添加、展览、记入或演示本网站的内容或以其他方式部分地或整体地非法使用本网站的内容，但经货比五家允许将本网站当中的资讯转发至微信朋友圈等第三方媒体的除外。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            7.3 用户不得进行任何侵犯货比五家知识产权的行为，或者进行其他的有损于货比五家或其他用户合法权益的行为，包括但不限于：
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.1 删除或修改本网站上的版权信息；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.2 修改、复制和/或发行本网站；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.3 在本网站当中内置各种插件程序或者其他的第三方程序；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.4 进行编译、反编译、反向工程或者以其他方式破解本网站的行为；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.5 使用本网站外挂和/或利用本网站当中的BUG来获得不正当的利益；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.6 利用劫持域名服务器等技术非法侵入、破坏本网站的服务器软件系统，或者修改、增加、删除、窃取、截留、替换本网站的客户端和/或服务器软件系统中的数据，或者非法挤占本网站的服务器空间，或者实施其他的使之超负荷运行的行为；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            7.3.7 利用本网站故意传播恶意程序或计算机病毒。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            7.4 用户充分理解并同意，货比五家可能会不定期地通过发布软件升级包或软件补丁、在线升级等方式对本网站/客户端进行更新。更新的过程中，货比五家可能通过互联网调取、收集用户在终端上的关于本网站的客户端软件版本信息、数据及其他有关资料，并自动进行替换、修改、删除和/或补充。此种行为是网站更新所必须的一种操作或步骤，用户如果不同意货比五家进行此种操作，请用户不要进行更新；用户更新的行为即视为用户同意货比五家进行此种操作。
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">八、条款更新</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            根据国家法律法规变化及网站运营需要，货比五家有权对本条款不时地进行修改，修改后的条款一旦被公布在本站上即行生效，并取代原来的条款版本。用户可随时登录查阅最新条款；用户有义务不时关注并阅读最新版的条款及网站公告。如用户不同意更新后的条款，应立即停止接受货比五家网站依据本条款提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的条款。货比五家建议您在使用本站之前阅读本条款及本站的公告。
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">九、通知</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            用户同意货比五家以下合理的方式向用户送达各类通知：
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            1.公示的文案；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            2.站内信、弹出消息、客户端推送的消息；
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-2-p">
                                            3.根据用户预留于货比五家平台的联系方式发出的电子邮件、短信、函件等。
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">十、特别声明</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            10.1 货比五家对由于信息网络设备维护、信息网络连接故障、电脑、通讯或其他系统的故障、电力故障等造成用户利益损害的，依法承担相应责任。因地震、战争等不可抗力造成用户利益损害的，依法承担相应责任或免除责任。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            10.2 除货比五家另有规定外，如发现有用户通过不正当手段（包括但不限于侵犯第三人合法权益、作弊、扰乱系统、实施网络攻击、恶意套现、刷信誉、批量注册、用机器注册货比五家账户、用机器模拟客户端）参加活动而有碍其他用户公平参加本次活动或有违反活动目的之行为，货比五家有权取消其获奖资格或其因参加活动所获赠品或权益。如该作弊行为给活动举办方造成损失的，货比五家有权采取封号、追偿等措施。
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">十一、法律适用和管辖</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">11.1 本条款之订立、生效、解释、修订、补充、终止、执行与争议解决均适用中华人民共和国(不含港澳台）法律；如法律无相关规定的，参照商业惯例及/或行业惯例。</span>
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">11.2 用户因使用货比五家平台服务所产生有关争议，应当优先协商解决。三十日内协商不成的，任何一方均可向有管辖权的中华人民共和国大陆地区的法院提起诉讼。</span>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p">十二、其他约定</p>
                                <ul class="rule-ul">
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            12.1 货比五家有可能以公告、温馨提示等形式，向用户说明用户在使用货比五家购买商品/服务时应当履行的本条款所约定的义务之外的其他义务，用户亦应当仔细阅读并全面履行。上述公告、提示如果与本条款相互冲突或者矛盾的，以上述公告、提示为准；上述公共、提示未涉及的内容，仍适用本条款。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            <span class="rule-bold-span">12.2 货比五家将本条款内置于本网站的注册环节，用户在注册的过程中即可查阅、了解本条款，并通过勾选“我已阅读并接受《货比五家服务条款》”表示用户完全同意并接受本条款之约束，或者通过取消勾选“我已阅读并接受《货比五家服务条款》”表示用户不同意本条款。</span>
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            12.3 本条款内容中以黑体、加粗、下划线、斜体等方式显著标识的条款，请用户着重阅读。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            12.4 本条款各条款是可分的，所约定的任何条款如果部分或者全部无效，不影响该条款其他部分条款的法律效力。
                                        </p>
                                    </li>
                                    <li class="rule-li rule-content">
                                        <p class="rule-p">
                                            12.5 本条款以上内容解释权在法律规定的范围内归本公司所有。
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li class="rule-li">
                                <p class="rule-title-p"><span class="rule-bold-span">更新版本:2017年08月04日，版本V1.0</span></p>
                            </li>
                        </ul>
                        </div>
                        </div>
                        <div class="footer">
                            <p>Copyright&ensp;&copy;&ensp;2017&ensp;huobiwujia.com&ensp;&ensp;All rights reserved.</p>
                            <p>粤ICP备15106664号&ensp;&ensp;广州市越秀区环市西路202号&ensp;&ensp;邮编:510010</p>
                        </div>
                        <script type="text/javascript" src="jquery-1.8.3.min.js"></script>
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

                        </script>
                        </body>
                        </html>