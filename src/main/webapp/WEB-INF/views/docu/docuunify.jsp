<%--
/**
* Created by macbookpro on 2017. 3. 3. PM 8:19
* sp4chap11-Project /
* No pain, No gain!
* What : 회사 이력서 제출용 다큐멘테이션, 프로젝트 기술보고서
* Why : 취업을 위하여. ㅠ_ㅠ
* How : 웹 페이지 어느 한 부분에 클릭하면 여기로 맵핑하여 웹에서 볼 수 있게 하자!
*/
--%>

<%--웹 개발자들이 주로 작업하는 환경--%>
<%--운영 체제: 윈도, 유닉스, 리눅스--%>
<%--클라이언트 측면 언어: HTML, CSS, 자바스크립트, XML ,XHTML, JSON--%>
<%--클라이언트 측면 js 프레임워크: jQuery, dojo , prototype, YUI, Jindo--%>
<%--클라이언트 측면 ui 프레임워크: jQuery UI, fontawesome, bootstrap--%>
<%--서버 측면 언어 : 자바, C#(ASP.NET), PHP, JSP, VB 스크립트(ASP), 파이썬, 펄, Ruby on Rails, grail--%>
<%--프레임워크 : J2EE, ASP.NET MVC, ASP.NET Webform, Struts, Spring, ibatis , hibernate , gwt ,spring roo, sitemesh , oscache, tiles, templete_--%>
<%--데이터베이스 : Oracle, MS SQL, Mysql, Postgres--%>
<%--버전 관리 : WinCVS, TotoiseCVS, Subversion, Rational ClearCase, git--%>
<%--웹 서버 : Nginx, Apache, Tomcat, JBoss, WAS, Bea Logic, IIS , jetty--%>
<%--도구 : 이클립스, WASD, Editplus, Oracle Developer, 메모장, Notepad++, Putty, FTP 클라이언트, Zend Studio, 비주얼 스튜디오--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
<head>
    <title>Documentation | UNIFY</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Create a project that can support your company">
    <meta name="author" content="EmiyaMulzomdao">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/resources/docu/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/docu/css/docs.css">
    <link rel="stylesheet" href="/resources/docu/plugins/prism/prism.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/resources/docu/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/resources/docu/plugins/font-awesome/css/font-awesome.min.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<!-- Sidebar -->
<div class="page-wrap">
    <div class="aside" id="sidebar">
        <%--<div class="aside" id="sidebar">--%>
        <h1>UNIFY - Shopping Website by <a href="https://www.facebook.com/jingug1004">김진국</a></h1>
        <p>Documentation v1.9.4</p>

        <hr>

        <ul class="list-unstyled">
            <li><a href="#scroll_overview">Overview</a></li>
            <li><a href="#scroll_main">Main Structure</a></li>
            <li><a href="#scroll_ssl">SSL & RSA</a></li>
            <li><a href="#scroll_jenkins">Jenkins</a></li>
            <li><a href="#scroll_aws">AWS</a></li>
            <li><a href="#scroll_github">GitHub</a></li>
            <li><a href="#scroll_sql">SQL</a></li>
            <li><a href="#scroll_interceptor">Interceptor</a></li>
            <li><a href="#scroll_fileupload">File Upload</a></li>
            <li><a href="#scroll_aop">AOP & Transaction</a></li>
            <li><a href="#scroll_board">Board</a></li>
            <li><a href="#scroll_spring">Spring Framework</a></li>
            <li><a href="#scroll_frontend">Front-End</a></li>
            <%--<li><a href="#scroll_misc">Misc Pages</a></li>--%>
            <%--<li><a href="#scroll_nav">Headers &amp; Footers</a></li>--%>
            <%--<li><a href="#scroll_theme">Theme Configuration</a></li>--%>
            <%--<li><a href="#scroll_css">CSS (Cascading Style Sheets)</a></li>--%>
            <%--<li><a href="#scroll_js">JavaScript Initialization</a></li>--%>
            <%--<li><a href="#scroll_fonts">Fonts</a></li>--%>
            <%--<li><a href="#scroll_credits">Credits</a></li>--%>
            <li><a href="#scroll_changelog">Change Log</a></li>
            <li><a href="#scroll_upgrade">Upgrade</a></li>
            <li><a href="#scroll_others">Others & End of Documentation</a></li>
            <%--<li><a href="#scroll_end">End of Documentation</a></li>--%>
        </ul>
    </div>
</div>
<!-- End Sidebar -->

<div class="content">
    <div class="container-full">
        <div class="row">
            <div class="col-lg-12">
                <div id="scroll_overview" class="margin-bottom-60">
                    <h2>Overview</h2>

                    <hr>

                    <p>안녕하십니까, 먼저 제 <code>포트폴리오</code>에 손수 방문해 주셔서 감사드립니다!</p>

                    <p>제 포트폴리오가 기대에 부응할 것을 진심으로 바랍니다. 다큐멘테이션이지만 포트폴리오에 적용했던 기술들의 보고서 형식으로 나열합니다.</p>

                    <%--<strong>연계과목, 기간, 개발언어, 플랫폼, 개발툴, 주요기술, 목적, 내용..</strong>--%>

                    <%--<br>--%>

                    <p>제 포트폴리오는 "UNIFY"라는 이름의 여성 쇼핑몰로서 어린 여아부터 중장년 여성까지 모든 아이템을 다룰 수 있게 카테고리화 하였습니다.
                        주 포인트는 게시판 작성(조회수 증가, 댓글 달기, 파일 업로드 등) 및 로그인 세션 유지, 보안으로 스프링 MVC 프레임워크(4.3.1)개념과 비지니스 로직 프로세스를
                        익히는데 초점을 두었으며 그 과정에
                        TDD, 마이바티스, 메이븐, CI(젠킨스), WS(AWS), Ajax, JQuery 등 여러 플랫폼, 엔진, 스크립트 언어까지 부가적으로 익힐 수 있었습니다.</p>

                    <p>잘 아시다시피 MVW 프레임워크(AngularJS)라는 기술이 있는데 제가 풀어야 했던 문제는 기본에 충실한 기능 구현이 목표였으므로 Spring MVC 방식으로 구현 시도를
                        했습니다.
                        그러면서 배운 거라면 위에 나열한 것들이며 마이바티스와 메이븐이 <code>Spring MVC 프레임워크</code>와 가장 최적화되어 좋은 결과를 만들었던 것 같고
                        AWS는 개발서버와 실제로 운영하는 서버에서 Run 할 때 처음 접하는 버그들이 많이 발생하여 많은 괴리감과 간극을 느꼈습니다. 그래서 포트폴리오로 제출할
                        최소한의 문제들을 즉각 대처할 수 있게 서버 인스턴스를 Ubuntu에서 amazon Linux API로 변경하여 사용하고 있습니다.
                    </p>

                    <p>
                        UI는 탐색하기 쉽고 단순하고 사용하기 쉬운 레이아웃과 개발자 친화적인 코드를 사용하였습니다.
                        또한 많은 리소스가 사용되었으며 많은 개발자들이 유지 보수에 어려움이 없도록 다양한 옵션이 추가되었습니다.</p>

                    <br>

                    <h4>Updates</h4>

                    <p>웹 프로그래밍 트렌드의 급변하는 발전 추세에 발 맞춰 항상 새로운 업데이트를 지속적으로 출시하려고 노력하고 있습니다.
                        각 업데이트의 목표는 개발자와 미래 사용할 잠재 고객에게 깊은 인상을 남기는 것입니다.</p>

                    <%--<p>UNIFY를 구매하면 평생 무료로 업데이트를 다운로드 할 자격이 주어집니다. <strong>FREE!</strong></p>--%>

                    <%--<p>그러나 다른 한편으로는 라이센스 업그레이드가 불가능하다는 사실을 알려드립니다. 라이센스를 업그레이드하려면 새로운 구매가 이루어져야합니다.</p>--%>

                    <p>현재 업데이트 된 버전은 v1.9 +로 웹서버(AWS)에서의 고정 버그, 개발 서버가 아닌 운영 서버에서의 오류 등 여러 가지 개선 사항을 제공합니다.
                        UNIFY는 다음 업데이트에서 더 많은 새로운 놀라운 기능이 곧 출시 될 예정이어서 스스로의 공부를 멈추지 않습니다.</p>
                    <%--항상 UNIFY를 사용하고 성공의 중요한 부분을 담당해 주셔서 감사합니다.</p><br>--%>

                    <br/>

                    <h4>Support</h4>

                    <%--<p>우리는 UNIFY가 지원이 성공적인 제품의 중요한 측면이라고 믿습니다. 따라서 우리는 가장 우수한 지원을 제공하기 위해 최선을 다하며--%>
                    <%--항상 우리의 소중한 고객을 돕기 위해 무엇이든 시도합니다. 우리의 지원은 완전한 사용자 정의 작업이 아닌 한 프론트 엔드 관련--%>
                    <%--문제 이외에 발생할 수 있는 모든 설계 문제를 주로 다루고 있음을 알아 두십시오.</p>--%>

                    <p>저의 지원은 완전한 사용자 정의 작업이 아닌 백엔드 관련 문제 이외에 발생할 수 있는 모든 설계 문제를 주로 다루고 있습니다.</p>

                    <%--<p><strong> "요즘 업계 최고의 기술인 XX 를 도입해서 YY 를 구현하였는데 그것이 아주 성공적이어서 유저들에게 ZZ 한 반응과 함께 $$ 의 매출을..." => 이것도--%>
                    <%--좀.--%>
                    <%--말하는 게 우선 너무 매니저스러움.--%>

                    <%--개발자스러운 답변은--%>
                    <%--"아실지 모르겠지만 XX 라는 기술이 있는데 저희가 풀어야 했던 문제는 YY 였으므로 ZZ 방식으로 구현 시도를 했습니다. 그러면서 배운 거라면 AA 는--%>
                    <%--이런 면이 좋아서 어느 정도 좋은 결과였던 것 같고 BB 는 이러이러한 문제가 있어서 저러저러하게 대처를 하였음" => 이상적인 답변.--%>
                    <%--여러 각도로 문제를 바라볼 수 있으며 객관적으로 좋은 점 나쁜 점을 나열 할 수 있고, 나쁜 점은 어떻게 극복하였는지도 디테일 말할 수 있음 플러스. </strong>--%>
                    <%--</p>--%>

                    <pre>
    자가(주) Development Environment(Server * Client, H/W * S/W)
        Processor : Intel Core™ i5
        RAM : 4GB
        TCP/IP Network : LocalHost
        Web Programming Language : Java 8(JDK1.8), JSP
        Markup Language : HTML5, CSS, XML, JSON
        Scripting Language : JavaScript, JQuery, Ajax
        Structured Query Language : MariaDB
        Framework : Spring MVC, Maven, MyBatis
        OS : MAC OSX 10.12.3, Ubuntu(Linux)
        IDE : IntelliJ, SublimeText3
        Web Server : Apache Tomcat 8.0.0.M17 WAS
        VCS : GitHub
        Client GUI Tool : Sequel Pro
        Test Browser : Chrome, Safari
        CI : Jenkins
        Online Web Service : AWS(amazon Web Service)
        Accesible DNS : www.unifyshop.ga (Instability : Not Recommend)
                        ec2-13-124-8-223.ap-northeast-2.compute.amazonaws.com
                        13.124.8.223
        FTP S/W : FileZilla
</pre>

                    <pre>
    학원(부) Development Environment(Server * Client, H/W * S/W)
        Processor : Intel Core™ i7
        RAM : 16GB
        TCP/IP Network : LocalHost(Identical port, Port forwarding)
        OS : MS Window 7
        IDE : IntelliJ, Eclipse Neon, NotePad++
        Client GUI Tool : HeidiSQL
        Test Browser : Chrome, FireFox
</pre>

                    <p>질문이 있으시면 언제든지
                        <strong>KAKAO TALK : jingug1004</strong>에 연락하여 24 시간 이내에 연락 드리도록 최선을 다할 것입니다.
                        조금 더 오래 걸릴 수도 있지만 48 시간 이상 기다리지 않으려 고 노력합니다.
                    </p>

                    <p>소셜 페이지를 통해 메시지를 남길 수도 있습니다.
                        <a class="color-dark-blue" href="https://www.facebook.com/jingug1004 "> Facebook</a> and <a
                                href="https://twitter.com/jingug1004"> Twitter</a></p>

                    <div class="margin-bottom-30"></div>

                    <ul class="list-unstyled overview-details list-style margin-bottom-40">
                        <li>Author: <a target="_blank" href="https://twitter.com/jingug1004">김진국</a></li>
                        <li>Contact:
                            <a href="mailto:jingug1004@naver.com">jingug1004@naver.com</a>
                            <span>|</span>
                            <a target="_blank" href="https://twitter.com/jingug1004">Twitter</a>
                            <span>|</span>
                            <a class="color-dark-blue" target="_blank"
                               href="https://www.facebook.com/jingug1004?ref=hl">Facebook</a>
                        </li>
                        <li>Created on: 2017/02/05</li>
                        <li>Latest Update on: 2017/03/13 ~</li>
                    </ul>
                </div><!--/overview-->

                <div id="scroll_main" class="margin-bottom-70">
                    <h2>Main Structure <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <h3> Files Structure <span class="label label-dark">Updated v1.9.2</span></h3>
                    <p>UNIFY에는 <strong>기본적인 스프링 MVC</strong>폴더 경로로 작성 되었습니다. (기본적인 스프링 MVC - STS, Legacy Project, Spring
                        MVC로 프로젝트 작성시 자동 빌드되는 폴더링 기준)</p>
                    <%--다운로드 패키지에서 HTML 포더 내부에는 기본--%>
                    <%--<code>UNIFY Main (Default)</code> 템플리트 및 자산 파일, <code>E-commerce (Shop UI)</code> , <code>Blog--%>
                    <%--&amp; Template</code>, <code>One--%>
                    <%--Pages</code>, <code>Landing Pages</code> 및 <code>Email Templates</code> 패키지. 또한 PSD 파일도--%>
                    <%--포함됩니다. --%>
                    <%--사용 가능한 PSD 파일의 전체 버전을 다운로드하려면 PSD 폴더의 <strong>README.txt</strong> 파일을 확인하십시오. <strong>README.txt</strong>--%>
                    <%--파일에는 다운로드 링크와 암호가 포함되어 있습니다.</p><br>--%>

                    <%--<h4><i class="fa fa-folder fa-2x color-blue"></i> DOWNLOAD PACKAGE</h4>--%>
                    <%--<ul class="list-unstyled css-files">--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Documentation</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>PSD</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>HTML</span>--%>
                    <%--<ul class="list-unstyled css-files css-v1">--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>assets</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>E-Commerce</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Blog-Magazine</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i>--%>
                    <%--<span>One-Pages</span>--%>
                    <%--<ul class="list-unstyled css-files css-v1">--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>assets</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Classic</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Agency</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>App</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Architecture</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Business</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Lawyer</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Shipping</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Spa</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Travel</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Wedding</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Courses</span></li>--%>
                    <%--<li>---- &nbsp;<code>..</code></li>--%>
                    <%--<li>---- &nbsp;<code>..</code></li>--%>
                    <%--</ul>--%>

                    <%--</li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Landing-Pages</span></li>--%>
                    <%--<li>----<i class="fa fa-folder"></i> <span>Email-Templates</span></li>--%>
                    <%--<li>---- &nbsp;<code>index.html</code></li>--%>
                    <%--<li>---- &nbsp;<code>..</code></li>--%>
                    <%--<li>---- &nbsp;<code>..</code></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</ul>--%>

                    <p>자세한 내용을 보려면 아래 링크를 클릭하십시오.</p>
                    <div class="panel-group acc-v1" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-header" href="#header">
                                        Project Folder, File Structure(path)
                                    </a>
                                </h4>
                            </div>
                            <div id="header" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <%--<div class="block-center">--%>
                                    <%--<img class="img-responsive header-img-bordered padding-top-10" src="/resources/docu/img/header01.png" alt="Default Header"></div>--%>
                                    <%--<div class="clearfix margin-bottom-40"></div>--%>

                                    <div class="block-center margin-bottom-30">
                                        <img class="img-responsive" src="/resources/docu/img/mainstructure01.png"
                                             alt=""/>
                                        <img class="img-responsive" src="/resources/docu/img/mainstructure02.png"
                                             alt=""/>
                                        <img class="img-responsive" src="/resources/docu/img/mainstructure03.png"
                                             alt=""/>
                                        <img class="img-responsive" src="/resources/docu/img/mainstructure04.png"
                                             alt=""/>
                                        <img class="img-responsive" src="/resources/docu/img/mainstructure05.png"
                                             alt=""/>
                                    </div>

                                    <p><span class="label label-info">Info</span> 출처:
                                        <small><code>IntelliJ Project Explorer</code></small>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/mainstructure01.png" alt=""/>--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/mainstructure02.png" alt=""/>--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/mainstructure03.png" alt=""/>--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/mainstructure04.png" alt=""/>--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/mainstructure05.png" alt=""/>--%>
                    <%--</div>--%>

                    <br>

                    <p>UNIFY 홈페이지는 <code>header</code>, <code>slider</code>, <code>content
                        part</code>, <code>footer</code> 및 <code>copyright</code> 부분으로 구성됩니다. 그러나 내부 페이지에는
                        <code>slider</code> 대신 <code>breadcrumbs</code>가 포함됩니다.</p>

                    <div class="block-center margin-bottom-30">
                        <%--<img class="img-responsive" src="/resources/docu/img/unify.png" alt=""/>--%>
                        <img class="img-responsive" src="/resources/docu/img/mainstructure06.png" alt=""/>
                    </div>

                    <hr class="margin-bottom-30">

                    <!--Beginning of Page-->
                    <h3>Beginning of the Page</h3>
                    <p>Internet Explorer 브라우저 버전 9를 검색하기 위해 아래 코드와 같이 모든 HTML 페이지에서 특정 클래스가 구현됩니다.</p>

                    <pre class="line-numbers"><code class="language-php">&lt;!DOCTYPE html&gt;
&lt;!--[if IE 9]&gt; &lt;html lang=&quot;en&quot; class=&quot;ie9&quot;&gt; &lt;![endif]--&gt;
&lt;!--[if !IE]&gt;&lt;!--&gt; &lt;html lang=&quot;en&quot;&gt; &lt;!--&lt;![endif]--&gt;</code></pre>
                    <div class="margin-bottom-40"></div>

                    <!--Page Head-->
                    <h3 id="scroll_page_head">Page Head <span class="label label-dark">Updated v1.7</span></h3>
                    <p>페이지 헤드에는 메타 데이터, 파비콘, 제목, 웹 글꼴 및 CSS 링크가 포함됩니다.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;head&gt;
    &lt;title&gt;UNIFY &lt;/title&gt;

    &lt;!-- Meta --&gt;
    &lt;meta charset=&quot;utf-8&quot;&gt;
    &lt;meta content=&quot;width=device-width, initial-scale=1.0&quot; name=&quot;viewport&quot;&gt;
    &lt;meta content=&quot;&quot; name=&quot;description&quot;&gt;
    &lt;meta content=&quot;&quot; name=&quot;author&quot;&gt;

    &lt;!-- Favicon --&gt;
    &lt;link rel=&quot;shortcut icon&quot; href=&quot;favicon.ico&quot;&gt;

    &lt;!-- Web Fonts --&gt;
    &lt;link rel=&quot;shortcut&quot; type=&quot;text/css&quot; href=&quot;//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin&quot;&gt;

    &lt;!-- CSS Global Compulsory --&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/plugins/bootstrap/css/bootstrap.min.css&quot;&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/style.css&quot;&gt;

    &lt;!-- CSS Header and Footer --&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/headers/header-default.css&quot;&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/footers/footer-v1.css&quot;&gt;

    &lt;!-- CSS Implementing Plugins --&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/plugins/animate.css&quot;&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/plugins/line-icons/line-icons.css&quot;&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/plugins/font-awesome/css/font-awesome.css&quot;&gt;

    &lt;!-- CSS Theme --&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/default.css&quot;&gt;

    &lt;!-- CSS Customization --&gt;
    &lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/custom.css&quot;&gt;
&lt;/head&gt;</code></pre>
                    <div class="margin-bottom-40"></div>

                    <!--Header-->
                    <h3>Wrapper <span class="label label-dark">Added v1.4</span></h3>
                    <p><code>.wrapper</code> 클래스가 모든 본문 내용을 래핑하기 위해 v1.4에 추가되었습니다. <strong>ALL</strong>
                        주로 헤더, 슬라이더, breadcrumbs, 내용 부분 등으로 구성됩니다.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;div class=&quot;wrapper&quot;&gt;
    ...
    ...
&lt;/div&gt;</code></pre>
                    <p><span class="label label-blue">Note</span> 아래 코드는 래퍼 내용 내에 중첩되어 있습니다.
                        <code>header</code> 에서 시작하여 <code>copyright</code> 부분 다음에 끝납니다.</p><br>


                    <!--Header-->
                    <h3>Header <span class="label label-dark">Updated v1.6</span></h3>
                    <pre class="line-numbers"><code class="language-php">&lt;!--=== Header ===--&gt;
&lt;div class=&quot;header&quot;&gt;
    &lt;!-- Topbar --&gt;
    &lt;div class=&quot;topbar&quot;&gt;
        ...
        ...
    &lt;/div&gt;
    &lt;!--  End Topbar --&gt;

    &lt;!-- Navbar --&gt;
    &lt;div class=&quot;navbar navbar-default mega-menu&quot; role=&quot;navigation&quot;&gt;
        ...
        ...
    &lt;/div&gt;
    &lt;!-- End Navbar --&gt;
&lt;/div&gt;
&lt;!--=== End Header ===--&gt;</code></pre>
                    <!--Content-->
                    <h3>Content <span class="label label-dark">Updated v1.6</span></h3>
                    <p>컨테이너 블록은 페이지의 모든 내용을 포함합니다. 또한 <code>.content</code>
                        클래스는 v1.4에서 주 랩 컨테이너에 추가되어 내용에 공간 (패딩)을 제공합니다.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;!--=== Content Part  ===--&gt;
