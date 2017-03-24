function checkImageType(fileName) {

    var pattern = /jpg|gif|png|jpeg/i;

    return fileName.match(pattern);

}

function getFileInfo(fullName) {

    var fileName, imgsrc, getLink;
    // fileName - 경로나 UUID가 제외된 파일의 이름. imgsrc - 화면상에 보여주는 썸네일 혹은 파일 이미지의 경로. getLink - 화면에서 원본 파일을 볼 수 있는 링크를 위해서 작성된 변수.

    var fileLink;

    if (checkImageType(fullName)) {
        imgsrc = "/displayFile?fileName=" + fullName;
        fileLink = fullName.substr(14);

        var front = fullName.substr(0, 12); // /2015/07/01/
        var end = fullName.substr(14);

        getLink = "/displayFile?fileName=" + front + end;

    } else {
        imgsrc = "/resources/dist/img/file.png";
        fileLink = fullName.substr(12);
        getLink = "/displayFile?fileName=" + fullName;
    }
    fileName = fileLink.substr(fileLink.indexOf("_") + 1);

    return {fileName: fileName, imgsrc: imgsrc, getLink: getLink, fullName: fullName};
    // 마지막 리턴 값은 정보들을 JavaScript의 객체로 생성해서 반환해주고, register.jsp에서는 템플릿을 이용해서 화면에 보여지도록 함.
    // /register.jsp <script type="text/javascript" src="/resources/js/upload.js"></script>
}
// upload.js는 getFileInfo()의 파라미터로 서버에서 전송된 파일의 이름을 사용.
// 해당 파일이 이미지인 경우를 체크하는 checkImageType()을 이용해서 썸네일 이미지 파일의 경로를 계산하거나 다운로드, 원본 이미지 파일의 경로를 계산.


