<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-20
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
 * What : 게시물 첨부파일 기능을 가진 스프링 MVC의 파일 업로드를 위한 테스트 jsp
 * Why :
 * How :
 * UploadController.class -> uploadForm.jsp -> uploadResult.jsp -> uploadForm.jsp
 * <iframe>을 사용하는 방식은 숨겨진 페이지를 이용해서 <form>의 submit()을 실행하고 숨겨진 페이지가 바깥쪽의 페이지 함수를 호출하는 형태
 * <iframe>의 width와 height를 모두 '0'으로 지장하면 화면상에는 전혀 안 보이기 때문에, 이를 이용하면 Ajax를 사용하지 않고도 화면이 전환되지 않는 효과를 줄 수 있음
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
<%--addFilePath()는 uploadResult.jsp에서 호출하는 부모창(parent)의 함수--%>

</body>
</html>