&lt;div class=&quot;container content&quot;&gt;
    ...
    ...
&lt;/div&gt;&lt;!--/container--&gt;
&lt;!--=== End Content Part  ===--&gt;</code></pre>

                    <!--Footer-->
                    <h3>Footer</h3>
                    <pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 1 ===--&gt;
&lt;div class=&quot;footer-v1&quot;&gt;
    &lt;div class=&quot;footer&quot;&gt;
        &lt;div class=&quot;container&quot;&gt;
            ...
            ...
        &lt;/div&gt;
    &lt;/div&gt;&lt;!--/footer--&gt;

    &lt;div class=&quot;copyright&quot;&gt;
        &lt;div class=&quot;container&quot;&gt;
            ...
            ...
        &lt;/div&gt;
    &lt;/div&gt;&lt;!--/copyright--&gt;
&lt;/div&gt;&lt;!--/footer-v1--&gt;
&lt;!--=== End Footer Version 1 ===--&gt;</code></pre>

                    <div class="margin-bottom-50"></div>

                    <!--Javascript and jQuery-->
                    <h3>Javascript and jQuery</h3>
                    <p>Javascript 파일은 페이지 하단에서 호출되므로 이 방법은로드 시간을 효과적으로 줄입니다.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;!-- JS Global Compulsory --&gt;
&lt;script src=&quot;assets/plugins/jquery/jquery.min.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;assets/plugins/jquery/jquery-migrate.min.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;assets/plugins/bootstrap/js/bootstrap.min.js&quot;&gt;&lt;/script&gt;

&lt;!-- JS Implementing Plugins --&gt;
&lt;script src=&quot;assets/plugins/back-to-top.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;assets/plugins/smoothScroll.js&quot;&gt;&lt;/script&gt;

&lt;!-- JS Customization --&gt;
&lt;script type=&quot;text/javascript&quot; src=&quot;assets/js/custom.js&quot;&gt;&lt;/script&gt;

&lt;!-- JS Page Level --&gt;
&lt;script src=&quot;assets/js/app.js&quot;&gt;&lt;/script&gt;
&lt;script&gt;
jQuery(document).ready(function() {
    App.init();
});
&lt;/script&gt;

&lt;!--[if lt IE 9]&gt;
    &lt;script src=&quot;assets/plugins/respond.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;assets/plugins/html5shiv.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;assets/plugins/placeholder-IE-fixes.js&quot;&gt;&lt;/script&gt;
&lt;![endif]--&gt;</code></pre>
                </div>


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_ssl">
                    <h2>SSL & RSA <span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>SSL Authentication & RSA Encryption</h3>

                    <p>스프링에서 중요한 보안 기능을 자체적으로 가지고 있는 Spring Security가 있습니다. 제가 도전하고 풀고 싶었던 이슈는 SSL 인증과 RSA 암호화 방식이었습니다.
                        그래서 RSA 방식으로 구현시도를 해봤습니다.</p>

                    <p>그 와중에 <code>리눅스 OS 운영체계</code>와 여러 명령어들을 배우게 되었습니다. 리눅스의 기본적인 부분을 필요에 의해서 습득하게 되어 좋은 결과를 냈던 것에
                        만족합니다. 그리고 RSA의
                        기능 구현에 여러 에로사항을 느껴 스프링 시큐리티 - 하이버네이트 프로퍼티로 대처를 하였습니다.</p>

                    <p>결론은 스프링 시큐리티로도 기능을 구현하지 못 하였습니다. 그 원인으로는 로그인 페이지와 회원가입 페이지의 비지니스 로직에 오류가 발생하는데 그 원인을 제대로 파악하지 못
                        했기 때문입니다.</p>

                    <p>그 와중에 스프링 시큐리티의 인증과 권한의 여러 각도로 이슈를 바라볼 수 있었으며 인증과 권한에 대해서 숙지할 수 있었습니다.</p>

                    <h4>SSL & RSA Specify</h4>
                    <p> SSL & RSA에 대해 더 자세히 알고 싶으시면 아래 링크를 클릭하십시오.</p>

                    <ul>
                        <li><a target="_blank"
                               href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER
                            지식백과 IT 용어사전</a></li>
                        <li><a target="_blank" href="https://ko.wikipedia.org/wiki/RSA_암호">위키백과</a></li>
                        <li><a target="_blank" href="https://namu.wiki/w/공개키%20암호화%20방식">나무위키</a></li>
                        <li><a target="_blank"
                               href="http://stackoverflow.com/questions/12471999/rsa-encryption-decryption-in-android">Stack
                            Overflow</a></li>
                        <li><a target="_blank" href="http://http://okky.kr/article/261064">okky.kr</a></li>
                        <li><a target="_blank" href="http://rhammer.tistory.com/24">rhammer tistory</a></li>
                        <li><a target="_blank" href="http://reinliebe.tistory.com/79">reinliebe tistory</a></li>
                        <li><a target="_blank" href="http://pulsebeat.tistory.com/56">pulsebeat tistory</a></li>
                    </ul>

                    <h4>Debug Prediction</h4>

                    <p>여러 보안 기능들이 있습니다. 보다 구체적인 풀어나가야 할 의문점들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>스프링 시큐리티를 Hibernate로 구현하려고 하는데 Mybatis와의 충돌로 인한 충격을 최소화할 수 있는 방법이 있을까?</li>
                        <li>AWS 웹 서비스와 스프링 시큐리티와의 충돌은 어떤 것들이 있을까?</li>
                    </ul>

                    <h4>Resolution Strategy</h4>

                    <p>여러 해결 전략들이 있습니다. 해결해나가기 위하여 필요한 보다 구체적으로 숙지해야할 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>인증과 권한에 대하여 메모리와 DB를 이용해 사용자 인증을 더 숙지해야 한다.</li>
                        <li>스프링 시큐리티의 패스워드 암호화 지원에 더 숙지해야 한다.</li>
                        <li>BCrypt를 적용하여 User들의 개인정보를 보호해야 하는 일이 시급하다.</li>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_jenkins">
                    <h2>Jenkins<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>Jenkins Server</h3>

                    <p>젠킨스 서버는 CI(Continuous Integration) Tool로서 여기서 CI란 팀의 구성원들이 작업한 내용을 정기적으로 통합하는 것을 의미합니다.</p>

                    <p>개인 프로젝트를 제외하고 팀단위 중대형 프로젝트를 맡게 된다면 무조건 CI를 통하여
                        통합 빌드 관리를 해야 한다는 기사를 읽은 적이 있습니다.</p>

                    <p>젠킨스는 웹 사이트에 localhost로 접속하여 관리 가능하기 때문에 개발서버 포트 충돌 방지를 위하여 개발서버 HTTP 포트번호를 8081로 톰캣 서버
                        세팅하였습니다.</p>

                    <h4>Effect of Use</h4>

                    <p>Jenkins 서버를 사용하는 이유는 여러가지인데 제 개인적인 사견으로 봤을 때 가장 큰 이유는 아래와 같습니다.</p>

                    <ul>
                        <li>프로젝트의 빌드가 정상적으로 되고 있는지 체크할 때</li>
                        <li>자동으로 유닛 테스트와 <code>통합 테스트 (Integration Test)</code>들의 정기적인 실행. 만약 테스트 결과에 문제가 있을 때 이메일을 통해
                            리포트
                        </li>
                        <li>PMD 같은 코드의 질을 확인할 수 있는 모니터링 시스템과의 연동으로 코드의 질을 조절</li>
                    </ul>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/jenkins01.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/jenkins02.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/jenkins03.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/jenkins04.png" alt=""/><br/>
                    </div>

                    <p>VCS의 GitHub의 소스가 Push되면 Jenkins에서 Pull하여 자동으로 통합 빌드를 실행합니다.</p>

                    <p>구현 와중에 CI의 개념을 접하게 되어 숙지할 수 있었고 여러 각도로 팀의 목적에 적합한 효율적인 방법을 바라볼 수 있었습니다.</p>

                    <h4>Expectation Effectiveness</h4>

                    <p> 하나의 프로젝트를 여러 명으로 구성된 한 팀이 작업할 때 프로젝트를 리드하는 매니저가 일을 여러가지로 나눠서 팀 멤버들한테 분배하고 팀 멤버들은 각각 할당된 부분만 작업을
                        하게
                        됩니다. 그리고 팀 멤버들은 자신이 담당해서 하고 있는 부분의 소스코드를 정기적으로 GitHub나 SVN과 같은 Version Control System에 Push 하는데
                        이 각각의
                        팀 멤버들로부터 Submit된 소스코드들을 정기적으로 통합하는 것으로서 큰 효과를 누릴 수 있을 것입니다.</p>

                    <p>Jenkins 서버는 현재 진행 중인 프로젝트가 정상적으로 빌드가 되고 있는지를 정기적으로 체크해서 결과를 팀원들한테 알려주고 문제가 발생했을 때 조기에 알려줄 수 있게
                        해줌으로써 여러 팀 멤버들이 큰 문제없이 각자의 맡은 부분만을 작업할 수 있도록 도와줍니다. 또한 프로젝트 빌드시 자동으로 <code>유닛 테스트</code>와 <code>통합
                            테스트</code>를 실행해줘서 잘 못된
                        점이 있으면 알려주고 또한 현재 얼마만큼의 소스코드를 유닛 테스트가 커버하고 있는지 및 어떤 부분에 문제가 있을 수 있는지 등의 정보도 SonarQube와 같이 연동시
                        모니터링 할 수 있도록 도와줍니다.
                    </p>


                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <%--<ul>--%>
                    <%--<li>스프링 시큐리티를 Hibernate로 구현하려고 하는데 Mybatis와의 충돌로 인한 충격을 최소화할 수 있는 방법이 있을까?</li>--%>
                    <%--</ul>--%>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>Jenkins에서 AWS 바로 인스턴스에 접근할 수 있도록 해야 한다.</li>
                        <ul>
                            <li>소스 변경에 대한 즉각적인 변경사항 적용</li>
                            <li>변화에 대한 더욱 능동적 신속한 대응</li>
                            <li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>
                        </ul>
                        <li>Jenkins 보안을 더욱 강화해야 한다.</li>
                        <li>IntelliJ 자체적으로 Jenkins Plug-In을 설치하여 바로 접근할 수 있는 방법과 권한을 획득하도록 한다.</li>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_aws">
                    <h2>AWS<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>amazon Web Service</h3>

                    <p>amazon Web Service(이하:AWS)는 안전한 <code>클라우드 서비스 플랫폼</code>으로서, 컴퓨팅 파워, 데이터베이스 스토리지, 콘텐츠 전송 및 기타
                        기능을 제공하여 기업이
                        확장하고 성장하도록 지원합니다. 무엇보다 1개의 인스턴스에 대하여 1년간 무료로 사용할 수 있다는 점에 대하여 선택을 하게 되었습니다.</p>

                    <p>okky.kr에서 신입 포트폴리오로 1년간 무료로 AWS에서 호스팅 하는 기능도 넣으면 강점이 된다는 기사를 본적이 있어서 기능을 구현하게 되었습니다.</p>

                    <h4>Effect of Use</h4>

                    <p>Docker나 Azure보다 AWS를 사용하는 이유는 아래와 같습니다.</p>

                    <ul>
                        <li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>
                        <li><a target="_blank"
                               href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>
                        </li>
                        <li><a target="_blank"
                               href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>
                        </li>
                        <li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>
                        </li>
                        <li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>

                    </ul>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/rds01.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/rds02.png" alt=""/><br/>
                    </div>

                    <p>총 1개의 인스턴스(1 Running Instances : 무료)와 1개의 IP를 할당 받아 고정시키고(1 Elastic IPs), 1개의 웹 서버(Volumes :
                        Amazone LINUX API, RDS : MariaDB)의 볼륨을 가지고
                        1개의 SSH / RSA 방식의 보안키(1 Key Pairs)를 부여받고 저장하고 있습니다. 그 모든 Resources들은 Security Groups에 저장 및 관리하고
                        있습니다.</p>

                    <p>구현 와중에 <code>Linux 운영체계</code>와 명령어를 숙지할 수 있었고 여러 각도로 AWS를 확장하여 사용하면 무궁무진한 서비스를 제공할 수 있을 것으로 판단
                        되었습니다.</p>

                    <p>한국 대표 포털사이트 중의 하나인 Daum도 AWS를 사용하고 있다고 합니다.</p>

                    <h4>Expectation Effectiveness</h4>

                    <p>저렴한 비용으로 서버를 구축할 수 있기에 스타트업이나 다른 기업들에게 적합합니다.</p>

                    <p>다큐멘트나 API가 한국어로 번역해서 제공되기 때문에 쉽게 접할 수 있다는 장점이 있습니다. 현지화가 잘 되어 있어서 누구나 쉽게 서버를 구축할 수 있습니다.</p>

                    <p>서비스를 가장 빨리 출시하여 끈끈한 개발자 생태계를 통하여 개발자들이 AWS 서비스를 사용하는데 불편함이 없도록 많은 지원을 해주고 있습니다.</p>


                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/awserror01.png" alt=""/>
                    </div>

                    <ul>
                        <li>Ubuntu로 Root 접속을 하려고 하면 Permission Denied 되는데 권한문제가 아닌 서버 인스턴스에 RSA 암호화 방식이 제대로 설정되지 않아서 접근
                            거부가 일어납니다.
                        </li>
                        <li>인스턴스가 이미 만들어져 Running 하고 있기 때문에 웹에서 접속이나 이용은 에러가 없으나 내무적으로 파일 관리나 다른 설정에서는 항상 변경되는 RSA 암호화
                            방식 때문에 접근 어려움이 생깁니다.
                        </li>
                        <li>그로 인하여 RSA 암호화 방식을 더욱 익혀야 할 필요가 있습니다.</li>
                    </ul>

                    <br/>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/awserror02.png" alt=""/>
                    </div>
                    <ul>
                        <li>게시판 기능중 파일을 첨부하면 DB서버(RDS)에서 접근 거부 및 비지니스 로직에서 문제가 발생합니다.</li>
                        <li><code>스택 트레이스</code> 및 크롬 개발자 도구를 보면 400 오류로 잘못된 Request 요청으로 문제가 발생한다는 것을 발견할 수 있습니다.</li>
                    </ul>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>Jenkins 부분에서 언급했듯이 Jenkins에서 AWS 바로 인스턴스에 접근할 수 있도록 해야 한다.</li>
                        <ul>
                            <li>소스 변경에 대한 즉각적인 변경사항 적용</li>
                            <li>변화에 대한 더욱 능동적 신속한 대응</li>
                            <li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>
                        </ul>
                        <li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>
                        <li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>
                        <li>IntelliJ 자체적으로 AWS Plug-In을 설치하여 바로 접근할 수 있는 방법과 권한을 획득하도록 한다.</li>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_github">
                    <h2>GitHub<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>VCS</h3>

                    <p>VCS는 GitHub만 사용하였습니다. 다른 VCS 중에 하나인 SVN이 있는데 차후 사용하여 GitHub의 장단점을 비교할 수 있는 시간을 가져야 할 것 입니다.</p>

                    <p>제 GitHub 주소는 <a target="_blank" href="https://gist.github.com/jingug1004">https://gist.github.com/jingug1004</a>이며
                        학원 교육기간 중 첫번째 Mini-Project로 비디오 대여 시스템과 두번째 Semi-Project인 JSP로 커뮤니티 구현한 소스를 Repo에 Push 해놨습니다.
                    </p>

                    <h4>Effect of Use</h4>

                    <p>잘 아시다시피 <code>분산 버전 관리 툴</code>을 사용하여 협업하는 프로젝트를 수행해야 하는 이유는 절대적입니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/github01.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/github02.png" alt=""/><br/>
                    </div>

                    <p>버전이 변경될 때마다 새로운 Repositories를 만들었으며 각 Repository에 Issue 등록 Assignment 할당과 Branch 사용법을 알고 있습니다. 실제
                        학원에서 팀 프로젝트 진행할 때 팀장으로서 <code>Branch 기능</code>을 주문하여 Fetch 후 Merge 하였습니다.</p>

                    <p>IntelliJ 에디터에도 기본적으로 VCS plug-in이 모두 내장되어 있으며 UI는 이클립스보다 더욱 유용합니다. VCS를 이용하는데 아무런 불편함이나 에로사항이
                        없습니다.</p>

                    <h4>Expectation Effectiveness</h4>

                    <p>공통의 이슈 해결 및 Docu 공유로 목적달성에 더욱 효율적으로 작동할 것 입니다. 소스나 이슈에 대하여 활발한 커뮤니케이션을 할 수 있습니다.</p>

                    <p>실제 업무시 일일보고까지 따로 작성하지 않고 GitHub을 이용하면 어떨까 라는 궁금증을 가져봅니다</p>

                    <p>젠킨스를 이용하며 느낀 것이 GitHub에도 여러 기능을 확장할 수 있다는 것에 놀랬습니다. AWS처럼 GitHub도 아직 알지 못한 기능들이 무궁무진하게 많이 있을 것
                        같습니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror01.png" alt=""/>--%>
                    <%--</div>--%>

                    <%--<ul>--%>
                    <%--<li>Ubuntu로 Root 접속을 하려고 하면 Permission Denied 되는데 권한문제가 아닌 서버 인스턴스에 RSA 암호화 방식이 제대로 설정되지 않아서 접근--%>
                    <%--거부가 일어납니다.--%>
                    <%--</li>--%>
                    <%--<li>인스턴스가 이미 만들어져 Running 하고 있기 때문에 웹에서 접속이나 이용은 에러가 없으나 내무적으로 파일 관리나 다른 설정에서는 항상 변경되는 RSA 암호화--%>
                    <%--방식 때문에 접근 어려움이 생깁니다.--%>
                    <%--</li>--%>
                    <%--<li>그로 인하여 RSA 암호화 방식을 더욱 익혀야 할 필요가 있습니다.</li>--%>
                    <%--</ul>--%>

                    <%--<br/>--%>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror02.png" alt=""/>--%>
                    <%--</div>--%>
                    <%--<ul>--%>
                    <%--<li>게시판 기능중 파일을 첨부하면 DB서버(RDS)에서 접근 거부 및 비지니스 로직에서 문제가 발생합니다.</li>--%>
                    <%--<li>스택 트레이스 및 크롬 개발자 도구를 보면 400 오류로 잘못된 Request 요청으로 문제가 발생한다는 것을 발견할 수 있습니다.</li>--%>
                    <%--</ul>--%>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>Stars나 다른 사용하지 않은 기능을 사용함으로서 GitHub를 더 익혀야 한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_sql">
                    <h2>SQL<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>MariaDB</h3>

                    <p>MySQL과 동일한 베이스인 MariaDB를 사용하였습니다. MariaDB가 MySQL과 별 차이가 없으며 성능이 MySQL보다 더욱
                        뛰어나다고 알고 있습니다. Client GUI Tool은 맥북에 최적화된 Sequel Pro를 사용하였습니다.</p>

                    <p>ORM은 <code>MyBatis</code>를 사용하였습니다. Hibernate도 사용할 예정입니다. src/main/resouces/mappers 폴더 이하 DB와 VO로
                        접근할 수 있는
                        Mapper파일을 만들어 모아놨습니다.</p>

                    <pre>
    Type : InnoDB
    Encoding : UTF-8 Unicode(utf8)
    Collation : utf8_general_ci
