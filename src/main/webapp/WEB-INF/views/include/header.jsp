<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page session="false" %>--%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>UNIFY | Shopping Mall </title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Create a project that can support your company">
    <meta name="author" content="EmiyaMulzomdao">

    <!-- <meta>태그
    - 해당 페이지에 대한 정보를 포함
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    - meta : 이 페이지에 관한 무엇인가를 브라우저에 말해준다
    - http-equiv : <meta>태그의 속성
    - "Content-Type" : 페이지의 컨텐츠 타입을 말해주려고 한다
    - content="text/html; : 이것이 html 파일이라고 알려줌
    - charset=ISO-8859-1 : 문자 인코딩으로 ISO-8859-1 방식 사용한다고 알려줌
    - text/html; charset=ISO-8859-1 : 해당 문자열이 컨텐츠 속성의 값이 된다
    - 위치 : <head>, 항상 다른 엘리먼트 보다 위에 위치

    <meta>태그 : 한글 사용(한글 깨짐 방지)
    html5
    <meta charset="utf-8">
    xhtml
    <meta http-equiv="Content-Type" content="text/html; charset="utf-8" />

    <meta>태그 : 검색
    - 검색 엔진이 파악할 수 있는 페이지에 대한 키워드, 제작자 등의 정보 포함
    순위 상승
    <meta name="description" content="This would be your description of what is on your page. Your most important keyword phrases should appear in this description." />
    <meta name-"keywords" content"keyword pharase 1, key word parase 2, keyword pharase 3, etc." />
    순위 제거
    <meta name="robots" content="noindex, nofollow" />
    - 이 페이지와 동일한 사이트에 있는 다른 페이지들까지도 무시하라

    <meta>태그 : 기타
    author
    <meta http-equiv="author" content="winner">
    - 웹 페이지 저자
    pragma
    <meta http-equiv="pragma" content="winner">
    - 브라우저의 페이지 캐시를 막고 서버에서 항상 새로운 페이지를 가져옴)
    expires
    <meta http-equiv="expires" content="Mon, 27 Apr 2015 14:52:52">
    - 페이지 만료일
    description
    <meta name="description" content="위너의 성장 배경">
    - 페이지의 설명 포함
    keywords
    <meta name="keywords" content="위너,배경">
    - 사용자가 페이지를 찾기 위해 검색할 수 있는 쉼표로 구분된 단어 목록 포함
    robots
    <meta name="robots" content="noindex">
    - 검색엔진이 해당 페이지를 검색결과에 추가할지의 여부를 지정
    - noindex : 해당 페이지를 검색결과에 추가하지 않음
    - nofollow : 해당 페이지를 검색결과에 추가함(링크된 페이지는 추가하지 않음)
    http://blog.naver.com/minhye9/220342895204
    -->

    <!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value="/WEB-INF/views/favicon.ico"/>">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css'
          href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,800&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">--%>
    <!--
    FreeBoard 연습 중에 텍스트는 보이는데 부트스트랩이 걸리지 않았다.
    @RequestMapping("/board/") 가 있어서 모든 경로에 /board/... 가 붙어서 경로를 못 찾는듯 했다.
    그래서 assets/(상대경로)...가 아닌 /asssets/(절대경로)...를 쓰니 된다.
    -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/shop.style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/assets/css/headers/header-v5.css">
    <link rel="stylesheet" href="/assets/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/animate.css">
    <link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/plugins/noUiSlider/jquery.nouislider.min.css">
    <link rel="stylesheet" href="/assets/plugins/jquery-steps/css/custom-jquery.steps.css">
    <link rel="stylesheet" href="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="/assets/plugins/revolution-slider/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="/assets/plugins/master-slider/masterslider/style/masterslider.css">
    <link rel='stylesheet' href="/assets/plugins/master-slider/masterslider/skins/default/style.css">

    <%-- jQuery 테스트 --%>


    <!-- CSS Page Style -->
    <link rel="stylesheet" href="/assets/css/pages/log-reg-v3.css">

    <!-- Style Switcher -->
    <link rel="stylesheet" href="/assets/css/plugins/style-switcher.css">

    <!-- CSS Theme -->
    <link rel="stylesheet" href="/assets/css/theme-colors/default.css" id="style_color">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/assets/css/custom.css">

    <%--<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>--%>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<%--<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>--%>
