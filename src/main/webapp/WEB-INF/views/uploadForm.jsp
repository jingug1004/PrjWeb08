<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-20
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
 * What : 게시물 첨부파일 기능을 가진 스프링 MVC의 파일 업로드를 위한 테스트 jsp
 * Why :
 * How :
 * UploadController.class -> uploadForm.jsp
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>uploadForm</title>

    <style>
        iframe {
            width: 0px;
            height: 0px;
            border: 0px
        }
    </style>
</head>
<body>


<form id='form1' action="uploadForm" method="post"
      enctype="multipart/form-data" target="zeroFrame">
    <input type='file' name='file'> <input type='submit'>
</form>

<iframe name="zeroFrame"></iframe>

<script>
    function addFilePath(msg) {
        alert(msg);
        document.getElementById("form1").reset();
    }
</script>

</body>
</html>