</pre>

                    <h4>Effect of Use</h4>

                    <p>MariaDB를 사용하여 MySQL보다 성능 개선이 되었음은 물론입니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/sql01.png" alt=""/><br/>
                        <img class="img-responsive" src="/resources/docu/img/sql02.png" alt=""/><br/>
                    </div>

                    <p>UML이 단순한 구조지만 기능을 더욱 많이 구현함으로서 가장 효율적인 구조로 테이블을 확장시켜나갈 예정입니다.</p>
                    <p>DB에는 회원정보, 게시판 내용, 댓글이 등록됩니다. 게시판 글 등록과 함께 파일첨부시 파일 경로를 중복하지 않을 UUID를 파일명 앞에 붙여 DB에 저장합니다.</p>
                    <p>파일은 비지니스 로직을 구현하여 servlet-context.xml에 설정한 빈(Bean) 경로에 저장됩니다. 게시판 파일 첨부 삭제 및 게시판 글 삭제시 DB와 경로에
                        저장한 임시파일도 함께 삭제됩니다.</p>

                    <h4>Expectation Effectiveness</h4>
                    <p>ORM(MyBatis)을 통하여 기본적인 SQL 기능 구현을 함으로서 직접 복잡한 쿼리문을 날리지 않는 수고를 줄일 수 있습니다. </p>
                    <p>TDD가 아닌 <code>DDD</code>에 대해서도 한번 생각해보는 기회를 가지게 됩니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror01.png" alt=""/>--%>
                    <%--</div>--%>

                    <%--<ul>--%>
                    <%--<li>Ubuntu로 Root 접속을 하려고 하면 Permission Denied 되는데 권한문제가 아닌 서버 인스턴스에 RSA 암호화 방식이 제대로 설정되지 않아서 접근--%>
                    <%--거부가 일어납니다.--%>
                    <%--</li>--%>
                    <%--<li>인스턴스가 이미 만들어져 Running 하고 있기 때문에 웹에서 접속이나 이용은 에러가 없으나 내무적으로 파일 관리나 다른 설정에서는 항상 변경되는 RSA 암호화--%>
                    <%--방식 때문에 접근 어려움이 생깁니다.--%>
                    <%--</li>--%>
                    <%--<li>그로 인하여 RSA 암호화 방식을 더욱 익혀야 할 필요가 있습니다.</li>--%>
                    <%--</ul>--%>

                    <%--<br/>--%>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror02.png" alt=""/>--%>
                    <%--</div>--%>
                    <%--<ul>--%>
                    <%--<li>게시판 기능중 파일을 첨부하면 DB서버(RDS)에서 접근 거부 및 비지니스 로직에서 문제가 발생합니다.</li>--%>
                    <%--<li>스택 트레이스 및 크롬 개발자 도구를 보면 400 오류로 잘못된 Request 요청으로 문제가 발생한다는 것을 발견할 수 있습니다.</li>--%>
                    <%--</ul>--%>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>스프링 시큐리티나 SSL & RSA 방식 구현과 관련하여 DB를 더욱 심도있게 공부해야 한다.</li>
                        <li>보안 방식 구현했을 때의 DB에 등록되는 내용을 보안적인 측면으로 예상해야 하며 유저 등록시에 개인정보도 스프링 시큐리티의 관점으로 접근하여 해결해야한다.</li>
                        <li>각 카테고리에 상품 올릴 때 연동되는 DB 내용을 어떻게 하면 재생산 안 하고 효율적으로 재사용 할 수 있을지 고민을 많이 해야한다.</li>
                        <li>어떤 특정 페이지에서는 로딩이 늦어지는 이유가 비지니스 로직 문제인지 DB의 성능 비개선으로 인한 원인인지 찾아야한다.</li>
                        <li>DB와 관계있는 VO, DTO 개념을 더욱 익혀야하며 마이바티스와 하이버네이트의 차이점과 장단점을 손수 구현하여 몸으로 익혀야한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_interceptor">
                    <h2>Interceptor<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>Login handling utilizing "Interceptor"</h3>

                    <p>세션 트래킹이라 불리는 로그인 처리는 웹 페이지에서 필수적으로 적용돼야 하는 기능입니다.</p>

                    <p><code>HttpSession</code>을 이용한 로그인, <code>Cookie</code>와 HttpSession을 활용한 <strong>자동 로그인</strong>
                    </p>


                    <h4>Effect of Use</h4>

                    <p>기본 기능의 개발이 끝난 후 인터셉터와 쿠키 등을 활용해서 로그인 처리를 해보았습니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>
                    <p>정상적으로 실행되면 브라우저의 화면에서는 아이디와 패스워드를 보관할 수 있는 화면이 보여집니다.</p>
                    <p>AuthInterceptor.class를 이용해서 게시물 작성 페이지에서 "New Board"를 누르면 로그인 페이지로 이동하며 로그인 성공하면 직전 작성할 수 있는 페이지로 이동합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor01.png" alt=""/><br/>
                    </div>

                    <p>스택트레이스 화면입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor02.png" alt=""/><br/>
                    </div>

                    <p>로그인 하지 않았을 때는 자기가 작성한 글을 수정하거나 댓글을 남길 수가 없습니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor03.png" alt=""/><br/>
                    </div>

                    <p>로그인 하였을 때는 글 수정 및 삭제, 다른 글에 댓글을 남길 수가 있습니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor04.png" alt=""/><br/>
                    </div>

                    <p>로그인 하였을 때는 자기가 남긴 댓글을 수정하거나 삭제할 수 있습니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor05.png" alt=""/><br/>
                    </div>

                    <p>로그인 시 "Remember Me"를 체크하고 로그인하면 LoginInterceptor.class의 postHandle()을 이용해서 HttpSession에 UserVO 타입의 객체를 보관합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor06.png" alt=""/><br/>
                    </div>

                    <p>브라우저의 개발자 도구에 들어가서 확인하면 loginCookie가 있는 것이 발견됩니다. 유효기간을 7일로 설정해놨기 때문에 그 이상의 시간이 지난 후에 접속하게 되면 loginCookie가 전송되지 않을 것입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/interceptor07.png" alt=""/><br/>
                    </div>




                    <h4>Expectation Effectiveness</h4>
                    <p>인터셉터를 이용해서 특정 컨트롤러의 동작 전과 후에 대한 처리를 할 수 있습니다.</p>
                    <p>필터와 달리 인터셉터는 스프링의 영역에 속하므로 스프링의 기능들을 활용할 수 있습니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror01.png" alt=""/>--%>
                    <%--</div>--%>

                    <%--<ul>--%>
                    <%--<li>Ubuntu로 Root 접속을 하려고 하면 Permission Denied 되는데 권한문제가 아닌 서버 인스턴스에 RSA 암호화 방식이 제대로 설정되지 않아서 접근--%>
                    <%--거부가 일어납니다.--%>
                    <%--</li>--%>
                    <%--<li>인스턴스가 이미 만들어져 Running 하고 있기 때문에 웹에서 접속이나 이용은 에러가 없으나 내무적으로 파일 관리나 다른 설정에서는 항상 변경되는 RSA 암호화--%>
                    <%--방식 때문에 접근 어려움이 생깁니다.--%>
                    <%--</li>--%>
                    <%--<li>그로 인하여 RSA 암호화 방식을 더욱 익혀야 할 필요가 있습니다.</li>--%>
                    <%--</ul>--%>

                    <%--<br/>--%>

                    <%--<div class="block-center margin-bottom-30">--%>
                    <%--<img class="img-responsive" src="/resources/docu/img/awserror02.png" alt=""/>--%>
                    <%--</div>--%>
                    <%--<ul>--%>
                    <%--<li>게시판 기능중 파일을 첨부하면 DB서버(RDS)에서 접근 거부 및 비지니스 로직에서 문제가 발생합니다.</li>--%>
                    <%--<li>스택 트레이스 및 크롬 개발자 도구를 보면 400 오류로 잘못된 Request 요청으로 문제가 발생한다는 것을 발견할 수 있습니다.</li>--%>
                    <%--</ul>--%>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>세션을 이용하는 경우 브라우저의 종료와 함께 사용자의 연결정보도 같이 잃어버리게 된다. 반면에 쿠키는 보안 상에 약점을 가지니 방법을 강구해야 한다.</li>
                        <li>웹에서 세션을 사용하는 것 역시 수많은 사용자가 새로운 세션을 짧은 시간 내에 생성하면 서버에 많은 부하를 주게 될 것이다. 서버 과부하를 예방하는 쪽으로 유도해야 한다.</li>
                        <li>인터셉터를 이용하면서 스프링 시큐리티를 더욱 숙지하여 결합시킬 수 있도록 하자.</li>
                        <li>업무에 따른 권한이 복잡하다면, 인터셉터보다는 차라리 처음부터 스프링 시큐리티로 인증과 권한을 나누는 방법을 생각해야한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_fileupload">
                    <h2>File Upload<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>Attachments feature of post</h3>

                    <p>게시물을 작성할 때 가장 필수적인 기능은 첨부파일을 추가하고 이를 화면에서 보여주거나 다운로드 할 수 있는 기능입니다.</p>

                    <p>첨부파일 업로드 처리. Ajax를 이용한 파일 업로드. 첨부파일의 저장. 파일 조회 및 다운로드.
                    </p>


                    <h4>Effect of Use</h4>

                    <p>게시물과 댓글에 대한 처리가 끝났다면 첨부파일에 대한 처리를 통해서 좀 더 다양한 기능이 있는 게시물 관리 기능을 구현할 수 있습니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>
                    <p>Ajax를 이용해서(/WEB-INF/views/uploadAjax.jsp) 정상적으로 실행되면 게시물에 파일을 등록할 수 있는 박스 화면이 보여집니다.</p>
                    <p>파일 첨부하는 단추를 클릭하여 화면이 전환되는 형식이 아닌 화면전환없이 파일을 끌어다 회색 박스에 넣어 파일을 첨부합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload01.png" alt=""/><br/>
                    </div>

                    <p>이미지 파일과 이미지 파일을 제외한 모든 확장자의 파일(ex:Excel) 화면입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload02.png" alt=""/><br/>
                    </div>

                    <p>정상적으로 파일이 올라간 스택트레이스 입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload03.png" alt=""/><br/>
                    </div>

                    <p>로그인하여 자기가 파일 첨부한 게시글을 보면 올린 내용 그대로 올라가 있는 것을 확인할 수 있습니다.</p>
                    <p>이미지 파일을 제외한 첨부파일을 클릭했을 때는 컴퓨터에 저장되며 이미지 파일들(jpg, jpeg, png, gif)은 모달 효과를 사용하여 원본 파일을 볼 수 있도록 이벤트 처리되었습니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload04.png" alt=""/><br/>
                    </div>

                    <p>정상적으로 등록되었을 때의 스택트레이스 입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload05.png" alt=""/><br/>
                    </div>

                    <p>정상적으로 등록되었을 때의 DB 입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload06.png" alt=""/><br/>
                    </div>

                    <p>정상적으로 등록되었을 때의 컴퓨터 폴더 경로 입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/fileupload07.png" alt=""/><br/>
                    </div>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Issue Detection</h4>

                    <p>여러 이슈와 오류가 발견될 수 있습니다. 보다 구체적으로 발견될 오류들은 아래에 추가됩니다.</p>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/awserror01.png" alt=""/>
                    </div>

                    <ul>
                        <li>Ubuntu로 Root 접속을 하려고 하면 Permission Denied 되는데 권한문제가 아닌 서버 인스턴스에 RSA 암호화 방식이 제대로 설정되지 않아서 접근
                            거부가 일어납니다.
                        </li>
                        <li>인스턴스가 이미 만들어져 Running 하고 있기 때문에 웹에서 접속이나 이용은 에러가 없으나 내무적으로 파일 관리나 다른 설정에서는 항상 변경되는 RSA 암호화
                            방식 때문에 접근 어려움이 생깁니다.
                        </li>
                        <li>그로 인하여 RSA 암호화 방식을 더욱 익혀야 할 필요가 있습니다.</li>
                    </ul>

                    <br/>


                    <h4>Expectation Effectiveness</h4>
                    <p>JS가 아닌 Ajax를 이용하여 검색창의 연관검색어 및 네이버지도나 구글지도를 구현 할 수 있습니다.</p>
                    <p>AngularJS나 다른 프론트엔드 쪽의 공부에 큰 거부감이 없습니다.</p>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/awserror02.png" alt=""/>
                    </div>
                    <ul>
                        <li>게시판 기능중 파일을 첨부하면 DB서버(RDS)에서 접근 거부 및 비지니스 로직에서 문제가 발생합니다.</li>
                        <li><code>스택 트레이스</code> 및 크롬 개발자 도구를 보면 400 오류로 잘못된 Request 요청으로 문제가 발생한다는 것을 발견할 수 있습니다.</li>
                    </ul>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>JS를 JQuery로 변환하는 방법을 모색한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_aop">
                    <h2>AOP & Transaction<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>
                    <!-- Bootsrap  -->
                    <h3>Processing AOP and Transaction</h3>

                    <p>크롬의 확장 프로그램 Advanced REST Client를 이용하는 방법을 익혀 테스트 합니다.</p>

                    <p>비지니스 로직에만 전념할 수 있는 다양한 기법을 이용합니다.</p>

                    <p>AOP에 대한 숙지가 확실치 않아 최소한의 기능만 적용시켜 보았습니다.</p>

                    <p>AOP용어 이해하고 적용. 트랜잭션이 필요한 상황 이해. 댓글 처리에 필요한 트랜잭션 처리. 컨트롤러의 메소드 실행 시간 체크.</p>

                    <h4>Effect of Use</h4>

                    <p></p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>
                    <p>Rest 방식으로 연결하여 테스트 하기위해 구글 크롬 확장프로그램에서 Advaced REST Client를 설치합니다.</p>
                    <p>user01이 user03에게 메세지를 보냄으로서 AOP 및 Transaction 설정이 제대로 되어있는지 확인합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/aop01.png" alt=""/><br/>
                    </div>

                    <p>200번으로 정상적으로 처리되었음을 확인합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/aop02.png" alt=""/><br/>
                    </div>


                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Expectation Effectiveness</h4>

                    <p>개발자가 원하는 코드를 실행하는데 얼마의 시간이 소모되는지 쉽게 알 수 있습니다.</p>
                    <p>개발자가 메소드에 전달되는 파라미터나 리턴 값에 대해서 로그를 기록할 수 있습니다.</p>
                    <p>데이터베이스 상에서 트랜잭션 처리를 설정하여 성공하는 경우에만 모든 데이터가 완전하게 처리되는 방법을 적용할 수 있습니다.</p>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>스프링의 중요한 특징으로 뽑히는 의존성 주입과 관련된 내용 다음으로 AOP가 있는데 많은 숙지가 필요하다.</li>
                        <li>중요한만큼 더욱 실제적으로 활용할 수 있는 방법을 모색한다.</li>
                        <li>Advice의 종류 중에 가장 많이 이용하는 Around를 더욱 이해해야 한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->


                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_board">
                    <h2>Board<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>

                    <h3>Managing post of basic features</h3>

                    <p>실제로 아주 단순한 CRUD(등록, 수정, 삭제, 조회) 게시물 관리를 제작했습니다. </p>

                    <p>개발 순서는 '뒤에서 앞으로'의 순서로 DB관련 부분을 개발하고 컨트롤러와 비지니스 영역을 개발 후 화면 쪽으로 개발하였습니다.</p>

                    <p>/main/java/ 폴더의 프로젝트 폴더는 Controller.클래스들은 controller 패키지 폴더에 넣었습니다. </p>

                    <p>외부 변화에 유연하게 대응하기 위하여 컨트롤러와 DAO 사이에 Service 인터페이스와 인터페이스를 implemetns(구현)한 클래스를 만들 service 패키지 폴더명으로 하였습니다</p>

                    <p>DB에 접근할 수 있는 B/L이 있는 DAO 클래스들과 인터페이스들은 persistence 패키지 폴더에 있습니다.</p>

                    <p>DAO인터페이스를 구현한(오버라이드) DAOImpl 클래스에 MyBatis를 사용하여 DB 쿼리문을 따로 작성하지 않고 쿼리요청 작업을 수행할 수 있습니다.</p>

                    <p>DB와 DAO를 연결할 수 있는 VO 클래스들은 domain 패키지 폴더에 있습니다.</p>

                    <p>게시판 UI 레이아웃은 Admin LTE 기본 템플릿을 이용하였습니다.</p>

                    <p>더 자세한 내용은 파일첨부한 javadoc.zip을 참고하여 주시기 바랍니다.</p>

                    <h4>Effect of Use</h4>

                    <p>스프링 MVC를 기본적으로 익힐 수 있는 것이 게시판 기능 구현하는 것이라고 생각합니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>
                    <p>한 페이지당 10개의 게시물로서 10페이지가 넘어가면 다른 10단위로 넘어갈 수 있도록 페이징 처리하였습니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/board01.png" alt=""/><br/>
                    </div>

                    <p>tbl_board 테이블의 DB content 내용입니다. </p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/board02.png" alt=""/><br/>
                    </div>

                    <p>tbl_board 테이블의 DB Structure 내용입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/board03.png" alt=""/><br/>
                    </div>


                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Expectation Effectiveness</h4>

                    <p>실제로 작업을 진행함으로서 예상치 못한 문제들을 풀어나감으로서 디버깅 및 프로그래밍 능력을 향상시킵니다.</p>
                    <p>간단하지만 기본이 되는 프로젝트를 직접 만들어보고 구현함으로서 본인만의 노하우를 쌓을 수 있습니다.</p>
                    <p>MyBatis 및 XML, 프론트엔드와 관련한 부수적인 것들을 익힐 수 있습니다.</p>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>글을 쓸 수 있는 register.jsp를 네이버 스마트 에디터로 개선 적용시켜 본다.</li>
                        <li>게시판 글 등록 및 조회 댓글 등록에 대하여 User의 포인트 점수를 플러스 시킨다.</li>
                        <li>여러 카테고리에 게시판을 재생산하지 않고 어떻게 DB와 서버에 연동하여 게시판을 재활용할 수 있는지 방법을 모색해본다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->

                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_spring">
                    <h2>Spring Framework<span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <div class="margin-bottom-30"></div>
                    <hr>

                    <h3>Basic structure and composition of Spring Framework</h3>

                    <p>TDD(slf4j)를 통하여 무리한 Server Run을 줄임으로 반복적이고 단순한 테스트를 직관적으로 처리됨을 확인할 수 있습니다.</p>
                    <p>스프링 프레임워크에 메이븐 플랫폼이 어떻게 라이브러리 관리를 해주고 Dependency 기능과 Lifecycle을 알 수 있습니다.</p>
                    <p>기본적인 스프링 프레임워크의 강점과 장점을 익히는데 중점을 둡니다.</p>


                    <h4>Effect of Use</h4>

                    <p>스프링 MVC를 기본적으로 익힐 수 있는 것이 게시판 기능 구현하는 것이라고 생각합니다.</p>

                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="https://aws.amazon.com/ko/events/cloud/">aws.amazon.com</a></li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="http://www.datamation.com/cloud-computing/amazon-aws-vs.-microsoft-azure-buying-guide.html">Datamation.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank"--%>
                    <%--href="https://blogs.endjin.com/2016/07/aws-vs-azure-vs-google-cloud-platform-compute/">blogs.endjin.com</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.naver.com/taek171/220761487824">http://blog.naver.com/taek171/</a>--%>
                    <%--</li>--%>
                    <%--<li><a target="_blank" href="https://blog.leedoing.com/48">http://blog.leedoing.com/</a></li>--%>

                    <%--</ul>--%>
                    <p>root-context.xml에 설정되어 있는 클래스들의 다이어그램입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring01.png" alt=""/><br/>
                    </div>

                    <p>servlet-context.xml에 설정되어 있는 클래스들의 다이어그램입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring02.png" alt=""/><br/>
                    </div>

                    <p>프로젝트에 스프링 설정 맵핑되어 있는 다이어그램입니다. 스프링 시큐리티를 구현함으로서 새로운 독립적인 스프링 설정파일을 만들어야 합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring03.png" alt=""/><br/>
                    </div>

                    <p>프로젝트의 기본적인 테스트 클래스입니다.  DataSource, MemberDAO, MyBatis, MySQLConnection(MariaDB), SampleController 기능들의 연결 또는 정상적인 설정이 완료되었는지 확인합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring04.png" alt=""/><br/>
                    </div>

                    <p>테스트 클래스들의 Coverage를 분석합니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring05.png" alt=""/><br/>
                    </div>

                    <p>프로젝트 중 게시판 기능(Board)의 테스트 클래스입니다.</p>
                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/spring06.png" alt=""/><br/>
                    </div>


                    <%--<ul>--%>
                    <%--<li><a target="_blank" href="http://terms.naver.com/entry.nhn?docId=862837&cid=42346&categoryId=42346">NAVER 지식백과 IT 용어사전</a></li>--%>
                    <%--</ul>--%>

                    <h4>Expectation Effectiveness</h4>

                    <p>미약하게나마 TDD 주도로 개발함으로서 불필요한 시간 낭비 예방과 서버에 부하를 주지 않음으로서 효율적인 개발방식을 익히게 됩니다.</p>
                    <p>JSP의 MVC2와 스프링 MVC의 프로세스를 더욱 효과적으로 익힐 수 있습니다.</p>
                    <p>기본적인 스프링 MVC 설정을 배움으로서 실무에서도 스프링 설정에 많은 시간을 할애하지 않을 것 입니다.</p>

                    <h4>Improvement Point</h4>

                    <p>더욱 나은 성능으로 개선점들이 있습니다. 개선해나가기 위하여 필요한 부분들은 아래에 추가됩니다.</p>

                    <ul>
                        <li>Eclipse에서 사용하였던 여러 기능 등을 IntelliJ에서 거부감없이 소화해낼 수 있게 IDE 툴을 더욱 파헤쳐야한다.</li>
                        <li>MyBatis와 동적 SQL을 익혀 Hibernate와 비교할 수 있도록 한다.</li>
                        <li>실제적으로 흔히 운영되고 있는 웹 사이트들의 기능을 적용시킬 수 있도록 한다.</li>
                        <%--<ul>--%>
                        <%--<li>소스 변경에 대한 즉각적인 변경사항 적용</li>--%>
                        <%--<li>변화에 대한 더욱 능동적 신속한 대응</li>--%>
                        <%--<li>더욱 고차원적인 웹 서비스 구현 및 서포트</li>--%>
                        <%--</ul>--%>
                        <%--<li>Ubuntu 서버로 설정한 후 다른 기능들을 디플로이 시켜서 기능 확장시킬 수 있는 방법을 모색해야 한다.</li>--%>
                        <%--<li>서버를 더욱 자유자재로 다루기 위해서 AWS 인스턴스 및 Linux OS에 대하여 더욱 숙지해야 한다.</li>--%>
                    </ul>

                </div><!--/end-->




                <div class="clearfix margin-bottom-50"></div>

                <div id="scroll_frontend" class="margin-bottom-60">
                    <h2>Front-End Pages <span class="label label-dark">Updated v1.9.1</span></h2>
                    <hr>
                    <p>구현한 여러 프론트 엔드 페이지에 대하여 간략하게 소개합니다.</p>
                    <%--<ol>--%>
                    <%--<li><code>page_misc_blank.html</code>&nbsp;&nbsp; 이미 연결된 모든 주요 구성 요소가있는 빈 페이지가 비어 있습니다.--%>
                    <%--</li>--%>
                    <%--<li><code>page_misc_boxed.html</code>&nbsp;&nbsp; 통합 서식 파일의 박스형 레이아웃</li>--%>
                    <%--<li><code>page_misc_boxed_img.html</code>&nbsp;&nbsp; 통합 서식 파일의 박스형 레이아웃</li>--%>
                    <%--<li><code>page_misc_boxed_fixed_header.html</code>&nbsp;&nbsp; 템플릿의 박스형 레이아웃의 고정 헤더--%>
                    <%--</li>--%>
                    <%--<li><code>page_misc_fixed_header.html</code>&nbsp;&nbsp; 통합 템플릿의 고정 헤더</li>--%>
                    <%--<li><code>page_misc_dark.html</code>&nbsp;&nbsp; Unify의 어두운 버전--%>
                    <%--</li>--%>
                    <%--<li><code>page_misc_dark_boxed.html</code>&nbsp;&nbsp; 통일 템플릿의 박스형 레이아웃의 어두운 버전--%>
                    <%--</li>--%>
                    <%--<li><code>page_misc_dark_other_color.html</code>&nbsp;&nbsp; Unify Template의 다른 테마 색이있는 어두운 버전--%>
                    <%--</li>--%>
                    <%--<li><code>page_misc_sticky_footer.html.html</code>&nbsp;&nbsp; 저작권 섹션이 있는 바닥 글--%>
                    <%--</li>--%>
                    <%--</ol>--%>
                </div>

                <!-- Header and Footer -->
                <div id="scroll_nav" class="margin-bottom-70">
                    <h2>Headers &amp; Footers <span class="label label-dark">Updated v1.9</span><a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <p class="lead">UNIFY에는 Header, Footer가 있습니다.</p>

                    <h3 id="scroll_headerDemos">Headers <span class="label label-dark">Updated v1.9</span></h3>

                    <h4>머리글을 상단에 고정 시키십시오.</h4>
                    <p><%--Where <code>x</code>&nbsp; =&nbsp;<code> v1, v2, v3, v5, v6</code> or nothing for the default
                        header. Any header option can be used as fixed (sticky) header except for <code>v4</code> and
                        <code>v7</code>.--%> 다른 메모에서 머리글 한 페이지는 한 <code>One Page</code> 서식 파일 용으로만 설계되었으며
                        다른 통합 페이지에서는 사용할 수 없습니다. 머리글 옵션을 사용하는 방법에 대한 자세한 내용은 아래 <strong>"Header Options"</strong> 섹션을
                        참조하십시오.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;body class=&quot;header-fixed&quot;&gt;
