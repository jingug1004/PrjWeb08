<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ page session="false" %>--%>

<%@include file="../include/header.jsp" %>

<!--=== Breadcrumbs v4 ===-->
<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name">게시판 리스트 페이지</span>
        <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="">Product</a></li>
            <li class="active">Product Filter Page</li>
        </ul>
    </div><!--/end container-->
</div>
<!--=== End Breadcrumbs v4 ===-->

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->

            <%-- 전체 검색하면 검색 버튼 및 기능 안보임 --%>
            <c:if test="${not empty pageMaker}">
                <div class='box'>
                    <div class="box-header with-border">
                            <%--<h3 class="box-title">Board List</h3>--%>
                        <h3 class="box-title">${cateName}</h3>
                    </div>

                    <div class='box-body text-right'>
                        <select name="searchType" class="form-control-static">
                                <%-- 옵션 기본값으로 하고 싶을 때 맨 상위를 주석으로 처리해서 제목이 기본값으로 보이게! --%>
                                <%--<option value="n"--%>
                                <%--<c:out value="${cri.searchType == null?'selected':''}"/>>--%>
                                <%--검색 옵션--%>
                                <%--</option>--%>
                            <option value="t"
                                    <c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>
                                제목
                            </option>
                            <option value="c"
                                    <c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>
                                내용
                            </option>
                            <option value="w"
                                    <c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>
                                작성자
                            </option>

                            <option value="tc"
                                    <c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>
                                제목 or 내용
                            </option>
                            <option value="cw"
                                    <c:out value="${cri.searchType eq 'cw' ? 'selected' : ''}"/>>
                                내용 or 작성자
                            </option>
                            <option value="tcw"
                                    <c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}"/>>
                                제목 or 내용 or 작성자
                            </option>
                        </select>

                        <input type="text" name='keyword' id="keywordInputCate" value='${cri.keyword}' class="form-control-static">
                            <%--<button id='newBtn'>글 쓰기0</button>--%>
                            <%--<button id='searchBtn01' class="btn btn-primary">검색</button>--%>
                        <button id='searchBtn01' class="btn">검색</button>
                    </div>
                </div>
            </c:if>

            <div class="box">
                <div class="box-header with-border">
                    <%--<h3 class="box-title">LIST</h3>--%>
                    <h3 class="box-title"></h3>
                </div>

                <div class="breadcrumbs-v5">
                    <div class="container">
                        <ul class="breadcrumb-v5">
                            <%--<li><a href="/sort/realPopular">실시간 인기</a></li>--%>
                            <li><a id="realPopular">실시간 인기</a></li>
                            <li id="liDailyPopular"><a id="dailyPopular">일간 인기</a></li>
                            <li><a href="/blog/daily/rankCv">주간 인기</a></li>
                            <li><a href="/blog/daily/referer">월간 인기</a></li>
                            <c:if test="${not empty login}">
                                <li><a id="samePopular"><img src="/assets/img/colors/${login.uday}.png"
                                                                    id="getColor02"
                                                                    alt="">${login.ugender}</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>

                <div class="box-body">
                    <table class="table table-bordered">
                        <tr>
                            <th style="width: 10px; text-align: center;">BNO</th>
                            <th>TITLE</th>
                            <th style="width: 40px; text-align: center;" id="goodSort">Good</th>
                            <th style="width: 40px; text-align: center;" id="gbSort">G/B</th>
                            <th style="width: 40px;  text-align: center;" id="badSort">Bad</th>
                            <th style="width: 240px; text-align: center;">WRITER</th>
                            <th style="width: 100px; text-align: center;">REGDATE</th>
                            <th style="width: 40px; text-align: center;" id="spamSort">Spam</th>
                            <th style="width: 40px; text-align: center;" id="viewSort">VIEW</th>
                        </tr>

                        <%--<c:forEach items="${list}" var="boardVO">--%>

                        <%--<tr>--%>
                        <%--<td>${boardVO.bno}</td>--%>
                        <%--<td><a--%>
                        <%--href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>--%>
                        <%--${boardVO.title} </a></td>--%>
                        <%--<td>${boardVO.writer}</td>--%>
                        <%--<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"--%>
                        <%--value="${boardVO.regdate}"/></td>--%>
                        <%--<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>--%>
                        <%--</tr>--%>

                        <%--</c:forEach>--%>

                        <%-- 상위 헤더의 일반적으로 메뉴를 클릭하고 들어왔을 때의 list --%>
                        <c:forEach items="${list}" var="boardVO" varStatus="itr">
                            <tr>
                                <%-- 작성자 칼라 색깔을 가져오기 위한 input hidden --%>
                                <input type="hidden" id="bringBoardVOgetcolor" value=${boardVO.getcolor}>

                                <td align="center">${boardVO.bno}</td>
                                <td>
                                    <a href='/sboard/readPa${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}' class="cookieBoardPOST">
                                            ${boardVO.title}
                                        <c:if test="${boardVO.replycnt > 0}">
                                            <strong>[ ${boardVO.replycnt} ]</strong>
                                        </c:if>
                                    </a>
                                </td>
                                <td align="right"><span class="badge bg-green-gradient center listgcnt">${boardVO.goodcnt}</span>
                                </td>
                                <td align="right"><span
                                        class="badge bg-yellow-gradient center listgbcnt">${boardVO.gbcnt}</span></td>
                                <td align="right"><span class="badge bg-red-gradient center listbcnt">${boardVO.badcnt}</span>
                                </td>
                                    <%--<td align="left"><img src="/assets/img/colors/001.png" id="getColor" alt="">--%>
                                    <%--${boardVO.getcolor} // ${boardVO.writer}--%>
                                    <%--</td>--%>
                                <td align="left" class="getBoardId" id="${boardVO.id}"><img src="/assets/img/colors/${boardVO.getcolor}.png" alt="">
                                        ${boardVO.writer}
                                        <%-- 게시글 작성글의 아이디를 통하여 가져오는 input hidden --%>
                                    <%--<input type="hidden" id="bringBoardVOgetId" value=${boardVO.id}>            &lt;%&ndash; 게시판 글의 아이디 클릭했을 때 아이디 값 가져옴 &ndash;%&gt;--%>
                                </td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.regdate}"/></td>
                                <td align="right"><span class="badge bg-orange-active center listscnt">${boardVO.spamcnt}</span>
                                </td>
                                <td align="right"><span class="badge bg-gray-light center listvcnt">${boardVO.viewcnt}</span>
                                </td>
                            </tr>
                        </c:forEach>

                        <%-- listAny 전체 아이템 검색 / 반복문을 통한 리스트 목록 --%>
                        <c:forEach items="${listAny}" var="boardVO" varStatus="itr">
                            <tr>
                                <%-- 작성자 칼라 색깔을 가져오기 위한 --%>
                                <input type="hidden" id="bringBoardVOgetcolor" value=${boardVO.getcolor}>
                                <td align="center">${boardVO.bno}</td>
                                <td>
                                    <a href='/sboard/readPage${pageMakerAny.makeSearchAll(pageMakerAny.criListAny.page)}&bno=${boardVO.bno}' class="cookieBoardPOST">
                                            ${boardVO.title}
                                        <c:if test="${boardVO.replycnt > 0}">
                                            <strong>[ ${boardVO.replycnt} ]</strong>
                                        </c:if>
                                    </a>
                                </td>
                                <td align="right"><span class="badge bg-green-gradient center listgcnt">${boardVO.goodcnt}</span>
                                </td>
                                <td align="right"><span
                                        class="badge bg-yellow-gradient center listgbcnt">${boardVO.gbcnt}</span></td>
                                <td align="right"><span class="badge bg-red-gradient center listbcnt">${boardVO.badcnt}</span>
                                </td>
                                <td align="left" class="getBoardIdAny" id="${boardVO.id}"><img src="/assets/img/colors/${boardVO.getcolor}.png" id="getColor" alt="">
                                        ${boardVO.writer}
                                        <%-- 게시글 작성글의 아이디를 통하여 가져오는 input hidden --%>
                                    <%--<input type="hidden" id="bringBoardVOgetId" value=${boardVO.id}>            &lt;%&ndash; 게시판 글의 아이디 클릭했을 때 아이디 값 가져옴 &ndash;%&gt;--%>
                                </td>
                                    <%--<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"--%>
                                <td align="center"><fmt:formatDate value="${boardVO.regdate}"
                                                                   pattern="yyyy-MM-dd"/></td>
                                <td align="right"><span class="badge bg-orange-active center listscnt">${boardVO.spamcnt}</span>
                                </td>
                                <td align="right"><span class="badge bg-gray-light center listvcnt">${boardVO.viewcnt}</span>
                                </td>
                            </tr>
                        </c:forEach>

                        <%-- 실시간 인기 소팅 --%>
                        <c:forEach items="${livePopular}" var="boardVO" varStatus="itr">
                            <tr>
                                <input type="hidden" id="bringBoardVOgetcolor" value=${boardVO.getcolor}>
                                <td align="center">${boardVO.bno}</td>
                                <td>
                                    <a href='/sboard/readPa${pageMakerLivePopular.makeSearchLivePopular(pageMakerLivePopular.cri.page)}&bno=${boardVO.bno}' class="cookieBoardPOST">
                                            ${boardVO.title}
                                        <c:if test="${boardVO.replycnt > 0}">
                                            <strong>[ ${boardVO.replycnt} ]</strong>
                                        </c:if>
                                    </a>
                                </td>
                                <td align="right"><span class="badge bg-green-gradient center listgcnt">${boardVO.goodcnt}</span>
                                </td>
                                <td align="right"><span
                                        class="badge bg-yellow-gradient center listgbcnt">${boardVO.gbcnt}</span></td>
                                <td align="right"><span class="badge bg-red-gradient center listbcnt">${boardVO.badcnt}</span>
                                </td>
                                    <%--<td align="left"><img src="/assets/img/colors/001.png" id="getColor" alt="">--%>
                                    <%--${boardVO.getcolor} // ${boardVO.writer}--%>
                                    <%--</td>--%>
                                <td align="left" class="getBoardIdLivePopular" id="${boardVO.id}"><img src="/assets/img/colors/${boardVO.getcolor}.png" id="getColor" alt="">
                                        ${boardVO.writer}
                                        <%-- 게시글 작성글의 아이디를 통하여 가져오는 input hidden --%>
                                    <%--<input type="hidden" id="bringBoardVOgetId" value=${boardVO.id}>            &lt;%&ndash; 게시판 글의 아이디 클릭했을 때 아이디 값 가져옴 &ndash;%&gt;                                </td>--%>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.regdate}"/></td>
                                <td align="right"><span class="badge bg-orange-active center listscnt">${boardVO.spamcnt}</span>
                                </td>
                                <td align="right"><span class="badge bg-gray-light center listvcnt">${boardVO.viewcnt}</span>
                                </td>
                            </tr>
                        </c:forEach>

                        <%-- 같은 색깔 인기 소팅 --%>
                        <c:forEach items="${samePopular}" var="boardVO" varStatus="itr">
                            <tr>
                                <input type="hidden" id="bringBoardVOgetcolor" value=${boardVO.getcolor}>
                                <td align="center">${boardVO.bno}</td>
                                <td>
                                    <a href='/sboard/readPa${pageMakerSamePopular.makeSearchSamePopular(pageMakerSamePopular.cri.page)}&bno=${boardVO.bno}' class="cookieBoardPOST">
                                            ${boardVO.title}
                                        <c:if test="${boardVO.replycnt > 0}">
                                            <strong>[ ${boardVO.replycnt} ]</strong>
                                        </c:if>
                                    </a>
                                </td>
                                <td align="right"><span class="badge bg-green-gradient center listgcnt">${boardVO.goodcnt}</span>
                                </td>
                                <td align="right"><span
                                        class="badge bg-yellow-gradient center listgbcnt">${boardVO.gbcnt}</span></td>
                                <td align="right"><span class="badge bg-red-gradient center listbcnt">${boardVO.badcnt}</span>
                                </td>
                                    <%--<td align="left"><img src="/assets/img/colors/001.png" id="getColor" alt="">--%>
                                    <%--${boardVO.getcolor} // ${boardVO.writer}--%>
                                    <%--</td>--%>
                                <td align="left" class="getBoardIdSamePopular" id="${boardVO.id}"><img src="/assets/img/colors/${boardVO.getcolor}.png" id="getColor" alt="">
                                        ${boardVO.writer}
                                        <%-- 게시글 작성글의 아이디를 통하여 가져오는 input hidden --%>
                                        <%--<input type="hidden" id="bringBoardVOgetId" value=${boardVO.id}>            &lt;%&ndash; 게시판 글의 아이디 클릭했을 때 아이디 값 가져옴 &ndash;%&gt;                                </td>--%>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.regdate}"/></td>
                                <td align="right"><span class="badge bg-orange-active center listscnt">${boardVO.spamcnt}</span>
                                </td>
                                <td align="right"><span class="badge bg-gray-light center listvcnt">${boardVO.viewcnt}</span>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
                <!-- /.box-body -->

                <div>
                    <%--<button id='newBtn' class="btn btn-primary pull-right">글 쓰기</button>--%>
                    <button id='newBtn' class="btn pull-right">글 쓰기</button>
                </div>

                <div class="box-footer">

                    <div class="text-center">
                        <ul class="pagination pagination-v2">

                            <c:choose>
                                <%-- cate에 맞는 검색 (페이징 기능) --%>
                                <c:when test="${not empty pageMaker}">
                                    <c:if test="${pageMaker.prev}">
                                        <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${pageMaker.startPage }"
                                               end="${pageMaker.endPage }" var="idx">
                                        <li<c:out value="${pageMaker.cri.page == idx?' class=active':''}"/>>
                                            <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                        <li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a>
                                        </li>
                                    </c:if>
                                </c:when>

                                <%-- 전체 게시판 검색 (페이징 기능) --%>
                                <c:when test="${not empty pageMakerAny}">
                                    <c:if test="${pageMakerAny.prev}">
                                        <li><a href="listAny${pageMakerAny.makeSearchAll(pageMakerAny.startPage - 1) }">&laquo;</a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${pageMakerAny.startPage }"
                                               end="${pageMakerAny.endPage }" var="idx">
                                        <li<c:out value="${pageMakerAny.criListAny.page == idx?' class=active':''}"/>>
                                            <a href="listAny${pageMakerAny.makeSearchAll(idx)}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMakerAny.next && pageMakerAny.endPage > 0}">
                                        <li><a href="listAny${pageMakerAny.makeSearchAll(pageMakerAny.endPage + 1) }">&raquo;</a>
                                        </li>
                                    </c:if>
                                </c:when>

                                <%-- 실시간 인기 소팅 --%>
                                <c:when test="${not empty pageMakerLivePopular}">
                                    <c:if test="${pageMakerLivePopular.prev}">
                                        <li><a href="livePopular${pageMakerLivePopular.makeSearchLivePopular(pageMakerLivePopular.startPage - 1) }">&laquo;</a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${pageMakerLivePopular.startPage }"
                                               end="${pageMakerLivePopular.endPage }" var="idx">
                                        <li<c:out value="${pageMakerLivePopular.cri.page == idx?' class=active':''}"/>>
                                            <a href="livePopular${pageMakerLivePopular.makeSearchLivePopular(idx)}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMakerLivePopular.next && pageMakerLivePopular.endPage > 0}">
                                        <li><a href="livePopular${pageMakerLivePopular.makeSearchLivePopular(pageMakerLivePopular.endPage + 1) }">&raquo;</a>
                                        </li>
                                    </c:if>
                                </c:when>

                                <%-- 같은 색깔 인기 소팅 --%>
                                <c:when test="${not empty pageMakerSamePopular}">
                                    <c:if test="${pageMakerSamePopular.prev}">
                                        <li><a href="samePopular${pageMakerSamePopular.makeSearchSamePopular(pageMakerSamePopular.startPage - 1) }">&laquo;</a>
                                        </li>
                                    </c:if>

                                    <c:forEach begin="${pageMakerSamePopular.startPage }"
                                               end="${pageMakerSamePopular.endPage }" var="idx">
                                        <li<c:out value="${pageMakerSamePopular.cri.page == idx?' class=active':''}"/>>
                                            <a href="samePopular${pageMakerSamePopular.makeSearchSamePopular(idx)}">${idx}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMakerSamePopular.next && pageMakerSamePopular.endPage > 0}">
                                        <li><a href="samePopular${pageMakerSamePopular.makeSearchSamePopular(pageMakerSamePopular.endPage + 1) }">&raquo;</a>
                                        </li>
                                    </c:if>
                                </c:when>
                            </c:choose>
                            <%--<input type="text" id="goUrl" name="goUrl" class="goUrl" value="">--%>
                        </ul>
                    </div>
                    <%-- JSTL의 <c:if>는 boolean으로 나오는 결과를 확인하므로 ${pageMaker.prev}를 이용해서 이전 페이지로 가는 링크가 있어야 하는지를 판단. --%>
                    <%-- 현재 페이지의 번호는 PageMaker 객체 내의 Criteria 객체에 존재하므로 ${pageMaker.cri.page}를 이용해서
                    getCriteria(), getPage()를 호출하는 형태로 사용. 이를 이용해서 화면에 현재 페이지 번호만을 눈에 띄게 표현할 수 있음. --%>
                    <%-- 이전의 예제는 단순히 게시물의 번호를 전송하는 링크만 생성되었지만, 위와 같이 페이지 정보를 유지할 수 있도록 변경. --%>

                </div>
                <!-- /.box-footer-->
            </div>
        </div>
        <!--/.col (left) -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--<script>--%>
