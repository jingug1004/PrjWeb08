<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-20
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
    * What : 게시물 첨부파일 기능을 가진 스프링 MVC의 파일 업로드하고 결과를 간직하는 jsp
    * Why : <form> 태그의 경우 기본이 현재 브라우저의 창에서 전송이 일어나기 때문에 화면 전환을 피할 수 없다는 점. <form> 태그에 target 속성을 주고 <iframe>을 이용하면 화면 전환 효과를 없앨 수 있음
    * How : UploadController에서  @RequestMapping(value = "/uploadForm", method = RequestMethod.POST) return "uploadResult";에서 넘어옴
    * <iframe> 내에서 동작하기 위해 작성된 페이지. 특이하게도 화면을 구성하는 부분없이 <script>를 사용해서 자신이 속한 화면의 바깥쪽 parent의 addFilePath()의 함수를 호출
    --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page session="false" %>

<script>

    var result = '${savedName}';

    parent.addFilePath(result);

</script>