..
..
&lt;!--=== Header x ===--&gt;
    &lt;div class=&quot;header-x header-sticky&quot;&gt;
    ..
    ..
    &lt;/div&gt;
&lt;!--=== End Header x===--&gt;
..
..
&lt;/body&gt;</code></pre>
                    <div class="clearfix margin-bottom-30"></div>
                    <h4>Header Options</h4>
                    <p>자세한 내용을 보려면 아래 링크를 클릭하십시오.</p>
                    <div class="panel-group acc-v1" id="accordion-header">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-header" href="#header">
                                        Header "Default"
                                    </a>
                                </h4>
                            </div>
                            <div id="header" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="block-center"><img
                                            class="img-responsive header-img-bordered padding-top-10"
                                            src="/resources/docu/img/header01.png" alt="Default Header"></div>
                                    <div class="clearfix margin-bottom-40"></div>

                                    <pre class="line-numbers"><code class="language-php">&lt;!--=== Header ===--&gt;
&lt;div class="header"&gt;
&lt;div class="container"&gt;
&lt;!-- Logo --&gt;
&lt;a class="logo" href="index.html"&gt;
&lt;img src="assets/img/logo1-default.png" alt="Logo"&gt;
&lt;/a&gt;
&lt;!--  End Logo --&gt;

&lt;!-- Topbar --&gt;
&lt;div class="topbar"&gt;
...
...
&lt;/div&gt;
&lt;!--  End Topbar --&gt;

&lt;!-- Toggle get grouped for better mobile display --&gt;
&lt;button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"&gt;
...
...
&lt;/button&gt;&lt;!-- /end container --&gt;
&lt;!--  End Toggle --&gt;
&lt;/div&gt;

&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;
&lt;div class="collapse navbar-collapse mega-menu navbar-responsive-collapse"&gt;
...
...
&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;
&lt;/div&gt;
&lt;!--=== End Header ===--&gt;</code>
                                    </pre>
                                    <p><span class="label label-info">Info</span> 예시:
                                        <small><code>header.jsp</code></small>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-v1">--%>
                        <%--Header v1--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-v1" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v1.jpg" alt="Header v1">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v1===--&gt;--%>
                        <%--&lt;div class="header-v1"&gt;--%>
                        <%--&lt;!-- Topbar --&gt;--%>
                        <%--&lt;div class="topbar-v1"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--  End Topbar --&gt;--%>

                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar navbar-default mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="navbar-header"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse mega-menu navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v1 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v1.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-v2">--%>
                        <%--Header v2--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-v2" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v2.jpg" alt="Header v2">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v2===--&gt;--%>
                        <%--&lt;div class="header-v2 header-sticky"&gt;--%>
                        <%--&lt;div class="container container-space"&gt;--%>
                        <%--&lt;!-- Topbar v2 --&gt;--%>
                        <%--&lt;div class="topbar-v2"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--  End Topbar v2 --&gt;--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar navbar-default mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container container-space"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="navbar-header"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v2 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v2.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-v3">--%>
                        <%--Header v3--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-v3" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img--%>
                        <%--class="img-responsive header-img-bordered padding-top-15"--%>
                        <%--src="/resources/docu/img/header_v3.jpg" alt="Header v3"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v3===--&gt;--%>
                        <%--&lt;div class="header-v3"&gt;--%>
                        <%--&lt;div class="container container-space"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar navbar-default mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="navbar-header"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v3 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v3.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-v4">--%>
                        <%--Header v4--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-v4" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v4.jpg" alt="Header v4">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v4===--&gt;--%>
                        <%--&lt;div class="header-v4"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Topbar v1 --&gt;--%>
                        <%--&lt;div class="topbar-v1"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--  End Topbar v1 --&gt;--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar navbar-default mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="navbar-header"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class="clearfix"&gt;&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v4 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v4.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-v5">--%>
                        <%--Header v5--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-v5" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v5.jpg" alt="Header v5">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v5===--&gt;--%>
                        <%--&lt;div class="header-v5"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Topbar v3 --&gt;--%>
                        <%--&lt;div class="topbar-v3"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--  End Topbar v3 --&gt;--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar navbar-default mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="navbar-header"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v5 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v5.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6">--%>
                        <%--Header v6 Transparent--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_transparent.jpg"--%>
                        <%--alt="Header v6 Transparent"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="menu-container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_transparent.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-dark">--%>
                        <%--Header v6 Dark Transparent--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-dark" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_dark_transparent.jpg"--%>
                        <%--alt="Header v6 Dark Transparent"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-dark-transparent"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_semi_dark_transparent.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-white">--%>
                        <%--Header v6 White Transparent--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-white" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_white_transparent.jpg"--%>
                        <%--alt="Header v6 White Transparent"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-white-transparent"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_semi_white_transparent.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-border">--%>
                        <%--Header v6 Border Bottom--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-border" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_border_bottom.jpg"--%>
                        <%--alt="Header v6 Border Bottom"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-border-bottom"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_border_bottom.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-cd">--%>
                        <%--Header v6 Classic Dark--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-cd" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_classic_dark.jpg"--%>
                        <%--alt="Header v6 Classic Dark"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-classic-dark"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_classic_dark.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-cw">--%>
                        <%--Header v6 Classic White--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-cw" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_classic_white.jpg"--%>
                        <%--alt="Header v6 Classic White"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-classic-white"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_classic_white.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-dd">--%>
                        <%--Header v6 Dark Dropdown--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-dd" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_dark_dropdown.jpg"--%>
                        <%--alt="Header v6 Dark Dropdown"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-dark-dropdown"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_dark_dropdown.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-ds">--%>
                        <%--Header v6 Dark on Scroll--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-ds" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_dark_scroll.jpg"--%>
                        <%--alt="Header v6 Dark on Scroll "></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-dark-scroll"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_dark_scroll.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-dsb">--%>
                        <%--Header v6 Dark Search Box--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-dsb" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_dark_search.jpg"--%>
                        <%--alt="Header v6 Dark Search Box"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-dark-search"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_dark_search.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>


                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-6-dr">--%>
                        <%--Header v6 Dark on Responsive--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-6-dr" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v6_dark_res.jpg"--%>
                        <%--alt="Header v6 Dark on Responsive"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header 6===--&gt;--%>
                        <%--&lt;div class="header-6 header-sticky header-dark-res-nav"&gt;--%>
                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header 6 --&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v6_dark_res_nav.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>


                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-7-left">--%>
                        <%--Header v7 Left--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-7-left" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v7_left.jpg"--%>
                        <%--alt="Header v7 Left">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v7 Left===--&gt;--%>
                        <%--&lt;div class="header-v7 header-left-v7"&gt;--%>
                        <%--&lt;nav class="navbar navbar-default mCustomScrollbar" role="navigation" data-mcs-theme="minimal-dark"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="menu-container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/nav&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v7 Left--&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>page_home12.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-7-right">--%>
                        <%--Header v7 Right--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-7-right" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v7_right.jpg"--%>
                        <%--alt="Header v7 Right">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v7 Right===--&gt;--%>
                        <%--&lt;div class="header-v7 header-right-v7"&gt;--%>
                        <%--&lt;nav class="navbar navbar-default mCustomScrollbar" role="navigation" data-mcs-theme="minimal-dark"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="menu-container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/nav&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v7 Right--&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>page_home13.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header-8">--%>
                        <%--Header v8--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header-8" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive header-img-bordered"--%>
                        <%--src="/resources/docu/img/header_v8.jpg" alt="Header v8">--%>
                        <%--</div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header v8===--&gt;--%>
                        <%--&lt;div class="header-v8 header-sticky"&gt;--%>
                        <%--&lt;!-- Topbar blog --&gt;--%>
                        <%--&lt;div class="blog-topbar"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Topbar blog --&gt;--%>

                        <%--&lt;!-- Navbar --&gt;--%>
                        <%--&lt;div class="navbar mega-menu" role="navigation"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Brand and toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;div class="res-container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Navbar --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!-- End Header v8--&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_header_v8.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>


                    </div>

                    <div class="clearfix margin-bottom-30"></div>
                    <hr>
                    <h3 id="scroll_footerDemos" class="margin-bottom-20">Footers <span class="label label-dark">Updated v1.9</span>
                    </h3>
                    <h4>Footer Options</h4>
                    <p>자세한 내용을 보려면 아래 링크를 클릭하십시오.</p>
                    <div class="panel-group acc-v1" id="accordion-footer">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-footer" href="#footer">
                                        Footer "Default"
                                    </a>
                                </h4>
                            </div>
                            <div id="footer" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="block-center"><img class="img-responsive"
                                                                   src="/resources/docu/img/footer01.png"
                                                                   alt="Default Footer"></div>
                                    <div class="clearfix margin-bottom-20"></div>

                                    <pre class="line-numbers"><code class="language-php">&lt;!--=== Default Footer ===--&gt;
&lt;div class=&quot;footer-default&quot;&gt;
    &lt;div class=&quot;footer&quot;&gt;
        &lt;div class=&quot;container&quot;&gt;
            ...
            ...
        &lt;/div&gt;
    &lt;/div&gt;&lt;!--/footer--&gt;

    &lt;div class=&quot;copyright&quot;&gt;
        &lt;div class=&quot;container&quot;&gt;
            ...
            ...
        &lt;/div&gt;
    &lt;/div&gt;&lt;!--/copyright--&gt;
&lt;/div&gt;
&lt;!--=== End Default Footer ===--&gt;</code></pre>

                                    <p><span class="label label-info">Info</span> 예시:
                                        <small><code>footer.jsp</code></small>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v1">--%>
                        <%--Footer v1--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v1" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>

                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v1.jpg"--%>
                        <%--alt="Footer 1"></div>--%>
                        <%--<div class="clearfix margin-bottom-10"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 1 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v1&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 1 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v1.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v2">--%>
                        <%--Footer v2--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v2" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v2.jpg"--%>
                        <%--alt="Footer 2"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 2 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v2&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 2 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v2.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v3">--%>
                        <%--Footer v3--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v3" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>

                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v3.jpg"--%>
                        <%--alt="Footer 3"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 3 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v3&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 3 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v3.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v4">--%>
                        <%--Footer v4--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v4" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v4.jpg"--%>
                        <%--alt="Footer 4"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 4 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v4&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 4 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v4.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v5">--%>
                        <%--Footer v5--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v5" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v5.jpg"--%>
                        <%--alt="Footer 5"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 5 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v5&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 5 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v5.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v6">--%>
                        <%--Footer v6--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v6" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v5.jpg"--%>
                        <%--alt="Footer 5"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 6 ===--&gt;--%>
                        <%--&lt;div class=&quot;footer-v6&quot;&gt;--%>
                        <%--&lt;div class=&quot;footer&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/footer--&gt;--%>

                        <%--&lt;div class=&quot;copyright&quot;&gt;--%>
                        <%--&lt;div class=&quot;container&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Footer Version 6 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v6.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v7">--%>
                        <%--Footer v7--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v7" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v7.jpg"--%>
                        <%--alt="Footer 7"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer Version 7 (One Page) ===--&gt;--%>
                        <%--&lt;section class=&quot;contacts-section&quot;&gt;--%>
                        <%--&lt;div class=&quot;container content-lg&quot;&gt;--%>
                        <%--&lt;div class=&quot;title-v1&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class=&quot;row contacts-in&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class=&quot;copyright-section&quot;&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!--/copyright--&gt;--%>
                        <%--&lt;/section&gt;--%>
                        <%--&lt;!--=== End Footer Version 7 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v7.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-footer" href="#footer-v8">--%>
                        <%--Footer v8--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="footer-v8" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img class="img-responsive"--%>
                        <%--src="/resources/docu/img/footer_v8.jpg"--%>
                        <%--alt="Footer 8"></div>--%>
                        <%--<div class="clearfix margin-bottom-20"></div>--%>
                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Footer v8 ===--&gt;--%>
                        <%--&lt;footer class="footer"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;div class="row"&gt;--%>
                        <%--&lt;div class="col-md-3 col-sm-6 column-one md-margin-bottom-50"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class="col-md-3 col-sm-6 md-margin-bottom-50"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class="col-md-3 col-sm-6 md-margin-bottom-50"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;div class="col-md-3 col-sm-6"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/footer&gt;--%>

                        <%--&lt;footer class="copyright"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;/footer&gt;--%>
                        <%--&lt;!--=== End Footer v8 ===--&gt;</code></pre>--%>

                        <%--<p><span class="label label-info">Info</span> 예시:--%>
                        <%--<small><code>feature_footer_v8.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                    <!-- End CSS Classes -->
                    <div class="clearfix margin-bottom-50"></div>

                    <!-- Theme Configuration -->
                    <div id="scroll_theme" class="theme">
                        <h2>Theme Configuration <span class="label label-dark">Updated v1.9.1</span> <a href="#top">top
                            <i class="fa fa-angle-up"></i></a></h2>

                        <hr>

                        <p>Unify에는 미리 정의 된 12 가지 색상을 사용하였습니다. 모든 테마 CSS 파일은
                            <code>assets/css/theme-colors/..</code>에 있습니다.
                        </p>

                        <ul class="list-inline theme-colors">
                            <li>
                                <span class="doc-top color-green">default</span>
                                <span class="doc-u">#72c02c</span>
                                <span class="doc-u-h">#5fb611</span>
                            </li>
                            <li>
                                <span class="doc-top color-blue">blue</span>
                                <span class="doc-blue">#3498db</span>
                                <span class="doc-blue-h">#2980b9</span>
                            </li>
                            <li>
                                <span class="doc-top color-orange">orange</span>
                                <span class="doc-orange">#e67e22</span>
                                <span class="doc-orange-h">#d35400</span>
                            </li>
                            <li>
                                <span class="doc-top color-red">red</span>
                                <span class="doc-red">#e74c3c</span>
                                <span class="doc-red-h">#c0392b</span>
                            </li>
                            <li>
                                <span class="doc-top color-grey">light</span>
                                <span class="doc-light">#95a5a6</span>
                                <span class="doc-light-h">#7f8c8d</span>
                            </li>
                            <li>
                                <span class="doc-top color-purple">purple</span>
                                <span class="doc-purple">#9b6bcc</span>
                                <span class="doc-purple-h">#814fb5</span>
                            </li>
                            <li>
                                <span class="doc-top color-aqua">aqua</span>
                                <span class="doc-aqua">#27d7e7</span>
                                <span class="doc-aqua-h">#26bac8</span>
                            </li>
                            <li>
                                <span class="doc-top color-brown">brown</span>
                                <span class="doc-brown">#9c8061</span>
                                <span class="doc-brown-h">#81674b</span>
                            </li>
                            <li>
                                <span class="doc-top color-dark-blue">dark-blue</span>
                                <span class="doc-dark-blue">#4765a0</span>
                                <span class="doc-dark-blue-h">#324c80</span>
                            </li>
                            <li>
                                <span class="doc-top color-light-green">light-green</span>
                                <span class="doc-green">#79d5b3</span>
                                <span class="doc-green-h">#59b795</span>
                            </li>
                            <li>
                                <span class="doc-top color-dark-red">dark-red</span>
                                <span class="doc-dark-red">#b61332</span>
                                <span class="doc-dark-red-h">#a10f2b</span>
                            </li>
                            <li>
                                <span class="doc-top color-teal">teal</span>
                                <span class="doc-teal">#2cd5b6</span>
                                <span class="doc-teal-h">#18ba9b</span>
                            </li>
                        </ul>

                        <p>테마 색상을 변경하려면 <code>assets/css/theme-colors/<strong>default.css</strong></code>
                            를 <code>assets/css/theme-colors/<strong>your_theme.css</strong></code>로
                            바꾸거나 준비된 테마 CSS 파일 <code>blue.css</code>, <code>red.css</code>, <code>orange.css</code>
                            등 <strong>your_theme.css</strong>을 대신 적용합니다.
                        <p>
                        <pre class="line-numbers"><code class="language-markup">&lt;head&gt;
    &lt;title&gt;Unify &lt;/title&gt;

    &lt;!-- CSS Theme --&gt;
    <span class="tag-cover">&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/default.css&quot; /&gt;</span>
&lt;/head&gt;</code></pre>

                        <p class="theme-info"><span class="label label-info">Info</span><strong> default
                            theme</strong>을 사용하려면
                            <code>assets/css/theme-colors/default.css</code>를 연결할 필요가 없습니다.이 줄을 HTML 헤드에서 제거하면됩니다. 이미
                            <code>style.css</code>, <code>app.css</code>등과 같은 기본 CSS 파일에 포함되어 있습니다.
                        </p>

                        <div class="clearfix margin-bottom-40"></div>

                        <h3>Theme color CSS links</h3>
                        <p>미리 정의 된 테마 색상 중 하나를 사용하려면 CSS 링크 중 하나를 사용하여 위의 <code>default.css</code> 링크로 바꾸십시오.</p>
                        <pre class="line-numbers"><code class="language-markup">&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/default.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/default.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/blue.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/orange.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/red.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/light.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/purple.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/aqua.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/brown.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/dark-blue.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/light-green.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/dark-red.css&quot;/&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/teal.css&quot;/&gt;
</code></pre>

                        <div class="clearfix margin-bottom-60"></div>

                        <h3>Dark Layout</h3>
                        <p>Dark Theme를 구현하는 두 가지 간단한 단계는 다음과 같습니다.</p>
                        <p>1. <code>&lt;head&gt;</code> 섹션에 <code>dark.css</code>를 연결하십시오.</p>
                        <p>2. <code>&lt;body&gt;</code> 태그에 <code>.dark</code>클래스를 추가하십시오.</p>
                        <pre class="line-numbers"><code class="language-php">&lt;head&gt;
    &lt;title&gt;Unify &lt;/title&gt;

    &lt;!-- CSS Theme --&gt;
    <span class="tag-cover">&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/dark.css&quot;&gt;</span>
&lt;/head&gt;


&lt;body class=&quot;dark&quot;&gt;
    ....
    ....
&lt;/body&gt;</code></pre>
                        <p><span class="label label-info">Info</span> 예시: <code>page_misc_dark.html</code></p>
                    </div>


                    <div class="clearfix margin-bottom-60"></div>

                    <h3>Boxed Layout <span class="label label-dark">Added v1.9.1</span></h3>
                    <p>박스형 레이아웃을 적용하려면 클래스 <code>boxed-layout</code>과 클래스
                        <code>container</code>를 <code>&lt;body&gt;</code> 태그에 추가하면됩니다.</p>

                    <pre class="line-numbers"><code class="language-php">&lt;body class=&quot;boxed-layout container&quot;&gt;
    ....
    ....
