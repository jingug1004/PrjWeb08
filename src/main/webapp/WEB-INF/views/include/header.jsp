<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--[출처] Spring - <spring:message> 태그 사용 2|작성자 hong699822--%>
<%--<%@ page session="false" %>--%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>UNIFY | 평등. 공정. 정의. </title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="문재인 커뮤니티">
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
    <link rel="shortcut icon" href="/favicon.ico">

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
    <%--<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">--%>
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
    <%--<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
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

    <%-- 데이트픽커 --%>
    <%--<link href="/resources/bootstrap-datepicker/css/bootstrap-material-datetimepicker.css">--%>
    <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>
    <%--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">--%>
    <%--<link href="/resources/datepicker/css/material-datetime-picker.css" rel="stylesheet" type="text/css"/>--%>

    <%----------------------------------------------------------%>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%--<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>--%>
    <%--일일이 자바스크립트에 선언하지 않아도 된다. 헤드와 바디 사이에 미리 자바스크립트 선언을 해놓으며.--%>
    <%--풋터 끝까지 적용됨! ^^--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%-- CKEditor 스크립트 선언 --%>
    <script src="/resources/ckeditor/ckeditor.js"></script>

    <%-- jQuery 포매팅 선언 --%>
    <%--<script src="/resources/js/num/jquery-1.11.3.min.js"></script>--%>
    <script src="/resources/js/num/jquery.number.min.js"></script>

    <%-- 데이트픽커 --%>
    <%--<script src="/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>--%>
    <%--<script src="/resources/bootstrap-datepicker/js/bootstrap-material-datetimepicker.js"></script>--%>
    <%--<script src="/resources/datepicker/js/material-datetime-picker.js"></script>--%>

</head>

<style type="text/css">

    <%-- 게시판 글 또는 리스트 간격 조정 --%>
    .content {
        /*position: absolute;*/
        width: 1170px;
    }


</style>

<%--<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>--%>

<body class="header-fixed">

