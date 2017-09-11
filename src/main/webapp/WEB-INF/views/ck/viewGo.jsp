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
<script src="//cdn.ckeditor.com/4.7.2/basic/ckeditor.js"></script>

<h3>테스트 성공!</h3>

<textarea name="editor1"></textarea>
<script>
    CKEDITOR.replace( 'editor1' );
</script>


<%@include file="../include/footer.jsp" %>