&lt;/body&gt;</code></pre>
                    <p><span class="label label-info">Info</span> 예시 : <code>page_misc_boxed.html</code></p>
                </div>
                <!-- End Theme Configuration -->

                <div class="clearfix margin-bottom-60"></div>

                <!-- CSS Classes -->
                <div id="scroll_css" class="margin-bottom-40">
                    <h2>CSS (Cascading Style Sheets) <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <h3>CSS Files Structure</h3>
                    <p>Unify은 소규모 프로젝트부터 대규모 기업 프로젝트에 이르기까지 템플릿을 체계적으로 구성하여 사용하기 쉽도록 여러 CSS 파일을 사용합니다. 모든
                        <code>CSS</code>
                        파일은 논리적으로 구성됩니다. <code>CSS</code>파일을 알면 커스터마이징 프로세스가 훨씬 쉽고 훨씬 유연 해집니다. 또한 <code>app.css</code> 및
                        <code>blocks.css</code>CSS 파일은 모든 패키지에서 전역으로 사용되므로 모든 패키지에서 모든 Unify 기본 요소, 블록 등을 사용하는 것이 좋습니다.
                    </p>
                    <p><code>assets/css</code>에 있는 모든 CSS 파일</p>
                    <h3><i class="fa fa-folder fa-2x color-blue"></i> CSS</h3>
                    <ul class="list-unstyled css-files">
                        <li>----<i class="fa fa-folder"></i> <strong>pages:</strong> 여기에서 모든 독립적 인 CSS 페이지를 제어 할 수 있습니다.
                        </li>
                        <li>----<i class="fa fa-folder"></i> <strong>headers:</strong> 여기에서 8 개의 모든 머리글을 제어 할 수 있습니다.
                            일반적으로 프로젝트 당 하나의 헤더가 사용되므로 별도의 폴더에 있습니다.
                        </li>
                        <li>----<i class="fa fa-folder"></i> <strong>footers:</strong> 여기에서 8 개의 바닥 글을 모두 제어 할 수 있습니다.
                            일반적으로 한 프로젝트에 하나의 바닥 글이 사용되므로 별도의 폴더에 있습니다.
                        </li>
                        <li>----<i class="fa fa-folder"></i> <strong>theme-skins</strong> 여기에서 테마 스킨을 제어 할 수 있습니다.
                            현재 Unify에는 Unify의 어두운 버전 인 테마 스킨이 하나만 있습니다.
                        </li>
                        <li>----<i class="fa fa-folder"></i> <strong>theme-colors:</strong> 여기에서 12 개의 테마 색을 모두 제어 할 수
                            있습니다. 색상 코드는 <a href="#scroll_theme">"Theme
                                Configuration"</a> 섹션을 참조하십시오.
                        </li>
                        <li>---- &nbsp;<code>app.css</code></li>
                        <li>---- &nbsp;<code>style.css</code></li>
                        <li>---- &nbsp;<code>blocks.css</code></li>
                    </ul>
                    <h3>CSS Classes <span class="label label-dark">Updated v1.9</span></h3>
                    <p>자세한 내용을 보려면 아래 링크를 클릭하십시오.</p>
                    <div class="panel-group acc-v1" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#table-1">
                                        Spaces
                                    </a>
                                </h4>
                            </div>
                            <div id="table-1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h4 class="no-top-space">General
                                        classes for spaces</h4>
                                    <table class="table table-hover table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>content</code></td>
                                            <td>상단과 하단에서<code>40px</code>패딩을 적용합니다.</br>큰 블록으로 사용하도록 설계
                                            </td>
                                            <td>padding-top: 40px;</br>padding-bottom: 40px;</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>content-sm</code></td>
                                            <td>상단과 하단에서<code>60px</code>패딩을 적용합니다.</br>큰 블록으로 사용하도록 설계
                                            </td>
                                            <td>padding-top: 60px;</br>padding-bottom: 60px;</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>content-md</code></td>
                                            <td>상단과 하단에서<code>80px</code>패딩을 적용합니다.</td>
                                            <td>padding-top: 80px;</br>padding-bottom: 80px;</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>content-lg</code></td>
                                            <td>왼쪽과 오른쪽에서<code>100px</code>패딩을 적용합니다.</br>큰 블록으로 사용하도록 설계
                                            </td>
                                            <td>padding-top: 100px;</br>padding-bottom: 100px;</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><code>space-lg-hor</code></td>
                                            <td>왼쪽과 오른쪽에서 <code>60px</code> 패딩을 적용합니다.</td>
                                            <td>padding-left: 60px</br>padding-right: 60px;</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><code>space-xlg-hor</code></td>
                                            <td>왼쪽 및 오른쪽에서 <code>100px</code> 패딩을 적용합니다.</td>
                                            <td>padding-left: 100px;</br>padding-right: 100px;</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td><code>margin-left-5</code></td>
                                            <td>왼쪽에 <code>5px</code> 여백을 적용합니다.</td>
                                            <td>margin-left: 5px</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td><code>margin-right-5</code></td>
                                            <td>오른쪽에 <code>5px</code>여백을 적용합니다.</td>
                                            <td>margin-right: 5px</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td><code>no-top-space</code></td>
                                            <td>padding-top 및 margin-top 제거합니다.</td>
                                            <td>margin-top: 0; </br> padding-top: 0;</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td><code>no-bottom-space</code></td>
                                            <td>padding-bottom과 margin-bottom을 제거합니다.</td>
                                            <td>margin-bottom: 0; </br> padding-bottom: 0;</td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td><code>margin-bottom-5</code></td>
                                            <td>하단에 <code>5px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 5px</td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td><code>margin-bottom-10</code></td>
                                            <td>하단에 <code>10px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 10px</td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td><code>margin-bottom-15</code></td>
                                            <td>하단에 <code>15px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 15px</td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td><code>margin-bottom-20</code></td>
                                            <td>하단에 <code>20px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 20px</td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td><code>margin-bottom-25</code></td>
                                            <td>하단에 <code>25px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 25px</td>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td><code>margin-bottom-30</code></td>
                                            <td>하단에 <code>30px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 30px</td>
                                        </tr>
                                        <tr>
                                            <td>17</td>
                                            <td><code>margin-bottom-35</code></td>
                                            <td>하단에 <code>35px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 35px</td>
                                        </tr>
                                        <tr>
                                            <td>18</td>
                                            <td><code>margin-bottom-40</code></td>
                                            <td>하단에 <code>40px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 40px</td>
                                        </tr>
                                        <tr>
                                            <td>19</td>
                                            <td><code>margin-bottom-45</code></td>
                                            <td>하단에 <code>45px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 45px</td>
                                        </tr>
                                        <tr>
                                            <td>20</td>
                                            <td><code>margin-bottom-50</code></td>
                                            <td>하단에 <code>50px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 50px</td>
                                        </tr>
                                        <tr>
                                            <td>21</td>
                                            <td><code>margin-bottom-55</code></td>
                                            <td>하단에 <code>55px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 55px</td>
                                        </tr>
                                        <tr>
                                            <td>22</td>
                                            <td><code>margin-bottom-60</code></td>
                                            <td>하단에 <code>60px</code>의 여백을 적용합니다.</td>
                                            <td>margin-bottom: 60px</td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    </br>
                                    <p>Example:</p>
                                    <pre class="line-numbers"><code class="language-markup">&ltul class="margin-bottom-40"&gt
    &ltli&gtDonec posuere&lt/li&gt
    &ltli&gtDonec posuere&lt/li&gt
    &ltli&gtDonec posuere&lt/li&gt
&lt/ul&gt</code></pre>
                                    </br>
                                    <h4 class="no-top-space">For medium device modern @media (max-width: 992px)</h4>
                                    <p>이러한 클래스는 화면 크기가 너비가 992px 미만일 때 유효합니다. 예를 들어 요소가 더 큰 장치에 수평으로 배치되고 더 작은 장치에 수직으로
                                        배치되는 경우 요소 사이에 충분한 간격이 없기 때문에 서로 붙어있게됩니다. 그래서 다음과 같은 클래스가 매우 유용 할 것입니다.</p>
                                    <table class="table table-hover table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>md-margin-bottom-10 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>10px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 10px</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>md-margin-bottom-20 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>20px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 20px</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>md-margin-bottom-30 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>30px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 30px</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>md-margin-bottom-40 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>40px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 40px</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><code>md-margin-bottom-50 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>50px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 50px</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><code>md-margin-bottom-60 </code></td>
                                            <td>최대 너비가 <code>992px</code> 미만인 경우 <code>60px</code> 여백 하단 적용
                                            </td>
                                            <td>margin-bottom: 60px</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                    <h4 class="no-top-space">For small device mode @media (max-width: 768px)</h4>
                                    <p>화면 크기가 너비가 768px보다 작으면 효과적입니다. 예를 들어 요소가 더 큰 장치에 수평으로 배치되고 더 작은 장치에 수직으로 배치되는 경우
                                        요소 사이에 충분한 간격이 없기 때문에 서로 붙어있게됩니다. 그래서 다음과 같은 클래스가 매우 유용 할 것입니다.</p>
                                    <table class="table table-hover table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>sm-margin-bottom-10 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>10px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 10px</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>sm-margin-bottom-20 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>20px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 20px</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>sm-margin-bottom-30 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>30px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 30px</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>sm-margin-bottom-40 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>40px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 40px</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><code>sm-margin-bottom-50 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>50px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 50px</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><code>sm-margin-bottom-60 </code></td>
                                            <td>최대 너비가 <code>768px</code> 미만인 경우 <code>60px</code> 여백 하단에 적용됩니다.
                                            </td>
                                            <td>margin-bottom: 60px</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#table-2">
                                        Colors
                                    </a>
                                </h4>
                            </div>
                            <div id="table-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h4>
                                        Classes for text colors</h4>
                                    <table class="table table-hover table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>color-sea</code></td>
                                            <td class="color-sea">텍스트 색상을 바다로 변경합니다.</td>
                                            <td class="color-sea">color: #1abc9c;</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>color-green</code></td>
                                            <td class="color-green">텍스트 색상을 녹색으로 변경합니다.</td>
                                            <td class="color-green">color: #72c02c</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>color-redgreen1</code></td>
                                            <td class="color-green1">텍스트 색상을 연한 녹색으로 변경합니다.</td>
                                            <td class="color-green1">color: #2ecc71</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>color-light-green</code></td>
                                            <td class="color-light-green">텍스트 색상을 밝은 녹색으로 변경합니다.</td>
                                            <td class="color-light-green">color: #1abc9c</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><code>color-purple</code></td>
                                            <td class="color-purple">텍스트 색상을 자주색으로 변경합니다.</td>
                                            <td class="color-purple">color: #9b6bcc</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><code>color-dark-blue</code></td>
                                            <td class="color-dark-blue">텍스트 색상을 진한 파란색으로 변경합니다.</td>
                                            <td class="color-dark-blue">color: #4765a0</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td><code>color-blue</code></td>
                                            <td class="color-blue">텍스트 색상을 파란색으로 변경합니다.</td>
                                            <td class="color-blue">color: #3498db</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td><code>color-aqua</code></td>
                                            <td class="color-aqua">텍스트 색상을 아쿠아로 변경합니다.</td>
                                            <td class="color-aqua">color: #27d7e7</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td><code>color-red</code></td>
                                            <td class="color-red">텍스트 색상을 빨간색으로 변경합니다.</td>
                                            <td class="color-red">color: #e74c3c;</td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td><code>color-orange</code></td>
                                            <td class="color-orange">텍스트 색상을 오렌지색으로 변경합니다.</td>
                                            <td class="color-orange">color: #e67e22</td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td><code>color-yellow</code></td>
                                            <td class="color-yellow">텍스트 색상을 노랑색으로 변경합니다.</td>
                                            <td class="color-yellow">color: #f1c40f</td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td><code>color-brown</code></td>
                                            <td class="color-brown">텍스트 색상을 갈색으로 변경합니다.</td>
                                            <td class="color-brown">color: #9c8061</td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td><code>color-dark</code></td>
                                            <td class="color-dark">텍스트 색상을 어둡게 변경합니다.</td>
                                            <td class="color-dark">color: #555555</td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td><code>color-light-grey</code></td>
                                            <td class="color-light-grey">텍스트 색상을 밝은 회색으로 변경합니다.</td>
                                            <td class="color-light-grey">color: #585f69</td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td><code>color-grey</code></td>
                                            <td class="color-grey">텍스트 색상을 회색으로 변경합니다.</td>
                                            <td class="color-grey">color: #95a5a6</td>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td><code>color-light</code></td>
                                            <td class="color-light">텍스트 색상을 조명으로 변경합니다.</td>
                                            <td class="color-light">color: #ffffff</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                    <h4 class="no-top-margin">
                                        classes for Background colors</h4>
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="bg-color-dark">
                                            <td>1</td>
                                            <td><code>bg-color-dark</code></td>
                                            <td>배경색을 어둡게 변경합니다.</td>
                                            <td>background-color: #555;</td>
                                        </tr>
                                        <tr class="bg-color-red">
                                            <td>1</td>
                                            <td><code>bg-color-red</code></td>
                                            <td>배경색을 빨갛게 변경합니다.</td>
                                            <td>background-color: #e74c3c;</td>
                                        </tr>
                                        <tr class="bg-color-sea">
                                            <td>1</td>
                                            <td><code>bg-color-sea</code></td>
                                            <td>배경색을 바다로 변경합니다.</td>
                                            <td>background-color: #1abc9c;</td>
                                        </tr>
                                        <tr class="bg-color-blue">
                                            <td>1</td>
                                            <td><code>bg-color-blue</code></td>
                                            <td>배경색을 파란색으로 변경합니다.</td>
                                            <td>background-color: #3498db;</td>
                                        </tr>
                                        <tr class="bg-color-grey">
                                            <td>1</td>
                                            <td><code>bg-color-grey</code></td>
                                            <td>배경색을 회색으로 변경합니다.</td>
                                            <td>background-color: #95a5a6;</td>
                                        </tr>
                                        <tr class="bg-color-green">
                                            <td>1</td>
                                            <td><code>bg-color-green</code></td>
                                            <td>배경색을 녹색으로 변경합니다.</td>
                                            <td>background-color: #72c02c;</td>
                                        </tr>
                                        <tr class="bg-color-brown">
                                            <td>1</td>
                                            <td><code>bg-color-brown</code></td>
                                            <td>배경색을 갈색으로 변경합니다.</td>
                                            <td>background-color: #9c8061;</td>
                                        </tr>
                                        <tr class="bg-color-orange">
                                            <td>1</td>
                                            <td><code>bg-color-orange</code></td>
                                            <td>배경색을 오렌지색으로 변경합니다.</td>
                                            <td>background-color: #e67e22;</td>
                                        </tr>
                                        <tr class="bg-color-green1">
                                            <td>1</td>
                                            <td><code>bg-color-green1</code></td>
                                            <td>배경색을 연두색으로 변경합니다.</td>
                                            <td>background-color: #2ecc71;</td>
                                        </tr>
                                        <tr class="bg-color-purple">
                                            <td>1</td>
                                            <td><code>bg-color-purple</code></td>
                                            <td>배경색을 보라색으로 변경합니다.</td>
                                            <td>background-color: #9b6bcc;</td>
                                        </tr>
                                        <tr class="bg-color-dark-blue">
                                            <td>1</td>
                                            <td><code>bg-color-dark-blue</code></td>
                                            <td>배경색을 진한 파랑색으로 변경합니다.</td>
                                            <td>background-color: #4765a0;</td>
                                        </tr>
                                        <tr class="bg-color-light-grey">
                                            <td>1</td>
                                            <td><code>bg-color-light-grey</code></td>
                                            <td>배경색을 밝은 회색으로 변경합니다.</td>
                                            <td>background-color: #585f69;</td>
                                        </tr>
                                        <tr class="bg-color-light-green">
                                            <td>1</td>
                                            <td><code>bg-color-light-green</code></td>
                                            <td>배경색을 밝은 녹색으로 변경합니다.</td>
                                            <td>background-color: #79d5b3;</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                    <p>Example:</p>
                                    <pre class="line-numbers"><code class="language-markup">&lt;div class="bg-color-dark"&gt;Demo Information&lt;div&gt;</code></pre>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#table-3">
                                        Rounded Corners
                                    </a>
                                </h4>
                            </div>
                            <div id="table-3" class="panel-collapse collapse block-center">
                                <div class="panel-body">
                                    <h4>
                                        Classes for rounded corners</h4>
                                    <p><code>round</code> 클래스는 <code>images, blocks,
                                        buttons...</code>에 적용 할 수 있습니다</p>
                                    <div class="row margin-bottom-40">
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-top</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-top"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-left</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-left"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-right</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-right"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                    </div>
                                    <div class="row margin-bottom-40">
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-bottom</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-bottom "
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded</code></h5>
                                            <img class="img-responsive img-doc-demo rounded"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-x</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-x"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                    </div>
                                    <div class="row margin-bottom-40">
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-2x</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-2x"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-3x</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-3x"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="text-center"><code>rounded-4x</code></h5>
                                            <img class="img-responsive img-doc-demo rounded-4x"
                                                 src="/resources/docu/img/demo.jpg">
                                        </div>
                                    </div>
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>rounded-top</code></td>
                                            <td>상단 모서리에 <code>4px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 4px 4px 0 0 !important;</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>rounded-left</code></td>
                                            <td>왼쪽 모서리에 <code>4px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 4px 0 0 4px !important;</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>rounded-right</code></td>
                                            <td>오른쪽 모서리에 <code>4px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 0 4px 4px 0 !important;</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>rounded-bottom</code></td>
                                            <td>하단 모서리에 <code>4px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 0 0 4px 4px !important;</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><code>rounded</code></td>
                                            <td>모든 모서리에 <code>4px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 4px;</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><code>rounded-x</code></td>
                                            <td>항목을 둥글게 만듭니다 (전체 원).</td>
                                            <td>border-radius: 50% !important;</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td><code>rounded-2</code></td>
                                            <td>모든 모서리에 <code>10px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 10px !important;;</td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td><code>rounded-3</code></td>
                                            <td>모든 모서리에 <code>15px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 15px !important;</td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td><code>rounded-4</code></td>
                                            <td>모든 모서리에 <code>20px</code> 테두리 반경을 적용합니다.</td>
                                            <td>border-radius: 20px !important;</td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    </br>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#table-4">
                                        Heights
                                    </a>
                                </h4>
                            </div>
                            <div id="table-4" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h4>
                                        Classes for height</h4>
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Description</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>height-100</code></td>
                                            <td>요소에 최소 100 픽셀의 높이를 적용합니다.</td>
                                            <td>min-height: 100px;</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>height-200</code></td>
                                            <td>요소에 최소 200 픽셀의 높이를 적용합니다.</td>
                                            <td>min-height: 200px;</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>height-300</code></td>
                                            <td>요소에 최소 300 픽셀의 높이를 적용합니다.</td>
                                            <td>min-height: 300px;</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>height-400</code></td>
                                            <td>요소에 최소 400 픽셀의 높이를 적용합니다.</td>
                                            <td>min-height: 400px;</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><code>height-500</code></td>
                                            <td>요소에 최소 500 픽셀의 높이를 적용합니다.</td>
                                            <td>min-height: 500px;</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#table-5">
                                        Other Classes
                                    </a>
                                </h4>
                            </div>
                            <div id="table-5" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h4>Other
                                        classes</h4>
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Class Name (Selector)</th>
                                            <th>Declaration</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><code>overflow-h</code></td>
                                            <td>overflow: hidden;</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><code>overflow-a</code></td>
                                            <td>overflow: auto;</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><code>clear-both</code></td>
                                            <td>clear: both;</td>
                                        </tr>

                                        <tr>
                                            <td>4</td>
                                            <td><code>dp-none</code></td>
                                            <td>display: none;</td>
                                        </tr>

                                        <tr>
                                            <td>5</td>
                                            <td><code>dp-block</code></td>
                                            <td>display: block;</td>
                                        </tr>

                                        <tr>
                                            <td>6</td>
                                            <td><code>dp-table</code></td>
                                            <td>display: table;</td>
                                        </tr>

                                        <tr>
                                            <td>7</td>
                                            <td><code>dp-inline-block</code></td>
                                            <td>display: inline-block;</td>
                                        </tr>

                                        <tr>
                                            <td>8</td>
                                            <td><code>dp-table-cell</code></td>
                                            <td>display: table-cell;</td>
                                        </tr>

                                        <tr>
                                            <td>9</td>
                                            <td><code>full-width</code></td>
                                            <td>width: 100%;</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End CSS Classes -->
                    <div class="clearfix margin-bottom-50"></div>

                    <!-- JavaScript initialization -->
                    <div id="scroll_js">
                        <h2>JavaScript Initialization<span class="label label-dark">Updated v1.9</span> <a href="#top">top
                            <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p>핵심 자바 스크립트 초기화는 아래와 같이 "App"객체를 통해 <code>assets/js/app.js</code>에 구현됩니다. 이 접근법을 사용하면 jquery
                            플러그인 및 기타 애플리케이션 로직을 쉽게 초기화 할 수 있습니다.</p>

                        <p>App 객체는 거의 모든 Unify 페이지에서 사용되는 플러그인의 초기화 만 포함합니다. 다른 플러그인은 독립적으로 초기화해야합니다. 아래의 <strong>JavaScript
                            Plugins</strong>을 참조하십시오.</p>
                        <pre class="line-numbers"><code class="language-php">var App = function () {
    ...
    ...
}();</code></pre>

                        <h3>JavaScript Plugins <span class="label label-dark">Updated v1.9.2</span></h3>
                        <p>더 자세한 정보는 아래 링크를 클릭하십시오.</p>
                        <div class="clearfix margin-bottom-20"></div>

                        <div class="panel-group acc-v1" id="accordion-1">
                            <!-- Bootstrap -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-2">
                                            Bootstrap
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>부트 스트랩은 반응형 모바일 첫 번째 프로젝트를 웹에서 개발하기위한 가장 널리 사용되는 HTML, CSS 및 JS 프레임
                                            워크입니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&ltlink rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css"&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Global Compulsory --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&ltscript src="assets/plugins/bootstrap/js/bootstrap.min.js"&gt&lt/script&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <p><a target="_blank"
                                              href="http://getbootstrap.com/">http://getbootstrap.com/</a></p>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<p>All Unify Pages</p>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- Bootstrap -->


                            <!-- jQuery -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-jquery">
                                            jQuery
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-jquery" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>jQuery는 빠르고 작으며 기능이 풍부한 JavaScript 라이브러리입니다. HTML 문서 탐색 및 조작, 이벤트 처리, 애니메이션 및
                                            Ajax를 여러 브라우저에서 작동하는 사용하기 쉬운 API로 훨씬 간단하게 만듭니다. 다양성과 확장 성을 결합한 jQuery는 수백만
                                            명이 JavaScript를 작성하는 방식을 변경했습니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-php">No CSS Required </code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Global Compulsory --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&ltscript src="assets/plugins/jquery/jquery.min.js"&gt&lt/script&gt
