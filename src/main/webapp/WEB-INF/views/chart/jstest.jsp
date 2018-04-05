<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<!--=== Breadcrumbs v4 ===-->
<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name">jqGrid</span>
        <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="">Product</a></li>
            <li class="active">Product Filter Page</li>
        </ul>
    </div><!--/end container-->
</div>
<!--=== End Breadcrumbs v4 ===-->

<style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }

</style>

<head>

    <meta charset="UTF-8">

    <title></title>

    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgridui/jquery-ui.theme.css" />--%>

    <%-- irush jqGrid --%>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/smoothness/jquery-ui.theme.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/" />--%>

    <%--<script src="/resources/jqgrid/js/jquery-1.11.0.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/jqgridui/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/chartjs/Chart.bundle.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/chartjs/Chart.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/chartjs/utils.js" type="text/javascript"></script>--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <%--[출처] [일일코딩]chartjs를 이용한 차트 표현 (한큐에자바(자바학원,java,jsp,웹개발,spring,html,개발자)) |작성자 리케--%>


    <%-- irush jqGrid --%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.irush.util.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery.bpopup.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery-ui.min.js" type="text/javascript"></script>--%>

    <%-- jqGrid를 위한 CSS @hanapharm irush --%>
    <%--<link rel='stylesheet' href="/assets/css/main.css">--%>
    <%--<link rel='stylesheet' href="/assets/css/reset.css">--%>

</head>

<body>

