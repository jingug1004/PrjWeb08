<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
         <%--pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<!DOCTYPE html>--%>

<%--<%@include file="../include/header.jsp" %>--%>

<%--<head lang="en">--%>

    <%--<meta charset="UTF-8">--%>

    <%--<title></title>--%>

        <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css" />--%>
        <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgridui/jquery-ui.theme.css" />--%>

        <%--<script src="/resources/jqgrid/js/jquery-1.11.0.min.js" type="text/javascript"></script>--%>
        <%--<script src="/resources/jqgridui/jquery-ui.min.js" type="text/javascript"></script>--%>
        <%--<script src="/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>--%>
        <%--<script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>

<%--</head>--%>

<%--<body>--%>

<%--&lt;%&ndash;<table id="list4"></table>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div id="grid_Pager"></div>&ndash;%&gt;--%>

<%--&lt;%&ndash;<h3>start시작04</h3>&ndash;%&gt;--%>

<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
    <%--&lt;%&ndash;$(function(){&ndash;%&gt;--%>

        <%--&lt;%&ndash;// 변수 선언&ndash;%&gt;--%>
        <%--&lt;%&ndash;var i, max, myData, grid = $("#list4");&ndash;%&gt;--%>

        <%--&lt;%&ndash;// grid 설정&ndash;%&gt;--%>
        <%--&lt;%&ndash;grid.jqGrid({&ndash;%&gt;--%>
            <%--&lt;%&ndash;datatype: "local",&ndash;%&gt;--%>
            <%--&lt;%&ndash;height: 'auto',&ndash;%&gt;--%>
            <%--&lt;%&ndash;colNames:['Inv No 넘버','Date 날짜', 'Client 클라', 'Amount 양','Tax 세금','Total 합','Notes 비고'],&ndash;%&gt;--%>
            <%--&lt;%&ndash;colModel:[&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'id',     index:'id',      width:100,  sorttype:"int"},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'invdate',index:'invdate', width:90,  sorttype:"date"},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'name',   index:'name',    width:100},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'amount', index:'amount',  width:80,  align:"right",sorttype:"float"},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'tax',    index:'tax',     width:80,  align:"right",sorttype:"float"},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'total',  index:'total',   width:80,  align:"right",sorttype:"float"},&ndash;%&gt;--%>
                <%--&lt;%&ndash;{name:'note',   index:'note',    width:150, sortable:false}&ndash;%&gt;--%>
            <%--&lt;%&ndash;],&ndash;%&gt;--%>
            <%--&lt;%&ndash;height:461,&ndash;%&gt;--%>
            <%--&lt;%&ndash;page: 1,&ndash;%&gt;--%>
            <%--&lt;%&ndash;rowNum: 10,&ndash;%&gt;--%>
            <%--&lt;%&ndash;rownumbers: true,&ndash;%&gt;--%>
            <%--&lt;%&ndash;rowList: [20,30,40],&ndash;%&gt;--%>
            <%--&lt;%&ndash;rownumbers: false,&ndash;%&gt;--%>
            <%--&lt;%&ndash;autowidth:true,&ndash;%&gt;--%>
<%--&lt;%&ndash;//            loadComplete: function(data){	//조회 완료시 호출되는 function&ndash;%&gt;--%>
<%--&lt;%&ndash;//                if(data.records > 0){		//조회 결과가 있을 경우&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    saleActionFlag = true;&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    $("#amt").val(Commons.addComma(data.sumLedger.amt));&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    $("#vat").val(Commons.addComma(data.sumLedger.vat));&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    $("#tot").val(Commons.addComma(data.sumLedger.tot));&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    $("#sukum").val(Commons.addComma(data.sumLedger.sukum));&ndash;%&gt;--%>
<%--&lt;%&ndash;//&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    if(data.page==1){&ndash;%&gt;--%>
<%--&lt;%&ndash;//                        var datarow = {ymd:"",rcust_nm:"",item_nm:"<b>[ 이월잔액 ]</b>",standard:"",qty:"",danga:"",amt:"",vat:"",tot:"",sukum:"",rem_amt:'<b>'+data.rows[0].before_amt+'</b>'};&ndash;%&gt;--%>
<%--&lt;%&ndash;//                        $("#grid_list").addRowData(0,datarow,"first");&ndash;%&gt;--%>
<%--&lt;%&ndash;//                        $("#grid_list").setSelection('0');&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    }&ndash;%&gt;--%>
<%--&lt;%&ndash;//&ndash;%&gt;--%>
<%--&lt;%&ndash;//                }else{&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    saleActionFlag = false;&ndash;%&gt;--%>
<%--&lt;%&ndash;//                    alert("해당 원장자료가 없습니다.");&ndash;%&gt;--%>
<%--&lt;%&ndash;//                }&ndash;%&gt;--%>
<%--&lt;%&ndash;//            },&ndash;%&gt;--%>
            <%--&lt;%&ndash;pager: "#grid_Pager",&ndash;%&gt;--%>

            <%--&lt;%&ndash;multiselect: true,&ndash;%&gt;--%>
            <%--&lt;%&ndash;caption: "Manipulating(사물을 능숙하게) 다루다 Array Data "&ndash;%&gt;--%>
        <%--&lt;%&ndash;});&ndash;%&gt;--%>

        <%--&lt;%&ndash;// 로컬 데이터&ndash;%&gt;--%>
        <%--&lt;%&ndash;myData = [&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"1",invdate:"2007-10-01",name:"test한글",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"2",invdate:"2007-10-02",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"3",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"4",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"5",invdate:"2007-10-05",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"6",invdate:"2007-09-06",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"7",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"8",invdate:"2007-10-03",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"9",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"10",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"11",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"12",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"13",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"14",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"15",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"16",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"17",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"18",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"19",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"20",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"21",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"22",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},&ndash;%&gt;--%>
            <%--&lt;%&ndash;{id:"23",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"}&ndash;%&gt;--%>
        <%--&lt;%&ndash;];&ndash;%&gt;--%>

        <%--&lt;%&ndash;// 데이터 추가&ndash;%&gt;--%>
        <%--&lt;%&ndash;for (i = 0, max = myData.length; i <= max; i++) {&ndash;%&gt;--%>
            <%--&lt;%&ndash;grid.jqGrid('addRowData', i + 1, myData[i]);&ndash;%&gt;--%>
        <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--&lt;%&ndash;});&ndash;%&gt;--%>

<%--&lt;%&ndash;</script>&ndash;%&gt;--%>



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
