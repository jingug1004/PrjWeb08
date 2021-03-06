<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-15
  Time: 오후 1:46
  To change this template use File | Settings | File Templates.
  조회를 처리하는 JSP의 경우 결과 데이터의 변수 이름이 'boardVO'라는 점을 주의하면서 작성.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../include/header.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> &lt;%&ndash;chart.js 플러그인&ndash;%&gt;--%>
<%--<script src="/resources/chartjs/Chart.bundle.js" type="text/javascript"></script>--%>
<%--<script src="/resources/chartjs/Chart.js" type="text/javascript"></script>--%>


<!-- Main content -->
<style type="text/css">
    .popup {
        position: absolute;
    }

    .back {
        background-color: gray;
        opacity: 0.5;
        width: 100%;
        height: 300%;
        overflow: hidden;
        z-index: 1101;
    }

    .front {
        z-index: 1110;
        opacity: 1;
        boarder: 1px;
        margin: auto;

        /* [CSS] 요소 및 레이어 중앙 정렬시키는 가장 쉽고 간단한 방법 start */
        position: fixed;
        left: 50%;
        top: 50%;

        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        /* https://webisfree.com/2016-03-09/[css]-%EC%9A%94%EC%86%8C-%EB%B0%8F-%EB%A0%88%EC%9D%B4%EC%96%B4-
        %EC%A4%91%EC%95%99-%EC%A0%95%EB%A0%AC%EC%8B%9C%ED%82%A4%EB%8A%94-%EA%B0%80%EC%9E%A5-%EC%89%BD%EA%B3%A0-
        %EA%B0%84%EB%8B%A8%ED%95%9C-%EB%B0%A9%EB%B2%95 end */
    }

    .show {
        position: relative;
        max-width: 1200px;
        max-height: 800px;
        overflow: auto;
    }

    .hoverInputRead:hover {
        /*border:10px;*/
        font-weight: bold;
        background-color: #aed9da;
    }

    /*
    color : 영문색상명 / RGB색상명 (글씨색)
    font-size : 절대크기인 pt/mm/cm/in, 상대크기인 px/%(기본100%)/em(배수)
    font-family :  글씨체명
    font-style : italic / normal (기울임꼴 여부)
    font-weight : bold / normal (굵은글꼴 여부)
    text-align : left / center / right (글자의 가로정렬)
    text-decoration : underline / none (글자밑줄 여부)
    [출처] [html/css] css(스타일시트) 기초 / font / a:link / a:hover / a:active / a:visited|작성자 솔부
    */
    .hoverInputReadAct {
        font-weight: bold;
        /*background-color: #aed9da;*/
        /*border: 5px solid #aed9da;*/
    }

    .disaClass:focus {
        cursor: not-allowed;
        /*background-color: #eee;*/
        /*filter: alpha(opacity=50);*/
        /*opacity: .5;*/
        /*!*cursor: default;*!*/
        /*user-select: none;*/
        /*!*disabled: true;*!*/
        /*visibility: collapse;*/
        disabled: true;
        opacity: 0;
        pointer-events: none;
    }

    /* CSS 이벤트 제어 속성 - pointer-events 출처: http://webclub.tistory.com/331 [Web Club] */

    /*canvas {*/
    /*-moz-user-select: none;*/
    /*-webkit-user-select: none;*/
    /*-ms-user-select: none;*/
    /*}*/

</style>

<div class='popup back' style="display:none;"></div>
<div id="popup_front" class='popup front' style="display:none;">
    <img id="popup_img">
