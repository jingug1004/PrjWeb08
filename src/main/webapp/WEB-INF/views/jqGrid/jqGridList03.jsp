<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<%@include file="../include/header.jsp" %>

<head lang="en">

    <meta charset="UTF-8">

    <title></title>

    <link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/smoothness/jquery-ui.theme.css"/>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/resources/ijqgrid/css/" />--%>

    <%--<script src="/resources/ijqgrid/js/jquery-1.11.1.min.js" type="text/javascript"></script>--%>
    <%--&lt;%&ndash;<script src="/resources/jqgridui/jquery-ui.min.js" type="text/javascript"></script>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<script src="/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>&ndash;%&gt;--%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>

    <%--&lt;%&ndash; irush jqGrid &ndash;%&gt;--%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.irush.util.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery.bpopup.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery-1.11.1.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery-ui.min.js" type="text/javascript"></script>--%>
    <%--<script src="/resources/ijqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>--%>

    <script src="/resources/ijqgrid/js/jquery.jqGrid.irush.util.js" type="text/javascript"></script>
    <script src="/resources/ijqgrid/js/jquery.bpopup.min.js" type="text/javascript"></script>

    <%-- jqGrid를 위한 CSS @hanapharm irush --%>
    <link rel='stylesheet' href="/assets/css/main.css">
    <link rel='stylesheet' href="/assets/css/reset.css">


</head>

<body>

<section class="content">


<%--<table id="list4"></table>--%>
<%--<div id="grid_Pager"></div>--%>

<%--<h3>start시작04</h3>--%>

<%--<div id="orderList" &lt;%&ndash;style="display:none;"&ndash;%&gt;>--%>
    <%--<table id="grid_list_clone"></table>--%>
<%--</div>--%>
    <%--<form id="itemFrm" name="itemFrm">--%>
<%--</form>--%>

    <%--<div class="wrap_result_group">--%>
        <%--<table id="grid_list" id="orderList"></table>--%>
    <%--</div>--%>

    <%--<div class="wrap_result_group">--%>
        <%--<table id="grid_list2"></table>--%>
    <%--</div>--%>

<script>
//    $(function(){
//
//        // 변수 선언
//        var i, max, myData, grid = $("#list4");
//
//        // grid 설정
//        grid.jqGrid({
//            datatype: "local",
//            height: 'auto',
//            colNames:['Inv No 넘버','Date 날짜', 'Client 클라', 'Amount 양','Tax 세금','Total 합','Notes 비고'],
//            colModel:[
//                {name:'id',     index:'id',      width:100,  sorttype:"int"},
//                {name:'invdate',index:'invdate', width:90,  sorttype:"date"},
//                {name:'name',   index:'name',    width:100},
//                {name:'amount', index:'amount',  width:80,  align:"right",sorttype:"float"},
//                {name:'tax',    index:'tax',     width:80,  align:"right",sorttype:"float"},
//                {name:'total',  index:'total',   width:80,  align:"right",sorttype:"float"},
//                {name:'note',   index:'note',    width:150, sortable:false}
//            ],
//            page: 1,
//            rowNum: 10,
//            rownumbers: true,
//            rowList: [20,30,40],
//            autowidth:true,
////            loadComplete: function(data){	//조회 완료시 호출되는 function
////                if(data.records > 0){		//조회 결과가 있을 경우
////                    saleActionFlag = true;
////                    $("#amt").val(Commons.addComma(data.sumLedger.amt));
////                    $("#vat").val(Commons.addComma(data.sumLedger.vat));
////                    $("#tot").val(Commons.addComma(data.sumLedger.tot));
////                    $("#sukum").val(Commons.addComma(data.sumLedger.sukum));
////
////                    if(data.page==1){
////                        var datarow = {ymd:"",rcust_nm:"",item_nm:"<b>[ 이월잔액 ]</b>",standard:"",qty:"",danga:"",amt:"",vat:"",tot:"",sukum:"",rem_amt:'<b>'+data.rows[0].before_amt+'</b>'};
////                        $("#grid_list").addRowData(0,datarow,"first");
////                        $("#grid_list").setSelection('0');
////                    }
////
////                }else{
////                    saleActionFlag = false;
////                    alert("해당 원장자료가 없습니다.");
////                }
////            },
//            pager: "#grid_Pager",
//
//            multiselect: true,
//            caption: "Manipulating(사물을 능숙하게) 다루다 Array Data "
//        });
//
//        // 로컬 데이터
//        myData = [
//            {id:"1",invdate:"2007-10-01",name:"test한글",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
//            {id:"2",invdate:"2007-10-02",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
//            {id:"3",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"4",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
//            {id:"5",invdate:"2007-10-05",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
//            {id:"6",invdate:"2007-09-06",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"7",invdate:"2007-10-04",name:"test",   note:"note",    amount:"200.00",tax:"10.00",total:"210.00"},
//            {id:"8",invdate:"2007-10-03",name:"test2",  note:"note2",   amount:"300.00",tax:"20.00",total:"320.00"},
//            {id:"9",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"10",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"11",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"12",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"13",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"14",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"15",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"16",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"17",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"18",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"19",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"20",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"21",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"22",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"},
//            {id:"23",invdate:"2007-08-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"}
//        ];
//
//        // 데이터 추가
//        for (i = 0, max = myData.length; i <= max; i++) {
//            grid.jqGrid('addRowData', i + 1, myData[i]);
//        }
//    });
//
//    var saleActionFlag = false;		//기능(엑셀, 인쇄) 제어를 위한 전역변수
//    var loadFlag = false;			//더블클릭방지 flag

    // ------------------------------------------------------------------------------------------------------------------

    /* 화면의 Dom 객체가 모두 준비되었을 때 */