&ltscript src="assets/plugins/jquery/jquery-migrate.min.js"&gt&lt/script&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://jquery.com/">http://jquery.com</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<p>All Unify Pages</p>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End jQuery -->

                            <!-- Circles Master -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-4">
                                            Circles Master
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>SVG에서 원형 그래프를 생성하는 경량의 JavaScript 라이브러리. 이제 애니메이션이 있습니다.</p>
                                        <h4>CSS Installation</h4>

                                        <div class="margin-bottom-20"></div>

                                        <pre class="line-numbers"><code
                                                class="language-php">No CSS Required </code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/circles-master/circles.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/circles-master.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오. <code>CirclesMaster.initCirclesMaster1();</code>
                                            또는 <code>CirclesMaster.initCirclesMaster2();</code> HTML 페이지 맨 아래의 jQuery
                                            함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    CirclesMaster.initCirclesMaster1();
});
// Or
jQuery(document).ready(function () {
    CirclesMaster.initCirclesMaster2();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="https://github.com/lugolabs/circles">https://github.com/lugolabs/circles</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_compo_charts.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Circles Master -->

                            <!-- Counter -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-6">
                                            Counter
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-6" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>Counter-Up은 0부터 숫자를 움직이는 jQuery 플러그인입니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-php">No CSS Required </code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&ltscript src="assets/plugins/counter/waypoints.min.js"&gt&lt/script&gt
&ltscript src="assets/plugins/counter/jquery.counterup.min.js"&gt&lt/script&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오.
                                            <code>App.initCounter();</code> HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    App.initCounter();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="https://github.com/bfintal/Counter-Up">https://github.com/bfintal/Counter-Up</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_compo_charts.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Counter -->

                            <!-- Cube Portfolio -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-23">
                                            Cube Portfolio
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-23" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>"큐브 포트폴리오"는 아름다운 애니메이션 필터링, 사용자 정의 캡션을 제공하는 강력한 jQuery 플러그인으로, 포트폴리오, 갤러리, 팀
                                            구성원, 블로그 게시물 또는 기타 주문한 컨텐츠에 이상적입니다.</p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css"&gt;
&lt;link rel="stylesheet" href="assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/cube-portfolio/cube-portfolio-4-ns.js"&gt;</code></pre>
                                        <p><span class="label label-red">Note</span> 경로는 포트폴리오 그리드 구조에 따라 다릅니다. 위의 예
                                            <strong>4 columns no space
                                                grid</strong>가 선택되지 않습니다.</p>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <p>assets/plugins/cube-portfolio/documentation</p>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">Used in Portfolio Pages</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Cube Portfolio -->

                            <!-- Fancybox -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-7">
                                            Fancybox
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-7" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>FancyBox는 웹 페이지의 이미지, HTML 콘텐츠 및 멀티미디어에 확대 / 축소 기능을 추가하는 멋지고 우아한 방법을 제공하는
                                            도구입니다. 인기있는 JavaScript 프레임 워크 인 jQuery의 상단에 구현되어 구현하기 쉽고 맞춤 설정이 쉽습니다.</p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/fancybox/source//jquery.fancybox.css.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/fancy-box.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오.<code>FancyBox.initFancybox();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    FancyBox.initFancybox();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://fancyapps.com/fancybox/#examples">http://fancyapps.com/fancybox/#examples/</a>

                                        <div class="margin-bottom-20"></div>

                                        <h4>GitHub. </h4>
                                        <a target="_blank" href="https://github.com/fancyapps/fancyBox">https://github.com/fancyapps/fancyBox/</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">feature_gallery.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Fancybox -->

                            <!-- Font Awesome -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-9">
                                            Font Awesome
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-9" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>Font Awesome은 크기, 색상, 그림자 및 기타 CSS 기능을 사용하여 수행 할 수 있는 모든 작업을 즉시 사용자 지정할 수 있는
                                            확장
                                            가능한 벡터 아이콘을 제공합니다.</p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <pre class="line-numbers"><code
                                                class="language-markup">No JavaScript Required</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>HTML</h4>
                                        <p>시작한 후 &lt;i&gt; 태그를 사용하여 어디에서나 글꼴 썸네일 아이콘을 배치 할 수 있습니다.</p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;i class="fa fa-camera-retro"&gt;&lt;/i&gt; fa-camera-retro</code></pre>
                                        <p><i class="fa fa-camera-retro"></i> fa-camera-retro</p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://fortawesome.github.io/Font-Awesome/">http://fortawesome.github.io/Font-Awesome//</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_icon_fa.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Font Awesome -->

                            <!-- Line Icons -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-16">
                                            Line Icons
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-16" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>심플 라인 아이콘은 모바일 응용 프로그램, 웹 사이트, 사용자 인터페이스 등에 적합한 162 개의 간단한 획 아이콘입니다. 모든 아이콘은
                                            이전에 GraphicBurger에 출시 된 똑같은 아름다운 단순한 선 아이콘 세트에서 변환되었습니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&ltlink rel="stylesheet" href="assets/plugins/line-icons/line-icons.css"&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <pre class="line-numbers"><code
                                                class="language-markup">No JavaScript Required</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>HTML</h4>
                                        <pre class="line-numbers"><code class="language-markup">&ltspan class="icon-user"&gt&lt/span&gt</code></pre>
                                        <span class="icon-user"> icon-user</span>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://graphicburger.com/simple-line-icons-set-vol-1/">http://graphicburger.com/simple-line-icons-set-vol-1</a></br>
                                        <a target="_blank" href="http://graphicburger.com/simple-line-icons-set-vol-2/">http://graphicburger.com/simple-line-icons-set-vol-2</a></br>
                                        <a target="_blank" href="http://graphicburger.com/simple-line-icons-set-vol-3/">http://graphicburger.com/simple-line-icons-set-vol-3</a></br>
                                        <a target="_blank" href="http://graphicburger.com/simple-line-icons-set-vol-4/">http://graphicburger.com/simple-line-icons-set-vol-4</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_line.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Line Icons -->

                            <!-- Google Maps (Gmaps) -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-11">
                                            Google Maps (Gmaps)
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-11" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>gmaps.js는 간단한 방법으로 Google지도의 잠재력을 사용할 수있게합니다. 더 이상의 광범위한 문서 또는 많은 양의 코드가 필요하지
                                            않습니다.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-php">No CSS Required</code></pre>
                                        <br>
                                        <p><span class="label label-red">Note</span> 지도가 나타나지 않는 경우 :</p>
                                        <p>그렇다면 <code>HTML\assets\css\pages\page_contact.css</code>
                                            또는 <code>HTML\assets\css\style.css</code>. 파일을 링크하는 것을 잊어 버린 것 같습니다. 그러나 CSS
                                            내에서 고정 된 높이를 지정하거나 위에 설명 된 Unify 사전 정의 된 높이 클래스 중 하나를 사용하여 지정할 수 있습니다.</p>
                                        <br>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="http://maps.google.com/maps/api/js?sensor=true"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/gmap/gmaps.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/pages/page_contacts.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 줄을 추가하십시오. <code>ContactPage.initMap();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    ContactPage.initMap();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Set location</h4>
                                        <p>위치를 변경하려면 다음과 같이하십시오.</p>
                                        <p>1. 파일 탐색 <code>HTML\assets\js\pages\page_contacts.js</code>
                                        </p>
                                        <p>2. 위치의 <code>lat</code> 및 <code>lng</code> 좌표를 설정하십시오.</p>
                                        </p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://hpneo.github.io/gmaps/">http://hpneo.github.io/gmaps</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_maps_google.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Google Maps (Gmaps) -->

                            <!-- Horizontal Parallax (Main Sldier) -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-12">
                                            Parallax Slider (Main Slider)
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-12" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>수평 시차 (Sliding Horizontal) 시차는 시차 효과 (시차 효과)를 창출하기 위해 동시에 여러 요소를 서로 다른 속도로
                                            움직입니다..</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/parallax-slider/css/parallax-slider.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;tscript src="assets/plugins/parallax-slider/js/modernizr.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/parallax-slider/js/jquery.cslider.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/parallax-slider.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오. <code>ParallaxSlider.initParallaxSlider();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    ParallaxSlider.initParallaxSlider();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank"
                                           href="http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery">http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">index.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Horizontal Parallax (Main Slider) -->

                            <!-- Layer Slider -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-15">
                                            Layer Slider
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-15" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>LayerSlider는 이미지 갤러리, 컨텐츠 슬라이더 및 필견적 인 효과를 제공하는 마음을 발산하는 슬라이드 쇼를 만들기위한 프리미엄
                                            다목적 슬라이더입니다. 최첨단 기술을 사용하여 가장 매끄러운 경험을 제공하며 200 개가 넘는 프리 세트 2D 및 3D 슬라이드 전환이
                                            제공됩니다.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/layer-slider/layerslider/css/layerslider.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&ltscript src="assets/plugins/layer-slider/layerslider/js/greensock.js"&gt&lt/script&gt
&lt;script src="assets/plugins/layer-slider/layerslider/js/layerslider.transitions.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/layer-slider/layerslider/js/layerslider.kreaturamedia.jquery.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/layer-slider.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오. <code>LayerSlider.initLayerSlider();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    LayerSlider.initLayerSlider();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <p>assets/plugins/layer-slider/documentation</p>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">page_home1.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Layer Slider -->

                            <!-- Masonry -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-17">
                                            Masonry
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-17" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>Masonry는 JavaScript 그리드 레이아웃 라이브러리입니다. 그것은 가능한 수직 공간을 기반으로 최적의 위치에 요소를 배치함으로써
                                            작동합니다. 일종의 석공 술은 벽에 돌을 맞추고 있습니다. 당신은 아마 인터넷을 통해 사용되는 것을 보았을 것입니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/css/pages/blog_masonry_3col.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/masonry/jquery.masonry.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/js/pages/blog-masonry.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/pages/blog-masonry.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://masonry.desandro.com/">http://masonry.desandro.com//</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">blog_masonry_3col.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Masonry -->

                            <!-- Owl Carousel  -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-18">
                                            Owl Carousel
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-18" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>민감한 회전식 슬라이드 슬라이더를 만들 수 있는 터치 가능한 jQuery 플러그인.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/owl-carousel.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오.<code>OwlCarousel.initOwlCarousel();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    OwlCarousel.initOwlCarousel();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>
                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://owlgraphic.com/owlcarousel/">http://owlgraphic.com/owlcarousel//</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_carousels.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- Owl Carousel  -->

                            <!-- Revolution Slider -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-19">
                                            Revolution Slider
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-19" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>Slider Revolution은 이미지, 비디오 및 캡션을 단순하고 현대적이고 멋진 3D 전환과 함께 표시 할 수 있는 기능을 제공하는
                                            완전히 개발 된 슬라이드 표시 시스템입니다. 이 플러그인에는 독특한 전환 효과, 이미지 프리 로더, 비디오 퍼가기, 사용자 상호 작용에서
                                            멈추는 자동 재생 및 자신 만의 효과를 만들기위한 다양한 설정 옵션이 있습니다. 모든 사용자 정의는 jQuery 옵션, HTML 5
                                            데이터 속성 및 CSS를 통해 처리 할 수 있습니다!</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/revolution-sliderrs-plugin/css/tools.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.plugins.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/revolution-sliderrs-plugin/js/jquery.themepunch.revolution.min.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/revolution-slider.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오.
                                            <code>RevolutionSlider.initRSfullScreenOffset();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    RevolutionSlider.initRSfullScreenOffset();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <p>assets/plugins/revolution-slider/documentation</p>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">page_home9.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- Revolution Slider -->

                            <!-- Sky Forms -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-21">
                                            Sky Forms
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-21" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>Sky Forms Pro는 유효성 검사, 마스킹, 모달, 아약스 제출, datepickers와 같이 많은 양의 자바 스크립트 기능이있는
                                            아름다운 양식 요소 세트입니다. 로그인, 등록, 연락처, 검토, 주문, 설명, 체크 아웃 등 복잡하고 필요한 모든 양식을 작성할 수
                                            있습니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/sky-forms-pro/sky-forms/css/sky-forms.css"&gt;
&lt;link rel="stylesheet" href="assets/plugins/sky-forms-pro/sky-forms/custom/custom-sky-forms.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/sky-forms-pro/sky-forms/js/jquery.maskedinput.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/sky-forms-pro/sky-forms/js/jquery-ui.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/sky-forms-pro/sky-forms/js/jquery.validate.min.js"&gt;&lt;/script&gt;</code></pre>
                                        <h4>Internet Exploror</h4>
                                        <pre class="line-numbers"><code class="language-markup">&lt;!--[if lt IE 9]&gt;
    &lt;script src="assets/plugins/sky-forms-pro/sky-forms/js/sky-forms-ie8.js"&gt;&lt;/script&gt;
&lt;![endif]--&gt;

&lt;!--[if lt IE 10]&gt;
    &lt;script src="assets/plugins/sky-forms-pro/sky-forms/js/jquery.placeholder.min.js"&gt;&lt;/script&gt;
&lt;![endif]--&gt; </code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;!-- For Masking --&gt;
&lt;script src="assets/js/plugins/masking.js"&gt;&lt;/script&gt;
&lt;!-- For Datepicker --&gt;
&lt;script src="assets/js/plugins/datepicker.js"&gt;&lt;/script&gt;
&lt;!-- For Validation --&gt;
&lt;script src="assets/js/plugins/validation.js"&gt;&lt;/script&gt;
                                </code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 HTML 페이지 맨 아래의 jQuery 함수에 다음 행을 추가하십시오. <code>Masking.initMasking();</code>
                                            마스킹을 위해 <code>Datepicker.initDatepicker();</code> datepicker 또는 <code>Validation.initValidation();</code>
                                            검증을 위해.</p>

                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    Masking.initMasking();
    //or
    Datepicker.initDatepicker();
    //or
    Validation.initValidation();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <p>assets/plugins/sky-forms-pro/documentation</p>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_form_general1.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Sky Forms -->

                            <!-- Countdown -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-5">
                                            Countdown
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>지정된 시간에 카운트 다운을 표시하도록 div 또는 span을 설정하는 jQuery 플러그인입니다.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/css/pages/page_coming_soon.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/countdown/jquery.plugin.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/countdown/jquery.countdown.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/pages/page_coming_soon.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>
                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오. <code>PageComingSoon.initPageComingSoon();</code>
                                            HTML 페이지 맨 아래의 jQuery 함수에 추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    PageComingSoon.initPageComingSoon();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Set countdown</h4>
                                        <p>카운트 다운 날짜와 시간을 변경하려면 다음과 같이하십시오.</p>
                                        <p>1. <code>HTML/resources/js/pages/page_coming_soon.js</code>로 이동하십시오.
                                        </p>
                                        <p>2. 전체 함수를 다음 함수로 바꿉니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
var PageComingSoon = function () {
    return {
      //Coming Soon
      initPageComingSoon: function () {
            $('#defaultCountdown').countdown({until: new Date(yyyy, mm-1, d, hh, mm, ss)})
        }
    };
}();
    </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://keith-wood.name/countdown.html">http://keith-wood.name/countdown.html</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">page_coming_soon.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- Countdown -->

                            <!-- jQuery Backstretch -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-1">
                                            jQuery Backstretch
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p> 동적인 크기 조정이 가능한 슬라이드 쇼 가능 배경 이미지를 모든 페이지 또는 요소에 추가 할 수 있는 간단한 jQuery
                                            플러그인입니다.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-php">No CSS required</code></pre>
                                        <br>
                                        <p><span class="label label-red">Note</span> 이미지는 JS를 사용하여 설정됩니다. 자세한 내용은 공식
                                            설명서를 참조하십시오.
                                        </p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="plugins/bootstrap/js/bootstrap.min.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://srobbin.com/jquery-plugins/backstretch/">http://srobbin.com/jquery-plugins/backstretch/</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">page_coming_soon.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End jQuery Backstretch -->

                            <!-- Vector Map -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-1" href="#collapse-22">
                                            Vector Map
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-22" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>jVectorMap은 JavaScript, CSS, HTML, SVG 또는 VML과 같은 고유 브라우저 기술 만 사용합니다. Flash
                                            또는 기타 독점 브라우저 플러그인은 필요하지 않습니다. 이를 통해 jVectorMap은 모든 최신 모바일 브라우저에서 작동합니다.</p>
                                        <ul>
                                            <li>모든 최신 브라우저 (IE6-8 포함)에서 작동합니다.</li>
                                            <li>그것의 벡터 본성 때문에 어떤 해상도에서도 멋지게 보입니다.</li>
                                            <li>많은 Map을 사용할 수 있습니다.</li>
                                            <li>사용자 지정 Map은 변환기를 사용하여 만들 수 있습니다.</li>
                                        </ul>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&ltlink rel="stylesheet" href="assets/plugins/vector-map/custom_jquery-jvectormap.css"&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>주석 밑 <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script rel="stylesheet" href="assets/js/plugins/vector-map.js"&gt;&lt;/script&gt; </code></pre>
                                        <br>
                                        <p>어떤 Map 스타일이 필요한지에 따라, 다음 js 설치 중 하나가 필요합니다.</p>
                                        <p>주석 밑 <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/vector-map/jquery-jvectormap.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/jquery-mousewheel.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/jquery-mousewheel.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/jvectormap.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/abstract-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/abstract-canvas-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/abstract-shape-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-group-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-canvas-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-shape-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-path-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/svg-circle-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-group-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-canvas-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-shape-element.js&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-path-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vml-circle-element.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/vector-canvas.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/simple-scale.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/numeric-scale.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/ordinal-scale.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/color-scale.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/data-series.js"&gt&lt/script&gt
&ltscript src="rrrassets/plugins/vector-map/lib/proj.jsrrr"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/lib/world-map.js"&gt&lt/script&gt
&ltscript src="assets/plugins/vector-map/tests/resources/jquery-jvectormap-world-mill-en.js"&gt&lt/script&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>플러그인을 초기화하려면 다음 행을 추가하십시오. <code>VectorMap.initVectorMap();</code>
                                            및 <code>VectorMap.initMarkerVectorMap();</code> HTML 페이지 맨 아래의 jQuery 함수에
                                            추가합니다.</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    VectorMap.initVectorMap();
    VectorMap.initMarkerVectorMap();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://jvectormap.com/">http://jvectormap.com</a>

                                        <div class="margin-bottom-20"></div>

                                        <%--<h4>Demo</h4>--%>
                                        <%--<span class="color-green">shortcode_maps_vector.html</span>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- End Vector Map -->
                        </div>

                    </div>
                    <!-- End JavaScript initialization -->

                    <div class="clearfix margin-bottom-50"></div>

                    <!-- Fonts -->
                    <div id="scroll_fonts" class="margin-bottom-70">
                        <h2>Fonts <span class="label label-dark">Updated v1.9</span><a href="#top">top <i
                                class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p>Unify은 제목 및 Google 웹 글꼴의 일부 요소에 Open Sans 글꼴을 사용합니다.
                            <a target="_blank" href="https://www.google.com/fonts">Google
                                Web Fonts</a>에서 600 개가 넘는 글꼴 중에서 선택할 수 있습니다. 글꼴은 <code>&lt;head&gt;</code>
                            섹션의 모든 HTML 파일에 연결됩니다.</p>
                        <pre class="line-numbers"><code class="language-php">&lt;!-- Web Fonts --&gt;
&lt;link rel=&quot;shortcut&quot; type=&quot;text/css&quot; href=&quot;//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin&quot;&gt;</code></pre>
                        <br>

                        <p><span class="label label-red">Note</span>항상 <strong>CSS</strong>에서 선택한 글꼴을 지정해야합니다.</p><br>

                        <pre class="line-numbers"><code class="language-css">
.example {
    font-family: "Open Sans", Arial, sans-serif;
}
            </code></pre>
                        <p><span class="label label-green">Example</span> CSS에서 Open Sans 글꼴 패밀리에 대한 사양입니다.</p>
                    </div><!--/end-->
                    <!-- End Fonts -->

                    <div class="clearfix margin-bottom-40"></div>

                    <!-- Credits -->
                    <div id="scroll_credits" class="table-credits margin-bottom-70">
                        <h2>
                            Credits
                            <span class="label label-dark">Updated v1.9</span>
                            <a href="#top">top <i class="fa fa-angle-up"></i></a>
                        </h2>
                        <hr>
                        <p>모든 플러그인은 <code>assets/plugins/..</code>에 있습니다.</p>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th width="120">Name</th>
                                <th class="hidden-sm">Description</th>
                                <th>URL</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Bootstrap</td>
                                <td class="hidden-sm">부트 스트랩은 반응 형 모바일 첫 번째 프로젝트를 웹에서 개발하기위한 가장 널리 사용되는 HTML, CSS 및 JS
                                    프레임 워크입니다.
                                </td>
                                <td><a target="_blank" href="http://getbootstrap.com">http://getbootstrap.com</a></td>
                            </tr>
                            <tr>
                                <td>jQuery</td>
                                <td class="hidden-sm">jQuery는 빠르고 작으며 기능이 풍부한 JavaScript 라이브러리입니다. HTML 문서 탐색 및 조작, 이벤트
                                    처리, 애니메이션 및 Ajax를 여러 브라우저에서 작동하는 사용하기 쉬운 API로 훨씬 간단하게 만듭니다. 다양성과 확장 성을 결합한 jQuery는
                                    수백만 명이 JavaScript를 작성하는 방식을 변경했습니다.
                                </td>
                                <td><a target="_blank" href="http://jquery.com">http://jquery.com</a></td>
                            </tr>
                            <tr>
                                <td>Font Awesome</td>
                                <td class="hidden-sm">Font Awesome 부트 스트랩을 위해 고안된 상징적 글꼴.</td>
                                <td><a target="_blank" href="http://fortawesome.github.io/Font-Awesome">http://fortawesome.github.io/Font-Awesome</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Line Icons</td>
                                <td class="hidden-sm">웹이나 네이티브 응용 프로그램에서보다 편리하게 사용할 수 있도록 160 개의 간단한 회선 아이콘이 모두 이제 웹 폰트에
                                    포함됩니다. 이 멋진 웹 폰트를 만든 Jamal Jama에게 큰 감사를드립니다.
                                </td>
                                <td><a target="_blank" href="http://graphicburger.com/simple-line-icons-webfont">http://graphicburger.com/simple-line-icons-webfont</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Parallax Slider</td>
                                <td class="hidden-sm">각 슬라이더 요소와 배경 시차 효과에 대해 서로 다른 애니메이션이있는 간단한 시차 콘텐츠 슬라이더입니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery">http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery</a>
                                </td>
                            </tr>
                            <tr>
                                <td>OWL Carousel</td>
                                <td class="hidden-sm">민감한 회전식 슬라이드 슬라이더를 만들 수 있는 터치 가능한 jQuery 플러그인.
                                </td>
                                <td><a target="_blank" href="http://owlgraphic.com/owlcarousel">http://owlgraphic.com/owlcarousel</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Backstretch</td>
                                <td class="hidden-sm">동적인 크기가 조정 된 슬라이드 쇼 가능 배경 이미지를 페이지 나 요소에 추가 할 수 있는 간단한 jQuery
                                    플러그인입니다.
                                </td>
                                <td><a target="_blank" href="http://srobbin.com/jquery-plugins/backstretch">http://srobbin.com/jquery-plugins/backstretch</a>
                                </td>
                            </tr>
                            <tr>
                                <td>MIXITUP</td>
                                <td class="hidden-sm">CSS3 및 JQuery 필터 및 정렬 플러그인 (버전 : 1.5.4)</td>
                                <td><a target="_blank" href="https://mixitup-old.kunkalabs.com">https://mixitup-old.kunkalabs.com</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Counter-Up</td>
                                <td class="hidden-sm">Counter-Up은 0부터 숫자를 움직이는 jQuery 플러그인입니다.
                                </td>
                                <td><a target="_blank" href="https://github.com/bfintal/Counter-Up">https://github.com/bfintal/Counter-Up</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pace.js</td>
                                <td class="hidden-sm">페이지로드 및 Ajax 탐색을위한 아름다운 진행 표시기.
                                </td>
                                <td><a target="_blank" href="http://github.hubspot.com/pace/docs/welcome">http://github.hubspot.com/pace/docs/welcome</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Circles (Master)</td>
                                <td class="hidden-sm">SVG에서 원형 그래프를 생성하는 경량의 JavaScript 라이브러리. 이제 애니메이션이 있습니다.
                                </td>
                                <td><a target="_blank" href="https://github.com/lugolabs/circles">https://github.com/lugolabs/circles</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Respond.js</td>
                                <td class="hidden-sm">최소 / 최대 너비의 CSS3 Media Queries (IE 6-8 및 그 이상)를위한 빠르고 가벼운 폴리필.
                                </td>
                                <td><a target="_blank" href="https://github.com/scottjehl/Respond">https://github.com/scottjehl/Respond</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ladda Buttons</td>
                                <td class="hidden-sm">로드 인디케이터를 호출 한 액션에로드 인디케이터를 병합하는 UI 개념. 주로 브라우저가 그 일을하는 동안 사용자가
                                    궁금해하는 채로 떠나지 않고 제출 즉시 즉각적인 피드백을 제공하는 양식과 함께 사용하기위한 것입니다.
                                </td>
                                <td><a target="_blank" href="https://github.com/scottjehl/Respond">https://github.com/scottjehl/Respond</a>
                                </td>
                            </tr>
                            <tr>
                                <td>HTML5 Shiv</td>
                                <td class="hidden-sm">HTML5 Shiv는 레거시 Internet Explorer에서 HTML5 섹션 요소 사용을 지원하며 Internet
                                    Explorer 6-9, Safari 4.x (및 iPhone 3.x) 및 Firefox 3.x에 기본 HTML5 스타일을 제공합니다.
                                </td>
                                <td><a target="_blank" href="https://github.com/aFarkas/html5shiv">https://github.com/aFarkas/html5shiv</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Countdown</td>
                                <td class="hidden-sm">jQuery 카운트 다운 플러그인</td>
                                <td><a target="_blank" href="http://keith-wood.name/countdown.html">http://keith-wood.name/countdown.html</a>
                                </td>
                            </tr>
                            <tr>
                                <td>GMaps</td>
                                <td class="hidden-sm">gmaps.js는 간단한 방법으로 Google지도의 잠재력을 사용할 수있게합니다. 더 이상의 광범위한 문서 또는 많은
                                    양의 코드가 필요하지 않습니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://hpneo.github.io/gmaps">http://hpneo.github.io/gmaps</a></td>
                            </tr>
                            <tr>
                                <td>Brand Buttons</td>
                                <td class="hidden-sm">CSS 버튼 플러그인</td>
                                <td><a target="_blank" href="https://github.com/theaqua/bootstrap-brand-buttons">https://github.com/theaqua/bootstrap-brand-buttons</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Hover Effects</td>
                                <td class="hidden-sm">링크, 버튼, 로고, SVG, 추천 이미지 등에 적용 할 수 있는 CSS3 구동 호버 효과 모음입니다. 자신의 요소에
                                    쉽게 적용하거나, 수정하거나, 영감을 얻기 위해 사용하십시오. CSS, Sass 및 LESS로 제공됩니다.
                                </td>
                                <td><a target="_blank" href="http://ianlunn.github.io/Hover/">http://ianlunn.github.io/Hover/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Login/Sign up Modal Window</td>
                                <td class="hidden-sm">이 모달 창을 통해 사용자는 귀하의 웹 사이트에 로그인 / 가입 할 수 있습니다. 일단 열면 사용자는 한 양식에서 다른
                                    양식으로 쉽게 전환하거나 암호 재설정 옵션을 선택할 수 있습니다.
                                </td>
                                <td><a target="_blank" href="https://codyhouse.co/gem/loginsignup-modal-window/">https://codyhouse.co/gem/loginsignup-modal-window/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Masonry</td>
                                <td class="hidden-sm">Masonry는 JavaScript 그리드 레이아웃 라이브러리입니다. 그것은 가능한 수직 공간을 기반으로 최적의 위치에
                                    요소를 배치함으로써 작동합니다. 일종의 석공 술은 벽에 돌을 맞추고 있습니다. 당신은 아마 인터넷을 통해 사용되는 것을 보았을 것입니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://masonry.desandro.com/">http://masonry.desandro.com/</a></td>
                            </tr>
                            <tr>
                                <td>Vector Maps</td>
                                <td class="hidden-sm">세계, 세계 지역, 국가 및 도시의 많은지도를이 사이트에서 다운로드 할 수 있습니다. 이 모든 것은 공개 된 데이터
                                    또는 무료 라이센스에 따라 사용이 허가 된 데이터로 만들어 지므로 어떤 목적 으로든 무료로 사용할 수 있습니다.
                                </td>
                                <td><a target="_blank" href="http://jvectormap.com/">http://jvectormap.com/</a></td>
                            </tr>
                            <tr>
                                <td>WOW Animation</td>
                                <td class="hidden-sm">페이지를 아래로 스크롤 할 때 CSS 애니메이션을 보여줍니다. 기본적으로 animate.css 애니메이션을 트리거하는
                                    데 사용할 수 있습니다. 그러나 설정을 좋아하는 애니메이션 라이브러리로 쉽게 변경할 수 있습니다.
                                </td>
                                <td><a target="_blank" href="http://mynameismatthieu.com/WOW/">http://mynameismatthieu.com/WOW/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Animate.css</td>
                                <td class="hidden-sm">CSS 애니메이션 플러그인</td>
                                <td><a target="_blank" href="https://daneden.github.io/animate.css/">https://daneden.github.io/animate.css/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Modernizr</td>
                                <td class="hidden-sm">그것은 초고속 테스트의 모음입니다. 또는 제가 호출하기를 원하는대로 "탐지"합니다. 웹 페이지가로드 될 때 실행되며,
                                    그 결과를 사용하여 사용자에게 경험을 맞출 수 있습니다.
                                </td>
                                <td><a target="_blank" href="https://modernizr.com/">https://modernizr.com/</a></td>
                            </tr>
                            <tr>
                                <td>Smooth Scroll</td>
                                <td class="hidden-sm">동일한 페이지 링크에 대해 부드러운 스크롤을 쉽게 구현할 수 있습니다.
                                </td>
                                <td><a target="_blank" href="https://github.com/kswedberg/jquery-smooth-scroll">https://github.com/kswedberg/jquery-smooth-scroll</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="clearfix margin-bottom-10"></div>
                        <h3>
                            Premium Plugin Credits <span class="label label-dark">Updated v1.9</span>
                        </h3>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th width="120">Name</th>
                                <th class="hidden-sm">Description</th>
                                <th>URL</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Master Slider</td>
                                <td class="hidden-sm">마스터 슬라이더는 최고급 부드러운 하드웨어 가속 전환 효과가있는 프리미엄 이미지 및 콘텐츠 슬라이더입니다. 이전에 경험
                                    해보지 못한 순수 스와이프 제스처로 터치 탐색을 지원합니다. 모든 주요 장치에서 완벽하게 작동하는 진정으로 반응적이고 장치 친화적 인 슬라이더입니다.
                                    마스터 슬라이더는 레이어의 모든 HTML 내용 (텍스트, 이미지 등)을 추가 할 수 있는 멋진 슬라이더입니다. 사용하기 쉽고 25 개 이상의 템플릿을
                                    사용할 준비가되어 있습니다. 마스터 슬라이더의 모든 항목은 거의 최고, 핫스팟, 축소판, 다양한 효과, 비디오 지원 등에서 가장 완벽합니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/master-slider-jquery-touch-swipe-slider/6337671?ref=htmlstream">http://codecanyon.net/item/master-slider-jquery-touch-swipe-slider/6337671</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Revolution Slider</td>
                                <td class="hidden-sm"> Slider Revolution은 이미지, 비디오 및 캡션을 단순하고 현대적이고 멋진 3D 전환과 함께 표시 할
                                    수 있는
                                    기능을 제공하는 완전히 개발 된 슬라이드 표시 시스템입니다. 이 플러그인에는 독특한 전환 효과, 이미지 프리 로더, 비디오 퍼가기, 사용자 상호
                                    작용에서 멈추는 자동 재생 및 자신 만의 효과를 만들기위한 다양한 설정 옵션이 있습니다. 모든 사용자 정의는 jQuery 옵션, HTML 5 데이터
                                    속성 및 CSS를 통해 처리 할 수 있습니다!
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/slider-revolution-responsive-jquery-plugin/2580848?ref=htmlstream">http://codecanyon.net/item/slider-revolution-responsive-jquery-plugin/2580848</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Layer Slider</td>
                                <td class="hidden-sm">LayerSlider는 이미지 갤러리, 컨텐츠 슬라이더 및 필수적인 효과가있는 마음을 끄는 슬라이드 쇼를 만들기위한
                                    프리미엄 다목적 슬라이더입니다. 가능한 최첨단 기술을 제공하기 위해 최첨단 기술을 사용하며 200 개가 넘는 프리 세트 2D 및 3D 슬라이드 전환이
                                    제공됩니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/layerslider-responsive-jquery-slider-plugin/922100?ref=htmlstream">http://codecanyon.net/item/layerslider-responsive-jquery-slider-plugin/922100</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Cube Portfolio</td>
                                <td class="hidden-sm">큐브 포트폴리오는 아름다운 애니메이션 필터링, 사용자 정의 캡션을 제공하는 강력한 jQuery 플러그인으로,
                                    포트폴리오, 갤러리, 팀 구성원, 블로그 게시물 또는 기타 주문한 콘텐츠에 이상적입니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/cube-portfolio-responsive-jquery-grid-plugin/6372959?ref=htmlstream">http://codecanyon.net/item/cube-portfolio-responsive-jquery-grid-plugin/6372959</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Sky Forms Pro</td>
                                <td class="hidden-sm">Sky Forms Pro는 유효성 검사, 마스킹, 모달, 아약스 제출, datepickers와 같이 많은 양의 자바
                                    스크립트 기능이있는 아름다운 양식 요소 세트입니다. 로그인, 등록, 연락처, 검토, 주문, 설명, 체크 아웃 등 복잡하고 필요한 모든 양식을 작성할 수
                                    있습니다.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/sky-forms-pro/5414510?ref=htmlstream">http://codecanyon.net/item/sky-forms-pro/5414510</a>
                                </td>
                            </tr>
                            <tr>
                                <td>FancyBox</td>
                                <td class="hidden-sm">FancyBox는 웹 페이지의 이미지, HTML 콘텐츠 및 멀티미디어에 확대 / 축소 기능을 추가하는 멋지고 우아한
                                    방법을 제공하는 도구입니다. 인기있는 JavaScript 프레임 워크 인 jQuery의 상단에 구현되어 구현하기 쉽고 맞춤 설정이 쉽습니다.
                                </td>
                                <td><a target="_blank" href="http://fancyapps.com/fancybox">http://fancyapps.com/fancybox</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="clearfix margin-bottom-10"></div>

                        <h3>Image and Design credits</h3>
                        <ul class="list-unstyled margin-bottom-20">
                            <li>- Google Fonts: <a target="_blank" href="http://www.google.com/fonts">http://www.google.com/fonts</a>
                            </li>
                            <%--<li>- Photo by DAVID ILIFF. License: CC-BY-SA 3.0: <a href="http://bit.ly/ZhuJG1">http://bit.ly/ZhuJG1</a>--%>
                            <%--</li>--%>
                            <%--<li>- Showcase: <a target="_blank"--%>
                            <%--href="http://www.pixeden.com/psd-web-elements/responsive-showcase-psd">http://www.pixeden.com/psd-web-elements/responsive-showcase-psd</a>--%>
                            <%--</li>--%>
                            <li>- Blurred backgrounds: <a target="_blank"
                                                          href="http://www.cssauthor.com/10-beautiful-collection-of-blurred-backgrounds">http://www.cssauthor.com/10-beautiful-collection-of-blurred-backgrounds</a>
                            </li>
                            <li>- <strong>Unsplash</strong> 무료 고해상도 사진 <a target="_blank"
                                                                          href="http://unsplash.com">http://unsplash.com</a>
                            </li>
                            <li>- <strong>Picjumbo</strong> 상업 및 개인 작품을위한 완전한 무료 사진 <a target="_blank"
                                                                                       href="http://picjumbo.com">http://picjumbo.com</a>
                            </li>
                            <li>- <strong>IM FREE</strong> 상업적 용도로 사용되는 큐레이팅 된 무료 자료 모음 <a target="_blank"
                                                                                           href="http://imcreator.com/free">http://imcreator.com/free</a>
                            </li>
                        </ul>
                        <div class="clearfix margin-bottom-10"></div>

                        <h3>Premium Image Credits</h3>
                        <p>라이센싱 권한으로 인해 이미지는 데모 용도로만 데모 용으로 사용되며 다음 위치에서 구입할 수 있습니다.<br/>
                            <a target="_blank" href="http://photodune.net?ref=htmlstream">wwww.photodune.net</a>, <a
                                    target="_blank" href="http://peopleimages.com">http://peopleimages.com</a> and <a
                                    target="_blank" href="http://deathtothestockphoto.com">http://deathtothestockphoto.com</a>
                        </p>
                        <%--<div class="row">--%>
                        <%--<div class="col-md-3">--%>
                        <%--<ul class="list-unstyled">--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/little-girl-with-schoolbag/8968061?ref=htmlstream">--%>
                        <%--Demo-Image-1</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905143?ref=htmlstream">--%>
                        <%--Demo-Image-2</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905128?ref=htmlstream">--%>
                        <%--Demo-Image-3</a></li>--%>

                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                        <%--<ul class="list-unstyled">--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905133?ref=htmlstream">--%>
                        <%--Demo-Image-4</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/pretty-woman-in-white-dress-isolated-studio-shot/3044372?ref=htmlstream">--%>
                        <%--Demo-Image-5</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/fasionable-beautiful-woman-in-white-dress-standing/3092313?ref=htmlstream">--%>
                        <%--Demo-Image-6</a></li>--%>

                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                        <%--<ul class="list-unstyled">--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/casual-male-fashion/4061088?ref=htmlstream">--%>
                        <%--Demo-Image-7</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/male-model-against-white-background/4298787?ref=htmlstream">--%>
                        <%--Demo-Image-8</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/smiling-portraits/4276142?ref=htmlstream">--%>
                        <%--Demo-Image-9</a></li>--%>
                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                        <%--<ul class="list-unstyled">--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/pretty-woman-wearing-short-jeans-and-summer-shirt-smiling/5310015?ref=htmlstream">--%>
                        <%--Demo-Image-10</a></li>--%>
                        <%--<li><a target="_blank"--%>
                        <%--href="http://photodune.net/item/handsome-male-fashion-model-smiling-dressed-casual-outdoor/2426017?ref=htmlstream">--%>
                        <%--Demo-Image-11</a></li>--%>
                        <%--</ul>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                    <!-- End Credits -->

                    <div class="margin-bottom-40"></div>

                    <!--Change Log-->
                    <div id="scroll_changelog" class="changelog margin-bottom-70">
                        <h2>Change Log <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p><label class="label label-danger">Important!</label> 업그레이드하기 전에 파일을 백업하는 것을 잊지 마십시오.</p>
                        <br>

                        <h4><span>Version 1.9.4 – 2017/03/12</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>JavaDoc</strong> 생성 및 압축 파일 Export</li>
                            <li>UPDATED: Document 수정 및 보완</li>
                        </ul>

                        <h4><span>Version 1.9.3 – 2017/03/10</span></h4>
                        <ul class="margin-bottom-40">
                            <li>UPDATED: Document 수정 및 보완</li>
                        </ul>

                        <h4><span>Version 1.9.2 – 2017/03/07</span></h4>
                        <ul class="margin-bottom-40">
                            <li>IMPROVEMENT: Document 수정 및 보완</li>
                            <li>UPDATED: Document 수정 및 보완</li>
                            <li>FIXED: FileZila, SSH 서버 접속 불가</li>
                        </ul>

                        <h4><span>Version 1.9.1 – 2017/03/05</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: FTP툴 FileZila 설치 후 SSH 서버 접속</li>
                            <li>IMPROVEMENT: EC2 서버 Ubuntu에서 Amazone Linux Api로 수정</li>
                            <li>FIXED: AWS BeansTalk 접속 시 RSA public 키 접근 불가</li>
                            <li>UPDATED: Document 수정 및 보완</li>
                        </ul>

                        <h4><span>Version 1.9 – 31 2017/03/03</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: AWS 공인 IP 무료도메인 .ga 연결</li>
                            <li>NEW: Jenkins 정기적 빌드 설정</li>

                            <li>UPDATED: AWS Security Group 인스턴스 연결</li>
                            <li>UPDATED: Document 수정 및 보완</li>
                        </ul>

                        <h4><span>Version 1.8 – 2017/03/01</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: Jenkins 계정 생성</li>
                            <li>NEW: GitHub와 Hook 설정</li>
                            <li>NEW: AWS 계정 생성 후 EC2 생성</li>
                            <li>NEW: RDS 인스턴스 EC2와 연결</li>

                            <li>UPGRADE: HandlerInterceptorAdapter 클래스</li>
                            <li>UPGRADE: 패키지의 생성과 SampleInterceptor 설정</li>
                            <li>UPGRADE: UserDAO의 생성과 SQL 처리</li>
                            <li>UPGRADE: UserController의 작성</li>

                            <li>IMPROVEMENT: 도메인 객체의 변화</li>
                            <li>IMPROVEMENT: 파일 업로드를 위한 register.jsp 페이지 수정하기</li>
                            <li>IMPROVEMENT: 파일 삭제 후 화면에서의 제거</li>
                            <li>IMPROVEMENT: 파일 링크 처리</li>

                            <li>FIXED: EC2 다른 모듈과 연결 오류</li>
                            <li>FIXED: Jenkins, GitHub 연결 RSA 오류</li>
                            <li>FIXED: Jenkins 즉시 Build 수정</li>
                            <li>FIXED: Jenkins HTTP 포트 변경</li>
                        </ul>

                        <h4><span>Version 1.7 – 2017/02/26</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: MVC의 인터셉터</li>
                            <li>NEW: HttpSession을 이용하는 로그인 처리</li>
                            <li>NEW: 게시물의 세부 기능 적용</li>
                            <li>NEW: 자동 로그인과 쿠키</li>

                            <li>UPGRADE: postHandle()을 이용해서 추가적인 작업하기</li>
                            <li>UPGRADE: LoginInterceptor의 설정</li>
                            <li>UPGRADE: AuthInterceptor의 설정</li>
                            <li>UPGRADE: servlet-context.xml의 설정</li>
                            <li>UPGRADE: LoginInterceptor에서의 쿠키 생성하기</li>

                            <li>IMPROVEMENT: 자동 로그인 테스트</li>
                            <li>IMPROVEMENT: 브라우저 종료 후 다시 접속하기</li>
                            <li>IMPROVEMENT: jsp별 로그인 처리</li>
                            <li>IMPROVEMENT: UserController의 작성</li>
                            <li>IMPROVEMENT: 패키지의 생성과 SampleInterceptor</li>

                            <li>FIXED: HomeController의 수정</li>
                            <li>FIXED: preHandle()의 Object 파라미터</li>
                            <li>FIXED: BoardService의 처리</li>
                            <li>FIXED: 업로드 된 파일 이름의 처리를 위한 JavaScript</li>
                            <li>FIXED: form 태그의 submit 처리</li>
                        </ul>

                        <h4><span>Version 1.6 – 2017/02/23</span></h4>
                        <ul class="margin-bottom-40">
                            <li>New: MVC의 파일 업로드</li>
                            <li>New: 전송된 파일의 저장</li>
                            <li>New: UploadController의 재구성</li>
                            <li>New: 전송된 파일을 화면에 표시</li>
                            <li>New: 첨부파일의 삭제</li>
                            <li>New: 게시물 등록의 파일 업로드</li>
                            <li>New: 조회 페이지와 파일 업로드</li>
                            <li>New: 게시물 수정, 삭제 작업의 파일 업로드</li>

                            <li>UPGRADE: UploadController의 파일 전송 기능 구현</li>
                            <li>UPGRADE: jsp에서의 첨부파일 삭제 처리</li>
                            <li>UPGRADE: BoardService의 변경과 트랜잭션의 처리</li>
                            <li>UPGRADE: 원본 이미지의 조회와 다운로드 처리</li>
                            <li>UPGRADE: 수정 작업에 대한 서비스의 트랜잭션 관리</li>
                            <li>UPGRADE: iframe을 이용한 파일 업로드의 결과 처리</li>
                            <li>UPGRADE: 업로드 폴더의 생성 처리</li>

                            <li>IMPROVEMENT: BoardDao, ReplyDAO 변경</li>
                            <li>IMPROVEMENT: MessageService의 트랜잭션 처리 후 테스트</li>
                            <li>IMPROVEMENT: 실행시에 전달되는 파라미터 파악하기</li>
                            <li>IMPROVEMENT: 도메인 객체 MessageVO 재설정</li>
                            <li>IMPROVEMENT: 댓글 등록의 이벤트 처리</li>
                            <li>IMPROVEMENT: 전체 목록에 대한 함수 처리</li>

                            <li>FIXED: HiddenMethod의 활용 오류</li>
                            <li>FIXED: Ajax 댓글 전달 방식과 처리 방식의 결정</li>
                            <li>FIXED: Ajax 루트 컨텍스트로 실행하기</li>
                        </ul>

                        <h4><span>Version 1.5 – 2017/02/18</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>AOP와 트랜잭션 관리</strong></li>
                            <li>NEW: 테스트 프로젝트의 생성과 AOP의 적용 준비</li>
                            <li>NEW: AOP Test</li>
                            <li>NEW: <strong>트랜잭션</strong>처리</li>
                            <li>NEW: 게시물의 댓글에 따른 트랜잭션 처리</li>

                            <li>NEW FEATURES (AOP)
                                <ul>
                                    <li>NEW: 샘플용 도메인 객체 DAO, XML Mapper, 서비스</li>
                                    <li>NEW: 도메인 객체 MessageVO</li>
                                    <li>NEW: DAO 재설정</li>
                                    <li>NEW: Alarm Notifications</li>
                                </ul>
                            </li>
                            <li>NEW FEATURES (Transaction)
                                <ul>
                                    <li>NEW: root-context.xml의 재처리</li>
                                    <li>NEW: MessageService의 트랜잭션 처리 후 테스트</li>
                                    <li>NEW: 조회 화면에서 댓글의 숫자 출력</li>
                                </ul>
                            </li>

                            <li>UPGRADE: Header & Footer</li>
                            <li>UPGRADE: Slide Bar</li>

                            <li>IMPROVEMENT: MessageService의 트랜잭션 처리 후 테스트</li>
                            <li>IMPROVEMENT: boardMapper.xml의 SQL문 변경</li>
                            <li>IMPROVEMENT: ReplyServiceImpl의 수정</li>
                            <li>IMPROVEMENT: 조회 화면의 댓글 수 출력</li>

                            <li>FIXED: Advanced REST Client
                                <ul>
                                    <li>FIXED: targetid 전달 불가</li>
                                    <li>FIXED: 400 오류</li>
                                    <li>FIXED: json 문법 오류</li>
                                </ul>
                            </li>
                        </ul>

                        <h4><span>Version 1.4 – 2017/02/15</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: RestController와 Ajax</li>
                            <li>NEW: 댓글 처리와 REST</li>
                            <li>NEW: REST 방식의 ReplyController 작성</li>
                            <li>NEW: 화면에서의 Ajax 호출</li>
                            <li>NEW: 게시물 관리의 댓글 적용</li>

                            <li>IMPROVEMENT: @RestController</li>
                            <li>IMPROVEMENT: ReplyService/ReplyServiceImpl 개선</li>
                            <li>IMPROVEMENT: ReplyController에서의 페이징 처리</li>
                            <li>IMPROVEMENT: 테스트를 위한 컨트롤러와 jsp</li>
                            <li>IMPROVEMENT: handlebars를 이용한 템플릿</li>
                            <li>IMPROVEMENT: searchType과 keywork 링크 처리</li>
                            <li>IMPROVEMENT: 게시물의 수정 처리</li>
                            <li>IMPROVEMENT: 스프링 MVC의 UriComponentsBuilder</li>
                            <li>IMPROVEMENT: 게시판 목록 페이징</li>
                            <li>IMPROVEMENT: Exception 화면으로 전달</li>

                            <li>FIXED: UTF-8 처리 필터 등록</li>
                            <li>FIXED: CSS, Javascript 준비</li>
                            <li>FIXED: SessionFactory, SqlSessionTemplate의 수정</li>
                            <li>FIXED: Redirect와 결과 데이터</li>
                            <li>FIXED: MyBatis의 로그 log4jdbc-log4j2</li>
                            <li>FIXED: XML Mapper Debugging</li>

                            <li>UPDATED: 게시판 Dummy Data</li>
                        </ul>

                        <h4><span>Version 1.3 – 2017/02/09</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: 등록, 수정, 삭제, 조회 기능의 구현</li>
                            <li>NEW: 영속(persistence)계층, 비지니스 계층</li>
                            <li>NEW: 등록 구현 - 컨트롤러와 프레젠테이션 계층</li>
                            <li>NEW: 전체 목록 구현</li>
                            <li>NEW: 조회 구현</li>
                            <li>NEW: 삭제/수정 처리</li>
                            <li>NEW: 예외 처리</li>
                            <li>NEW: 페이징 처리 - 영속(persistence)계층, 비지니스 계층</li>
                            <li>NEW: 페이징 처리 - 컨트롤러와 프레젠테이션 계층</li>
                            <li>NEW: 검색 처리와 동적 SQL</li>

                            <li>UPGRADE: <strong>프로젝트 컨셉 및 구상</strong></li>
                            <li>UPGRADE: MariaDB <strong>10.1.21</strong></li>
                            <li>UPGRADE: SequelPro <strong>1.1.2</strong></li>

                            <li>IMPROVEMENT: 프로젝트 컨셉 및 구상</li>
                            <li>IMPROVEMENT: 데이터베이스의 테이블 수정</li>
                            <li>IMPROVEMENT: Mapper 파일의 저장 경로</li>
                            <li>IMPROVEMENT: SqlSessionTemplate 설정</li>

                            <li>FIXED: 프로젝트 컨셉 및 구상</li>
                            <li>FIXED: MyBatis의 "#"문법</li>
                        </ul>

                        <div class="clearfix"></div>

                        <h4><span>Version 1.2 – 2017/02/07</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: 개발 환경의 설정 <code>IntelliJ Project Structure</code></li>
                            <li>NEW: MariaDB의 설정과 스프링 테스트 <code>MySQLConnectionTest.class</code></li>
                            <li>NEW: 스프링 + MyBatis + MariaDB의 설정 <code>MyBatisTest.class</code></li>
                            <li>NEW: 모델 방식과 스프링 MVC 비교</li>
                            <li>NEW: 스프링 + MyBatis <code>mappers.xml</code></li>
                            <li>IMPROVEMENT: Documentation</li>
                            <li>IMPROVEMENT: 프로젝트 컨셉 개선</li>
                            <li>IMPROVEMENT: MariaDB 테이블 수정</li>
                            <li>UPGRADE: 프로젝트 구상 후 추가 및 수정</li>
                            <li>UPGRADE: 프로세스 목적 및 방법 재설정</li>
                            <li>
                                FIXED:
                                <ul>
                                    <li>프로젝트 컨셉 수정</li>
                                    <li>MySQL에서 MariaDB로 변경</li>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                        <div class="clearfix"></div>

                        <h4><span>Version 1.1 – 2017/02/06</span></h4>
                        <ul>
                            <li>CHOICE: Responsive Template(<strong>value &#8361;0</strong>)</li>
                            <li>UPGRADE: 프로젝트 구상</li>
                            <li>FIXED: </li>
                        </ul>
                        <br>

                        <h4><span>Version 1.0 – 2017/02/05</span></h4>
                        <ul>
                            <li>프로젝트 구상</li>
                        </ul>
                    </div><!--/end-->

                    <div class="margin-bottom-50"></div>

                    <!-- Update -->
                    <div id="scroll_upgrade" class="upgrade margin-bottom-70">
                        <h2>Upgrade <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p><span class="label label-blue">Info</span> 업그레이드하기 전에 파일을 <strong>백업</strong>하는 것을 잊지 마십시오.
                            <a href="mailto:jingug1004@naver.com.com">jingug1004@naver.com</a>업그레이드하기 전에 파일을 백업하는
                            것을 잊지 마십시오. </p><br>

                        <p><span class="label label-red">Important!</span> 최신 버전으로 업그레이드하기 전에 모든 코드를 <code>VCS</code> 및 <code>프로젝트</code> 에 포함하십시오.
                            그렇지 않으면 업그레이드 중 원본이 손실 될 수 있습니다.</p>
                        <p>파일은 <code>UNIFY 프로젝트</code> 및
                            <code>GitHub</code> 에 있습니다. </p><br>

                        <div class="margin-bottom-30"></div>

                        <hr>

                        <!-- v1.9+ Upgrade -->
                        <h4>v1.9+ Upgrade</h4>
                        <p>Document</p>
                        <ul>
                            <li>
                                Java Doc 및 Document 작성
                            </li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_overview"> Overview </a> 섹션을 확인하십시오.</p>

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.8 Upgrade -->
                        <h4>v1.8 Upgrade</h4>
                        <p>Jenkins, AWS</p>
                        <ul>
                            <li>서버 인스터스 생성 후 서버 Depoly 활용하는 웹 사이트 오픈
                            </li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_aws"> AWS </a> 섹션을 확인하십시오.</p>

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.7 Upgrade -->
                        <h4>v1.7 Upgrade</h4>

                        <p>인터셉터를 활용하는 로그인 처리</p>
                        <ul>
                            <li>HttpSession, 자동 로그인 쿠키를 활용하는 로그인 처리
                            </li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_interceptor"> Interceptor </a> 섹션을 확인하십시오.</p>
                        <!-- End v1.7 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.6 Upgrade -->
                        <h4>v1.6 Upgrade</h4>
                        <p>게시물의 첨부파일 기능</p>
                        <ul>
                            <li>게시물의 첨부 파일 등록시 Ajax 및 UploadController 재구성
                            </li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_fileupload"> File Upload </a> 섹션을 확인하십시오.</p>
                        <!-- End v1.6 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.5 Upgrade -->
                        <h4>v1.5 Upgrade</h4>
                        <p>AOP와 트랜잭션 처리</p>
                        <ul>
                            <li>AOP 연습 및 구현</li>
                            <li>트랜잭션 처리</li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_aop"> AOP & Transaction </a> 섹션을 확인하십시오.</p>
                        <!-- End v1.5 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.4 Upgrade -->
                        <h4>v1.4 Upgrade</h4>
                        <p>Ajax 댓글 처리</p>
                        <ul>
                            <li>프로트엔드 구현과 기본적인 게시판 기능의 댓글 처리</li>
                            <li>댓글 처리와 REST 숙지</li>
                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_frontend"> Front-End </a> 섹션을 확인하십시오.</p>
                        <!-- End v1.4 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.3 Upgrade -->
                        <h4>v1.3 Upgrade</h4>
                        <p>구글링 및 okky.kr을 통한 기본적인 기능의 게시물 관리</p>
                        <p>*자세한 정보는 공식 <a
                                target="_blank" href="http://okky.kr">http://okky.kr</a> Q&A 문서 페이지를 방문하십시오.</p>
                        <!-- End v1.3 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.2 Upgrade -->
                        <h4>v1.2 Upgrade</h4>
                        <p>스프링 프로젝트의 기본 구조 구성</p>
                        <ul class="margin-bottom-40">
                            <li>
                                기본 컨셉:
                                <ul>
                                    <li>
                                        타겟:
                                        <ul>
                                            <li>사이트: <code>여성 쇼핑몰</code></li>
                                            <li>사이트명: <code>UNIFY</code></li>
                                            <li>도메인: <code>unifyshop.</code>추후 무료 도메인</li>
                                            <li>고객 타겟: <code>모든 여성</code></li>
                                            <li>사이트 차별점: <code>명품 거래</code></li>
                                            <li>기타사항</li>
                                        </ul>
                                    </li>
                                    <li>무엇보다 습작으로 기본기를 다지는데 초점
                                    </li>
                                </ul>
                            </li>
                            <li>File Structures <code>Eclipse</code> legacy project(Spring MVC)와 동일하게
                            </li>
                            <li>예상 소요 시간: 측정 불가(습작이기 때문에)</li>
                            <li>사이트 구현시 걸림돌: </li>
                            <li>예상 비용: 무조건 무비용
                            </li>
                            <li>스프링 개발환경 설정
                            </li>
                            <li>테스트 클래스 구현
                            </li>

                        </ul>
                        <p><span class="label label-blue">Info</span> 자세한 내용은 <a href ="#scroll_main"> Main Structure </a> 섹션을 확인하십시오.</p>
                        <!-- End v1.2 Upgrade -->
                    </div>
                    <!-- End Update -->

                    <div class="margin-bottom-50"></div>

                    <!-- Others -->
                    <div id="scroll_others">
                        <h2>Others <span class="label label-dark">Update v1.6</span> <a href="#top">top <i
                                class="fa fa-angle-up"></i></a></h2>
                        <div class="margin-bottom-30"></div>
                        <hr>
                        <!-- Bootsrap  -->
                        <h3>Bootstrap</h3>
                        <p>버전 3.0부터 Bootstrap은 기본적으로 응답성이 뛰어난 디자인을 강조하면서 모바일 첫 디자인 철학을 채택했습니다.</p>
                        <h4>Bootstrap Translations</h4>
                        <p> 부트 스트랩에 대해 더 자세히 알고 싶으시면 아래 링크를 클릭하십시오.</p>
                        <ul>
                            <li><a target="_blank" href="http://holdirbootstrap.de/" hreflang="de">Bootstrap auf Deutsch
                                (German)</a></li>
                            <li><a target="_blank" href="http://www.hackerstribe.com/guide/IT-bootstrap-3.1.1/"
                                   hreflang="it">Bootstrap in Italiano (Italian)</a></li>
                            <li><a target="_blank" href="http://www.oneskyapp.com/docs/bootstrap/fr" hreflang="fr">Bootstrap
                                en Français (French)</a></li>
                            <li><a target="_blank" href="http://v3.bootcss.com/" hreflang="zh">Bootstrap 中文文档
                                (Chinese)</a></li>
                            <li><a target="_blank" href="http://bootstrapk.com/BS3/" hreflang="ko">Bootstrap 한국어
                                (Korean)</a></li>
                            <li><a target="_blank" href="http://www.oneskyapp.com/docs/bootstrap/ru" hreflang="ru">Bootstrap
                                по-русски (Russian)</a></li>
                            <li><a target="_blank" href="http://www.oneskyapp.com/docs/bootstrap/es" hreflang="es">Bootstrap
                                en Español (Spanish)</a></li>
                            <li><a target="_blank" href="http://twbs.site-konstruktor.com.ua" hreflang="uk">Bootstrap ua
                                Українською (Ukrainian)</a></li>
                        </ul>

                        <h4>Supported Browsers</h4>
                        <p>특히 부트 스트랩은 다음 브라우저와 플랫폼의 최신 버전을 지원합니다. Windows에서 부트 스트랩은 Internet Explorer 8-11을 지원합니다. 보다
                            구체적인 지원 정보는 아래에 제공됩니다.</p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <td></td>
                                    <th>Chrome</th>
                                    <th>Firefox</th>
                                    <th>Internet Explorer</th>
                                    <th>Opera</th>
                                    <th>Safari</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>Android</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-muted" rowspan="3" style="vertical-align: middle;">N/A</td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> <span
                                            class="sr-only">Not Supported</span></td>
                                    <td class="text-muted">N/A</td>
                                </tr>
                                <tr>
                                    <th>iOS</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-muted">N/A</td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> <span
                                            class="sr-only">Not Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                </tr>
                                <tr>
                                    <th>Mac OS X</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                </tr>
                                <tr>
                                    <th>Windows</th>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> <span
                                            class="sr-only">Supported</span></td>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> <span
                                            class="sr-only">Not Supported</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <p>공식적으로 지원되지는 않지만 비공식적으로 부트 스트랩은 Chromium 및 Linux 용 Chrome, Linux 용 Firefox 및 Internet Explorer
                            7에서 제대로 작동하고 올바르게 작동해야합니다. 부트 스트랩이 해결해야하는 일부 브라우저 버그 목록은 부트 스트랩 <a
                                    target="_blank" href="http://getbootstrap.com/browser-bugs/">을 참조하십시오.</a></p>
                        <h4>Internet Explorer 8 and 9</h4>
                        <p>Internet Explorer 8 및 9도 지원되지만 일부 CSS3 속성과 HTML5 요소는이 브라우저에서 완전히 지원되지 않습니다. 또한 Internet
                            Explorer 8에서는 미디어 쿼리 지원을 활성화하기 위해 <a target="_blank"
                                                                 href="https://github.com/scottjehl/Respond">Respond.js </a>
                            를 사용해야합니다.</p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th scope="col" class="col-xs-4">Feature</th>
                                    <th scope="col" class="col-xs-4">Internet Explorer 8</th>
                                    <th scope="col" class="col-xs-4">Internet Explorer 9</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"><code>border-radius</code></th>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> Not
                                        supported
                                    </td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Supported</td>
                                </tr>
                                <tr>
                                    <th scope="row"><code>box-shadow</code></th>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> Not
                                        supported
                                    </td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Supported</td>
                                </tr>
                                <tr>
                                    <th scope="row"><code>transform</code></th>
                                    <td class="text-danger"><span class="glyphicon glyphicon-remove"></span> Not
                                        supported
                                    </td>
                                    <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Supported,
                                        with <code>-ms</code> prefix
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><code>transition</code></th>
                                    <td colspan="2" class="text-danger"><span class="glyphicon glyphicon-remove"></span>
                                        Not supported
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><code>placeholder</code></th>
                                    <td colspan="2" class="text-danger"><span class="glyphicon glyphicon-remove"></span>
                                        Not supported
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <p>CSS3 및 HTML5 기능의 브라우저 지원에 대한 자세한 내용은 <a target="_blank" href="http://caniuse.com/">사용법</a>을
                            참조하십시오.</p>

                        <h4>Internet Explorer 8 and Respond.js</h4>
                        <p>Internet Explorer 8의 개발 환경 및 프로덕션 환경에서 Respond.js를 사용할 때는 다음주의 사항을주의하십시오.</p>
                        <h5><strong>Respond.js and cross-domain CSS</strong></h5>
                        <p>다른 하위 도메인 (예 : CDN)에서 호스팅되는 CSS와 함께 Respond.js를 사용하려면 몇 가지 추가 설정이 필요합니다. 자세한 내용은 <a
                                target="_blank"
                                href="https://github.com/scottjehl/Respond/blob/master/README.md#cdnx-domain-setup">See
                            the Respond.js docs </a>문서를 참조하십시오.</p>
                        <h5><strong>Respond.js and <code>file://</code></strong></h5>
                        <p>브라우저 보안 규칙으로 인해 Respond.js는 file : // 프로토콜을 통해 (로컬 HTML 파일을 열 때와 마찬가지로) 볼 수 있는 페이지에서는 작동하지
                            않습니다. IE8에서 반응 형 기능을 테스트하려면 HTTP (S)를 통해 페이지를보십시오. 자세한 내용은 <a target="_blank"
                                                                                          href="https://github.com/scottjehl/Respond/blob/master/README.md#support--caveats">See
                                the Respond.js docs </a>문서를 참조하십시오.</p>
                        <h5><strong>Respond.js and <code>@import</code></strong></h5>
                        <p>Respond.js는 @import를 통해 참조 된 CSS에서 작동하지 않습니다. 특히, 일부 드루팔 구성은 @import를 사용하는 것으로 알려져 있습니다. 자세한
                            내용은 <a target="_blank"
                                   href="https://github.com/scottjehl/Respond/blob/master/README.md#support--caveats">Respond.js
                                docs</a> 문서를 참조하십시오.</p>
                        <h4>Internet Explorer 8 and box-sizing</h4>
                        <p>IE8은 <code>box-sizing: border-box;</code>를 완전히 지원하지 않습니다. <code>min-width</code>,
                            <code>max-width</code>, <code>min-height</code>, 또는 <code>max-height</code>와 결합 된 경우 이러한 이유
                            때문에 v3.0.1부터 <code>max-width</code>에 <code>.container</code>를 더 이상 사용하지 않습니다.
                        </p>
                        <h4>Internet Explorer 8 and @font-face</h4>
                        <p>
                        <p>IE8은 <code>:before</code>와 결합 할 때 <code>@font-face</code> 에 몇 가지 문제가 있습니다. 부트 스트랩은 Glyphicon과
                            그 조합을 사용합니다. 페이지가 캐싱되어 마우스없이 창 위에로드 된 경우 (즉, 새로 고침 버튼을 누르거나 iframe에서 무언가를로드하면) 글꼴로드 전에 페이지가
                            렌더링됩니다. 페이지 (본체) 위로 마우스를 가져 가면 아이콘 중 일부가 표시되고 나머지 아이콘 위로 마우스를 올리면 해당 아이콘이 표시됩니다. 자세한 내용은 <a
                                    target="_blank" href="https://github.com/twbs/bootstrap/issues/13863">See issue
                                #13863</a></p></p>
                        <!-- End Bootsrap -->

                        <hr>

                        <!-- Sublime text editor  -->
                        <h3>IntelliJ IDE</h3>
                        <p>저는 코딩을 위해 "IntelliJ"를 사용합니다. IntelliJ 텍스트 편집기를 사용하시려면 여기를 클릭하십시오. <a
                                target="_blank" href="http://www.jetbrains.com ">click here "IntelliJ IDE"</a>
                            를 클릭하시면 더 자세한 정보를 얻을 수 있습니다.</p><br>
                        <!-- End Sublime text editor -->
                        <%--</div>--%>

                        <!-- Documentation -->
                        <%--<div id="scroll_end">--%>
                        <h2>End of Documentation <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p>다시 한번 제 포트폴리오를 지금까지 봐주셔서 감사합니다.</p>
                        <p>언제나 행복합시다 <i class="fa fa-heart color-red"></i> <strong> 김진국^^ </strong></p>
                    </div><!--/end-->
                    <!-- End of Documentation -->
                </div><!--/content-->

            </div><!--/row-->
        </div><!--/container-->
    </div>

    <!-- JS Global Compulsory -->
    <script type="text/javascript" src="/resources/docu/plugins/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/resources/docu/plugins/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/docu/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- JS Implementing Plugins -->
    <script type="text/javascript" src="/resources/docu/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="/resources/docu/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="/resources/docu/plugins/smoothScroll.js"></script>

    <script>
        $(function () {
            $('a[href*=#scroll_]:not([href=#scroll_])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });
    </script>

    <!-- 나중에 검토 -->
    <!--[if lt IE 9]>
    <script src="../resources/js/respond.js"></script>
    <![endif]-->
</div>
</body>
</html>