</div>
<%-- 이미지를 보여주기 위해서 화면상에 숨겨져 있는 <div>를 작성하고, 이미지 파일명을 클릭하면 큰 크기로 보여주게 함. --%>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">${cateName}</h3>
                </div>
                <!-- /.box-header -->

                <form role="form" action="modifyPage" method="post">
                    <input type='hidden' name='bno' value="${boardVO.bno}">
                    <%-- 조회 화면의 경우 나중에 수정이나 삭제 작업에서 사용되기 때문에 반드시 원래 게시물 번호인 bno를 가지고 있어야만 함.
                    가장 먼저 선언된 <form> 태그를 보면 type='hidden'을 이용해서 bno 값을 처리하는 것을 볼 수 있음. --%>

                    <input id='cnumToList' type='hidden' name='cate' value="">
                    <%-- URL 전달하기 위한 jQuery().value(); 사용! --%>

                    <input type='hidden' name='page' value="${cri.page}">
                    <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
                    <%-- BoardController의 read 메소드 파라미터를 받아서 뿌려줄 <input>태그. 세 개의 정보를 다 가짐. --%>

                    <input type='hidden' name='searchType' value="${cri.searchType}">
                    <input type='hidden' name='keyword' value="${cri.keyword}">
                    <input type='hidden' name='loginid' value="${cri.loginid}">
                </form>

                <div class="box-body">
                    <div class="form-group">
                        <div style="display: inline; float: left; width: 100%;">
                            <div style="display: inline; float: left; width: 48%; margin-right: 1%">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/titleIcon.png" alt="">
                                    Title</label>
                                <input type="text" name='title' class="form-control" value="${boardVO.title}"
                                       readonly="readonly">
                                <%--조회 화면이므로 아예 사용자가 내용을 수정할 수 없도록 EL로 출력되는 부분에는 readonly 속성을 이용해서 사용자가 내용을 수정할 수 없도록 만들어 줌. 밑의 2개도 readonly--%>
                            </div>
                            <div id="divBoardip" style="display: inline; float: left; width: 16%; margin-right: 1%">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/ipIcon.png" alt="">
                                    ip</label>
                                <input id="boardip" type="text" name='boardip' class="form-control"
                                       value="${boardVO.boardip}"
                                       readonly="readonly" style="color: #aa1111">
                                <%--조회 화면이므로 아예 사용자가 내용을 수정할 수 없도록 EL로 출력되는 부분에는 readonly 속성을 이용해서 사용자가 내용을 수정할 수 없도록 만들어 줌. 밑의 2개도 readonly--%>
                            </div>
                            <div id="gbdiv" style="display: inline; float: left; width: 16%; margin-right: 1%">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/rateIcon.png" alt="">
                                    G/B</label>
                                <input id="gbcnt" type="text" name='gbtitle' class="form-control readgbcnt" value=""
                                       readonly="readonly" style="color: darkorange">
                                <%--조회 화면이므로 아예 사용자가 내용을 수정할 수 없도록 EL로 출력되는 부분에는 readonly 속성을 이용해서 사용자가 내용을 수정할 수 없도록 만들어 줌. 밑의 2개도 readonly--%>
                            </div>
                            <div style="display: inline; float: left; width: 17%;">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/viewIcon.png" alt="">
                                    View</label>
                                <input type="text" name='title' class="form-control readvcnt" value="${boardVO.viewcnt}"
                                       readonly="readonly" style="color: darkgray">
                                <%--조회 화면이므로 아예 사용자가 내용을 수정할 수 없도록 EL로 출력되는 부분에는 readonly 속성을 이용해서 사용자가 내용을 수정할 수 없도록 만들어 줌. 밑의 2개도 readonly--%>
                            </div>
                        </div>
                    </div>
                    <div></div>
                    <div class="form-group">
                        <%--@declare id="exampleinputpassword1"--%>
                        <label for="exampleInputPassword1">
                            <img src="/assets/img/colors/contentIcon.png" alt="">
                            Content</label>
                        <%--<textarea class="form-control" name="content" rows="25"--%>
                        <%--readonly="readonly">${boardVO.content}</textarea>--%>

                        <%-- CKEditor 사용 --%>
                        <textarea name="content" readonly="readonly" class="form-control" rows="200">
                            ${boardVO.content}</textarea>
                        <script>
                            CKEDITOR.replace('content');
                            CKEDITOR.config.height = 550;
                            CKEDITOR.config.width = 'auto';
                        </script>

                    </div>


                    <%--<div class="form-group">--%>
                    <%--<canvas id="myChartLeft" width="400" height="400"></canvas>--%>
                    <%--<canvas id="myChartRight" width="400" height="400"></canvas>--%>
                    <%--</div>--%>
                    <%--<button id="randomizeData">Randomize Data</button>--%>
                    <%--<button id="addDataset">Add Dataset</button>--%>
                    <%--<button id="removeDataset">Remove Dataset</button>--%>
                    <%--<button id="addData">Add Data</button>--%>
                    <%--<button id="removeData">Remove Data</button>--%>


                    <div class="form-group">
                        <div style="display:inline; float: left; width: 100%;">
                            <div style="display: inline; float: left; width: 19%; margin-right: 1%;">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/${boardVO.getcolor}.png" class="getColor" alt="">
                                    Writer</label>
                                <input type="text" name="writer" class="form-control"
                                       value="${boardVO.writer}" readonly="readonly">
                            </div>
                            <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/${boardVO.getcolor}.png" class="getColor" alt="">
                                    Level</label>
                                <input type="text" name="ucolorlevel" class="form-control"
                                       value="Lv.${boardVO.ucolorlevel}" readonly="readonly">
                            </div>
                            <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                <label for="exampleInputEmail1">
                                    <img src="/assets/img/colors/modify_U.png" class="getColor" alt="">
                                    Unify Total Level</label>
                                <input type="text" name="utotallevel" class="form-control"
                                       value="Lv.${boardVO.utotallevel}" readonly="readonly">
                            </div>

                            <%-- ---------------------------------------------------------------------------------- --%>

                            <%--<c:choose>--%>
                            <c:if test="${login.uid == goodCntVOGet && login.uid != badCntVOGet}">
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/goodIcon.png" alt="">
                                        Good</label>
                                    <input id="logGood" type="text" name="writer" class="form-control hoverInputReadAct"
                                           value="${boardVO.goodcnt}" readonly="readonly" style="color: green;"
                                           onclick="goodcntButton('${login.uid}')">
                                </div>
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/badIcon.png" alt="">
                                        Bad</label>
                                    <input id="logNoBad" type="text" name="writer"
                                           class="form-control hoverInputRead disaClass readbcnt"
                                           value="${boardVO.badcnt}" readonly="readonly" style="color: red;"
                                           onclick="badcntButton('${login.uid}')">
                                </div>
                            </c:if>
                            <c:if test="${login.uid == badCntVOGet && login.uid != goodCntVOGet}">
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/goodIcon.png" alt="">
                                        Good</label>
                                    <input id="logNoGood" type="text" name="writer"
                                           class="form-control hoverInputRead disaClass"
                                           value="${boardVO.goodcnt}" readonly="readonly" style="color: green;"
                                           onclick="goodcntButton('${login.uid}')">
                                </div>
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/badIcon.png" alt="">
                                        Bad</label>
                                    <input id="logBad" type="text" name="writer"
                                           class="form-control hoverInputReadAct readbcnt"
                                           value="${boardVO.badcnt}" readonly="readonly" style="color: red;"
                                           onclick="badcntButton('${login.uid}')">
                                </div>
                            </c:if>
                            <c:if test="${empty login.uid}">
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/goodIcon.png" alt="">
                                        Good</label>
                                    <input id="logNoGoodPage" type="text" name="writer"
                                           class="form-control hoverInputRead"
                                           value="${boardVO.goodcnt}" readonly="readonly" style="color: green;"
                                           onclick="goodcntButton('${login.uid}')">
                                </div>
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/badIcon.png" alt="">
                                        Bad</label>
                                    <input id="logNoBadPage" type="text" name="writer"
                                           class="form-control hoverInputRead readbcnt"
                                           value="${boardVO.badcnt}" readonly="readonly" style="color: red;"
                                           onclick="badcntButton('${login.uid}')">
                                </div>
                            </c:if>
                            <c:if test="${not empty login.uid && empty goodCntVOGet && empty badCntVOGet}">
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/goodIcon.png" alt="">
                                        Good</label>
                                    <input id="logNoGoodPage02" type="text" name="writer"
                                           class="form-control hoverInputRead"
                                           value="${boardVO.goodcnt}" readonly="readonly" style="color: green;"
                                           onclick="goodcntButton('${login.uid}')">
                                </div>
                                <div style="display: inline; float: left; width: 15%; margin-right: 1%;">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/badIcon.png" alt="">
                                        Bad</label>
                                    <input id="logNoBadPage02" type="text" name="writer"
                                           class="form-control hoverInputRead readbcnt"
                                           value="${boardVO.badcnt}" readonly="readonly" style="color: red;"
                                           onclick="badcntButton('${login.uid}')">
                                </div>
                            </c:if>

                            <%-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>

                            <c:if test="${login.uid == spamCntVOGet && not empty login.uid}">
                                <div style="display: inline; float: left; width: 16%">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/spamIcon.png" alt="">
                                        Spam</label>
                                    <input id="logSpam" type="text" name="writer"
                                           class="form-control hoverInputReadAct readscnt"
                                           value="${boardVO.spamcnt}" readonly="readonly" style="color: orange;"
                                           onclick="spamcntButton('${login.uid}')">
                                </div>
                            </c:if>
                            <c:if test="${empty login.uid}">
                                <div style="display: inline; float: left; width: 16%">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/spamIcon.png" alt="">
                                        Spam</label>
                                    <input id="logNoSpam" type="text" name="writer"
                                           class="form-control hoverInputRead readscnt"
                                           value="${boardVO.spamcnt}" readonly="readonly" style="color: orange;"
                                           onclick="spamcntButton('${login.uid}')">
                                </div>
                            </c:if>
                            <c:if test="${not empty login.uid && login.uid != spamCntVOGet}">
                                <div style="display: inline; float: left; width: 16%">
                                    <label for="exampleInputEmail1">
                                        <img src="/assets/img/colors/spamIcon.png" alt="">
                                        Spam</label>
                                    <input id="logSpamPage" type="text" name="writer"
                                           class="form-control hoverInputRead readscnt"
                                           value="${boardVO.spamcnt}" readonly="readonly" style="color: orange;"
                                           onclick="spamcntButton('${login.uid}')">
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- /.box-body -->
                <div class="box-footer text-right">

                    <div>
                        <hr/>
                    </div>

                    <%-- 첨부파일 되어있을 때 보여지는 위치 // 클래스 uploadedList에 의하여 --%>
                    <ul class="mailbox-attachments clearfix uploadedList"></ul>
                    <%--조회 페이지에서 기존에 업로드 된 파일들이 보여질 수 있는 영역을 작성하고, upload.js와 handlebars를 설정.--%>

                    <c:if test="${login.nickname == boardVO.writer}">
                        <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
                        <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
                    </c:if>
                    <a name="goListBtnTest"></a>
                    <%--<button &lt;%&ndash;type="submit" &ndash;%&gt;name="goListBtn" class="btn btn-primary" id="goListBtn01">메뉴</button>--%>
                    <%--<button &lt;%&ndash;type="submit"&ndash;%&gt;name="goListBtn" class="btn btn-primary" id="goListBtn02">메뉴</button>--%>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!--/.col (left) -->

    </div>
    <!-- /.row -->

    <div class="row">
        <div class="col-md-12">

            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">댓글</h3>
                </div>
                <c:if test="${not empty login}">
                    <div class="box-body">
                            <%--@declare id="exampleinputemail1"--%>
                        <input type="hidden" value="${login.uid}" id="newReplyerID">
                        <label for="exampleInputEmail1">
                            <img src="/assets/img/colors/${login.uday}.png" class="getColor" alt="">
                            Writer</label> <%-- 댓글 등록 --%>
                        <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"
                               value="${login.nickname}" readonly="readonly">
                        <label for="exampleInputEmail1">Reply</label>
                        <input class="form-control" type="text" placeholder="Reply TEXT" id="newReplyText">
                        <input type="hidden" value="${login.uday}" id="newReplyColor">
                    </div>
                    <!--/.box-body-->

                    <div class="box-footer text-right">
                        <button type="submit" class="btn btn-primary" id="replyAddBtn">
                            댓글 추가
                        </button>
                    </div>
                </c:if>

                <c:if test="${empty login}">
                    <div class="box-body">
                        <div><a href="javascript:goLogin();">로그인 하셔야 댓글을 달 수 있습니다.</a></div>
                    </div>
                </c:if>
            </div>
            <%--댓글의 등록에 필요한 <div>--%>

            <%--<!-- The time line -->--%>
            <%--<ul class="timeline">--%>
            <%--&lt;%&ndash;<ul class="dropdown-menu">&ndash;%&gt;--%>
            <%--<!-- timeline time label -->--%>
            <%--<li class="time-label" id="repliesDiv"><span class="bg-green">--%>
            <%--&lt;%&ndash;<li class="activ" id="repliesDiv">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<span class="bg-green">&ndash;%&gt;--%>
            <%--Replies List</span></li>--%>
            <%--</ul>--%>

            <!-- The time line -->
            <ul class="timeline">
                <!-- timeline time label -->
                <li class="time-label" id="repliesDiv">
                    <span class="bg-green">
                        댓글 리스트 <small id='replycntSmall'> [ ${boardVO.replycnt} ]
                    </small></span>
                </li>
            </ul>

            <%-- 페이징 --%>
            <div class='text-center'>
                <ul id="pagination" class="pagination pagination-sm no-margin ">
                </ul>
            </div>
            <%--댓글의 목록과 페이징 처리에 필요한 <div>--%>

        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- 글 수정 Modal -->
    <div id="modifyModal" class="modal modal-primary fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body" data-rno>
                    <p><input type="text" id="replytext" class="form-control"></p>
                </div>
                <div class="modal-footer text-right">
                    <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
                    <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->


