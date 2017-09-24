<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>


<style>
    .fileDrop {
        width: 100%;
        height: 100px;
        border: 5px dotted #7BD4CC;
        background-color: #f5f5f5;
        margin: auto;

        display: table;
    }
</style>

<%--
#7BD4CC AQUAPOISE
#BEA42E HONEY
#7B895B ARMY
#037367 CELADON
#00281F SANGRIA
--%>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <%--<h3 class="box-title">REGISTER BOARD</h3>--%>
                    <h3 class="box-title"></h3>
                </div>
                <!-- /.box-header -->

                <form id='registerForm' role="form" method="post">
                    <%-- form의 action 속성이 지정되지 않으면 현재 경로를 그대로 action의 대상 경로로 잡음. --%>
                    <div class="box-body">
                        <div class="form-group">
                            <%--@declare id="exampleinputemail1"--%>
                            <label for="exampleInputEmail1">Title</label>
                            <input type="text" name='title' class="form-control" placeholder="Enter Title">
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword1"--%>
                            <label for="exampleInputPassword1">Content</label>
                            <%--<textarea class="form-control" name="content" rows="20"--%>
                            <%--placeholder="Enter ..."></textarea>--%>
                            <%--
                            textarea의 name은 boardVO(VO) 필드와 같아야 한다.
                            ex) boardVO의 private String content; = <textarea name="content'
                            --%>
                            <textarea name="content" class="form-control" placeholder="Enter ..." rows="50"></textarea>
                            <script>
                                CKEDITOR.replace('content');
                                CKEDITOR.config.height = 450;
                                CKEDITOR.config.width = 'auto';
                            </script>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Writer</label>
                            <%--<input type="text" name="writer" class="form-control" placeholder="Enter Writer">--%>
                            <%--<input type="text" name="writer" class="form-control" value='${login.uid}' readonly>--%>
                            <%--<input type="text" name="writer" class="form-control" value='${login.uid}' readonly>--%>
                            <input type="text" name="writer" class="form-control" value='${login.nickname}' readonly>
                            <%--JSP에서 사용하는 EL의 경우 자동으로 HttpSession에 있는 'login'을 찾아서 사용하므로 '${loogin.nickname}'와 같은 형태로 사용할 수 있음--%>
                        </div>
                        <input id="cnumInput" type="hidden" name="cnum" value="1101">



                        <%-- Todo : 첨부파일 추가할 수 있는 영역 --%>
                        <div class="form-group">
                            <label for="exampleInputEmail1">File DROP Here</label>
                            <div class="fileDrop" >
                                <p style="display: table-cell; text-align: center; vertical-align: middle;">첨부할 파일을 드래그 하거나 직접 파일찾기</p>
                            </div>
                            <%--첨부파일을 추가할 수 있는 영역--%>
                        </div>
                    </div>

                    <!-- /.box-body -->

                    <div class="box-footer text-right">
                        <div>
                            <hr>
                        </div>

                        <ul class="mailbox-attachments clearfix uploadedList">
                        </ul>
                        <%--업로드 된 파일이 보여줄 수 있는 <ul></ul> 태그--%>

                        <button type="submit" class="btn btn-primary">등록</button>
                    </div>
                </form>
            </div>
            <!-- /.box -->
        </div>
        <!--/.col (left) -->

    </div>
    <!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<%-- /upload.js 마지막 리턴 값은 정보들을 JavaScript의 객체로 생성해서 반환해주고, register.jsp에서는 템플릿을 이용해서 화면에 보여지도록 함.--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%-- 첨부파일 추가할 때 생기는 아이콘 --%>
<script id="template" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <%--<li></li> 구성할 때 'imgsrc' 속성을 보여주는데, 'imgsrc'는 이미지 파일인 경우 썸네일 파일의 경로이고, 일반 파일인 경우는 단순히 파일 모양의 이미지(file.png)를 보여주는 경로.--%>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
                <i class="fa fa-fw fa-remove"></i></a>
            </span>
        </div>
    </li>
</script>

<script>

    var template = Handlebars.compile($("#template").html());

    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });


    $(".fileDrop").on("drop", function (event) {
        event.preventDefault();

        var files = event.originalEvent.dataTransfer.files;

        var file = files[0];

        var formData = new FormData();

        formData.append("file", file);


        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {

                var fileInfo = getFileInfo(data);

                var html = template(fileInfo);

                $(".uploadedList").append(html);
            }
        });
    });
    //    파일이 Ajax로 전송되는 부분의 처리를 보면 getFileInfo() 함수를 이용해서 템플릿에 필요한 객체를 생성. 이후 템플릿을 적용해서 온전한 HTML을 구성한 후 첨부된 파일이 보여지는 $('.uploadedList')의 일부로 추가.

    $(".uploadedList").on("click", ".delbtn", function (event) {

        event.preventDefault();

        var that = $(this);

        $.ajax({
            url: "/deleteFile",
            type: "post",
            data: {fileName: $(this).attr("href")},
            dataType: "text",
            success: function (result) {
                if (result == 'deleted') {
                    that.closest("li").remove();
                }
            }
        });
    });

    function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
            params[key] = value;
        });
        return params;
    }


    $("#registerForm").submit(function (event) {
        event.preventDefault();

        var that = $(this);

        var str = "";
        $(".uploadedList .delbtn").each(function (index) {
            str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'> ";
        });
        // <form> 태그의 submit은 먼저 기본 동작을 막고, 현재까지 업로드 된 파일들을 <form> 태그의 내부에 <input type='hidden'>으로 추가.
        // 이 때 각 파일은 'files[0]'과 같은 이름으로 추가되는데, 이 배열 표시를 이용해서 컨트롤러에서는 BoardVO의 files 파라미터를 수집하게 됨.
        // 모든 파일의 정보를 <input type='hidden'>으로 생성한 후에는 <form> 데이터의 submit()을 호출해서 서버를 호출.

        that.append(str);

        console.log(str);

        that.get(0).submit();
        // jQuery의 get(0)은 순수한 DOM 객체를 얻어내기 위해서 사용.

//        window.onLoad = function() {
//            oParams = getUrlParams();
//        }

        self.location = 'list?cate='
            + getUrlParams().cate;
    });
    // 최종적인 submit이 일어나게 되면, 서버에는 사용자가 업로드 한 파일의 정보를 같이 전송해줘야 함.
    // 이에 대한 처리는 업로드 된 파일의 이름을 <form> 태그의 내부로 포함시켜서 전송하는 방식을 이용.


</script>

<script>
    //    $(document).ready(function () {
    function getUrlParams() {
//            var casting = 1;
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
            params[key] = value;
        });
        return params;
//            return parseInt("params", 10);
//            return params * casting;
    }

    $('#cnumInput').val(getUrlParams().cate);
    //        parseInt($('#cnumInput').val(getUrlParams()), 10);
    //        val 없애도 되는지??????????????? 위의 53라인의 val 없어도 잘 됨.
    // console.log("cnumInput: " + $('#cnumInput').val('getUrlParams().cate'));
    //    });
</script>


<%@include file="../include/footer.jsp" %>