<section class="content">

    <div id="canvas-holder" style="width:40%">
        <canvas id="myChart"/>
    </div>
    <button id="randomizeData">Randomize Data</button>
    <button id="addDataset">Add Dataset</button>
    <button id="removeDataset">Remove Dataset</button>
    <button id="addData">Add Data</button>
    <button id="removeData">Remove Data</button>

    <script>
        var ctx = document.getElementById("myChart").getContext("2d");

        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                },
                    {
                        label: '# of Votes 2',
                        data: [1, 9, 13, 1, 12, 13],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1

                    }

                ]
            },
            options: {
                title: {
                    display: true,
                    text: 'custom chart'
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>

</section>
<!-- /.content -->

<%--<!-- footer -->--%>
<%--<div class="footer-v4">--%>
    <%--<div class="footer">--%>
        <%--<div class="container">--%>
            <%--<div class="row">--%>
                <%--<!-- About -->--%>
                <%--<div class="col-md-4 md-margin-bottom-40">--%>
                    <%--<a href="index.html"><img class="footer-logo" src="/assets/img/logo-2.png" alt=""></a>--%>
                    <%--<p>UNIFY는 국민의 목소리와 귀가 되어 <br/>--%>
                        <%--한차원 발전하는 아름다운 대한민국을 위하여<br/>--%>
                        <%--소통의 장을 열려는 '커뮤니티' 입니다.<br/></p>--%>
                    <%--<br>--%>
                    <%--<ul class="list-unstyled address-list margin-bottom-20">--%>
                        <%--<li><i class="fa fa-angle-right"></i>South Korea</li>--%>
                        <%--<li><i class="fa fa-angle-right"></i>Phone: 010 123 3456</li>--%>
                        <%--<li><i class="fa fa-angle-right"></i>Fax: 02 123 3456</li>--%>
                        <%--<li><i class="fa fa-angle-right"></i>Email: info@unify.com</li>--%>
                    <%--</ul>--%>

                    <%--<ul class="list-inline shop-social">--%>
                        <%--<li><a href="#"><i class="fb rounded-md fa fa-facebook"></i></a></li>--%>
                        <%--<li><a href="#"><i class="tw rounded-md fa fa-twitter"></i></a></li>--%>
                        <%--<li><a href="#"><i class="gp rounded-md fa fa-google-plus"></i></a></li>--%>
                        <%--<li><a href="#"><i class="yt rounded-md fa fa-youtube"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<!-- End About -->--%>

                <%--<!-- Simple List -->--%>
                <%--<div class="col-md-2 col-sm-3">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">GUIDE</h2>--%>
                            <%--<ul class="list-unstyled simple-list margin-bottom-20">--%>
                                <%--<li><a href="#">커뮤니티 소개</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">개인정보처리방침</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">이용약관</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">이용안내</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">인재채용</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">도매/제휴 문의</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">모델지원</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">Partnership Proposal</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">오프라인 매장</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>

                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">DELIVERY</h2>--%>
                            <%--<ul class="list-unstyled simple-list">--%>
                                <%--<li><a href="#">요청 조회</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">반품요청</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">배송조회</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="col-md-2 col-sm-3">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">BANK INFO</h2>--%>
                            <%--<ul class="list-unstyled simple-list margin-bottom-20">--%>
                                <%--<li><a href="#">후원문의</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">예금주 : 김진국(주)</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">KDB하나은행</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">국민은행</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">신한은행</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">우리은행</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">기업은행</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">농협</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>

                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">CONTACT</h2>--%>
                            <%--<ul class="list-unstyled simple-list">--%>
                                <%--<li><a href="#">SNS</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">10:00~17:00</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">(Lunch 13:00)</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">SAT, SUN, Holiday</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">문의하기</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">자주 묻는 질문</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="col-md-2 col-sm-3">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">SERVICE</h2>--%>
                            <%--<ul class="list-unstyled simple-list margin-bottom-20">--%>
                                <%--<li><a href="#">공지사항</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">자주 묻는 질문</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">이벤트</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">배송조회</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">출석체크</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">UNIFY 119</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">해외배송안내</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">매장 / 면세점 상담</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>

                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">CUSTOMER'S</h2>--%>
                            <%--<ul class="list-unstyled simple-list">--%>
                                <%--<li><a href="#">인증후기</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">구매질문</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">구매인증</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">패션센스</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="col-md-2 col-sm-3">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">Download</h2>--%>
                            <%--<ul class="list-unstyled simple-list margin-bottom-20">--%>
                                <%--&lt;%&ndash;<li><a href="#">가이드 라인</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">표준약관</a></li>&ndash;%&gt;--%>
                                <%--<li><a href="#">Tip & KnowHow</a></li>--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>

                        <%--<div class="col-sm-12 col-xs-6">--%>
                            <%--<h2 class="thumb-headline">FAMILY SITE</h2>--%>
                            <%--<ul class="list-unstyled simple-list">--%>
                                <%--&lt;%&ndash;<li><a href="#">NEVER</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">Baum</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">MATE</a></li>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<li><a href="#">GOGLE</a></li>&ndash;%&gt;--%>
                                <%--<li><a href="#">HeapOverflow</a></li>--%>
                                <%--&lt;%&ndash;<li><a href="#">NOKKKY</a></li>&ndash;%&gt;--%>
                                <%--<li>...</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- End Simple List -->--%>
    <%--</div><!--/end row-->--%>
<%--</div>--%>
<%--<!--/end continer-->--%>
<%--</div>--%>
<%--<!--/footer-->--%>

<%--<div class="copyright">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-6">--%>
                <%--<p>--%>
                    <%--2017 &copy; UNIFY. ALL Rights Reserved.<br/>--%>
                    <%--Sponsored by <a href="http://www.naver.com">heapoverflow.com</a> | <a href="#">Privacy--%>
                    <%--Policy</a> | <a href="#">Terms of Service</a>--%>
                <%--</p>--%>
            <%--</div>--%>
            <%--<div class="col-md-6">--%>
                <%--<ul class="list-inline sponsors-icons pull-right">--%>
                    <%--<li><i class="fa fa-cc-paypal"></i></li>--%>
                    <%--<li><i class="fa fa-cc-visa"></i></li>--%>
                    <%--<li><i class="fa fa-cc-mastercard"></i></li>--%>
                    <%--<li><i class="fa fa-cc-discover"></i></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>
<%@include file="../include/footer.jsp" %>