<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>

<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<!--
[현상] : 눌러도 아무런 동작을 하지 않음. 콘솔창에도 넘어가는 받는 데이터가 없음. 찍히는 값도 확인 안 됐음. ㅠ_ㅠ
[예상] : 이건(<script>) 다른 소스와 연결된 문제가 없을 것이다 왜냐하면 아무런 데이터를 주고 받는 것이 포착되지 않으니깐.
[해결] : "1. 스크립트 부분을 헤더에 두지말고 Html 라인 제일 아래에 위치 변경해보세요~" 맨 밑에 위치시켰음!
"2. 제이쿼리 라이브러리 선언은 하셨나요?" 아니오!!!
"<script src="http://code.jquery.com/jquery-latest.js"></script>
스크립트 호출 전에 넣어주시죠. 브라우저에 로딩하는 페이지에 jquery.js 파일이 빠진 듯합니다. " 감사합니다. 이제 되네요. ^^
"3. 이것도 써보실래요?
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
" 이것도 됩니다. 감사합니다. 뭐가 더 좋고 뭔 차이가 있는지 알아보고 싶지만 시간이 없어서.. 2번으로 써야겠네요.
-->

<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>

<%-- 등록된 첨부파일 보이게 하는 스크립트 --%>
<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{fullName}}'>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            </span>
        </div>
    </li>
