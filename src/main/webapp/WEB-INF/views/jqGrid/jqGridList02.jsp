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

<head>

    <meta charset="UTF-8">

    <title></title>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css"/>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgridui/jquery-ui.theme.css" />--%>

    <%-- irush jqGrid --%>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/smoothness/jquery-ui.theme.css"/>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/" />--%>

    <%--<script src="/resources/jqgrid/js/jquery-1.11.0.min.js" type="text/javascript"></script>--%>
    <script src="/resources/jqgridui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
    <script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

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

    <%--<div class="grid_Pager"></div>--%>
    <table id="list4"></table>
    <div id="grid_Pager"></div>

 <script>
//        $(function () {

        $(document).ready(function () {

            $(function () {

            // 변수 선언
            var i, max, myData, grid = $("#list4");

            // grid 설정
                grid.jqGrid({
                    datatype: 'local',
                    height: '463',
//                scroll: 1,
                    colNames: ['Inv No 넘버', 'Date 날짜', 'Client 클라', 'Amount 양', 'Tax 세금', 'Total 합', 'Notes 비고'],
                    colModel: [
                        {name: 'id', index: 'id', width: 100, sorttype: "int"},
                        {name: 'invdate', index: 'invdate', width: 90, sorttype: "date"},
                        {name: 'name', index: 'name', width: 100},
                        {name: 'amount', index: 'amount', width: 80, align: "right", sorttype: "float"},
                        {name: 'tax', index: 'tax', width: 80, align: "right", sorttype: "float"},
                        {name: 'total', index: 'total', width: 80, align: "right", sorttype: "float"},
                        {name: 'note', index: 'note', width: 150, sortable: false}
                    ],
                    page: 1,
                    rowNum: 20,
                    rownumbers: true,
                    rowList: [0, 20, 50, 100, 200],
                    autowidth: true,
                    viewrecords: true,
//                sortorder:'desc',
//            loadComplete: function(data){	//조회 완료시 호출되는 function
//                if(data.records > 0){		//조회 결과가 있을 경우
//                    saleActionFlag = true;
//                    $("#amt").val(Commons.addComma(data.sumLedger.amt));
//                    $("#vat").val(Commons.addComma(data.sumLedger.vat));
//                    $("#tot").val(Commons.addComma(data.sumLedger.tot));
//                    $("#sukum").val(Commons.addComma(data.sumLedger.sukum));
//
//                    if(data.page==1){
//                        var datarow = {ymd:"",rcust_nm:"",item_nm:"<b>[ 이월잔액 ]</b>",standard:"",qty:"",danga:"",amt:"",vat:"",tot:"",sukum:"",rem_amt:'<b>'+data.rows[0].before_amt+'</b>'};
//                        $("#grid_list").addRowData(0,datarow,"first");
//                        $("#grid_list").setSelection('0');
//                    }
//
//                }else{
//                    saleActionFlag = false;
//                    alert("해당 원장자료가 없습니다.");
//                }
//            },
                    pager: '#grid_Pager',

                    multiselect: false,
                    caption: "Manipulating(사물을 능숙하게) 다루다 Array Data "
                });

                // 로컬 데이터
                myData = [
                    {id:"1",invdate:"2007-10-01",name:"test한글",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
                    {id:"2",invdate:"2007-10-02",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
                    {id:"3",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"4",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
                    {id:"5",invdate:"2007-10-05",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
                    {id:"6",invdate:"2007-09-06",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"7",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
                    {id:"8",invdate:"2007-10-03",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
                    {id:"9",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"10",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"11",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"12",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"13",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"14",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"15",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"16",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"17",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"18",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"19",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"20",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"21",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"22",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
                    {id:"23",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"}
                ];

                // 데이터 추가
                for (i = 0, max = myData.length; i <= max; i++) {
                    grid.jqGrid('addRowData', i + 1, myData[i]);
                }


            });

        });

</script>

</section>
<!-- /.content -->

<!-- footer -->
<div class="footer-v4">
    <div class="footer">
        <div class="container">
            <div class="row">
                <!-- About -->
                <div class="col-md-4 md-margin-bottom-40">
                    <a href="index.html"><img class="footer-logo" src="/assets/img/logo-2.png" alt=""></a>
                    <p>UNIFY는 국민의 목소리와 귀가 되어 <br/>
                        한차원 발전하는 아름다운 대한민국을 위하여<br/>
                        소통의 장을 열려는 '커뮤니티' 입니다.<br/></p>
                    <br>
                    <ul class="list-unstyled address-list margin-bottom-20">
                        <li><i class="fa fa-angle-right"></i>South Korea</li>
                        <li><i class="fa fa-angle-right"></i>Phone: 010 123 3456</li>
                        <li><i class="fa fa-angle-right"></i>Fax: 02 123 3456</li>
                        <li><i class="fa fa-angle-right"></i>Email: info@unify.com</li>
                    </ul>

                    <ul class="list-inline shop-social">
                        <li><a href="#"><i class="fb rounded-md fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="tw rounded-md fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="gp rounded-md fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="yt rounded-md fa fa-youtube"></i></a></li>
                    </ul>
                </div>
                <!-- End About -->

                <!-- Simple List -->
                <div class="col-md-2 col-sm-3">
                    <div class="row">
                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">GUIDE</h2>
                            <ul class="list-unstyled simple-list margin-bottom-20">
                                <li><a href="#">커뮤니티 소개</a></li>
                                <%--<li><a href="#">개인정보처리방침</a></li>--%>
                                <%--<li><a href="#">이용약관</a></li>--%>
                                <%--<li><a href="#">이용안내</a></li>--%>
                                <%--<li><a href="#">인재채용</a></li>--%>
                                <%--<li><a href="#">도매/제휴 문의</a></li>--%>
                                <%--<li><a href="#">모델지원</a></li>--%>
                                <%--<li><a href="#">Partnership Proposal</a></li>--%>
                                <%--<li><a href="#">오프라인 매장</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>

                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">DELIVERY</h2>
                            <ul class="list-unstyled simple-list">
                                <li><a href="#">요청 조회</a></li>
                                <%--<li><a href="#">반품요청</a></li>--%>
                                <%--<li><a href="#">배송조회</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-3">
                    <div class="row">
                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">BANK INFO</h2>
                            <ul class="list-unstyled simple-list margin-bottom-20">
                                <li><a href="#">후원문의</a></li>
                                <%--<li><a href="#">예금주 : 김진국(주)</a></li>--%>
                                <%--<li><a href="#">KDB하나은행</a></li>--%>
                                <%--<li><a href="#">국민은행</a></li>--%>
                                <%--<li><a href="#">신한은행</a></li>--%>
                                <%--<li><a href="#">우리은행</a></li>--%>
                                <%--<li><a href="#">기업은행</a></li>--%>
                                <%--<li><a href="#">농협</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>

                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">CONTACT</h2>
                            <ul class="list-unstyled simple-list">
                                <li><a href="#">SNS</a></li>
                                <%--<li><a href="#">10:00~17:00</a></li>--%>
                                <%--<li><a href="#">(Lunch 13:00)</a></li>--%>
                                <%--<li><a href="#">SAT, SUN, Holiday</a></li>--%>
                                <%--<li><a href="#">문의하기</a></li>--%>
                                <%--<li><a href="#">자주 묻는 질문</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-3">
                    <div class="row">
                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">SERVICE</h2>
                            <ul class="list-unstyled simple-list margin-bottom-20">
                                <li><a href="#">공지사항</a></li>
                                <%--<li><a href="#">자주 묻는 질문</a></li>--%>
                                <%--<li><a href="#">이벤트</a></li>--%>
                                <%--<li><a href="#">배송조회</a></li>--%>
                                <%--<li><a href="#">출석체크</a></li>--%>
                                <%--<li><a href="#">UNIFY 119</a></li>--%>
                                <%--<li><a href="#">해외배송안내</a></li>--%>
                                <%--<li><a href="#">매장 / 면세점 상담</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>

                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">CUSTOMER'S</h2>
                            <ul class="list-unstyled simple-list">
                                <li><a href="#">인증후기</a></li>
                                <%--<li><a href="#">구매질문</a></li>--%>
                                <%--<li><a href="#">구매인증</a></li>--%>
                                <%--<li><a href="#">패션센스</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-3">
                    <div class="row">
                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">Download</h2>
                            <ul class="list-unstyled simple-list margin-bottom-20">
                                <%--<li><a href="#">가이드 라인</a></li>--%>
                                <%--<li><a href="#">표준약관</a></li>--%>
                                <li><a href="#">Tip & KnowHow</a></li>
                                <li>...</li>
                            </ul>
                        </div>

                        <div class="col-sm-12 col-xs-6">
                            <h2 class="thumb-headline">FAMILY SITE</h2>
                            <ul class="list-unstyled simple-list">
                                <%--<li><a href="#">NEVER</a></li>--%>
                                <%--<li><a href="#">Baum</a></li>--%>
                                <%--<li><a href="#">MATE</a></li>--%>
                                <%--<li><a href="#">GOGLE</a></li>--%>
                                <li><a href="#">HeapOverflow</a></li>
                                <%--<li><a href="#">NOKKKY</a></li>--%>
                                <li>...</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Simple List -->
    </div><!--/end row-->
</div>
<!--/end continer-->
</div>
<!--/footer-->

<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>
                    2017 &copy; UNIFY. ALL Rights Reserved.<br/>
                    Sponsored by <a href="http://www.naver.com">heapoverflow.com</a> | <a href="#">Privacy
                    Policy</a> | <a href="#">Terms of Service</a>
                </p>
            </div>
            <div class="col-md-6">
                <ul class="list-inline sponsors-icons pull-right">
                    <li><i class="fa fa-cc-paypal"></i></li>
                    <li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-discover"></i></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
