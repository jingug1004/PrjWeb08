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
                            <li><a href="shop-ui-add-to-cart.html">Wishlist (0)</a></li>
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
                                Pages
                            </a>
                            <ul class="dropdown-menu">
                                <li class="active"><a href="home.jsp">BEST</a></li>
                                <li><a href="shop-ui-inner.html">기획전</a></li>
                                <li><a href="shop-ui-filter-grid.html">이벤트</a></li>
                                <li><a href="shop-ui-filter-list.html">포토리뷰/후기</a></li>
                                <li><a href="shop-ui-add-to-cart.html">VIP 게시판</a></li>
                                <li><a href="shop-ui-login.html">회원등급별 혜택</a></li>
                                <li><a href="../include/shop-ui-register.jsp">득템샵</a></li>
                            </ul>
                        </li>
                        <!-- End Pages -->

                        <!-- Promotion -->
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                Promotion
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Jeans</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Skinny Jeans</a></li>
                                        <li><a href="#">Bootcut Jeans</a></li>
                                        <li><a href="#">Straight Cut Jeans</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="javascript:void(0);">Shoes</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Sandals</a></li>
                                        <li><a href="#">Heels</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- End Promotion -->

                        <!-- Gifts -->
                        <li class="dropdown mega-menu-fullwidth">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-hover="dropdown"
                               data-toggle="dropdown">
                                Gifts
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-12 col-xs-12 md-margin-bottom-30">
                                                    <h3 class="mega-menu-heading">고객 사은 할인 이벤트</h3>
                                                    <p>언제나 저희 UNIFY를 이용해 주심에 고객의 성원에 보답하고자 365일 이월 재고 상품을 대폭 할인하고
                                                        있습니다</p>
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
                                MENU
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="mega-menu-content">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Clothes</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">New in</a></li>
                                                        <li><a href="#">Coats &amp; Jackets</a></li>
                                                        <li><a href="#">Jeans</a></li>
                                                        <li><a href="#">Dresses</a></li>
                                                        <li><a href="#">Shorts</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Skirts</a></li>
                                                        <li><a href="#">T-Shirts</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Shoes</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Boots</a></li>
                                                        <li><a href="#">Flats</a></li>
                                                        <li><a href="#">Heels</a></li>
                                                        <li><a href="#">Sandals</a></li>
                                                        <li><a href="#">Sports</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Accessories</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">All accessories</a></li>
                                                        <li><a href="#">Bags &amp; Purses</a></li>
                                                        <li><a href="#">Scarvs &amp; Hats</a></li>
                                                        <li><a href="#">Jewellery</a></li>
                                                        <li><a href="#">Whatch &amp; Belt</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Lingerie</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Linger</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Slippers</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Nightwear</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Nightwear</a></li>
                                                        <li><a href="#">Socks</a></li>
                                                        <li><a href="#">Tights</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Mixed</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">New in</a></li>
                                                        <li><a href="#">Coats &amp; Jackets</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Jeans</a></li>
                                                        <li><a href="#">Dresses</a></li>
                                                        <li><a href="#">Shorts</a></li>
                                                        <li><a href="#">Skirts</a></li>
                                                        <li><a href="#">T-shirts</a></li>
                                                        <li><a href="#">Boots</a></li>
                                                        <li><a href="#">Flats</a></li>
                                                        <li><a href="#">Heels</a></li>
                                                        <li><a href="#">Sandals</a></li>
                                                        <li><a href="#">Sports</a></li>
                                                        <li><a href="#">Socks</a></li>
                                                        <li><a href="#">Tights</a></li>
                                                    </ul>
                                                </div>


                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Beauty</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">New in</a></li>
                                                        <li><a href="#">Cleansing &amp; Peeling</a></li>
                                                        <li><a href="#">Skincare</a></li>
                                                        <li><a href="#">Haircare</a></li>
                                                        <li><a href="#">Bodycare</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Nailcare</a></li>
                                                        <li><a href="#">Soap</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Travel</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Package Tour</a></li>
                                                        <li><a href="#">Free Travel</a></li>
                                                        <li><a href="#">Hotel</a></li>
                                                        <li><a href="#">Resort</a></li>
                                                        <li><a href="#">Pension</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Food</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">All Food</a></li>
                                                        <li><a href="#">Agricultural &amp; Animal</a></li>
                                                        <li><a href="#">Side Dish &amp; Processed Food</a></li>
                                                        <li><a href="#">Fish</a></li>
                                                        <li><a href="#">Snack &amp; Instant Food</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Interest</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Pet</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Flower</a></li>
                                                    </ul>
                                                    <h3 class="mega-menu-heading">Goods</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">Notebook</a></li>
                                                        <li><a href="#">Smartphone</a></li>
                                                        <li><a href="#">Smart Device</a></li>
                                                    </ul>
                                                </div>

                                                <div class="col-md-2 col-sm-6">
                                                    <h3 class="mega-menu-heading">Infant care</h3>
                                                    <ul class="list-unstyled style-list">
                                                        <li><a href="#">New in</a></li>
                                                        <li><a href="#">Clothes &amp; Shoes</a> <span
                                                                class="label label-danger-shop">New</span></li>
                                                        <li><a href="#">Diaper</a></li>
                                                        <li><a href="#">Powdered Milk</a></li>
                                                        <li><a href="#">Bath</a></li>
                                                        <li><a href="#">Skincare</a></li>
                                                        <li><a href="#">Oral Care</a></li>
                                                        <li><a href="#">Dinnerware</a></li>
                                                        <li><a href="#">Detergent for Baby</a></li>
                                                        <li><a href="#">Toy</a></li>
                                                        <li><a href="#">Nutritional Supplements</a></li>
                                                        <li><a href="#">Maternity Dress</a></li>
                                                        <li><a href="#">Return present</a></li>
                                                        <li><a href="#">Childbirth DIY</a> <span
                                                                class="label label-danger-shop">New</span></li>
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
                                Clothes
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Jeans</a></li>
                                <li><a href="#">T-shirts</a></li>
                                <li><a href="#">Shorts</a></li>
                            </ul>
                        </li>
                        <!-- End Clothes -->

                        <!-- Main Demo -->
                        <li><a href="<c:url value="/sboard/list"/>">Free Board</a></li>
                        <!-- Main Demo -->
                    </ul>
                    <!-- End Nav Menu -->
                </div>
            </div>
        </div>
        <!-- End Navbar -->
    </div>
    <!--=== End Header v5 ===-->