<div class="wrapper">
    <!--=== Header v5 ===-->
    <div class="header-v5 header-static">
        <!-- Topbar v3 -->
        <div class="topbar-v3">
            <div class="search-open">
                <div class="container">
                    <%--
                    <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"
                           class="form-control" placeholder="Search">
                    <div class="search-close"><i class="icon-close"></i></div>
                    --%>
                    <form id="searchForm" method="get" action="/sboard/listAny">
                        <input type="text" name="keyword" id="keywordInput" value="${criteria.keyword}"
                               class="form-control" placeholder="Search (2글자 이상 입력 후 Enter!)"
                               onclick="validate(this, 2, 100, event)"
                               <%--onblur="validate(this, 2, 100)"--%>
                        <%-- onkeydown="listAnySubmit()"--%>
                        <%--onkeypress="javascript:codeCheck(event)"--%>>
                        <%--<input type="hidden" id="searchBtn" value="검색">--%>
                    </form>
                    <div class="search-close"><i class="icon-close"></i></div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Topbar Navigation -->
                        <ul class="left-topbar">
                            <li>
                                <a>OFFICIAL</a>
                                <ul class="currency">
                                    <li class="active">
                                        <a href="http://www.president.go.kr/" target="_blank">청와대 사이트<i class="fa fa-check"></i></a>
                                    </li>
                                    <li><a href="https://twitter.com/TheBlueHouseKR" target="_blank">청와대 트위터</a></li>
                                    <li><a href="https://www.facebook.com/TheBlueHouseKR/" target="_blank">청와대 페이스북</a></li>
                                    <li><a href="https://www.instagram.com/thebluehouse_kr/" target="_blank">청와대 인스타그램</a></li>
                                    <li><a href="https://www.youtube.com/channel/UC7WMB_czX5jF__5kqT4d9Ww" target="_blank">청와대 유투브</a></li>
                                    <li><a href="https://blog.naver.com/moonjaein2" target="_blank">문재인 네이버 블로그</a></li>
                                    <li><a href="https://twitter.com/moonriver365" target="_blank">문재인 트위터</a></li>
                                    <li><a href="https://www.facebook.com/moonbyun1" target="_blank">문재인 페이스북</a></li>
                                    <li><a href="https://www.youtube.com/user/moonriver365" target="_blank">문재인 유투브</a></li>
                                    <li><a href="https://www.instagram.com/moonjaein/" target="_blank">문재인 인스타그램</a></li>
                                    <li><a href="https://www.instagram.com/moonjaein/" target="_blank">문재인 인스타그램</a></li>
                                    <li><a href="http://moonjaein.com/" target="_blank">문재인닷컴</a></li>
                                </ul>
                            </li>
                            <li>
                                <a>UNOFFICIAL</a>
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
                            <li><a>${todayTime}</a></li>
                            <li><a>${clientIP}</a></li>
                        </ul><!--/end left-topbar-->
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-inline right-topbar pull-right">
                            <%--<li>${todayTime}</li>--%>
                            <%--<li>${clientIP}</li>--%>
                            <%--<li><a href="#">Account</a></li>--%>
                            <%--<li><a href="#">Wishlist (0)</a></li>--%>
                            <c:if test="${empty login}">
                                <%--<li>${todayTime}</li>--%>
                                <%--<li>${clientIP}</li>--%>
                                <li><a href="#">Account</a></li>
                                <li><a href="#">Readlist (0)</a></li>
                                <li><a href="<c:url value="/user/login"/>">Login</a> | <a
                                        href="<c:url value="/user/shop-ui-register"/>">Register</a>
                                </li>
                            </c:if>
                            <c:if test="${not empty login}">
                                <%--<li>${todayTime}</li>--%>
                                <%--<li>${login.updip}</li>--%>
                                <li><a href="#">Account</a></li>
                                <li><a href="#">Readlist (0)</a></li>
                                <li>
                                    <input type="hidden" id="loginUday" value="${login.uday}">
                                    <img src="/assets/img/colors/${login.uday}.png" id="getColor"
                                         alt=""> ${login.nickname}님! |
                                        <%--<a href="<c:url value="/user/shop-ui-modify"/>">Modify</a> |--%>
                                    <a data-toggle="modal" data-target="#userModifyModal">Modify</a> |
                                    <a href="<c:url value="/user/logout"/>">Logout</a>
                                </li>
                            </c:if>
                            <li><i id="searchBtnAny" class="search fa fa-search search-button"></i></li>
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

                        <!-- Promotion -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                대통령
                            </a>

                            <ul class="dropdown-menu">

                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">프로필</a>
                                    <ul class="dropdown-menu">
                                        <%--<ul id="cateNum" class="dropdown-menu">--%>
                                        <li class="active" value="1101"><a href="/sboard/list?cate=1101"
                                                                           title="<spring:message code="프로필.개요" />">개요</a>
                                        </li>
                                        <li value="1102"><a href="/sboard/list?cate=1102"
                                                            title="<spring:message code="프로필.생애" />">생애</a></li>
                                        <li value="1103"><a href="/sboard/list?cate=1103"
                                                            title="<spring:message code="프로필.약력" />">약력</a></li>
                                        <li><a href="/sboard/list?cate=1104" title="<spring:message code="프로필.가족관계" />">가족관계</a>
                                        </li>
                                        <li><a href="/sboard/list?cate=1105" title="<spring:message code="프로필.인간관계" />">인간관계</a>
                                        </li>
                                        <li><a href="/sboard/list?cate=1106" title="<spring:message code="프로필.반려동물" />">반려
                                            동물</a></li>
                                        <li><a href="/sboard/list?cate=1107"
                                               title="<spring:message code="프로필.성격" />">성격</a></li>
                                        <li><a href="/sboard/list?cate=1108"
                                               title="<spring:message code="프로필.인기" />">인기</a></li>
                                        <li><a href="/sboard/list?cate=1109"
                                               title="<spring:message code="프로필.별명" />">별명</a></li>
                                        <li><a href="/sboard/list?cate=1110"
                                               title="<spring:message code="프로필.저서" />">저서</a></li>
                                        <li><a href="/sboard/list?cate=1111" title="<spring:message code="프로필.선거이력" />">선거
                                            이력</a></li>
                                        <li><a href="/sboard/list?cate=1112"
                                               title="<spring:message code="프로필.각종타이틀" />">각종 타이틀</a></li>
                                        <li><a href="/sboard/list?cate=1113"
                                               title="<spring:message code="프로필.비판과논란" />">비판과 논란</a></li>
                                        <li><a href="/sboard/list?cate=1114"
                                               title="<spring:message code="프로필.재산" />">재산</a></li>
                                        <li><a href="/sboard/list?cate=1115"
                                               title="<spring:message code="프로필.기타" />">기타</a></li>
                                        <%--</ul>--%>
                                    </ul>
                                </li>

                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">당선 전</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/sboard/list?cate=1201"
                                               title="<spring:message code="당선전.당선전공약" />">당선 전 공약</a></li>
                                        <li><a href="/sboard/list?cate=1202" title="<spring:message code="당선전.공약이행" />">공약
                                            이행</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">당선 후</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/sboard/list?cate=1251"
                                               title="<spring:message code="당선후.당선후공약" />">당선 후 공약</a></li>
                                        <li><a href="/sboard/list?cate=1252" title="<spring:message code="당선후.공약이행" />">공약
                                            이행</a></li>
                                    </ul>
                                </li>

                                <%--<li class="dropdown-submenu">--%>
                                <%--<a href="javascript:void(0);">당선 후</a>--%>
                                <%--<ul class="dropdown-menu">--%>
                                <%----%>
                                <%--</ul>--%>
                                <%--</li>--%>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">사람</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/sboard/list?cate=1501" title="<spring:message code="사람.청와대" />">청와대</a>
                                        </li>
                                        <li><a href="/sboard/list?cate=1502"
                                               title="<spring:message code="사람.국회" />">국회</a></li>
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
                                                    <p>언제나 저희 UNIFY를 이용해 주심에 따라 국민의 성원에 보답하고자 365일 항상 국민의 목소리에 귀기울이고
                                                        있습니다.</p>
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
                                                        <li><a href="/sboard/list?cate=1401"
                                                               title="<spring:message code="대통령i.대통령비서실" />">대통령비서실</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1402"
                                                               title="<spring:message code="대통령i.대통령경호처" />">대통령경호처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1403"
                                                               title="<spring:message code="대통령i.국가안보실" />">국가안보실</a>
                                                        </li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국가인권위원회</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1404"
                                                               title="<spring:message code="국가인권위원회.국가인권위원회" />">국가인권위원회</a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">대통령ii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1405"
                                                               title="<spring:message code="대통령ii.감사원" />">감사원</a></li>
                                                        <li><a href="/sboard/list?cate=1406"
                                                               title="<spring:message code="대통령ii.국가정보원" />">국가정보원</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1407"
                                                               title="<spring:message code="대통령ii.방송통신위원회" />">방송통신위원회</a>
                                                        </li>

                                                    </ul>
                                                    <h3 class="mega-menu-heading">대통령iii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1408"
                                                               title="<spring:message code="대통령iii.국가안전보장회의" />">국가안전보장회의</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1409"
                                                               title="<spring:message code="대통령iii.민주평화통일자문회의" />">민주평화통일자문회의</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1410"
                                                               title="<spring:message code="대통령iii.국민경제자문회의" />">국민경제자문회의</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1411"
                                                               title="<spring:message code="대통령iii.국가과학기술자문회의" />">국가과학기술자문회의</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1412"
                                                               title="<spring:message code="대통령iii.특별감찰관" />">특별감찰관</a>
                                                        </li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국무총리i</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1413"
                                                               title="<spring:message code="국무총리i.국무조정실" />">국무조정실</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1414"
                                                               title="<spring:message code="국무총리i.국무총리비서실" />">국무총리비서실</a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">국무총리ii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1415"
                                                               title="<spring:message code="국무총리ii.기획재정부" />">기획재정부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1416"
                                                               title="<spring:message code="국무총리ii.교육부" />">교육부</a></li>
                                                        <li><a href="/sboard/list?cate=1417"
                                                               title="<spring:message code="국무총리ii.미래창조과학부" />">미래창조과학부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1418"
                                                               title="<spring:message code="국무총리ii.외교부" />">외교부</a></li>
                                                        <li><a href="/sboard/list?cate=1419"
                                                               title="<spring:message code="국무총리ii.통일부" />">통일부</a></li>
                                                        <li><a href="/sboard/list?cate=1420"
                                                               title="<spring:message code="국무총리ii.법무부" />">법무부</a></li>
                                                        <li><a href="/sboard/list?cate=1421"
                                                               title="<spring:message code="국무총리ii.국방부" />">국방부</a></li>
                                                        <li><a href="/sboard/list?cate=1422"
                                                               title="<spring:message code="국무총리ii.행정자치부" />">행정자치부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1423"
                                                               title="<spring:message code="국무총리ii.문화체육관광부" />">문화체육관광부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1424"
                                                               title="<spring:message code="국무총리ii.농림축산식품부" />">농림축산식품부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1425"
                                                               title="<spring:message code="국무총리ii.산업통상자원부" />">산업통상자원부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1426"
                                                               title="<spring:message code="국무총리ii.보건복지부" />">보건복지부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1427"
                                                               title="<spring:message code="국무총리ii.환경부" />">환경부</a></li>
                                                        <li><a href="/sboard/list?cate=1428"
                                                               title="<spring:message code="국무총리ii.고용노동부" />">고용노동부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1429"
                                                               title="<spring:message code="국무총리ii.여성가족부" />">여성가족부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1430"
                                                               title="<spring:message code="국무총리ii.국토교통부" />">국토교통부</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1431"
                                                               title="<spring:message code="국무총리ii.해양수산부" />">해양수산부</a>
                                                        </li>
                                                    </ul>
                                                </div>


                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">국무총리iii</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1432"
                                                               title="<spring:message code="국무총리iii.국민안전처" />">국민안전처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1433"
                                                               title="<spring:message code="국무총리iii.인사혁신처" />">인사혁신처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1434"
                                                               title="<spring:message code="국무총리iii.법제처" />">법제처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1435"
                                                               title="<spring:message code="국무총리iii.국가보훈처" />">국가보훈처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1436"
                                                               title="<spring:message code="국무총리iii.식품의약품안전처" />">식품의약품안전처</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1437"
                                                               title="<spring:message code="국무총리iii.공정거래위원회" />">공정거래위원회</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1438"
                                                               title="<spring:message code="국무총리iii.금융위원회" />">금융위원회</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1439"
                                                               title="<spring:message code="국무총리iii.국민권익위원회" />">국민권익위원회</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1440"
                                                               title="<spring:message code="국무총리iii.원자력안전위원회" />">원자력안전위원회</a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">기획재정부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1441"
                                                               title="<spring:message code="기획재정부.국세청" />">국세청</a></li>
                                                        <li><a href="/sboard/list?cate=1442"
                                                               title="<spring:message code="기획재정부.관세청" />">관세청</a></li>
                                                        <li><a href="/sboard/list?cate=1443"
                                                               title="<spring:message code="기획재정부.조달청" />">조달청</a></li>
                                                        <li><a href="/sboard/list?cate=1444"
                                                               title="<spring:message code="기획재정부.통계청" />">통계청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">법무부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1445"
                                                               title="<spring:message code="법무부.검찰청" />">검찰청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국방부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1446"
                                                               title="<spring:message code="국방부.병무청" />">병무청</a></li>
                                                        <li><a href="/sboard/list?cate=1447"
                                                               title="<spring:message code="국방부.방위사업청" />">방위사업청</a>
                                                        </li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">행정자치부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1448"
                                                               title="<spring:message code="행정자치부.경찰청" />">경찰청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">문화체육관광부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1449"
                                                               title="<spring:message code="문화체육관광부.문화재청" />">문화재청</a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">농림축산식품부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1450"
                                                               title="<spring:message code="농림축산식품부.농촌진흥청" />">농촌진흥청</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1451"
                                                               title="<spring:message code="농림축산식품부.산림청" />">산림청</a>
                                                        </li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">산업통상자원부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1452"
                                                               title="<spring:message code="산업통상자원부.중소기업청" />">중소기업청</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1453"
                                                               title="<spring:message code="산업통상자원부.특허청" />">특허청</a>
                                                        </li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">환경부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1454"
                                                               title="<spring:message code="환경부.기상청" />">기상청</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">국토교통부</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="/sboard/list?cate=1455"
                                                               title="<spring:message code="국토교통부.행정중심복합도시건설청" />">행정중심복합도시건설청</a>
                                                        </li>
                                                        <li><a href="/sboard/list?cate=1456"
                                                               title="<spring:message code="국토교통부.새만금개발청" />">새만금개발청</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div><!--/end row-->
                                        </div><!--/end container-->
                                    </div><!--/end mega menu content-->
                                </li>
                            </ul><!--/end dropdown-menu-->
                        </li>
                        <!-- End Books -->

                        <!-- 상품 리스트 헤더 메뉴 -->
                        <li><a href="/userInfo/userInfoList">상품 리스트</a></li>
                        <!-- 상품 리스트 헤더 메뉴 -->

                        <!-- jqGrid 헤더 메뉴 -->
                        <%--<li><a href="/jqGrid/jqGridList">jq</a></li>--%>
                        <li><a href="/jqGrid/jqGridList02">jq2</a></li>
                        <%--<li><a href="/jqGrid/jqGridList03">jq3</a></li>--%>
                        <!-- jqGrid 헤더 메뉴 -->

                        <!-- 통계 -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                통계
                            </a>

                            <ul class="dropdown-menu">

                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">인기 게시물</a>
                                    <ul class="dropdown-menu">
                                        <%--<ul id="cateNum" class="dropdown-menu">--%>
                                        <li class="active" value="1101"><a href="/sboard/popList"
                                                                           title="<spring:message code="프로필.개요" />">실시간</a>
                                        </li>
                                        <li value="1102"><a href="" title="<spring:message code="프로필.생애" />">일간</a></li>
                                        <li value="1103"><a href="" title="<spring:message code="프로필.약력" />">주간</a></li>
                                        <li><a href="" title="<spring:message code="프로필.가족관계" />">월간</a></li>
                                        <%--</ul>--%>
                                    </ul>
                                </li>

                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">그래프</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="" title="<spring:message code="당선전.당선전공약" />">당선 전 공약</a></li>
                                        <li><a href="" title="<spring:message code="당선전.공약이행" />">공약 이행</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">당선 후</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="" title="<spring:message code="당선후.당선후공약" />">당선 후 공약</a></li>
                                        <li><a href="" title="<spring:message code="당선후.공약이행" />">공약 이행</a></li>
                                    </ul>
                                </li>

                                <%--<li class="dropdown-submenu">--%>
                                <%--<a href="javascript:void(0);">당선 후</a>--%>
                                <%--<ul class="dropdown-menu">--%>
                                <%----%>
                                <%--</ul>--%>
                                <%--</li>--%>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">사람</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="" title="<spring:message code="사람.청와대" />">청와대</a></li>
                                        <li><a href="" title="<spring:message code="사람.국회" />">국회</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- 통계 -->

                        <!-- jqGrid 헤더 메뉴 -->
                        <%--<li><a href="/jqGrid/jqGridList">jq</a></li>--%>
                        <li><a href="/chart/jstest">chart</a></li>
                        <%--<li><a href="/jqGrid/jqGridList03">jq3</a></li>--%>
                        <!-- jqGrid 헤더 메뉴 -->

                    </ul>
                    <!-- End Nav Menu -->
                </div>
            </div>
        </div>
        <!-- End Navbar -->
    </div>
    <!--=== End Header v5 ===-->
    <%--</div>--%>

    <%-- 회원정보 수정 모달 start --%>
    <div id="userModifyModal" class="modal modal-primary fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 <%--class="modal-title"--%>>비밀번호 확인</h4>
                </div>
                <div class="modal-body" data-rno>
                    <p><input type="text" id="upwConfirm" class="form-control"></p>
                </div>
                <div class="modal-footer text-right">
                    <button type="button" class="btn btn-info" id="upwConfirmBtn">확인</button>
                    <%--<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>--%>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <%-- 회원정보 수정 모달 end --%>

    <script>

        <%--var tempUrl02 = ${login.uday};--%>

        $(document).ready(function () {

            /* url 쿼리 스트링 구하기 */
            window.onload = function () {
                oParams = getUrlParams();
            };

            /* 정규식이용 input박스 한글 숫자 영문만 입력되도록 */
            $("#keywordInput").on("keypress", function (event) {
                var keyValue = event.key; // jQuery로 눌러진 값을 가져온다

                var input_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\s]+$/; //\s 가 공백  한글, 숫자, 영문 가능

                if (input_char.test(keyValue)) {
                    return true;
                } else {
                    event.key.value = "";
                    return false;
                }
            });

//            // 숫자 앞에 자릿수를 맞추기 위한 0을 넣기 / https://programmers.co.kr/learn/questions/52
//            function pad(n, width) {
//                n = n + '';
//                return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
//
//            }
//            /*
//            pad(10, 4);      // 0010
//            pad(9, 4);       // 0009
//            pad(123, 4);    // 0123
//            pad(1234, 4);   // 1234
//            */
//
//            var number = $('#loginUday').val();
//
//            var tempUrl01 = "/assets/img/colors/";
//            var tempUrl02 = pad(number, 3);
//            var tempUrl03 = ".png";
//
//            var tempUrl = "";
//            var temp = tempUrl.concat(tempUrl01, tempUrl02, tempUrl03);
//
//            $('#getColor').prop("src", temp);

            $("#upwConfirmBtn").on("click", function () {

                var upwConfirm = $("#upwConfirm").val();

                var loginUid = "${login.uid}";

                var userVO = {
                    uid: loginUid,
                    upw: upwConfirm
                };

                $.ajax({
                    type: 'POST',
                    url: '/userInfo/userPassConfirmGET',
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: 'text',
                    data: JSON.stringify(userVO),
                    success: function (data) {

                        var temp = data;

//                        console.log("result 00 : " + data);
//                        console.log("result 01 : " + data[0]);
//                        console.log('result 02 : ' + data[1]);
//                        console.log('result 03 : ' + temp);
//                        console.log('result 04 : ' + temp[0]);
//                        console.log('result 05 : ' + temp[1]);

                        if (temp == upwConfirm) {
                            location.href ="/user/shop-ui-modify";
                        } else {
                            alert("비밀번호가 일치하지 않습니다.");
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        console.log("ErRoR : " + xhr, textStatus, error);
                    }
                });
            });

        });

        /* url 쿼리 스트링 구하기 */
        function getUrlParams() {
            var params = {};
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
                params[key] = value;
            });
            return params;
        }

        /* 몇 글자 이상, 몇 글자 이하로 입력해야 함. */
        function validate(element, min, max, event) {
            var len = element.value.length;
            if (event.keyCode === 13) {
                if ($('#keywordInput').val() == null || $('#keywordInput').val() == "") {
                    alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다').one();
                    return false;
                }
            }
            if ((len < min) || (len > max)) {
                alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다').one();
                // element.style.borderColor = "#FF0000";
                // 입력 필드의 경계선을 빨강으로 설정함

                element.focus();
                // 입력 필드로 포커스를 이동
                return false;
//                element.preventDefault();
            }
            else if ($('#keywordInput').val() == null || $('#keywordInput').val() == "") {
                alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다').one();
                // element.style.borderColor = "#ffffff";
                // 입력 필드의 경계선을 흰색으로 설정
                return false;
            }
        }

        /* FIXME : onfocus에 문자 스페이스 넣으면 오류 뜨는 걸로 접근해볼까나 */
        /* form 전체 검색시 submit jQuery */
        function listAnySubmit() {

//            var i = $(input[name="keyword"]).length;
//            $(input[name="keyword"]).each(function (i) {
//               if(this.value == "") {
//                   alert("그만하세요");
//                   return false;
//               }
//            });
//            if ((len < min) && (keyCode == 13 || event.keyCode == 0X0D)) {
//                alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다').one();
//            }

            var keywordSearch = $(input[name = "keyword"]).attr('val');

            console.log("keywordSearch" + keywordSearch);

            var trimKeywordSearch = $.trim(keywordSearch);

            console.log("trimKeywordSearch" + trimKeywordSearch);

//            $(input[name="keyword"]).val(trimKeywordSearch).submit();
        }


        //        function codeCheck(event) {
        //            if (isFirst(event)) {
        //                alert("시작글자는 공백이면 안 됩니다.");
        //                return false;
        //            }
        //        }
        //
        //        function isFirst(input) //첫글짜만 체크
        //        {
        //            var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //            if(chars.indexOf(input.value.charAt(0))==-1)
        //            {
        //                return false;
        //            }else{
        //                return true;
        //            }
        //        }

        <%--
        바로 검색 누르면 화면이 검색 기능이 바로 작동되어 오류가 뜸.
        $(document).ready(function () {
            $('#searchBtnAny').on("click", function (e) {
                self.location = "listAny"
                    + '${pageMaker.makeQuery(1)}'
                    // + '&searchType=tcw'
                    // + $().val()
                    + '&keyword=' + $('#keywordInput').val();
            });

            window.onload = function () {
                oParams = getUrlParams();
            }
        });
        --%>


    </script>