<%--var result = '${msg}';--%>

<%--if (result == 'SUCCESS') {--%>
<%--alert("처리가 완료되었습니다.");--%>
<%--}--%>
<%--</script>--%>

<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--ex) www.profile.com?name=hyewon&age=25--%>
<script>
    var result = '${msg}';

    if (result == 'SUCCESS') {
        alert("처리가 완료되었습니다.");
    }

    // list(리스트)의 g/b 넘버 포맷팅 Todo: 나머지 넘버 포맷팅 해야함
    $('.listgcnt').number(true);
    $('.listgbcnt').number(true);
    $('.listbcnt').number(true);
    $('.listscnt').number(true);
    $('.listvcnt').number(true);

    function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
            params[key] = value;
        });
        return params;
    }

    $(document).ready(function () {

        // $('#idDetail').off();

        var allUrlAddr = $(location).attr('href');

        // 헤더 게시판 카테고리 클릭
        $('#searchBtn01').on("click", function (event) {
            self.location = "list"
                + '${pageMaker.makeQuery(1)}'
                + "&searchType="
                + $("select option:selected").val()
                + "&keyword="
                + $('#keywordInputCate').val()
                + "&cate="
                + oParams.cate;
        });

        // 헤더에서 전체 검색 listAny
        $('#searchBtn02').on("click", function (event) {
            self.location = "listAny"
                + '${pageMaker.makeQuery(1)}'
                // + "&searchType="
                // + $("select option:selected").val()
                + "&keyword="
                + $('#keywordInputCate').val();
            // + "&cate="
            // + oParams.cate;
        });

        window.onload = function () {
            oParams = getUrlParams();
        }

        // 새 글 등록
        $('#newBtn').on("click", function (evt) {
            self.location = 'register?cate='
                + oParams.cate;
            <%--+ '${getQuerystring(cate)}';--%>
        });

//        alert("prevSelfLocation : " + prevSelfLocation);
//        var prevSelfLocation = "";

        $('#goodSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=gc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=gc";
            }
        });

        // 실시간 인기 검색
        $('#realPopular').on("click", function (event) {
            self.location = "livePopular"
                + '${pageMaker.makeQuery(1)}'
//                + "&searchType="
//                + $("select option:selected").val()
//                + "&keyword="
//                + $('#keywordInputCate').val()
                + "&cate="
                + oParams.cate;
        });

        // sameColor 같은 색깔 검색
        $('#samePopular').on("click", function (event) {
            self.location = "samePopular"
                + '${pageMaker.makeQuery(1)}'
//                + "&searchType="
//                + $("select option:selected").val()
//                + "&keyword="
//                + $('#keywordInputCate').val()
                + "&cate="
                + oParams.cate;
        });