//    $(document).ready(function(){

        /* jqGrid의 jsonReader 옵션 전역 설정. row 반복 형태의 json 처리. */
//        jsonReader : {
//            repeatitems: false;
//        }

        /* 주문 detail jqGrid 생성 및 options 설정. */
        $("#grid_list2").jqGrid({
//            mtype:"post",
            datatype:"local",
            colNames:["제품코드","제품명","규격","요청수량","승인수량","단가","공급가액","세액","공급총액"],
            colModel:[
                {name:"item_id",		index:"item_id",		align:"center",		width:120,	key:true },												//제품코드
                {name:"item_nm",		index:"item_nm ",		align:"left",		width:400	},														//제품명
                {name:"standard",		index:"standard", 		align:"center",		width:120	},														//규격
                {name:"req_qty",		index:"req_qty", 		align:"center", 	width:100	},														//주문수량(요청)
                {name:"qty",			index:"qty", 			align:"center", 	width:100	},														//주문수량(승인)
                {name:"danga",			index:"danga", 			align:"right",  	width:120,	formatter:Order.amountFormatter },						//단가
                {name:"amt",			index:"amt", 			align:"right",		width:120,	formatter:Order.amountFormatter },						//공급가액
                {name:"vat",			index:"vat",			align:"right",		width:150,	formatter:Order.amountFormatter },						//세액
                {name:"tot_amt",		index:"tot_amt", 		align:"right",		width:150,	formatter:Order.amountFormatter }						//공급총액
            ],
            rowNum: -1,
            height:300,
            autowidth:true
//            loadComplete: function(data){	//조회 완료시 호출되는 function
//                if(data.records != 0){		//조회결과가 있을 경우
//
//                    /* 주문 마스터의 status가 접수일때는 수량으로, 승인/반려일 경우네는 승인수량으로 */
//                    var status = $("#grid_list").getRowData($("#grid_list").getGridParam("selrow")).status;		//선택된 주문 마스터의 상태값
//                    if('승인' == status){
//                        $("#grid_list2").showCol("qty");
//                    } else {
//                        $("#grid_list2").hideCol("qty");
//                    }
//                    $("#grid_list2").setGridWidth($('.wrap_result_group').width(), true);			//grid 영역의 넓이가 동적으로 조절
//
//                    /* 하단 총액 계산 */
//                    footerSum();
//                }
//            }
        });

        myData = [
            {item_id:"1", item_nm:"1", standard:"ea", req_qty:"10", qty:"10", danga:"1000", amt:"1000", vat:"100", tot_amt:"1100"}
        ];

        $("#grid_list2").jqGrid('addRowData', 1, myData);

        Commons.setDate('fr_date','to_date');	//주문요청일 오늘날짜로 set

        var param = "fr_date="+$("#fr_date").val()+"&to_date="+$("#to_date").val()+"&receipt_gb=1&receipt_gb=2&receipt_gb=3";	//주문 master 조회 파라메터  set

        /* 주문 master jqGrid 생성 및 options 설정. */
        $("#grid_list").jqGrid({
            url : "/order/orderGridList.do?"+param,
            mtype:"post",
            datatype:"json",
            colNames:["판매처","판매처명","접수번호","주문요청일","주문상태","주문종류","주문승인일","승인번호","비고","담보약속"],
            colModel:[
                {name:"rcust_id",	index:"rcust_id ",	align:"center",		width:100	},			//판매처
                {name:"rcust_nm",	index:"rcust_nm", 	align:"left",		width:250	},			//판매처명
                {name:"gumae_no",	index:"gumae_no", 	align:"center", 	width:150,	key:true},	//접수번호
                {name:"ymd",		index:"ymd",		align:"center",		width:120	},			//주문요청일
                {name:"status",		index:"status", 	align:"center", 	width:80	},			//주문상태
                {name:"gumae_gb",	index:"gumae_gb", 	align:"center",  	width:100	},			//주문종류
                {name:"app_ymd",	index:"app_ymd", 	align:"center",  	width:120	},			//주문승인일
                {name:"app_no",		index:"app_no", 	align:"center",  	width:150	},			//승인번호
                {name:"bigo",		index:"bigo", 		align:"left",		width:300,	editable: true, editype : "text", formatter:"textbox"	},	//요청사항
                {name:"pbigo",		index:"pbigo", 		align:"left",		width:300}
            ],
            rowNum: -1,
            onSelectRow: detailOrderGrid,				//row를 클릭등으로 selection할 때 detailOrderGrid 함수를 실행함
            height:200,
            autowidth:true,
            rownumbers: true,
//            loadComplete: function(data){				//조회 완료시 호출되는 function
//                if(data.records == 0){					//조회결과가 없을 경우
//                    alert("해당 주문자료가 없습니다.");
//                    saleActionFlag=false;
//                }else{									//조회결과가 있을 경우
//                    saleActionFlag=true;
//                    $("#grid_list").setSelection(data.rows[0].gumae_no);
//                }
//
//            }

        });

        /* 조회 버튼 클릭 */
        $("#ct_retrieve_btn_type01").on("click",function(){
            masterOrderGrid();
        });

        /* 인쇄 버튼 클릭 */
        $("#p_print").on("click",function(){
            gridPrint();
        });

        /* 엑셀 버튼 클릭 */
        $("#p_excel").on("click",function(){
            Commons.extraAction(saleActionFlag, 'excel', '/order/orderGridListExcelDown.do', '');
        });

        /* 닫기 버튼 클릭 */
        $("#p_close").on("click",function(){
            parent.Commons.closeTab('주문검색');
        });

