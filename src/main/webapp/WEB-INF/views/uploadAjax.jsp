<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-20
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <style>
        .fileDrop {
            width: 100%;
            height: 200px;
            border: 1px dotted #606569;
        }

        small {
            margin-left: 3px;
            font-weight: bold;
            color: gray;
        }
    </style>
</head>
<body>

<h3>Ajax File Upload</h3>
<div class='fileDrop'></div>
<%--파일을 놓아두는 <div>는 스타일이 적용되어서 화면에는 점섬으로 표시되는 영역--%>

<div class='uploadedList'></div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
    $(".fileDrop").on("dragenter dragover", function(event) {
        event.preventDefault();
    });

    $(".fileDrop").on("drop", function(event){
        event.preventDefault();

// <script> 이후의 jQuery를 이용하는 JavaScript 부분을 보면 'dragenter, dragover, drop'시 기본 동작을 막도록 작성되어 있음. 브라우저에서 파일을 끌어다 놓아도 아무런 동작을 하지 않도록 막아주는 기능.
// 기본적인 이벤터 처리를 제한(preventDefault)하면 브라우저에서는 파일을 끌어다 놓아도 아무런 변화가 없는 것을 확인

        var files = event.originalEvent.dataTransfer.files;
// 'drop' 이벤트가 발생했을 때 이벤트 처리 코드의 핵심적인 부분은 dataTransfer.files의 부분으로, 전달된 파일 데이터를 가져오는 부분
// event.originalEvent는 jQuery를 이용하는 경우 event가 순수한 DOM 이벤트가 아니기 때문에 event.originalEvent를 이용해서 순수한 원래의 DOM 이벤트를 가져옴
// event.dataTransfer는 이벤트와 같이 전달된 데이터를 의미하고 그 안에 포함된 파일 데이터를 찾아내기 위해서 dataTransfer.files를 이용


        var file = files[0];

        //console.log(file);

        var formData = new FormData();
        formData.append("file", file);
// FormData 객체를 이용하면 <form> 태그로 만든 데이터의 전송 방식과 동일하게 파일 데이터를 전송할 수 있음
// FormData를 사용하는 방법은 객체를 생성하고 필요한 데이터의 '이름'과 '값'을 추가
// 만들어진 FormData에 append()를 이용해서 'file' 이름으로 끌어다 놓은 파일 객체를 추가

        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType:'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){

                var str ="";

                console.log(data);
                console.log(checkImageType(data));

                if(checkImageType(data)){
                    str ="<div><a href=displayFile?fileName="+getImageLink(data)+">"
                        +"<img src='displayFile?fileName="+data+"'/>"
                        +"</a><small data-src="+data+">X</small></div>";
                }else{
                    str = "<div><a href='displayFile?fileName="+data+"'>"
                        + getOriginalName(data)+"</a>"
                        +"<small data-src="+data+">X</small></div></div>";
                }

                $(".uploadedList").append(str);
            }
        });
    });


    $(".uploadedList").on("click", "small", function(event){

        var that = $(this);

        $.ajax({
            url:"deleteFile",
            type:"post",
            data: {fileName:$(this).attr("data-src")},
            dataType:"text",
            success:function(result){
                if(result == 'deleted'){
                    that.parent("div").remove();
                }
            }
        });
    });


    /*
     $(".fileDrop").on("drop", function(event) {
     event.preventDefault();

     var files = event.originalEvent.dataTransfer.files;

     var file = files[0];

     //console.log(file);
     var formData = new FormData();

     formData.append("file", file);


     $.ajax({
     url: '/uploadAjax',
     data: formData,
     dataType:'text',
     processData: false,
     contentType: false,
     type: 'POST',
     success: function(data){

     var str ="";

     console.log(data);
     console.log(checkImageType(data));

     if(checkImageType(data)){
     str ="<div><a href='displayFile?fileName="+getImageLink(data)+"'>"
     +"<img src='displayFile?fileName="+data+"'/></a>"
     +data +"</div>";
     }else{
     str = "<div><a href='displayFile?fileName="+data+"'>"
     + getOriginalName(data)+"</a></div>";
     }

     $(".uploadedList").append(str);
     }
     });
     });	 */


    function getOriginalName(fileName){

        if(checkImageType(fileName)){
            return;
        }

        var idx = fileName.indexOf("_") + 1 ;
        return fileName.substr(idx);

    }


    function getImageLink(fileName){

        if(!checkImageType(fileName)){
            return;
        }
        var front = fileName.substr(0,12);
        var end = fileName.substr(14);

        return front + end;

    }




    /* 		$(".fileDrop").on("drop", function(event) {
     event.preventDefault();

     var files = event.originalEvent.dataTransfer.files;

     var file = files[0];

     //console.log(file);
     var formData = new FormData();

     formData.append("file", file);

     $.ajax({
     url: '/uploadAjax',
     data: formData,
     dataType:'text',
     processData: false,
     contentType: false,
     type: 'POST',
     success: function(data){

     alert(data);

     }
     });

     }); */


    function checkImageType(fileName){

        var pattern = /jpg|gif|png|jpeg/i;

        return fileName.match(pattern);

    }


</script>

</body>
</html>