</script>


<%--<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
<div class="timeline-item">
<span class="time">
<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
</span>
<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
<div class="timeline-body">{{replytext}}</div>
<div class="timeline-footer">
<a class="btn btn-primary btn-xs"
data-toggle="modal" data-target="#modifyModal">Modify</a>
</div>
</div>
</li>
{{/each}}
</script>--%>

<%-- 등록된 댓글 리스트 보이게 하는 스크립트 --%>
<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-rno={{rno}}>
        <i class="fa fa-comments bg-blue"></i>
        <div class="timeline-item">
                <span class="time">
                  <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                    <%--'prettifyDate regdate'에는 handlebar의 기능을 확장하는 자바스크립트 방법의 예로 사용. --%>
                </span>
            <span class="time">
                  <i class="fa"></i>{{replyip}}
                </span>
            <h3 class="timeline-header"><strong>{{rno}}</strong>
                <img src="/assets/img/colors/{{bringreplycolor}}.png" id="getColor" alt="">
                {{replyer}}</h3>
            <div class="timeline-body">{{replytext}}</div>
            <div class="timeline-footer">
                {{#eqReplyer replyer }}
                <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">댓글 수정</a>
                {{/eqReplyer}}
            </div>
        </div>
    </li>
    {{/each}}
</script>
<%-- handlebars를 사용해서 화면에 반복적으로 처리되는 템플릿 코드를 처리할 수 있고, 서버에서는 댓글의 목록과 댓글의 리스트 데이터를 한 번에 전송해 줄 수 있음. --%>

<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>
<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>
<script>

    Handlebars.registerHelper("eqReplyer", function (replyer, block) {
        var accum = '';
        if (replyer == '${login.nickname}') {
            accum += block.fn();
        }
        return accum;
    });

    Handlebars.registerHelper("prettifyDate", function (timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        return year + "/" + month + "/" + date;
    });
    // handlebars는 helper라는 기능을 이용해서 데이터의 상세한 처리에 필요한 기능등을 처리.

    var printData = function (replyArr, target, templateObject) {

        var template = Handlebars.compile(templateObject.html());

        var html = template(replyArr);
        $(".replyLi").remove();
        target.after(html);
    };

    var bno = ${boardVO.bno};
    // 가장 먼저 선언된 var bno는 JSP에 처리되는 문자열로 해당 게시물의 번호를 의미.

    var replyPage = 1;
    // 수정이나 삭제 작업 이후에 사용자가 보던 댓글의 페이지 번호를 가지고 다시 목록을 출력하기 위해서 유지되는 데이터.

    //    function getPage(pageInfo) {
    //
    //        $.getJSON(pageInfo, function (data) {
    //            printData(data.list, $("#repliesDiv"), $('#template'));
    //            printPaging(data.pageMaker, $(".pagination"));
    //
    //            $("#modifyModal").modal('hide');

    //            http://localhost:8080/sboard/readPage?page=1&perPageNum=10&searchType=&keyword=&bno=1529
    //            게시물 클릭해서 들어가서 댓글 수정 및 삭제하면 모달(검은 화면에서 처리된 후 리스트로)이 안 없어졌는데 이제 없어짐!
    //        });

    function getPage(pageInfo) {

        $.getJSON(pageInfo, function (data) {
            printData(data.list, $("#repliesDiv"), $('#template'));
            printPaging(data.pageMaker, $(".pagination"));

            $("#modifyModal").modal('hide');
            $("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");

        });
    }

    // getPage()는 특정한 게시물에 대한 페이징 처리를 위해서 호출되는 함수. 내부적으로 jQuery를 이용해서 JSON 타입의 데이터를 처리.
    // getPage()는 페이지 번호를 파라미터로 전달받고, jQuery의 getJSON()을 이용해서 댓글의 목록 데이터를 처리. 댓글의 목록 데이터는 'pageMaker'와 'list'로 구성되므로 이를 printPaging()과 printData()에서 처리.
    var printPaging = function (pageMaker, target) {

        var str = "";

        if (pageMaker.prev) {
            str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.cri.page == i ? 'class=active' : '';
            str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
        }

        if (pageMaker.next) {
            str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
        }

        target.html(str);
    };

    $("#repliesDiv").on("click", function () {

        if ($(".timeline li").size() > 1) {
            return;
        }
        getPage("/replies/" + bno + "/1");
    });
    // 목록의 size()를 체크하는 코드는 목록을 가져오는 버튼이 보여지는 <li>만 있는 경우에 1 페이지의 댓글 목록을 가져오기 위해서 처리한 코드.

    $(".pagination").on("click", "li a", function (event) {

        event.preventDefault();

        replyPage = $(this).attr("href");

        getPage("/replies/" + bno + "/" + replyPage);

    });
    // 각 링크에는 <li> 태그와 <a> 태그로 구성되고, 이에 대한 이벤트 처리.

    // 댓글에 대한 Ajax 및 모달 처리
    $("#replyAddBtn").on("click", function () {

        var replyerIDObj = $("#newReplyerID");
        var replyerObj = $("#newReplyWriter");
        var replytextObj = $("#newReplyText");
        var bringreplycolorObj = $("#newReplyColor");
        var replyerID = replyerIDObj.val();
        var replyer = replyerObj.val();
        var replytext = replytextObj.val();
        var bringreplycolor = bringreplycolorObj.val();

        $.ajax({
            type: 'post',
            url: '/replies/',
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({
                rid: replyerID,
                bno: bno,
                replyer: replyer,
                replytext: replytext,
                bringreplycolor: bringreplycolor
            }),
            success: function (result) {
                console.log("result: " + result);
                if (result == 'SUCCESS') {
                    alert("등록 되었습니다.");
                    replyPage = 1;
                    getPage("/replies/" + bno + "/" + replyPage);
//                    replyerObj.val("");
//                    replytextObj.val("");
                    replyerObj.val("${login.nickname}");
                    replytextObj.val("");
                    <%--replyerObj.val("${login.nickname}"); 이게 정확하게 잘 돌아감 -> 댓글의 댓글을 달아도 계속 Writer 유지 됨--%>
                }
            }
        });
        // 서버에서 등록 처리에 대한 결과를 문자열로 받고, 이를 보여주고 나서 사용자의 현재 페이지 번호는 1페이지로 변경하고, 댓글의 페이지를 조회.
    });


    $(".timeline").on("click", ".replyLi", function (event) {

        var reply = $(this);

        $("#replytext").val(reply.find('.timeline-body').text());
        $(".modal-title").html(reply.attr("data-rno"));

    });
    // 'data-'로 시작하는 커스텀 속성을 활용해서 'modifyModal' 아이디에 속하는 <div>를 화면에 보이게 처리.


    $("#replyModBtn").on("click", function () {

        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();

        $.ajax({
            type: 'put',
            url: '/replies/' + rno,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "PUT"
            },
            data: JSON.stringify({
                replytext: replytext
            }),
            dataType: 'text',
            success: function (result) {
                console.log("result: " + result);
                if (result == 'SUCCESS') {
                    alert("수정 되었습니다.");
                    getPage("/replies/" + bno + "/" + replyPage);
                }
            }
        });
    });

    $("#replyDelBtn").on("click", function () {

        var rno = $(".modal-title").html();
        var replytext = $("#replytext").val();

        $.ajax({
            type: 'delete',
            url: '/replies/' + rno,
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "DELETE"
            },
            dataType: 'text',
            success: function (result) {
                console.log("result: " + result);
                if (result == 'SUCCESS') {
                    alert("삭제 되었습니다.");
                    getPage("/replies/" + bno + "/" + replyPage);
                }
            }
        });
    });
    <%--

    </script>


    <script>
    --%>

    //    $('.readgbcnt').val().number(true);
    //    $('.readvcnt').val().number(true);
    //
    //    $('.readgcnt').val().number(true);
    //    $('.readbcnt').val().number(true);
    //
    //    $('.readscnt').val().number(true);


    function getUrlParamsCnt() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
            params[key] = value;
        });
        return params;
    }
    //    $("#cnumToList").val(getUrlParamsCnt().cate);

    //    window.onload = function() {
    //        var oParamsCnt = getUrlParamsCnt();
    //    };

    $(document).ready(function () {

        <%--alert("lllll~~~~~ ${login.uid} : " + ${login.uid});--%>
        <%--alert("lllll~~~~~ ${goodCntVOGet.goodcntuid} : " + ${goodCntVOGet.goodcntuid});--%>

        <%--console.log("lllll~~~~~ ${login.uid} : " + ${login.uid});--%>
        <%--console.log("lllll~~~~~ ${goodCntVOGet.goodcntuid} : " + ${goodCntVOGet.goodcntuid});--%>

        // readPage(상세페이지)의 g/b 넘버 포맷팅
        // fixme: list.jsp의 넘버 포맷팅은 됨(태그 안에 없으면) 그러나 readPage.jsp의 포맷팅은 안 됨(input 안에 포맷팅 디버깅 해야함)
        var gbcntRate = Math.round(${boardVO.gbcnt});           // 링크 : http://fillin.tistory.com/88
        // $("input[type=text][name=gbtitle]").val(gbcntRate);
        $("input[type=text][name=gbtitle]").val(gbcntRate);
//        var ss = $("input[type=text][name=gbtitle]").val(gbcntRate).number(true);

        console.log("gbcntRate : " + gbcntRate);

        <%--function formatting() {--%>
        <%--var gbcntRate = Math.round(${boardVO.gbcnt});           // 링크 : http://fillin.tistory.com/88--%>

        <%--var ss = $("input[type=text][name=gbtitle]").val(gbcntRate).number(true);--%>

        <%--return ss;--%>

        <%--console.log("gbcntRate : " + gbcntRate);--%>
        <%--console.log("ss : " + ss);--%>
        <%--}--%>

        var formObj = $("form[role='form']");
        // formObj는 위에 선언된 <form> 태그를 의미하게 됨. <input type='hidden' name='bno' value="${boardVO.bno}~${cri.keyword}">

        // console.log(formObj);

        <%--Tip01.게시물 댓글 페이지(리스트) 클릭 안하고 바로 보여주고 싶을 때 --%>
        <%--var bno = ${boardVO.bno};--%>

        <%--getPage("/replies/"+bno+"/1");--%>
        <%-- --------------------------------------------------- --%>

        function getUrlParams() {
            var params = {};
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
                params[key] = value;
            });
            return params;
        }
        $("#cnumToList").val(getUrlParams().cate);

        window.onload = function () {
            var oParams = getUrlParams();
        };

        // 수정버튼 클릭
        $("#modifyBtn").on("click", function () {
            formObj.attr("action", "/sboard/modifyPage");
            formObj.attr("method", "get");
            formObj.submit();
        });

        /* 	$("#removeBtn").on("click", function(){
         formObj.attr("action", "/sboard/removePage");
         formObj.submit();
         }); */

        $("#removeBtn").on("click", function () {

            var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g, "");

            if (replyCnt > 0) {
                alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
                return;
            }

            var arr = [];
            $(".uploadedList li").each(function (index) {
                arr.push($(this).attr("data-src"));
            });

            if (arr.length > 0) {
                $.post("/deleteAllFiles", {files: arr}, function () {

                });
            }

            formObj.attr("action", "/sboard/removePage");
            formObj.submit();
        });
        // 현재 첨부파일의 이름을 배열로 작성해서 UploadController에 Ajax 방식으로 첨부파일에 대한 삭제를 지시.
        // 첨부파일 삭제 이후에 바로 <form> 태그를 이용해서 데이터베이스의 삭제를 처리할 것이므로, 성공이나 실패를 기다리지 않고, 바로 '/sboard/removePage'를 호출하는 형태로 작성.

        var goListBtn01 = '<button type="submit" name="goListBtn" class="btn" id="goListBtn01">목록1</button>';
        var goListBtn02 = '<button type="submit" name="goListBtn" class="btn" id="goListBtn02">목록2</button>';
        var goListBtn03 = '<button type="submit" name="goListBtn" class="btn" id="goListBtn03">목록3</button>';

        function validMenuInReadPage() {
//            if (getUrlParams().keyword == null && getUrlParams().cate != 0) {
            if (!getUrlParams().cate.match("backList02") && !getUrlParams().cate.match("backList03")) {
                $('a[name = "goListBtnTest"]').html(goListBtn01);   // cate에서 글 읽기(Read) 들어갔을 때
            } else if (getUrlParams().cate.match("backList02")) {
                $('a[name = "goListBtnTest"]').html(goListBtn02);   // listAny에서 글 읽기(Read) 들어갔을 때
//            } else if (getUrlParams().loginid != null && getUrlParams().keyword == null && getUrlParams().cate == 0) {
            } else if (getUrlParams().cate.match("backList03")) {
                $('a[name = "goListBtnTest"]').html(goListBtn03);   // 회원 상세페이지에서 들어갔을 때
            }
        }

        validMenuInReadPage();

        $("#goListBtn01").on("click", function () {

            // 전체 검색 했을 때 뒤로가기 누르면 /sboard/list 로 매핑 호출되면 안 되기 때문에.
            formObj.attr("method", "get");
            formObj.attr("action", "/sboard/list?cate=" + getUrlParams().cate);
            formObj.submit();
            // history.back();
        });

        $("#goListBtn02").on("click", function () {

            // 전체 검색 했을 때 뒤로가기 누르면 /sboard/list 로 매핑 호출되면 안 되기 때문에.
            formObj.attr("method", "get");
            formObj.attr("action", "/sboard/listAny?keyword=" + getUrlParams().keyword);
            formObj.submit();
            // history.back();
        });

        $("#goListBtn03").on("click", function () {

            // 전체 검색 했을 때 뒤로가기 누르면 /sboard/list 로 매핑 호출되면 안 되기 때문에.
            formObj.attr("method", "get");
            formObj.attr("action", "/userInfo/userInfoList?loginid=" + getUrlParams().loginid);
            formObj.submit();
            // history.back();
        });