//        $('#dailyPopular').on("click", function (event) {
//            $('#liDailyPopular').append("<input type='text' id='testDatepicker' />");
//        });

        $('#gbSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=gbc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=gbc";
            }
        });

        $('#badSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=bc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=bc";
            }
        });

        $('#spamSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=sc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=sc";
            }
        });

        $('#viewSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=vc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=vc";
            }
        });

        /* 게시판 리스트에서 유저 별명을 클릭했을 때 */
        $('.getBoardId').on("click", function () {
//            event.stopPropagation();  // 이벤트버블링 방지
            // event.addEventListener();
            self.location = "../userInfo/userInfoList"
                + '${pageMaker.makeQuery(1)}'
                + "&loginid="
                + this.id;
        });
//        $('.get').each(function() {
//            alert( this.id );
//        });
        /* 전체 게시판 리스트에서 유저 별명을 클릭했을 때 */
        $('.getBoardIdAny').on("click", function () {
//            event.stopPropagation();  // 이벤트버블링 방지
            // event.addEventListener();
            self.location = "../userInfo/userInfoList"
                + "?page=1"
                + "&perPageNum=10"
                + "&loginid="
                + this.id;
        });

        /* 실시간 인기 게시판 리스트에서 유저 별명을 클릭했을 때 */
        $('.getBoardIdLivePopular').on("click", function () {
//            event.stopPropagation();  // 이벤트버블링 방지
            // event.addEventListener();
            self.location = "../userInfo/userInfoList"
                + "?page=1"
                + "&perPageNum=10"
                + "&loginid="
                + this.id;
        });

        /* 같은 칼라 게시판 리스트에서 유저 별명을 클릭했을 때 */
        $('.getBoardIdSamePopular').on("click", function () {
//            event.stopPropagation();  // 이벤트버블링 방지
            // event.addEventListener();
            self.location = "../userInfo/userInfoList"
                + "?page=1"
                + "&perPageNum=10"
                + "&loginid="
                + this.id;
        });

    });

</script>

<%@include file="../include/footer.jsp" %>
