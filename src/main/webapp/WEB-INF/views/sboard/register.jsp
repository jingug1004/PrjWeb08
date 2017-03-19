<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>


<style>
    .fileDrop {
        width: 80%;
        height: 100px;
        border: 1px dotted gray;
        background-color: lightslategrey;
        margin: auto;

    }
</style>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">REGISTER BOARD</h3>
                </div>
                <!-- /.box-header -->

                <form id='registerForm' role="form" method="post">
                    <div class="box-body">
                        <div class="form-group">
                            <%--@declare id="exampleinputemail1"--%>
                            <label for="exampleInputEmail1">Title</label>
                            <input type="text" name='title' class="form-control" placeholder="Enter Title">
                        </div>
                        <div class="form-group">
                            <%--@declare id="exampleinputpassword1"--%>
                            <label for="exampleInputPassword1">Content</label>
                            <textarea class="form-control" name="content" rows="20"
                                      placeholder="Enter ..."></textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Writer</label>
                            <%--<input type="text" name="writer" class="form-control" placeholder="Enter Writer">--%>
                            <%--<input type="text" name="writer" class="form-control" value='${login.uid}' readonly>--%>
                            <%--<input type="text" name="writer" class="form-control" value='${login.uid}' readonly>--%>
                            <input type="text" name="writer" class="form-control" value='${login.nickname}' readonly>
                            <%--JSP에서 사용하는 EL의 경우 자동으로 HttpSession에 있는 'login'을 찾아서 사용하므로 '${loogin.nickname}'와 같은 형태로 사용할 수 있음--%>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">File DROP Here</label>
                            <div class="fileDrop"></div>
                        </div>
                    </div>

                    <!-- /.box-body -->

                    <div class="box-footer">
                        <div>
                            <hr>
                        </div>

                        <ul class="mailbox-attachments clearfix uploadedList">
                        </ul>

                        <button type="submit" class="btn btn-primary">Submit</button>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            <a href="{{fullName}}"
               class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
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


    $("#registerForm").submit(function (event) {
        event.preventDefault();

        var that = $(this);

        var str = "";
        $(".uploadedList .delbtn").each(function (index) {
            str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'> ";
        });

        that.append(str);

        console.log(str);

        that.get(0).submit();
    });


</script>


<%@include file="../include/footer.jsp" %>