//        "{boardVO.bno}", "{cri.page}", "{cri.perPageNum}" 의 정보를 이용하는 방식으로 변경 되었음.

//        $.getJSON("/replies/all/" + bno, function (data) {
//            //console.log(data.length);
////            var str = "";
////
////            $(data).each(function () {
////                str += "<li data-rno='" + this.rno + "' class='replyLi'>"
////                    + this.rno
////                    + ":"
////                    + this.replytext
////                    + "<button>MOD</button></li>";
////            });
//
//            $("#replycntSmall").data.length;
//        });

        var bno02 = ${boardVO.bno};
        var template = Handlebars.compile($("#templateAttach").html());

        $.getJSON("/sboard/getAttach/" + bno02, function (list) {
            $(list).each(function () {

                var fileInfo = getFileInfo(this);

                var html = template(fileInfo);

                $(".uploadedList").append(html);

            });
        });
        // 컨트롤러에서 문자열의 리스트를 반환하기 때문에 JSON 형태의 데이터를 전송하게 되고 이를 getJSON()을 이용해서 처리.
        // 데이터를 화면에 보여주는 부분은 등록하는 부분과 동일.

        $(".uploadedList").on("click", ".mailbox-attachment-info a", function (event) {

            var fileLink = $(this).attr("href");

            if (checkImageType(fileLink)) {

                event.preventDefault();
                // 사용자가 첨부파일의 제목을 클릭한 경우 해당 파일이 이미지인지 체크하면, 화면 이동을 못하도록 event.preventDefault()로 처리.

                var imgTag = $("#popup_img");
                imgTag.attr("src", fileLink);
                // 현재 클릭한 이미지의 경로를 id 속성값이 'popup_img'인 요소에 추가.

                console.log(imgTag.attr("src"));

                $(".popup").show('slow');
                imgTag.addClass("show");
                // 추가된 뒤에 화면에 보이도록 jQuery의 show()를 호출, 필요한 경우 CSS를 추가.
            }
        });

        $("#popup_img").on("click", function () {

            $(".popup").hide('slow');
            // 화면에 원본 이미지가 보여진 후 다시 한번 사용자가 클릭하면 이미지가 사라지는 효과를 처리.

        });