<%--일일이 자바스크립트에 선언하지 않아도 된다. 헤드와 바디 사이에 미리 자바스크립트 선언을 해놓으며.--%>
<%--풋터 끝까지 적용됨! ^^--%>

<body class="header-fixed">

<div class="wrapper">


    <!--=== Header v5 ===-->
    <div class="header-v5 header-static">
        <!-- Topbar v3 -->
        <div class="topbar-v3">
            <div class="search-open">
                <div class="container">
                    <input type="text" class="form-control" placeholder="Search">
                    <div class="search-close"><i class="icon-close"></i></div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Topbar Navigation -->
                        <ul class="left-topbar">
                            <li>
                                <a>Currency (KRW)</a>
                                <ul class="currency">
                                    <li class="active">
                                        <a href="#">KRW <i class="fa fa-check"></i></a>
                                    </li>
                                    <li><a href="#">JPY</a></li>
                                    <li><a href="#">CNY</a></li>
                                    <li><a href="#">Dollar</a></li>
                                    <li><a href="#">Euro</a></li>
                                    <li><a href="#">Pound</a></li>
                                </ul>
                            </li>
                            <li>
                                <a>Language (KOR)</a>
                                <ul class="language">
                                    <li class="active">
                                        <a href="#">Korean (KOR)<i class="fa fa-check"></i></a>
                                    </li>
                                    <li><a href="#">Japanese (JPN)</a></li>
                                    <li><a href="#">Chinese (CHN)</a></li>
                                    <li><a href="#">English (EN)</a></li>
                                    <li><a href="#">Spanish (SPN)</a></li>
                                    <li><a href="#">Russian (RUS)</a></li>
                                    <li><a href="#">German (GRM)</a></li>
                                </ul>
                            </li>
                        </ul><!--/end left-topbar-->
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-inline right-topbar pull-right">
                            <li><a href="#">Account</a></li>
                            <li><a href="#">Wishlist (0)</a></li>
                            <c:if test="${empty login}">
                                <li><a href="<c:url value="/user/login"/>">Login</a> | <a
                                        href="<c:url value="/user/shop-ui-register"/>">Register</a>
                                </li>
                            </c:if>
                            <c:if test="${not empty login}">
                                <li>${login.nickname}님! | <a href="<c:url value="/user/shop-ui-modify"/>">Modify</a> | <a
                                        href="<c:url value="/user/logout"/>">Logout</a>
                                </li>
                            </c:if>
                            <li><i class="search fa fa-search search-button"></i></li>
                        </ul>
                    </div>
                </div>
            </div><!--/container-->
        </div>
        <!-- End Topbar v3 -->

        <!-- Navbar -->
        <div class="navbar navbar-default mega-menu" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value="/"/>">
                        <img id="logo-header" src="/assets/img/logo.png" alt="Logo">
                    </a>
                </div>

                <!-- Shopping Cart -->
                <div class="shop-badge badge-icons pull-right">
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    <span class="badge badge-sea rounded-x">0</span>
                    <div class="badge-open">
                        <ul class="list-unstyled mCustomScrollbar" data-mcs-theme="minimal-dark">
                            <li>
                                <img src="/assets/img/thumb/05.jpg" alt="">
                                <button type="button" class="close">×</button>
                                <div class="overflow-h">
                                    <span>Black Watch</span>
                                    <small>1 x 40,000</small>
                                </div>
                            </li>
                            <li>
                                <img src="/assets/img/thumb/02.jpg" alt="">
                                <button type="button" class="close">×</button>
                                <div class="overflow-h">
                                    <span>Black Glasses</span>
                                    <small>1 x 57,000</small>
                                </div>
                            </li>
                            <li>
                                <img src="/assets/img/thumb/03.jpg" alt="">
                                <button type="button" class="close">×</button>
                                <div class="overflow-h">
                                    <span>Brown Belts</span>
                                    <small>1 x 32,000</small>
                                </div>
                            </li>
                        </ul>
                        <div class="subtotal">
                            <div class="overflow-h margin-bottom-10">
                                <span>Subtotal</span>
                                <span class="pull-right subtotal-cost">129,000</span>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="shop-ui-inner.html"
                                       class="btn-u btn-brd btn-brd-hover btn-u-sea-shop btn-block">View Cart</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="shop-ui-add-to-cart.html"
                                       class="btn-u btn-u-sea-shop btn-block">Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Shopping Cart -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <!-- Nav Menu -->
                    <ul class="nav navbar-nav">
                        <!-- Pages -->
                        <li class="dropdown active">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                대통령
                            </a>
                            <ul id="cateNum" class="dropdown-menu">
                                <li class="active" value="1101"><a href="/sboard/list?cate=1101">개요</a></li>
                                <li value="1102"><a href="/sboard/list?cate=1102">생애</a></li>
                                <li value="1103"><a href="/sboard/list?cate=1103">약력</a></li>
                                <li><a href="/sboard/list?cate=1104">가족관계</a></li>
                                <li><a href="/sboard/list?cate=1105">인간관계</a></li>
                                <li><a href="/sboard/list?cate=1106">반려 동물</a></li>
                                <li><a href="/sboard/list?cate=1107">성격</a></li>
                                <li><a href="/sboard/list?cate=1108">인기</a></li>
                                <li><a href="/sboard/list?cate=1109">별명</a></li>
                                <li><a href="/sboard/list?cate=1110">저서</a></li>
                                <li><a href="/sboard/list?cate=1111">선거 이력</a></li>
                                <li><a href="/sboard/list?cate=1112">각종 타이틀</a></li>
                                <li><a href="/sboard/list?cate=1113">비판과 논란</a></li>
                                <li><a href="/sboard/list?cate=1114">재산</a></li>
                                <li><a href="/sboard/list?cate=1115">기타</a></li>
                            </ul>
                        </li>
                        <!-- End Pages -->

                        <!-- Promotion -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                공약
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">당선 전</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">당선 전 공약</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">당선 후</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">공약 이행</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- End Promotion -->

                        <!-- Gifts -->
                        <li class="dropdown mega-menu-fullwidth">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                이슈
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-12 col-xs-12 md-margin-bottom-30">
                                                    <h3 class="mega-menu-heading">대국민 이벤트</h3>
                                                    <p>언제나 저희 UNIFY를 이용해 주심에 따라 국민의 성원에 보답하고자 365일 항상 국민의 목소리에 귀기울이고 있습니다.</p>
                                                    <button type="button" class="btn-u btn-u-dark">Read More</button>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4 md-margin-bottom-30">
                                                    <a href="#"><img class="product-offers img-responsive"
                                                                     src="/assets/img/blog/01.jpg" alt=""></a>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4 sm-margin-bottom-30">
                                                    <a href="#"><img class="product-offers img-responsive"
                                                                     src="/assets/img/blog/02.jpg" alt=""></a>
                                                </div>
                                                <div class="col-md-3 col-sm-4 col-xs-4">
                                                    <a href="#"><img class="product-offers img-responsive"
                                                                     src="/assets/img/blog/03.jpg" alt=""></a>
                                                </div>
                                            </div><!--/end row-->
                                        </div><!--/end container-->
                                    </div><!--/end mega menu content-->
                                </li>
                            </ul><!--/end dropdown-menu-->
                        </li>
                        <!-- End Gifts -->

                        <!-- Books -->
                        <li class="dropdown mega-menu-fullwidth">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                국가행정조직
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">대통령i</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">대통령비서실</a></li>
                                                        <li><a href="#">대통령경호실</a></li>
                                                        <li><a href="#">국가안보실</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국가인권위원회</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">국가인권위원회</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">대통령ii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">감사원</a></li>
                                                        <li><a href="#">국가정보원</a></li>
                                                        <li><a href="#">방송통신위원회</a></li>

                                                    </ul>
                                                    <h3 class="mega-menu-heading">대통령iii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">국가안전보장회의</a></li>
                                                        <li><a href="#">민주평화통일자문회의</a></li>
                                                        <li><a href="#">국민경제자문회의</a></li>
                                                        <li><a href="#">국가과학기술자문회의</a></li>
                                                        <li><a href="#">특별감찰관</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국무총리i</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">국무조정실</a></li>
                                                        <li><a href="#">국무총리비서실</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">국무총리ii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">기획재정부</a></li>
                                                        <li><a href="#">교육부</a></li>
                                                        <li><a href="#">미래창조과학부</a></li>
                                                        <li><a href="#">외교부</a></li>
                                                        <li><a href="#">통일부</a></li>
                                                        <li><a href="#">법무부</a></li>
                                                        <li><a href="#">국방부</a></li>
                                                        <li><a href="#">행정자치부</a></li>
                                                        <li><a href="#">문화체육관광부</a></li>
                                                        <li><a href="#">농림축산식품부</a></li>
                                                        <li><a href="#">산업통상자원부</a></li>
                                                        <li><a href="#">보건복지부</a></li>
                                                        <li><a href="#">환경부</a></li>
                                                        <li><a href="#">고용노동부</a></li>
                                                        <li><a href="#">여성가족부</a></li>
                                                        <li><a href="#">국토교통부</a></li>
                                                        <li><a href="#">해양수산부</a></li>
                                                    </ul>
                                                </div>


                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">국무총리iii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">국민안전처</a></li>
                                                        <li><a href="#">인사혁신처</a></li>
                                                        <li><a href="#">법제처</a></li>
                                                        <li><a href="#">국가보훈처</a></li>
                                                        <li><a href="#">식품의약품안전처</a></li>
                                                        <li><a href="#">공정거래위원회</a></li>
                                                        <li><a href="#">금융위원회</a></li>
                                                        <li><a href="#">국민권익위원회</a></li>
                                                        <li><a href="#">원자력안전위원회</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">기획재정부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">국세청</a></li>
                                                        <li><a href="#">관세청</a></li>
                                                        <li><a href="#">조달청</a></li>
                                                        <li><a href="#">통계청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">법무부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">검찰청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국방부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">병무청</a></li>
                                                        <li><a href="#">방위사업청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">행정자치부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">경찰청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">문화체육관광부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">문화재청</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">농림축산식품부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">농촌진흥청</a></li>
                                                        <li><a href="#">산림청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">산업통상자원부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">중소기업청</a></li>
                                                        <li><a href="#">특허청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">환경부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">기상청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국토교통부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">행정중심복합도시건설청</a></li>
                                                        <li><a href="#">새만금개발청</a></li>
                                                    </ul>
                                                </div>
                                            </div><!--/end row-->
                                        </div><!--/end container-->
                                    </div><!--/end mega menu content-->
                                </li>
                            </ul><!--/end dropdown-menu-->
                        </li>
                        <!-- End Books -->

                        <!-- Clothes -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown" data-delay="1000">
                                사람
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">청와대</a></li>
                                <li><a href="#">국회</a></li>
                            </ul>
                        </li>
                        <!-- End Clothes -->

                        <!-- Main Demo -->
                        <li><a href="<c:url value="/sboard/list"/>">건의사항</a></li>
                        <!-- Main Demo -->
                    </ul>
                    <!-- End Nav Menu -->
                </div>
            </div>
        </div>
        <!-- End Navbar -->
    </div>
    <!--=== End Header v5 ===-->