//    });

    /* 브라우저 창의 사이즈가 변경될 때 */
    $(window).resize(function(){
        $("#grid_list").setGridWidth($('.wrap_result_group').width(), false);			//grid 영역의 넓이가 동적으로 조절
        $("#grid_list2").setGridWidth($('.wrap_result_group').width(), false);			//grid 영역의 넓이가 동적으로 조절
    });

    /* 화면의 모든 객체가 모두 로드되었을 때 */
    $(window).load(function(){
        /* 엔터키 눌렸을 경우 조회되도록. */
        if($("#ct_retrieve_btn_type01").prop('disabled') == false){
            $("body").on("keydown", function(event){
                if(event.keyCode==13 && event.target.name!="grid_count"){
                    masterOrderGrid();
                    return false;
                }
            });
        }
    });

    /**
     *	조회버튼 클릭시
     */
    function masterOrderGrid(){

        var fr_date = $('#fr_date');
        if(!formCheck.isDateFormat(fr_date.val())){
            alert('주문요청일 형식(YYYY-MM-DD)을 확인해주세요.');
            fr_date.focus();
            return;
        }

        var to_date = $('#to_date');
        if(!formCheck.isDateFormat(to_date.val())){
            alert('주문요청일 형식(YYYY-MM-DD)을 확인해주세요.');
            to_date.focus();
            return;
        }

        if (formCheck.dateChk(fr_date.val(),to_date.val())<0) {
            alert('조회 종료일이 조회 시작일보다 이전일자입니다.');
            fr_date.focus();
            return;
        }

        //값 초기화
        saleActionFlag = false;

        //파라미터 셋팅
        var param = $('#frm').serialize();

        // 주문 detail jqgrid 호출
        $("#grid_list").jqGrid('clearGridData');
        $("#grid_list2").jqGrid('clearGridData');
        $("#grid_list").jqGrid('setGridParam',{url:"/order/orderGridList.do?" + param}).trigger("reloadGrid");

    }

    /**
     *	주문 master row 선택했을 때
     */
    function detailOrderGrid(id){

        var grid = $("#grid_list");
        var ymd = grid.getRowData(id).ymd.replace(/-/gi,"");
        var gumae_no = grid.getRowData(id).gumae_no.replace(/-/gi,"");

        //파라미터 셋팅
        var param = "ymd=" + ymd +"&gumae_no=" + gumae_no;
        // 주문 detail jqgrid 호출
        $("#grid_list2").jqGrid('clearGridData');
        $("#grid_list2").jqGrid('setGridParam',{url:"/order/detailGridList.do?" + param}).trigger("reloadGrid");

    }

    /**
     *	하단 총액 계산
     */
    function footerSum(){

        //변수생성
        var dGrid = $("#grid_list2");

        //detail grid 생성 후 아래 하단 총액 계산
        var amt=0;
        var vat=0;
        var total_amt=0;


        //grid 하단 총 공급가액, 세액, 공급총액 구하는 방식
        var col_amt = dGrid.getCol('amt', true);
        var col_vat = dGrid.getCol('vat', true);
        var col_tot_amt = dGrid.getCol('tot_amt', true);

        for(var colInt=0; colInt < col_amt.length; colInt++){
            if(col_amt[colInt].value!=''){
                var str_amt = (col_amt[colInt].value).replace(/,/gi,"");
                var str_vat = (col_vat[colInt].value).replace(/,/gi,"");
                var str_tot_amt = (col_tot_amt[colInt].value).replace(/,/gi,"");
                amt += parseInt(str_amt);
                vat += parseInt(str_vat);
                total_amt += parseInt(str_tot_amt);
            }
        }

        //grid 하단 공급가액, 세액, 공급총액, 주문 가능액 value set
        $('#amt').val(Commons.addComma(amt));
        $('#vat').val(Commons.addComma(vat));
        $('#tot_amt').val(Commons.addComma(total_amt));

    }


    /**
     *	프린트를 하기위해 grid 재생성
     */
    function gridPrint(){

        $('#orderList').html('<table id="grid_list_clone"></table>');

        //파라미터 셋팅
        var param = $('#frm').serialize();

        $("#grid_list_clone").jqGrid({
            url:"/order/orderGridList.do?" + param,
            mtype:"post",
            datatype:"json",
            colNames:["판매처","판매처명","접수번호","주문요청일","주문상태","주문종류","주문승인일","승인번호","비고"],
            colModel:[
                {name:"rcust_id",	index:"rcust_id ",	align:"center",		width:100	},			//판매처
                {name:"rcust_nm",	index:"rcust_nm", 	align:"left",		width:250	},			//판매처명
                {name:"gumae_no",	index:"gumae_no", 	align:"center", 	width:150,	key:true},	//접수번호
                {name:"ymd",		index:"ymd",		align:"center",		width:120	},			//주문요청일
                {name:"status",		index:"status", 	align:"center", 	width:80	},			//주문상태
                {name:"gumae_gb",	index:"gumae_gb", 	align:"center",  	width:100	},			//주문종류
                {name:"app_ymd",	index:"app_ymd", 	align:"center",  	width:120	},			//주문승인일
                {name:"app_no",		index:"app_no", 	align:"center",  	width:150	},			//승인번호
                {name:"bigo",		index:"bigo", 		align:"left",		width:300,	editable: true, editype : "text", formatter:"textbox"	}	//요청사항
            ],
            rowNum: -1,
            height:200,
            rownumbers: true,
            loadComplete: function(data){
                Commons.extraAction(saleActionFlag, 'print', '/common/commonPrint.do', 'orderList');
            }
        });
    }

