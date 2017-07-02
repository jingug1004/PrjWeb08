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
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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
    }

    .show {
        position: relative;
        max-width: 1200px;
        max-height: 800px;
        overflow: auto;
    }

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
                    <h3 class="box-title">READ BOARD</h3>
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
                </form>

                <div class="box-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Title</label> <input type="text"
                                                                             name='title' class="form-control"
                                                                             value="${boardVO.title}"
                                                                             readonly="readonly">
                        <%--조회 화면이므로 아예 사용자가 내용을 수정할 수 없도록 EL로 출력되는 부분에는 readonly 속성을 이용해서 사용자가 내용을 수정할 수 없도록 만들어 줌. 밑의 2개도 readonly--%>
                    </div>
                    <div class="form-group">
                        <%--@declare id="exampleinputpassword1"--%>
                        <label for="exampleInputPassword1">Content</label>
                        <textarea class="form-control" name="content" rows="25"
                                  readonly="readonly">${boardVO.content}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Writer</label> <input type="text"
                                                                              name="writer" class="form-control"
                                                                              value="${boardVO.writer}"
                                                                              readonly="readonly">
                    </div>
                </div>

                <!-- /.box-body -->
                <div class="box-footer">

                    <div>
                        <hr/>
                    </div>


                    <ul class="mailbox-attachments clearfix uploadedList"></ul>
                    <%--조회 페이지에서 기존에 업로드 된 파일들이 보여질 수 있는 영역을 작성하고, upload.js와 handlebars를 설정.--%>

                    <c:if test="${login.nickname == boardVO.writer}">
                        <button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
                        <button type="submit" class="btn btn-danger" id="removeBtn">Remove</button>
                    </c:if>
                    <button type="submit" class="btn btn-primary" id="goListBtn">Go List</button>
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
                    <h3 class="box-title">ADD NEW REPLY</h3>
                </div>
                <c:if test="${not empty login}">
                    <div class="box-body">
                            <%--@declare id="exampleinputemail1"--%>
                        <label for="exampleInputEmail1">Writer</label>
                        <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"
                               value="${login.nickname}" readonly="readonly">
                        <label for="exampleInputEmail1">Reply Text</label>
                        <input class="form-control" type="text" placeholder="Reply TEXT" id="newReplyText">
                    </div>
                    <!--/.box-body-->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary" id="replyAddBtn">
                            Add Reply
                        </button>
                    </div>
                </c:if>

                <c:if test="${empty login}">
                    <div class="box-body">
                        <div><a href="javascript:goLogin();">Login Please</a></div>
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
                        Replies List <small id='replycntSmall'> [ ${boardVO.replycnt} ]
                    </small></span>
                </li>
            </ul>

            <div class='text-center'>
                <ul id="pagination" class="pagination pagination-sm no-margin ">

                </ul>
            </div>
            <%--댓글의 목록과 페이징 처리에 필요한 <div>--%>

        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Modal -->
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
                    <button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- /.content -->

<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>
<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>

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

<script id="template" type="text/x-handlebars-template">
    {{#each .}}
    <li class="replyLi" data-rno={{rno}}>
        <i class="fa fa-comments bg-blue"></i>
        <div class="timeline-item">
                <span class="time">
                  <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                    <%--'prettifyDate regdate'에는 handlebar의 기능을 확장하는 자바스크립트 방법의 예로 사용. --%>
                </span>
            <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
            <div class="timeline-body">{{replytext}}</div>
            <div class="timeline-footer">
                {{#eqReplyer replyer }}
                <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
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
    }

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
            str += "<li><a href='" + (pageMaker.startPage - 1)
                + "'> << </a></li>";
        }

        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
            var strClass = pageMaker.cri.page == i ? 'class=active' : '';
            str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
        }

        if (pageMaker.next) {
            str += "<li><a href='" + (pageMaker.endPage + 1)
                + "'> >> </a></li>";
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

    $("#replyAddBtn").on("click", function () {

        var replyerObj = $("#newReplyWriter");
        var replytextObj = $("#newReplyText");
        var replyer = replyerObj.val();
        var replytext = replytextObj.val();

        $.ajax({
            type: 'post',
            url: '/replies/',
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({
                bno: bno,
                replyer: replyer,
                replytext: replytext
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

</script>


<script>

//    function getUrlParams() {
//        var params = {};
//        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
//        return params;
//    };

    $(document).ready(function () {

        var formObj = $("form[role='form']");
//        formObj는 위에 선언된 <form> 태그를 의미하게 됨. <input type='hidden' name='bno' value="${boardVO.bno}~${cri.keyword}">

        console.log(formObj);

        <%--Tip01.게시물 댓글 페이지(리스트) 클릭 안하고 바로 보여주고 싶을 때 --%>
        <%--var bno = ${boardVO.bno};--%>

        <%--getPage("/replies/"+bno+"/1");--%>
        <%-- --------------------------------------------------- --%>

        function getUrlParams() {
            var params = {};
            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
            return params;
        };

        $("#cnumToList").val(getUrlParams().cate);

//        window.onload = function() {
//            var oParams = getUrlParams();
//        };

        console.log("lll~~~ oParams : " + getUrlParams().cate );

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

        $("#goListBtn ").on("click", function () {

            formObj.attr("method", "get");
            formObj.attr("action", "/sboard/list");
//            formObj.attr("action", "/sboard/list?cate=" + oParams.cate);
            formObj.submit();
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


        var bno = ${boardVO.bno};
        var template = Handlebars.compile($("#templateAttach").html());

        $.getJSON("/sboard/getAttach/" + bno, function (list) {
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

    });
</script>


<%@include file="../include/footer.jsp" %>