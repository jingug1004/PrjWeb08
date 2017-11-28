<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>

<head lang="en">

    <meta charset="UTF-8">

    <title></title>

        <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgridui/jquery-ui.theme.css" />

        <script src="/resources/jqgrid/js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="/resources/jqgridui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
        <script src="/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

</head>

<body>

<table id="list4"></table>
<h3>start시작04</h3>

</body>

<script>
    $(function(){

        // 변수 선언
        var i, max, myData, grid = $("#list4");

        // grid 설정
        grid.jqGrid({
            datatype: "local",
            height: 'auto',
            colNames:['Inv No 넘버','Date 날짜', 'Client 클라', 'Amount 양','Tax 세금','Total 합','Notes 비고'],
            colModel:[
                {name:'id',     index:'id',      width:100,  sorttype:"int"},
                {name:'invdate',index:'invdate', width:90,  sorttype:"date"},
                {name:'name',   index:'name',    width:100},
                {name:'amount', index:'amount',  width:80,  align:"right",sorttype:"float"},
                {name:'tax',    index:'tax',     width:80,  align:"right",sorttype:"float"},
                {name:'total',  index:'total',   width:80,  align:"right",sorttype:"float"},
                {name:'note',   index:'note',    width:150, sortable:false}
            ],
            multiselect: true,
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
            {id:"9",invdate:"2007-09-01",name:"test3",  note:"note3",   amount:"400.00",tax:"30.00",total:"430.00"}
        ];

        // 데이터 추가
        for (i = 0, max = myData.length; i <= max; i++) {
            grid.jqGrid('addRowData', i + 1, myData[i]);
        }
    });

</script>

</html>