//        var ctx = document.getElementById("chart-area").getContext("2d");
//        window.myDoughnut = new Chart(ctx, config);
    });
    // end. $(document).ready(function () {

    <%-- goodcnt, badcnt, spamcnt 로그인 시 클릭되어 +1 되게! --%>

    function goodcntButton(loginUid) {

        if (loginUid) {

            var urlParam = getUrlParamsCnt().bno;
            var urlLoginSession = loginUid;
            var urlGood = 'Good';

            var temp = '';

            var urlTemp = temp.concat(urlParam, urlLoginSession, urlGood);

            $.ajax({
                type: 'post',
                url: '/cnt/goodcntpush',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    goodcntbno: urlParam,
                    goodcntuid: urlLoginSession,
                    goodcnttemp: urlTemp
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == 'SUCCESS') {
                        alert("urlParam : " + urlParam + " // urlLoginSession : " + urlLoginSession + " // urlParam : " + urlTemp);
                        console.log("goodcnttemp : " + urlTemp);

                        $('#logNoBadPage02').toggleClass('disaClass');
                        $('#logNoGoodPage02').toggleClass('hoverInputRead');
                        $('#logNoGoodPage02').toggleClass('hoverInputReadAct');
                    }
                }
            });
        }
    }

    function badcntButton(loginUid) {

        if (loginUid) {

            var urlParam = getUrlParamsCnt().bno;
            var urlLoginSession = loginUid;
            var urlBad = 'Bad';

            var temp = '';

            var urlTemp = temp.concat(urlParam, urlLoginSession, urlBad);

            $.ajax({
                type: 'post',
                url: '/cnt/badcntpush',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    goodcntbno: urlParam,
                    badcntuid: urlLoginSession,
                    badcnttemp: urlTemp
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == 'SUCCESS') {
                        alert("urlParam : " + urlParam + " // urlLoginSession : " + urlLoginSession + " // urlParam : " + urlTemp);
                        console.log("goodcnttemp : " + urlTemp);

                        $('#logNoGoodPage02').toggleClass('disaClass');
                        $('#logNoBadPage02').toggleClass('hoverInputRead');
                        $('#logNoBadPage02').toggleClass('hoverInputReadAct');
                    }
                }
            });
        }
    }

    function spamcntButton(loginUid) {

        if (loginUid) {
//            alert("스팸 씨앤티! 02" + loginNickname);
//            console.log("스팸 씨앤티! 02" + loginNickname);

            var urlParam = getUrlParamsCnt().bno;
            var urlLoginSession = loginUid;
            var urlSpam = 'Spam';

            var temp = '';

            var urlTemp = temp.concat(urlParam, urlLoginSession, urlSpam);

            $.ajax({
                type: 'post',
                url: '/cnt/spamcntpush',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "POST"
                },
                dataType: 'text',
                data: JSON.stringify({
                    goodcntbno: urlParam,
                    spamcntuid: urlLoginSession,
                    spamcnttemp: urlTemp
                }),
                success: function (result) {
                    console.log("result : " + result);
                    if (result == 'SUCCESS') {
                        alert("urlParam : " + urlParam + " // urlLoginSession : " + urlLoginSession + " // urlParam : " + urlTemp);
                        console.log("spamcnttemp : " + urlTemp);

//                        $('#').toggleClass('disaClass');
                        $('#logSpamPage').toggleClass('hoverInputReadAct');
                        $('#logSpam').toggleClass('hoverInputRead');

                    }
                }
            });
        }
    }

    function goLogin() {
        self.location = "/user/login";
    }
</script>

<%@include file="../include/footer.jsp" %>