</script>

    <!-- ##### content start ##### -->
    <div class="wrap_search">
        <div class="search">
            <label class="w70">주문요청일</label>
            <p class="wrap_date">
                <input type="text" id="fr_date" name="fr_date" maxlength="10"/>
                <button type="button" class="btn_date"><span class="blind">달력보기</span></button>
            </p>
            ~
            <p class="wrap_date">
                <input type="text" id="to_date" name="to_date" maxlength="10"/>
                <button type="button" class="btn_date"><span class="blind">달력보기</span></button>
            </p>

            <label class="ml10">주문상태</label>
            <input type="checkbox" id="status1" name="receipt_gb" value="1" checked="checked"/>
            <span>접수</span>
            <input type="checkbox" id="status2" name="receipt_gb" value="2" checked="checked"/>
            <span>승인</span>
            <input type="checkbox" id="status3" name="receipt_gb" value="3" checked="checked"/>
            <span>반려</span>

            <div class="wrap_search_btn">
                <%--<%=WebUtil.createButtonArea(currPgmNoByUri, "ct_")%>--%>
                <button>조회 버튼</button>
            </div>
        </div>
    </div>

    <div class="wrap_btn_group">
        <div class="btn_group">
            <div class="float_r ta_r">
                <%--<%=WebUtil.createButtonArea(currPgmNoByUri, "p_")%>--%>
                    <button>조회 버튼 2</button>
            </div>
        </div>
    </div>

    <div class="inner_cont2">
        <div class="wrap_result_group">
            <table id="grid_list" id="orderList"></table>
        </div>

        <div class="wrap_result_group">
            <table id="grid_list2"></table>
        </div>
        <div class="wrap_result_group">
            <div class="result_group">
                <div class="float_r">
                    <label class="point">공급가액</label>
                    <input type="text" class="w100 ta_right ipt_disable" id="amt" readonly/>
                    <label class="point ml10">세액</label>
                    <input type="text" class="w100 ta_right ipt_disable" id="vat" readonly/>
                    <label class="point ml10">공급총액</label>
                    <input type="text" class="w100 ta_right ipt_disable" id="tot_amt" readonly/>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### content end ##### -->

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
