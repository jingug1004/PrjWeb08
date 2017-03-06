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
        <h1>UNIFY - Shopping Website by <a href="https://www.facebook.com/jingug1004">김진국</a></h1>
        <p>Documentation v1.9.4</p>

        <hr>

        <ul class="list-unstyled">
            <li><a href="#scroll_overview">Overview</a></li>
            <li><a href="#scroll_main">Main Structure</a></li>
            <li><a href="#scroll_misc">Misc Pages</a></li>
            <li><a href="#scroll_nav">Headers &amp; Footers</a></li>
            <li><a href="#scroll_theme">Theme Configuration</a></li>
            <li><a href="#scroll_css">CSS (Cascading Style Sheets)</a></li>
            <li><a href="#scroll_js">JavaScript Initialization</a></li>
            <li><a href="#scroll_fonts">Fonts</a></li>
            <li><a href="#scroll_credits">Credits</a></li>
            <li><a href="#scroll_changelog">Change Log</a></li>
            <li><a href="#scroll_upgrade">Upgrade</a></li>
            <li><a href="#scroll_others">Others</a></li>
            <li><a href="#scroll_end">End of Documentation</a></li>
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

                    <p>안녕하십니까, 먼저 Unify Template을 선택해 주셔서 감사드립니다! Unify가 귀하를 잘 대할 것이며 귀하의 기대에 부응 할 것을 진심으로 바랍니다. 연계과목,
                        기간, 개발언어, 플랫폼, 개발툴, 주요기술, 목적, 내용..</p>

                    <br>

                    <p>UNIFY 템플릿의 탐색하기 쉽고 사용하기 쉬운 레이아웃과 개발자 친화적 인 코드를 사용하여 즐겁게 보내시기 바랍니다.
                        또한 많은 리소스가 사용되었으며 많은 고객들이 구매에 만족할 수 있도록 다양한 옵션이 추가되었습니다.</p>

                    <br>

                    <h4>Updates</h4>

                    <p>웹 디자인 트렌드의 급변하는 발전 추세에 발 맞춰 항상 새로운 업데이트를 지속적으로 출시하려고 노력하고 있습니다.
                        각 업데이트의 목표는 고객에게 깊은 인상을 남기고 얼굴에 거대한 미소를 짓는 것입니다.</p>

                    <p>UNIFY를 구매하면 평생 무료로 업데이트를 다운로드 할 자격이 주어집니다. <strong>FREE!</strong></p>

                    <p>그러나 다른 한편으로는 라이센스 업그레이드가 불가능하다는 사실을 알려드립니다. 라이센스를 업그레이드하려면 새로운 구매가 이루어져야합니다.</p>

                    <p>현재 업데이트 된 버전은 v1.9 +로 고정 버그, 다양한 새로운 테마 데모 및 새로운 디자인 등 여러 가지 개선 사항을 제공합니다.
                        UNIFY는 다음 업데이트에서 더 많은 새로운 놀라운 기능이 곧 출시 될 예정이어서 거기에서 멈추지 않습니다.
                        항상 UNIFY 템플릿을 사용하고 성공의 중요한 부분을 담당해 주셔서 감사합니다.</p><br>

                    <h4>Support</h4>

                    <p>우리는 UNIFY가 지원이 성공적인 제품의 중요한 측면이라고 믿습니다. 따라서 우리는 가장 우수한 지원을 제공하기 위해 최선을 다하며
                        항상 우리의 소중한 고객을 돕기 위해 무엇이든 시도합니다. 우리의 지원은 완전한 사용자 정의 작업이 아닌 한 프론트 엔드 관련
                        문제 이외에 발생할 수있는 모든 설계 문제를 주로 다루고 있음을 알아 두십시오.</p>

                    <p> "요즘 업계 최고의 기술인 XX 를 도입해서 YY 를 구현하였는데 그것이 아주 성공적이어서 유저들에게 ZZ 한 반응과 함께 $$ 의 매출을..." => 이것도 좀.
                        말하는 게 우선 너무 매니저스러움.

                        개발자스러운 답변은
                        "아실지 모르겠지만 XX 라는 기술이 있는데 저희가 풀어야 했던 문제는 YY 였으므로 ZZ 방식으로 구현 시도를 했습니다. 그러면서 배운 거라면 AA 는
                        이런 면이 좋아서 어느 정도 좋은 결과였던 것 같고 BB 는 이러이러한 문제가 있어서 저러저러하게 대처를 하였음" => 이상적인 답변.
                        여러 각도로 문제를 바라볼 수 있으며 객관적으로 좋은 점 나쁜 점을 나열 할 수 있고, 나쁜 점은 어떻게 극복하였는지도 디테일 말할 수 있음 플러스.</p>

                    <pre> 자가 Development Environment(Server * Client, H/W * S/W)
                        Processor : Intel Core™ i5
                        RAM : 4GB
                        TCP/IP Network : LocalHost
                        Web Programming Language : Java 8(JDK1.8), JSP
                        Markup Language : HTML5, CSS
                        Scripting Language : JavaScript, JQuery, ajax
                        Structured Query Language : MariaDB
                        Framework : Spring MVC, Maven, MyBatis
                        OS : MAC OSX 10.12.3
                        IDE : IntelliJ, SublimeText3
                        Server : Apache Tomcat 8.0.0.M17 WAS
                        VCS : GitHub
                        Client GUI Tool : Sequel Pro
                        Test Browser : Chrome, Safari
                        CI : Jenkins
                        WS : AWS
                    </pre>

                    <pre> 학원 Development Environment(Server * Client, H/W * S/W)
                        Processor : Intel Core™ i7
                        RAM : 16GB
                        TCP/IP Network : LocalHost(Identical port, Port forwarding)
                        OS : MS Window 7
                        IDE : IntelliJ, Eclipse Neon, EditPlus
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
                        <li>Author: <a target="_blank" href="http://htmlstream.com">김진국</a></li>
                        <li>Contact:
                            <a href="mailto:jingug1004@naver.com">jingug1004@naver.com</a>
                            <span>|</span>
                            <a target="_blank" href="https://twitter.com/jingug1004">Twitter</a>
                            <span>|</span>
                            <a target="_blank" href="https://www.facebook.com/jingug1004?ref=hl">Facebook</a>
                        </li>
                        <li>Created on: 2013/02/05</li>
                        <li>Latest Update on: 2017/03/10</li>
                    </ul>
                </div><!--/overview-->

                <div id="scroll_main" class="margin-bottom-70">
                    <h2>Main Structure <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <h3> Files Structure <span class="label label-dark">Updated v1.9.2</span></h3>
                    <p>UNIFY comes with <strong>6 complete independent packages</strong>. In your download package,
                        inside the HTML fodler you will find main <code>UNIFY Main (Default)</code> template and assets
                        files, <code>E-commerce (Shop UI)</code> , <code>Blog &amp; Template</code>, <code>One
                            Pages</code>, <code>Landing Pages</code>, and <code>Email Templates</code> packages. It also
                        includes with PSD files. Please check <strong>README.txt</strong> file in the PSD folder to
                        download the full version of available PSD files. The <strong>README.txt</strong> file includes
                        the download link and password.</p><br>
                    <h4><i class="fa fa-folder fa-2x color-blue"></i> DOWNLOAD PACKAGE</h4>
                    <ul class="list-unstyled css-files">
                        <li>----<i class="fa fa-folder"></i> <span>Documentation</span></li>
                        <li>----<i class="fa fa-folder"></i> <span>PSD</span></li>
                        <li>----<i class="fa fa-folder"></i> <span>HTML</span>
                            <ul class="list-unstyled css-files css-v1">
                                <li>----<i class="fa fa-folder"></i> <span>assets</span></li>
                                <li>----<i class="fa fa-folder"></i> <span>E-Commerce</span></li>
                                <li>----<i class="fa fa-folder"></i> <span>Blog-Magazine</span></li>
                                <li>----<i class="fa fa-folder"></i>
                                    <span>One-Pages</span>
                                    <ul class="list-unstyled css-files css-v1">
                                        <li>----<i class="fa fa-folder"></i> <span>assets</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Classic</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Agency</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>App</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Architecture</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Business</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Lawyer</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Shipping</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Spa</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Travel</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Wedding</span></li>
                                        <li>----<i class="fa fa-folder"></i> <span>Courses</span></li>
                                        <li>---- &nbsp;<code>..</code></li>
                                        <li>---- &nbsp;<code>..</code></li>
                                    </ul>

                                </li>
                                <li>----<i class="fa fa-folder"></i> <span>Landing-Pages</span></li>
                                <li>----<i class="fa fa-folder"></i> <span>Email-Templates</span></li>
                                <li>---- &nbsp;<code>index.html</code></li>
                                <li>---- &nbsp;<code>..</code></li>
                                <li>---- &nbsp;<code>..</code></li>
                            </ul>
                        </li>
                    </ul>

                    <br>

                    <p>Home pages in UNIFY Template consist of <code>header</code>, <code>slider</code>, <code>content
                        part</code>, <code>footer</code> and <code>copyright</code> parts. However, inner pages include
                        <code>breadcrumbs</code> instead of <code>slider</code>.</p>

                    <div class="block-center margin-bottom-30">
                        <img class="img-responsive" src="/resources/docu/img/unify.png" alt=""/>
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
    &lt;title&gt;UNIFY - Responsive Website Template&lt;/title&gt;

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
                        주로 헤더, 슬라이더, 빵 부스러기, 내용 부분 등으로 구성됩니다.</p>
                    <pre class="line-numbers"><code class="language-php">&lt;div class=&quot;wrapper&quot;&gt;
    ...
    ...
&lt;/div&gt;</code></pre>
                    <p><span class="label label-blue">Note</span>아래 코드는 래퍼 내용 내에 중첩되어 있습니다.
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

                <div id="scroll_misc" class="margin-bottom-60">
                    <h2>Misc Pages <span class="label label-dark">Updated v1.9.1</span></h2>
                    <hr>
                    <p>기타 페이지는 의도적으로 페이지의 주요 부분만으로 만들어 졌으므로 개발자가 직접 내용을 직접 추가 할 수 있습니다.
                        다음 페이지를 사용하여 새 프로젝트를 시작하십시오.</p>
                    <ol>
                        <li><code>page_misc_blank.html</code>&nbsp;&nbsp; 이미 연결된 모든 주요 구성 요소가있는 빈 페이지가 비어 있습니다.
                        </li>
                        <li><code>page_misc_boxed.html</code>&nbsp;&nbsp; 통합 서식 파일의 박스형 레이아웃</li>
                        <li><code>page_misc_boxed_img.html</code>&nbsp;&nbsp; 통합 서식 파일의 박스형 레이아웃</li>
                        <li><code>page_misc_boxed_fixed_header.html</code>&nbsp;&nbsp; 템플릿의 박스형 레이아웃의 고정 헤더
                        </li>
                        <li><code>page_misc_fixed_header.html</code>&nbsp;&nbsp; 통합 템플릿의 고정 헤더</li>
                        <li><code>page_misc_dark.html</code>&nbsp;&nbsp; Unify 템플릿의 어두운 버전
                        </li>
                        <li><code>page_misc_dark_boxed.html</code>&nbsp;&nbsp; 통일 템플릿의 박스형 레이아웃의 어두운 버전
                        </li>
                        <li><code>page_misc_dark_other_color.html</code>&nbsp;&nbsp; Unify Template의 다른 테마 색이있는 어두운 버전
                        </li>
                        <li><code>page_misc_sticky_footer.html.html</code>&nbsp;&nbsp; 저작권 섹션이있는 끈적한 바닥 글
                        </li>
                    </ol>
                </div>

                <!-- Header and Footer -->
                <div id="scroll_nav" class="margin-bottom-70">
                    <h2>Headers &amp; Footers <span class="label label-dark">Updated v1.9</span><a href="#top">top <i
                            class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <p class="lead">통합 템플릿에는 8 개의 머리글 및 바닥 글 대안이 포함되어 있습니다.</p>

                    <h3 id="scroll_headerDemos">Headers <span class="label label-dark">Updated v1.9</span></h3>

                    <h4>머리글을 상단에 고정 시키십시오.</h4>
                    <p>Where <code>x</code>&nbsp; =&nbsp;<code> v1, v2, v3, v5, v6</code> or nothing for the default
                        header. Any header option can be used as fixed (sticky) header except for <code>v4</code> and
                        <code>v7</code>. 다른 메모에서 머리글 한 페이지는 한 <code>One Page</code> 서식 파일 용으로 만 설계되었으며
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

                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--<h4 class="panel-title">--%>
                        <%--<a data-toggle="collapse" data-parent="#accordion-header" href="#header">--%>
                        <%--Header "Default"--%>
                        <%--</a>--%>
                        <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="header" class="panel-collapse collapse">--%>
                        <%--<div class="panel-body">--%>
                        <%--<div class="block-center"><img--%>
                        <%--class="img-responsive header-img-bordered padding-top-10"--%>
                        <%--src="/resources/docu/img/header-default.jpg" alt="Default Header"></div>--%>
                        <%--<div class="clearfix margin-bottom-40"></div>--%>

                        <%--<pre class="line-numbers"><code class="language-php">&lt;!--=== Header ===--&gt;--%>
                        <%--&lt;div class="header"&gt;--%>
                        <%--&lt;div class="container"&gt;--%>
                        <%--&lt;!-- Logo --&gt;--%>
                        <%--&lt;a class="logo" href="index.html"&gt;--%>
                        <%--&lt;img src="assets/img/logo1-default.png" alt="Logo"&gt;--%>
                        <%--&lt;/a&gt;--%>
                        <%--&lt;!--  End Logo --&gt;--%>

                        <%--&lt;!-- Topbar --&gt;--%>
                        <%--&lt;div class="topbar"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--  End Topbar --&gt;--%>

                        <%--&lt;!-- Toggle get grouped for better mobile display --&gt;--%>
                        <%--&lt;button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/button&gt;&lt;!-- /end container --&gt;--%>
                        <%--&lt;!--  End Toggle --&gt;--%>
                        <%--&lt;/div&gt;--%>

                        <%--&lt;!-- Collect the nav links, forms, and other content for toggling --&gt;--%>
                        <%--&lt;div class="collapse navbar-collapse mega-menu navbar-responsive-collapse"&gt;--%>
                        <%--...--%>
                        <%--...--%>
                        <%--&lt;/div&gt;&lt;!-- /navbar-collapse --&gt;--%>
                        <%--&lt;/div&gt;--%>
                        <%--&lt;!--=== End Header ===--&gt;</code></pre>--%>
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
                        <%--<small><code>feature_header_Default.html</code></small>--%>
                        <%--</p>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>

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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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
                                                                   src="/resources/docu/img/footer_default.jpg"
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

                                    <p><span class="label label-info">Info</span> Example Page:
                                        <small><code>feature_footer_default.htm.html</code></small>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <%--<p><span class="label label-info">Info</span> Example Page:--%>
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

                        <p>Unify Template에는 미리 정의 된 12 가지 테마 색상이 있습니다. 모든 테마 CSS 파일은
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
                            등. <strong>your_theme.css</strong>대신입니다.
                        <p>
                        <pre class="line-numbers"><code class="language-markup">&lt;head&gt;
    &lt;title&gt;Unify - Responsive Website Template&lt;/title&gt;

    &lt;!-- CSS Theme --&gt;
    <span class="tag-cover">&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/default.css&quot; /&gt;</span>
&lt;/head&gt;</code></pre>

                        <p class="theme-info"><span class="label label-info">Info</span><strong>default
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
                        <p>Here are two easy steps to implement the Dark Theme:</p>
                        <p>1. Link <code>dark.css</code> inside <code>&lt;head&gt;</code> section.</p>
                        <p>2. Add a <code>.dark</code> class to <code>&lt;body&gt;</code> tag.</p>
                        <pre class="line-numbers"><code class="language-php">&lt;head&gt;
    &lt;title&gt;Unify - Responsive Website Template&lt;/title&gt;

    &lt;!-- CSS Theme --&gt;
    <span class="tag-cover">&lt;link rel=&quot;stylesheet&quot; href=&quot;assets/css/theme-colors/dark.css&quot;&gt;</span>
&lt;/head&gt;


&lt;body class=&quot;dark&quot;&gt;
    ....
    ....
&lt;/body&gt;</code></pre>
                        <p><span class="label label-info">Info</span> Example Page: <code>page_misc_dark.html</code></p>
                    </div>


                    <div class="clearfix margin-bottom-60"></div>

                    <h3>Boxed Layout <span class="label label-dark">Added v1.9.1</span></h3>
                    <p>박스형 레이아웃을 적용하려면 클래스 <code>boxed-layout</code>과 클래스
                        <code>container</code>를 <code>&lt;body&gt;</code> 태그에 추가하면됩니다.</p>

                    <pre class="line-numbers"><code class="language-php">&lt;body class=&quot;boxed-layout container&quot;&gt;
    ....
    ....
&lt;/body&gt;</code></pre>
                    <p><span class="label label-info">Info</span> 예제 페이지 : <code>page_misc_boxed.html</code></p>
                </div>
                <!-- End Theme Configuration -->

                <div class="clearfix margin-bottom-60"></div>

                <!-- CSS Classes -->
                <div id="scroll_css" class="margin-bottom-40">
                    <h2>CSS (Cascading Style Sheets) <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                    <hr>
                    <h3>CSS Files Structure</h3>
                    <p>Unify Template은 소규모 프로젝트부터 대규모 기업 프로젝트에 이르기까지 템플릿을 체계적으로 구성하여 사용하기 쉽도록 여러 CSS 파일을 사용합니다. 모든
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
                            현재 Unify에는 Unify Template의 어두운 버전 인 테마 스킨이 하나만 있습니다.
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
                                        배치되는 경우 요소 사이에 충분한 간격이 없기 때문에 서로 붙어있게됩니다. 그래서 다음과 같은 수업이 매우 유용 할 것입니다.</p>
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
                                        요소 사이에 충분한 간격이 없기 때문에 서로 붙어있게됩니다. 그래서 다음과 같은 수업이 매우 유용 할 것입니다.</p>
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
                                        <p>Font Awesome은 크기, 색상, 그림자 및 기타 CSS 기능을 사용하여 수행 할 수있는 모든 작업을 즉시 사용자 지정할 수있는 확장
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
                                        <p>Sliding Horizontal Parallax moves multiple elements at the same time but at
                                            different speeds to create a parallax effect — the appearance of 3D
                                            movement.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/parallax-slider/css/parallax-slider.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;tscript src="assets/plugins/parallax-slider/js/modernizr.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/parallax-slider/js/jquery.cslider.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/parallax-slider.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line: <code>ParallaxSlider.initParallaxSlider();</code>
                                            to the jQuery function at the bottom of the HTML page:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">index.html</span>
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
                                        <p>LayerSlider is a premium multi-purpose slider for creating image galleries,
                                            content sliders, and mind-blowing slide-shows with must-see effects. It uses
                                            cutting edge technologies to provide the smoothest experience possible, and
                                            it comes with more than 200 preset 2D and 3D slide transitions.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/layer-slider/layerslider/css/layerslider.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&ltscript src="assets/plugins/layer-slider/layerslider/js/greensock.js"&gt&lt/script&gt
&lt;script src="assets/plugins/layer-slider/layerslider/js/layerslider.transitions.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/layer-slider/layerslider/js/layerslider.kreaturamedia.jquery.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/layer-slider.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line: <code>LayerSlider.initLayerSlider();</code>
                                            to the jQuery function at the bottom of the HTML page:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">page_home1.html</span>
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
                                        <p>Masonry is a JavaScript grid layout library. It works by placing elements in
                                            optimal position based on available vertical space, sort of like a mason
                                            fitting stones in a wall. You’ve probably seen it in use all over the
                                            Internet.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/css/pages/blog_masonry_3col.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/masonry/jquery.masonry.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/js/pages/blog-masonry.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/pages/blog-masonry.js"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://masonry.desandro.com/">http://masonry.desandro.com//</a>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Demo</h4>
                                        <span class="color-green">blog_masonry_3col.html</span>
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
                                        <p>Touch enabled jQuery plugin that lets you create beautiful responsive
                                            carousel slider.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/owl-carousel.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line: <code>OwlCarousel.initOwlCarousel();</code>
                                            to the jQuery function at the bottom of the HTML page:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">shortcode_carousels.html</span>
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
                                        <p>Slider Revolution is a fully developed slide displaying system offering the
                                            capability to show images, videos and captions paired with simple, modern
                                            and fancy 3D transitions. This plugin features tons of unique transition
                                            effects, an image preloader, video embedding, autoplay that stops on user
                                            interaction and lots of easy to set options to create your own effects. All
                                            customization can be handled via jQuery Options, HTML 5 data-attributes and
                                            CSS!</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/revolution-sliderrs-plugin/css/tools.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.plugins.min.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/revolution-sliderrs-plugin/js/jquery.themepunch.revolution.min.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/plugins/revolution-slider.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line: <code>RevolutionSlider.initRSfullScreenOffset();</code>
                                            to the jQuery function at the bottom of the HTML page:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">page_home9.html</span>
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
                                        <p>Sky Forms Pro is a set of beautiful form elements with large amount of
                                            javascript features: validation, masking, modals, ajax submit, datepickers.
                                            It allows you to create forms of any complexity and for any needs: login,
                                            registration, contacts, review, order, comment, checkout, etc.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/plugins/sky-forms-pro/sky-forms/css/sky-forms.css"&gt;
&lt;link rel="stylesheet" href="assets/plugins/sky-forms-pro/sky-forms/custom/custom-sky-forms.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
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

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;!-- For Masking --&gt;
&lt;script src="assets/js/plugins/masking.js"&gt;&lt;/script&gt;
&lt;!-- For Datepicker --&gt;
&lt;script src="assets/js/plugins/datepicker.js"&gt;&lt;/script&gt;
&lt;!-- For Validation --&gt;
&lt;script src="assets/js/plugins/validation.js"&gt;&lt;/script&gt;
                                </code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line to the jQuery function at
                                            the bottom of the HTML page: <code>Masking.initMasking();</code> for
                                            masking, <code>Datepicker.initDatepicker();</code> for datepicker, or <code>Validation.initValidation();</code>
                                            for validation.</p>

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

                                        <h4>Demo</h4>
                                        <span class="color-green">shortcode_form_general1.html</span>
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
                                        <p>A jQuery plugin that sets a div or span to show a countdown to a given
                                            time.</p>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&lt;link rel="stylesheet" href="assets/css/pages/page_coming_soon.css"&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/plugins/countdown/jquery.plugin.js"&gt;&lt;/script&gt;
&lt;script src="assets/plugins/countdown/jquery.countdown.js"&gt;&lt;/script&gt;</code></pre>
                                        <br>

                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="assets/js/pages/page_coming_soon.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>
                                        <h4>Initialization</h4>
                                        <p>To initialize the plugin, add the following line: <code>PageComingSoon.initPageComingSoon();</code>
                                            to the jQuery function at the bottom of the HTML page:</p>
                                        <pre class="line-numbers"><code class="language-javascript">
                                    <script>
jQuery(document).ready(function () {
    PageComingSoon.initPageComingSoon();
});
</script>
                                </code></pre>
                                        <div class="margin-bottom-20"></div>

                                        <h4>Set countdown</h4>
                                        <p>To change the date and time of the countdown:</p>
                                        <p>1. Navigate to <code>HTML/resources/js/pages/page_coming_soon.js</code></p>
                                        <p>2. Replace the whole function with the following function:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">page_coming_soon.html</span>
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
                                        <p> A simple jQuery plugin that allows you to add a dynamically-resized,
                                            slideshow-capable background image to any page or element.</p>
                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-php">No CSS required</code></pre>
                                        <br>
                                        <p><span class="label label-red">Note</span> The image is set using JS, please
                                            refer to the official documentation for more information.</p>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script src="plugins/bootstrap/js/bootstrap.min.js"&gt;&lt;/script&gt;</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Official Documentation</h4>
                                        <a target="_blank" href="http://srobbin.com/jquery-plugins/backstretch/">http://srobbin.com/jquery-plugins/backstretch/</a>

                                        <div class="margin-bottom-20"></div>

                                        <h4>Demo</h4>
                                        <span class="color-green">page_coming_soon.html</span>
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
                                        <p>jVectorMap uses only native browser technologies like JavaScript, CSS, HTML,
                                            SVG or VML. No Flash or any other proprietary browser plug-in is required.
                                            This allows jVectorMap to work in all modern mobile browsers.</p>
                                        <ul>
                                            <li>Works in all modern browsers (including IE6-8)</li>
                                            <li>Looks great on any resolution because of its vector nature</li>
                                            <li>Many maps are available</li>
                                            <li>Custom maps could be created using converter</li>
                                        </ul>

                                        <h4>CSS Installation</h4>
                                        <pre><code class="language-markup">&ltlink rel="stylesheet" href="assets/plugins/vector-map/custom_jquery-jvectormap.css"&gt</code></pre>

                                        <div class="margin-bottom-20"></div>

                                        <h4>JavaScript Installation</h4>
                                        <p>Under <code>&lt;!-- JS Page Level --&gt;</code></p>
                                        <pre class="line-numbers"><code class="language-markup">&lt;script rel="stylesheet" href="assets/js/plugins/vector-map.js"&gt;&lt;/script&gt; </code></pre>
                                        <br>
                                        <p>Depending on which map style needed, one of the following js installations
                                            will be required to place</p>
                                        <p>Under <code>&lt;!-- JS Implementing Plugins --&gt;</code></p>
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
                                        <p>To initialize the plugin, add the following lines: <code>VectorMap.initVectorMap();</code>
                                            and <code>VectorMap.initMarkerVectorMap();</code> to the jQuery function at
                                            the bottom of the HTML page:</p>
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

                                        <h4>Demo</h4>
                                        <span class="color-green">shortcode_maps_vector.html</span>
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
                        <p>Unify Template uses Open Sans font for headings and some elements from Google Web Fonts. You
                            are able to choose from more than 600+ fonts from <a target="_blank"
                                                                                 href="https://www.google.com/fonts">Google
                                Web Fonts</a>. The font is linked in all HTML files at the <code>&lt;head&gt;</code>
                            section.</p>
                        <pre class="line-numbers"><code class="language-php">&lt;!-- Web Fonts --&gt;
&lt;link rel=&quot;shortcut&quot; type=&quot;text/css&quot; href=&quot;//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin&quot;&gt;</code></pre>
                        <br>

                        <p><span class="label label-red">Note</span> Always remember to specify the font you choose in
                            your <strong>CSS</strong>.</p><br>

                        <pre class="line-numbers"><code class="language-css">
.example {
    font-family: "Open Sans", Arial, sans-serif;
}
            </code></pre>
                        <p><span class="label label-green">Example</span> The specification for Open Sans font family in
                            CSS.</p>
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
                        <p>All plugins are located in <code>assets/plugins/..</code></p>
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
                                <td class="hidden-sm">Bootstrap is the most popular HTML, CSS, and JS framework for
                                    developing responsive, mobile first projects on the web.
                                </td>
                                <td><a target="_blank" href="http://getbootstrap.com">http://getbootstrap.com</a></td>
                            </tr>
                            <tr>
                                <td>jQuery</td>
                                <td class="hidden-sm">jQuery is a fast, small, and feature-rich JavaScript library. It
                                    makes things like HTML document traversal and manipulation, event handling,
                                    animation, and Ajax much simpler with an easy-to-use API that works across a
                                    multitude of browsers. With a combination of versatility and extensibility, jQuery
                                    has changed the way that millions of people write JavaScript.
                                </td>
                                <td><a target="_blank" href="http://jquery.com">http://jquery.com</a></td>
                            </tr>
                            <tr>
                                <td>Font Awesome</td>
                                <td class="hidden-sm">Font Awesome The iconic font designed for Bootstrap</td>
                                <td><a target="_blank" href="http://fortawesome.github.io/Font-Awesome">http://fortawesome.github.io/Font-Awesome</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Line Icons</td>
                                <td class="hidden-sm">All 160 simple line icons are now embedded in a webfont for more
                                    convenient use on the web or in a native application. Big thanks to Jamal Jama for
                                    creating this awesome webfont.
                                </td>
                                <td><a target="_blank" href="http://graphicburger.com/simple-line-icons-webfont">http://graphicburger.com/simple-line-icons-webfont</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Parallax Slider</td>
                                <td class="hidden-sm">A simple parallax content slider with different animations for
                                    each slider element and a background parallax effect.
                                </td>
                                <td><a target="_blank"
                                       href="http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery">http://tympanus.net/codrops/2012/03/15/parallax-content-slider-with-css3-and-jquery</a>
                                </td>
                            </tr>
                            <tr>
                                <td>OWL Carousel</td>
                                <td class="hidden-sm">Touch enabled jQuery plugin that lets you create beautiful
                                    responsive carousel slider.
                                </td>
                                <td><a target="_blank" href="http://owlgraphic.com/owlcarousel">http://owlgraphic.com/owlcarousel</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Backstretch</td>
                                <td class="hidden-sm">A simple jQuery plugin that allows you to add a
                                    dynamically-resized, slideshow-capable background image to any page or element.
                                </td>
                                <td><a target="_blank" href="http://srobbin.com/jquery-plugins/backstretch">http://srobbin.com/jquery-plugins/backstretch</a>
                                </td>
                            </tr>
                            <tr>
                                <td>MIXITUP</td>
                                <td class="hidden-sm">A CSS3 and JQuery Filter &amp; Sort Plugin (Version: 1.5.4)</td>
                                <td><a target="_blank" href="https://mixitup-old.kunkalabs.com">https://mixitup-old.kunkalabs.com</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Counter-Up</td>
                                <td class="hidden-sm">Counter-Up is a jQuery plugin that animates a number from zero
                                    (counting up towards it).
                                </td>
                                <td><a target="_blank" href="https://github.com/bfintal/Counter-Up">https://github.com/bfintal/Counter-Up</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pace.js</td>
                                <td class="hidden-sm">A beautiful progress indicator for your page load and ajax
                                    navigation.
                                </td>
                                <td><a target="_blank" href="http://github.hubspot.com/pace/docs/welcome">http://github.hubspot.com/pace/docs/welcome</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Circles (Master)</td>
                                <td class="hidden-sm">Lightwheight JavaScript library that generates circular graphs in
                                    SVG. Now with animation.
                                </td>
                                <td><a target="_blank" href="https://github.com/lugolabs/circles">https://github.com/lugolabs/circles</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Respond.js</td>
                                <td class="hidden-sm">A fast &amp; lightweight polyfill for min/max-width CSS3 Media
                                    Queries (for IE 6-8, and more).
                                </td>
                                <td><a target="_blank" href="https://github.com/scottjehl/Respond">https://github.com/scottjehl/Respond</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ladda Buttons</td>
                                <td class="hidden-sm">A UI concept which merges loading indicators into the action that
                                    invoked them. Primarily intended for use with forms where it gives users immediate
                                    feedback upon submit rather than leaving them wondering while the browser does its
                                    thing.
                                </td>
                                <td><a target="_blank" href="https://github.com/scottjehl/Respond">https://github.com/scottjehl/Respond</a>
                                </td>
                            </tr>
                            <tr>
                                <td>HTML5 Shiv</td>
                                <td class="hidden-sm">The HTML5 Shiv enables use of HTML5 sectioning elements in legacy
                                    Internet Explorer and provides basic HTML5 styling for Internet Explorer 6-9, Safari
                                    4.x (and iPhone 3.x), and Firefox 3.x.
                                </td>
                                <td><a target="_blank" href="https://github.com/aFarkas/html5shiv">https://github.com/aFarkas/html5shiv</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Countdown</td>
                                <td class="hidden-sm">jQuery Countdown Plugin</td>
                                <td><a target="_blank" href="http://keith-wood.name/countdown.html">http://keith-wood.name/countdown.html</a>
                                </td>
                            </tr>
                            <tr>
                                <td>GMaps</td>
                                <td class="hidden-sm">gmaps.js allows you to use the potential of Google Maps in a
                                    simple way. No more extensive documentation or large amount of code
                                </td>
                                <td><a target="_blank"
                                       href="http://hpneo.github.io/gmaps">http://hpneo.github.io/gmaps</a></td>
                            </tr>
                            <tr>
                                <td>Brand Buttons</td>
                                <td class="hidden-sm">CSS buttons plugin</td>
                                <td><a target="_blank" href="https://github.com/theaqua/bootstrap-brand-buttons">https://github.com/theaqua/bootstrap-brand-buttons</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Hover Effects</td>
                                <td class="hidden-sm">A collection of CSS3 powered hover effects to be applied to links,
                                    buttons, logos, SVG, featured images and so on. Easily apply to your own elements,
                                    modify or just use for inspiration. Available in CSS, Sass, and LESS.
                                </td>
                                <td><a target="_blank" href="http://ianlunn.github.io/Hover/">http://ianlunn.github.io/Hover/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Login/Sign up Modal Window</td>
                                <td class="hidden-sm">This modal window allows users to login/signup into your website.
                                    Once opened, the user can easily switch from one form to the other, or select the
                                    reset password option.
                                </td>
                                <td><a target="_blank" href="https://codyhouse.co/gem/loginsignup-modal-window/">https://codyhouse.co/gem/loginsignup-modal-window/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Masonry</td>
                                <td class="hidden-sm">Masonry is a JavaScript grid layout library. It works by placing
                                    elements in optimal position based on available vertical space, sort of like a mason
                                    fitting stones in a wall. You’ve probably seen it in use all over the Internet.
                                </td>
                                <td><a target="_blank"
                                       href="http://masonry.desandro.com/">http://masonry.desandro.com/</a></td>
                            </tr>
                            <tr>
                                <td>Vector Maps</td>
                                <td class="hidden-sm">Many maps of the world, world regions, countries and cities are
                                    available for download from this site. All of them are made from the data in public
                                    domain or data licensed under the free licenses, so you can use them for any purpose
                                    free of charge.
                                </td>
                                <td><a target="_blank" href="http://jvectormap.com/">http://jvectormap.com/</a></td>
                            </tr>
                            <tr>
                                <td>WOW Animation</td>
                                <td class="hidden-sm">Reveal CSS animation as you scroll down a page. By default, you
                                    can use it to trigger animate.css animations. But you can easily change the settings
                                    to your favorite animation library.
                                </td>
                                <td><a target="_blank" href="http://mynameismatthieu.com/WOW/">http://mynameismatthieu.com/WOW/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Animate.css</td>
                                <td class="hidden-sm">CSS animation plugin</td>
                                <td><a target="_blank" href="https://daneden.github.io/animate.css/">https://daneden.github.io/animate.css/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Modernizr</td>
                                <td class="hidden-sm">It’s a collection of superfast tests – or “detects” as we like to
                                    call them – which run as your web page loads, then you can use the results to tailor
                                    the experience to the user.
                                </td>
                                <td><a target="_blank" href="https://modernizr.com/">https://modernizr.com/</a></td>
                            </tr>
                            <tr>
                                <td>Smooth Scroll</td>
                                <td class="hidden-sm">Allows for easy implementation of smooth scrolling for same-page
                                    links.
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
                                <td class="hidden-sm">Master Slider is a premium image and content slider with super
                                    smooth hardware accelerated transitions. It supports touch navigation with pure
                                    swipe gesture that you have never experienced before. It’s a truly responsive and
                                    device friendly slider which works perfect in all major devices. Master Slider is an
                                    awesome layer slider as well, with the ability of adding any html contents (texts,
                                    images, …) in layers. It is easy to use, plus there are 25+ ready to use templates
                                    available for you. You almost have everything in Master slider which is the most
                                    complete among the best, hotspots, thumbnails, variety of effects, Video support and
                                    much more.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/master-slider-jquery-touch-swipe-slider/6337671?ref=htmlstream">http://codecanyon.net/item/master-slider-jquery-touch-swipe-slider/6337671</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Revolution Slider</td>
                                <td class="hidden-sm">Slider Revolution is a fully developed slide displaying system
                                    offering the capability to show images, videos and captions paired with simple,
                                    modern and fancy 3D transitions. This plugin features tons of unique transition
                                    effects, an image preloader, video embedding, autoplay that stops on user
                                    interaction and lots of easy to set options to create your own effects. All
                                    customization can be handled via jQuery Options, HTML 5 data-attributes and CSS!
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/slider-revolution-responsive-jquery-plugin/2580848?ref=htmlstream">http://codecanyon.net/item/slider-revolution-responsive-jquery-plugin/2580848</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Layer Slider</td>
                                <td class="hidden-sm">LayerSlider is a premium multi-purpose slider for creating image
                                    galleries, content sliders, and mind-blowing slideshows with must-see effects. It
                                    uses cutting edge technologies to provide the smoothest experience that’s possible,
                                    and it comes with more than 200 preset 2D and 3D slide transitions.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/layerslider-responsive-jquery-slider-plugin/922100?ref=htmlstream">http://codecanyon.net/item/layerslider-responsive-jquery-slider-plugin/922100</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Cube Portfolio</td>
                                <td class="hidden-sm">Cube Portfolio is a powerful jQuery plugin that provides beautiful
                                    animated filtering, custom captions and it’s perfect for portfolios, galleries, team
                                    members, blog posts or any other ordered content.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/cube-portfolio-responsive-jquery-grid-plugin/6372959?ref=htmlstream">http://codecanyon.net/item/cube-portfolio-responsive-jquery-grid-plugin/6372959</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Sky Forms Pro</td>
                                <td class="hidden-sm">Sky Forms Pro is a set of beautiful form elements with large
                                    amount of javascript features: validation, masking, modals, ajax submit,
                                    datepickers. It allows you to create forms of any complexity and for any needs:
                                    login, registration, contacts, review, order, comment, checkout, etc.
                                </td>
                                <td><a target="_blank"
                                       href="http://codecanyon.net/item/sky-forms-pro/5414510?ref=htmlstream">http://codecanyon.net/item/sky-forms-pro/5414510</a>
                                </td>
                            </tr>
                            <tr>
                                <td>FancyBox</td>
                                <td class="hidden-sm">FancyBox is a tool that offers a nice and elegant way to add
                                    zooming functionality for images, html content and multi-media on your webpages. It
                                    is built on the top of the popular JavaScript framework jQuery and is both easy to
                                    implement and a snap to customize.
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
                            <li>- Photo by DAVID ILIFF. License: CC-BY-SA 3.0: <a href="http://bit.ly/ZhuJG1">http://bit.ly/ZhuJG1</a>
                            </li>
                            <li>- Showcase: <a target="_blank"
                                               href="http://www.pixeden.com/psd-web-elements/responsive-showcase-psd">http://www.pixeden.com/psd-web-elements/responsive-showcase-psd</a>
                            </li>
                            <li>- Blurred backgrounds: <a target="_blank"
                                                          href="http://www.cssauthor.com/10-beautiful-collection-of-blurred-backgrounds">http://www.cssauthor.com/10-beautiful-collection-of-blurred-backgrounds</a>
                            </li>
                            <li>- <strong>Unsplash</strong> free hi-resolution photos: <a target="_blank"
                                                                                          href="http://unsplash.com">http://unsplash.com</a>
                            </li>
                            <li>- <strong>Picjumbo</strong> totally free photos for your commercial &amp; personal
                                works: <a target="_blank" href="http://picjumbo.com">http://picjumbo.com</a></li>
                            <li>- <strong>IM FREE</strong> A curated collection of free resources, all for commercial
                                use.: <a target="_blank" href="http://imcreator.com/free">http://imcreator.com/free</a>
                            </li>
                        </ul>
                        <div class="clearfix margin-bottom-10"></div>

                        <h3>Premium Image Credits</h3>
                        <p>Due to licencing rights following images are only used in demo for demonstration purposes and
                            it can be purchased at
                            <a target="_blank" href="http://photodune.net?ref=htmlstream">wwww.photodune.net</a>, <a
                                    target="_blank" href="http://peopleimages.com">http://peopleimages.com</a> and <a
                                    target="_blank" href="http://deathtothestockphoto.com">http://deathtothestockphoto.com</a>
                        </p>
                        <div class="row">
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/little-girl-with-schoolbag/8968061?ref=htmlstream">
                                        Demo-Image-1</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905143?ref=htmlstream">
                                        Demo-Image-2</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905128?ref=htmlstream">
                                        Demo-Image-3</a></li>

                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/beautiful-woman-with-long-sexy-legs-dressed-elegant-posing-in-the-studio-full-body/8905133?ref=htmlstream">
                                        Demo-Image-4</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/pretty-woman-in-white-dress-isolated-studio-shot/3044372?ref=htmlstream">
                                        Demo-Image-5</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/fasionable-beautiful-woman-in-white-dress-standing/3092313?ref=htmlstream">
                                        Demo-Image-6</a></li>

                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/casual-male-fashion/4061088?ref=htmlstream">
                                        Demo-Image-7</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/male-model-against-white-background/4298787?ref=htmlstream">
                                        Demo-Image-8</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/smiling-portraits/4276142?ref=htmlstream">
                                        Demo-Image-9</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/pretty-woman-wearing-short-jeans-and-summer-shirt-smiling/5310015?ref=htmlstream">
                                        Demo-Image-10</a></li>
                                    <li><a target="_blank"
                                           href="http://photodune.net/item/handsome-male-fashion-model-smiling-dressed-casual-outdoor/2426017?ref=htmlstream">
                                        Demo-Image-11</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Credits -->

                    <div class="margin-bottom-40"></div>

                    <!--Change Log-->
                    <div id="scroll_changelog" class="changelog margin-bottom-70">
                        <h2>Change Log <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p><label class="label label-danger">Important!</label> Please do not forget to backup your
                            files before the upgrade.</p>
                        <br>

                        <h4><span>Version 1.9.4 – 19 April 2016</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>Construction Layout</strong> (One-Pages/Construction/index.html)</li>
                            <li>UPDATED: Font Awesome Icons v4.5.0</li>
                        </ul>

                        <h4><span>Version 1.9.3 – 01 April 2016</span></h4>
                        <ul class="margin-bottom-40">
                            <li>FIXED: Version name (typo error) in the download package</li>
                            <li>UPDATED: Animate CSS v4.5.1</li>
                        </ul>

                        <h4><span>Version 1.9.2 – 29 March 2016</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>Courses Layout</strong> (One-Pages/Courses/index.html)</li>
                            <li>NEW: <strong>Wedding Layout</strong> (One-Pages/Wedding/index.html)</li>
                            <li>IMPROVEMENT: Documentation</li>
                            <li>IMPROVEMENT: Busines Layout - promo and equal height blocks (One-Pages/Business/..)</li>
                            <li>IMPROVEMENT: Spa Layout - vertical align texts in some blocks (One-Pages/Spa/..)</li>
                            <li>IMPROVEMENT: Equal Height javascript codes (app.js)</li>
                            <li>IMPROVEMENT: Header v8 for iPhones (app.js)</li>
                            <li>FIXED: Google Maps for IE in Thematic Layouts</li>
                            <li>FIXED: Different slips in (blocks.css)</li>
                            <li>FIXED: Equal Height issue on Home Allure (page_home17.html)</li>
                        </ul>

                        <h4><span>Version 1.9.1 – 07 February 2016</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>Business Layout</strong> (One-Pages/Business/index.html)</li>
                            <li>NEW: <strong>Wealth Landing Page</strong> (Landing-Pages/Wealth/index.html)</li>
                            <li>NEW: <strong>Consulting Landing Page</strong> (One-Pages/Consulting/index.html)</li>
                            <li>NEW: Login and Registration Page (page_login_and_registration.html)</li>
                            <li>NEW: Login Page Option 2 (page_login2.html)</li>
                            <li>NEW: Registration Page Option 2 (page_registration2.html)</li>
                            <li>NEW: 404 Error Page 4 (page_404_error4.html)</li>
                            <li>NEW: 404 Error Page 5 (page_404_error5.html)</li>
                            <li>NEW: 404 Error Page 6 (page_404_error6.html)</li>
                            <li>NEW: Coming Soon Page v2 (page_coming_soon2.html)</li>
                            <li>NEW: Coming Soon Page v3 (page_coming_soon3.html)</li>
                            <li>NEW: Coming Soon Page v4 (page_coming_soon4.html)</li>
                            <li>NEW: Coming Soon Page v5 (page_coming_soon5.html)</li>
                            <li>NEW: Coming Soon Page v6 (page_coming_soon6.html)</li>
                            <li>NEW: RTL Business</li>
                            <li>NEW: RTL Agency</li>
                            <li>NEW: RTL Travel</li>
                            <li>NEW: RTL Lawyer</li>
                            <li>NEW: RTL Architecture</li>
                            <li>NEW: RTL Mobile App</li>
                            <li>NEW: RTL Spa</li>
                            <li>NEW: RTL Shipping</li>
                            <li>IMPROVEMENT: Older version of Coming Soon, 404 Error pages pages</li>
                            <li>IMPROVEMENT: Equal Height codes in app.js</li>
                            <li>FIXED: Links for Breadcrumb options (blocks.css)</li>
                            <li>FIXED: Multiple Progressbar issue (app.css)</li>
                            <li>UPDATED: Layer Slider v5.6.0</li>
                            <li>UPDATED: Cube Portfolio v3.5.1</li>
                        </ul>

                        <h4><span>Version 1.9 – 31 December 2015</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>Agency Layout</strong></li>
                            <li>NEW: <strong>Lawyer Layout</strong></li>
                            <li>NEW: <strong>Travel Layout</strong></li>
                            <li>NEW: <strong>Architecture Layout</strong></li>
                            <li>NEW: <strong>Mobile App Layout</strong></li>
                            <li>NEW: <strong>Spa Layout</strong></li>
                            <li>NEW: <strong>Shipping Layout</strong></li>
                            <li>NEW: Hero Fashion</li>
                            <li>NEW: Hero Gym</li>
                            <li>NEW: Hero Photography</li>
                            <li>NEW: Hero Restaurant</li>
                            <li>NEW: Hero Web App Dark</li>
                            <li>NEW: Hero Web App Light</li>
                            <li>NEW: Home Aspire</li>
                            <li>NEW: Home Allure</li>
                            <li>NEW: Animated Titles (demo on promo block in the page: page_home15.html)</li>
                            <li>NEW: CTA - Call to Actions (feature_call_to_actions.html)</li>
                            <li>NEW: full-height statix text image bg slider (page_home2.html)</li>
                            <li>NEW: full-height statix animated texts (page_home4.html)</li>
                            <li>NEW: full-height Youtube video background (page_home5.html)</li>
                            <li>NEW: on click sidebar navigation left and right (page_home17.html and
                                page_home18.html)
                            </li>
                            <li>NEW: Blog Page Layout v4</li>
                            <li>NEW: Modal Popups</li>
                            <li>NEW: 2000+ Pro Line Icons</li>
                            <li>UPDATED: Bootstrap v3.3.6</li>
                            <li>UPDATED: Animate.css - v3.5.0</li>
                            <li>UPDATED: WOW.js - v1.1.2</li>
                            <li>UPDATED: Cube Portfolio v3.4.2</li>
                            <li>UPDATED: Font Awesome 4.5.0</li>
                            <li>UPDATED: Master Slider v2.16.3</li>
                            <li>UPDATED/NEW: Revolution Slider v5+</li>
                            <li>IMPROVEMENT: Documentation</li>
                            <li>IMPROVEMENT: Shopping cart for mobile devices</li>
                            <li>IMPROVEMENT: Default fixed header for Safari</li>
                            <li>IMPROVEMENT: Default header language hover issue for iOS devices</li>
                            <li>FIXED: One Page focus issue after click and scroll</li>
                            <li>FIXED: Many reported minor bugs</li>
                        </ul>

                        <h4><span>Version 1.8 – 03 July 2015</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>Blog Template</strong></li>
                            <li>NEW: RTL Unify Main</li>
                            <li>NEW: RTL Unify Blog Template</li>
                            <li>NEW: RTL Unify Shop UI Template</li>
                            <li>NEW: RTL Unify One Page Template</li>
                            <li>NEW: 60+ PSD files</li>
                            <li>NEW: Master Slider Examples</li>
                            <li>NEW: Incredible Home Page (page_home16.html)</li>
                            <li>NEW: Static full-screen block in One Page (one_page_home1.html)</li>
                            <li>NEW: Popup login/registration for One Page (one_page_home2.html)</li>
                            <li>NEW: Language bar in One Page (one_page_home3.html)</li>
                            <li>NEW: Centered logo - header v4 (feature_header_v4_logo_centered.html)</li>
                            <li>NEW: Defaul Header without Topbar (feature_header_default_no_topbar.html)</li>
                            <li>NEW: Defaul Centered Header (feature_header_default_centered.html)</li>
                            <li>NEW: Header Login/Reg Popup (feature_header_default_login_popup.html)</li>
                            <li>NEW: Header v8 (feature_header_v8.html)</li>
                            <li>NEW: Footer v8 (feature_footer_v8.html)</li>
                            <li>NEW: Feature Icon Blocks (feature_icon_blocks.html)</li>
                            <li>NEW: Feature Team Blocks (feature_team_blocks.html)</li>
                            <li>NEW: Feature Testimonials and Quotes (feature_testimonials_quotes.html)</li>
                            <li>NEW: Feature News Blocks (feature_news_blocks.html)</li>
                            <li>NEW: Blog Home Page (blog/index.html)</li>
                            <li>NEW: Blog Page Layouts v1 (blog_page_layouts1.html)</li>
                            <li>NEW: Blog Page Layouts v2 (blog_page_layouts2.html)</li>
                            <li>NEW: Blog Page Layouts v3 (blog_page_layouts4.html)</li>
                            <li>NEW: Blog Post Layout v1 (blog_post_layouts1.html)</li>
                            <li>NEW: Blog Post Layout v2 (blog_post_layouts2.html)</li>
                            <li>NEW: Blog Post Layout v3 (blog_post_layouts3.html)</li>
                            <li>NEW: Blog Post Layout v4 (blog_post_layouts4.html)</li>
                            <li>NEW: Blog Post Layout v5 (blog_post_layouts5.html)</li>
                            <li>NEW: Blog Post Layout v6 (blog_post_layouts6.html)</li>
                            <li>NEW: Blog Post Layout v7 (blog_post_layouts7.html)</li>
                            <li>NEW: Blog Post Layout v8 (blog_post_layouts8.html)</li>
                            <li>NEW: Blog Post Layout v9 (blog_post_layouts9.html)</li>
                            <li>NEW: Blog Left Sidebar Example (blog_post_layouts_ls.html)</li>
                            <li>NEW: Blog Full Width Example (blog_post_layouts_fw.html)</li>
                            <li>NEW: Blog Grid: 1 Col (blog_grid_1.html)</li>
                            <li>NEW: Blog Grid: 2 Col (blog_grid_2.html)</li>
                            <li>NEW: Blog Grid: 3 Col (blog_grid_3.html)</li>
                            <li>NEW: Blog Grid: 4 Col (blog_grid_4.html)</li>
                            <li>NEW: Blog Grid: Full Width - 4 Col (blog_grid_4_fw.html)</li>
                            <li>NEW: Blog Grid: Right Sidebar - 2 Col (blog_grid_2_rs.html)</li>
                            <li>NEW: Blog Grid: Left Sidebar - 2 Col (blog_grid_2_ls.html)</li>
                            <li>NEW: Blog Single Page (blog_single.html)</li>
                            <li>NEW: Blog Home Boxed Page (blog_home_boxed.html)</li>
                            <li>NEW: Blog Home Boxed Space Page (blog_home_boxed_space.html)</li>
                            <li>UPGRADE: Bootstrap v3.3.5</li>
                            <li>UPGRADE: jQuery v1.11.3</li>
                            <li>UPGRADE: Master Slider v2.15.0</li>
                            <li>UPGRADE: Cube Portfolio v2.3.3</li>
                            <li>DROPPED: Glyphicons Pro (due to lincese changes)</li>
                            <li>FIXED: Navigation alignemtn and search box in page_home6.html page</li>
                            <li>FIXED: Footer logo in page_home9.html page</li>
                            <li>FIXED: Default header z-index issue with FancyBox</li>
                            <li>FIXED: Thumbnail FancyBox in the shorcodes page (Thanks to "Harald Meyer")</li>
                            <li>FIXED: Header v3 spacing issue on hover (Thanks to "Dario")</li>
                            <li>FIXED: Some design issues on dark layout styles</li>
                            <li>FIXED: Header v7 (sidebar header) - content onclick with ajax call issue</li>
                            <li>FIXED: Revolution Slider loading issue</li>
                            <li>IMPROVEMENT: "Timeline v2" tag
                                <time> replaced with</time>
                                <div> and added equal height columns (Thanks to Stefan Kreckwitz)</div>
                            </li>
                            <li>IMPROVEMENT: Header v7 (sidebar header) - added submenu option</li>
                            <li>IMPROVEMENT: One Page navigation - added submenu option</li>
                            <li>IMPROVEMENT: One Page navigation hides on scroll in mobile/tablet devices</li>
                        </ul>

                        <h4><span>Version 1.7 – 08 March 2015</span></h4>
                        <ul class="margin-bottom-40">
                            <li>UPGRADE: Bootstrap v3.3.2</li>
                            <li>UPGRADE: Countdown for jQuery v2.0.1</li>
                            <li>UPGRADE: jQuery v1.11.2</li>
                            <li>UPGRADE: Font Awesome 4.3.0</li>
                            <li>UPGRADE: Revolution Slider v4.6.4</li>
                            <li>UPGRADE: Sky Forms Pro v2.0.5</li>
                            <li>UPGRADE: Cube Portfolio v2.0.1</li>
                            <li>UPGRADE: Master Slider v2.9.3</li>
                            <li>NEW: Added working contact form to all contact pages</li>
                            <li>NEW: Sticky Footer (page_misc_sticky_footer.html)</li>
                            <li>NEW: Transparent Header with 9 Header Styles (header-v6)</li>
                            <li>NEW: Left/Right Sidebar Headers (header-v7)</li>
                            <li>NEW: WoW.js</li>
                            <li>NEW: Equal Height Columns</li>
                            <li>NEW: Smooth Scrolling "smoothScroll.js" (used in all pages)</li>
                            <li>NEW: Vertical Progress Bars</li>
                            <li>NEW: Animated Progress Bars on scroll</li>
                            <li>NEW: Light version of Parallax Quote</li>
                            <li>NEW: Clients v1 with Owl Carousel</li>
                            <li>NEW: Video iFrame (Modal) with Owl Carousel</li>
                            <li>NEW: Quote v1 with Parallax</li>
                            <li>NEW: Quote v2</li>
                            <li>NEW: News v2 Blocks (News/Blog Post)</li>
                            <li>NEW: News v3 Blocks (News/Blog Post)</li>
                            <li>NEW: Process v1 Section</li>
                            <li>NEW: Headline v2 (Title Heading)</li>
                            <li>NEW: Featured Blog (News Post)</li>
                            <li>NEW: Blog Trending (News/Blog Post)</li>
                            <li>NEW: Social Icons v1</li>
                            <li>NEW: Tags v2 (Sidebar Tags)</li>
                            <li>NEW: Pager v2 (Pagination)</li>
                            <li>NEW: Blog Photostream with Lightbox</li>
                            <li>NEW: Image Hover v1 Effects (Scale on Hover)</li>
                            <li>NEW: Image Hover v2 Effects (Black and White)</li>
                            <li>NEW: Call Action v2 with Parallax</li>
                            <li>NEW: Blog Comments with validation</li>
                            <li>NEW: Blog Comments</li>
                            <li>NEW: Dark/Light Option for default Breadcrumbs</li>
                            <li>NEW: Breadcrumbs v1</li>
                            <li>NEW: Breadcrumbs v3</li>
                            <li>NEW: Testimonials v4</li>
                            <li>NEW: Testimonials v6</li>
                            <li>NEW: Parallax Counter v3</li>
                            <li>NEW: Parallax Counter v4</li>
                            <li>NEW: Service Block v4</li>
                            <li>NEW: Service Block v5</li>
                            <li>NEW: Service Block v6</li>
                            <li>NEW: Service Block v7</li>
                            <li>NEW: Service Block v8</li>
                            <li>NEW: Team v3 Blocks</li>
                            <li>NEW: Team v4 Blocks</li>
                            <li>NEW: Team v5 Blocks</li>
                            <li>NEW: Team v6 Blocks</li>
                            <li>NEW: Team v7 Blocks</li>
                            <li>NEW: Home Page with Left sidebar navigation (page_home12.html)</li>
                            <li>NEW: Home Page with Right sidebar navigation (page_home13.html)</li>
                            <li>NEW: About Us v1 Page (page_about2.html)</li>
                            <li>NEW: About Us v2 Page (page_about3.html)</li>
                            <li>NEW: About Me v1 Page (page_about_me.html)</li>
                            <li>NEW: About Me v2 Page (page_about_me1.html)</li>
                            <li>NEW: About Me v3 Page (page_about_me2.html)</li>
                            <li>NEW: About Our Team v1 Page (page_about_our_team.html)</li>
                            <li>NEW: About Our Team v2 Page (page_about_our_team1.html)</li>
                            <li>NEW: About Our Team v3 Page (page_about_our_team2.html)</li>
                            <li>NEW: Services Page v1 (page_services.html)</li>
                            <li>NEW: Services Page v2 (page_services1.html)</li>
                            <li>NEW: Services Page v3 (page_services2.html)</li>
                            <li>NEW: Services Page v4 (page_services3.html)</li>
                            <li>NEW: Coming Soon Page (page_coming_soon1.html)</li>
                            <li>NEW: Gallery Examples Page (feature_gallery.html)</li>
                            <li>NEW: Animation on Scroll Page (feature_animations.html)</li>
                            <li>NEW: Parallax Counters Page (feature_parallax_counters.html)</li>
                            <li>NEW: Parallax Boxes Page (feature_parallax_blocks.html)</li>
                            <li>NEW: Blog Large Image Right Sidebar Page (blog_large_right_sidebar1.html)</li>
                            <li>NEW: Blog Large Image Left Sidebar Page (blog_large_left_sidebar1.html)</li>
                            <li>NEW: Blog Large Image Full Width Sidebar Page (blog_large_full_width1.html)</li>
                            <li>NEW: Blog Medium Image Right Sidebar Page (blog_medium_right_sidebar1.html)</li>
                            <li>NEW: Blog Medium Image Left Sidebar Page (blog_medium_left_sidebar1.html)</li>
                            <li>NEW: Blog Medium Image Full Width Sidebar Page (blog_medium_full_width1.html)</li>
                            <li>NEW: Blog Item Right Sidebar Page (blog_large_right_sidebar_item1.html)</li>
                            <li>NEW: Blog Item Left Sidebar Page (blog_large_left_sidebar_item1.html)</li>
                            <li>NEW: Blog Item Full Width Page (blog_large_full_width_item1.html)</li>
                            <li>NEW: Portfolio Hover Colors Page (portfolio_hover_colors.html)</li>
                            <li>NEW: Portfolio 2 Columns Full Width No Space Page
                                (portfolio_2_columns_fullwidth_no_space.html)
                            </li>
                            <li>NEW: Portfolio 2 Columns Full Width Grid Page (portfolio_2_columns_fullwidth.html)</li>
                            <li>NEW: Portfolio 2 Columns Full Width Grid With Text Page
                                (portfolio_2_columns_fullwidth_text.html)
                            </li>
                            <li>NEW: Portfolio 3 Columns Full Width No Space Page
                                (portfolio_3_columns_fullwidth_no_space.html)
                            </li>
                            <li>NEW: Portfolio 3 Columns Full Width Grid Page (portfolio_3_columns_fullwidth.html)</li>
                            <li>NEW: Portfolio 3 Columns Full Width Grid With Text Page
                                (portfolio_3_columns_fullwidth_text.html)
                            </li>
                            <li>NEW: Header v6 Transparent (feature_header_v6_transparent.html)</li>
                            <li>NEW: Header v6 Dark Semi Transparent (feature_header_v6_semi_dark_transparent.html)</li>
                            <li>NEW: Header v6 White Semi Transparent (feature_header_v6_semi_white_transparent.html)
                            </li>
                            <li>NEW: Header v6 Transparent Border Bottom (feature_header_v6_border_bottom.html)</li>
                            <li>NEW: Header v6 Classic Dark (feature_header_v6_classic_dark.html)</li>
                            <li>NEW: Header v6 Classic White (feature_header_v6_classic_white.html)</li>
                            <li>NEW: Header v6 Dark Dropdown (feature_header_v6_dark_dropdown.html)</li>
                            <li>NEW: Header v6 Dark Navigation on Scroll (feature_header_v6_dark_scroll.html)</li>
                            <li>NEW: Header v6 Dark Search (feature_header_v6_dark_search.html)</li>
                            <li>NEW: Header v6 Dark Navigation in Responsive mode
                                (feature_header_v6_dark_res_nav.html)
                            </li>
                            <li>IMPROVEMENT: Background images for high resolution screens in (paralalx counters,
                                clients block etc.)
                            </li>
                            <li>IMPROVEMENT: Default Header for large logo images (most wanted feature by users
                                request)
                            </li>
                            <li>IMPROVEMENT: Header CSS code structure (added new comment structure with tabel of
                                content)
                            </li>
                            <li>IMPROVEMENT: Portfolio Pages (all portfolio pages)</li>
                            <li>IMPROVEMENT: Smooth Content Scroller for blocks in Shop UI (header cart) and Profile
                                (notes, events, notification etc.) pages
                            </li>
                            <li>IMPROVEMENT: File structure (all detailed information written in the documentation)</li>
                            <li>IMPROVEMENT: Coming Soon Page (page_coming_soon.html) - added sticky footer, updated
                                countdown jquery plugin and enhanced some code structure.
                            </li>
                            <li>IMPROVEMENT: Redesigned About Us (page_about1.html)</li>
                            <li>IMPROVEMENT: Search Pages</li>
                            <li>IMPROVEMENT: Invoice Page</li>
                            <li>IMPROVEMENT: Documentation (Headers, Footers and Plugin sections)</li>
                            <li>FIXED: Language Bar in Default Header for iOS touch devices</li>
                            <li>FIXED: FancyBox overlay issue</li>
                            <li>FIXED: Scrollspy Reference for One Page Template</li>
                            <li>FIXED: Theme colors of border-bottom in Default Header</li>
                            <li>FIXED: Some theme color issues has fixed in Shop UI</li>
                            <li>FIXED: Typo Errors in the Documentation</li>
                        </ul>

                        <h4><span>Version 1.6 – 29 October 2014</span></h4>
                        <ul class="margin-bottom-40">
                            <li>New: Master Slider <strong>(value $17)</strong></li>
                            <li>New: Shop UI Home Page</li>
                            <li>New: Shop UI Product Page</li>
                            <li>New: Shop UI Filter Grid Page</li>
                            <li>New: Shop UI Filter List Page</li>
                            <li>New: Shop UI Checkout Page</li>
                            <li>New: Shop UI Login Page</li>
                            <li>New: Shop UI Registration Page</li>
                            <li>New: One Page (Added Dark Layout)</li>
                            <li>New: One Page (Added all Theme Colors)</li>
                            <li>New: Discover Home Page (Totally Redesigned)</li>
                            <li>New: Creative Home Page</li>
                            <li>New: Inspire Home Page</li>
                            <li>New: Desire Home Page</li>
                            <li>New: Contacts Advanced Page (with working PHP contact forms)</li>
                            <li>New: Contacts Option 3 Page (Classic Style)</li>
                            <li>New: Colourful Pricing Tables Page (Added 4 types of Pricing Tables)</li>
                            <li>New: Flat Pricing Tables (Added 2 types of Pricing Tables)</li>
                            <li>New: Icon Page (Glyphicons Pro IconsHome)</li>
                            <li>New: Portfolio Single Item Page</li>
                            <li>New: Portfolio 2 Columns (Grid)</li>
                            <li>New: Portfolio 2 Columns (Grid Text)</li>
                            <li>New: Portfolio 2 Columns (Grid No Space)</li>
                            <li>New: Portfolio 3 Columns (Grid)</li>
                            <li>New: Portfolio 3 Columns (Grid Text)</li>
                            <li>New: Portfolio 3 Columns (Grid No Space)</li>
                            <li>New: Portfolio 4 Columns (Grid)</li>
                            <li>New: Portfolio 4 Columns (Grid Text)</li>
                            <li>New: Portfolio 4 Columns (Grid No Space)</li>
                            <li>New: Portfolio 4 Columns (Fullwidth Grid)</li>
                            <li>New: Portfolio 4 Columns (Fullwidth Grid Text)</li>
                            <li>New: Portfolio 4 Columns (Fullwidth Grid No Space)</li>
                            <li>New: Portfolio 5 Columns (Grid)</li>
                            <li>New: Portfolio 5 Columns (Grid Text)</li>
                            <li>New: Portfolio 5 Columns (Grid No Space)</li>
                            <li>New: Portfolio 6 Columns (Grid)</li>
                            <li>New: Portfolio 6 Columns (Grid Text)</li>
                            <li>New: Portfolio 6 Columns (Grid No Space)</li>
                            <li>New: Footer Options (Added 3 new options. Can be found all options in
                                feature_footers.html)
                            </li>
                            <li>New: Header Options (Added 2 new header options Transparent and Shop UI. Can be found
                                all options in feature_headers.html)
                            </li>
                            <li>New: Mega Menu (Added 3 types of Mega Menu, one in default headers and 2 demos in Shop
                                pages)
                            </li>
                            <li>New: Two Theme Colors (Added dark-red and teal colors)</li>
                            <li>New: Misc Blank Page</li>
                            <li>New: Misc Boxed Fixed Menu Page</li>
                            <li>New: Misc Dark Page</li>
                            <li>New: Misc Dark Boxed Page</li>
                            <li>New: Misc Dark Page With Different Theme Color</li>
                            <li>New: PSD Files (All Shop UI pages, One Page with dark layout, all other new pages)</li>
                            <li>New: Owl Slider (Added diversity new options))</li>
                            <li>New: Revolution Slider (Added new slides and option with full screen header offset)</li>
                            <li>New: Content Boxes (Added variety options)</li>
                            <li>New: Thumbnail Blocks</li>
                            <li>New: Parallax Counters</li>
                            <li>New: Background Image Blocks/sections (with parallax effect)</li>
                            <li>New: Portfolio Boxes (Added different types)</li>
                            <li>New: Flat Background Block</li>
                            <li>New: Flat Testimonials</li>
                            <li>New: Service Block</li>
                            <li>UPGRADE: Bootstrap 3.2</li>
                            <li>UPGRADE: jQuery 1.11.1</li>
                            <li>UPGRADE: Glyphicons Pro v1.8.1</li>
                            <li>UPGRADE: Font Awesome Icons v4.2</li>
                            <li>UPGRADE: Revolution Slider v4.6.3</li>
                            <li>UPGRADE: Cube Portfolio v1.5.1</li>
                            <li>UPGRADE: Layer Slider v5.3</li>
                            <li>UPGRADE: Sky Forms v2.0.3</li>
                            <li>UPGRADE: Pace.js v0.5.6</li>
                            <li>UPGRADE: GMaps.js v0.4.15</li>
                            <li>IMPROVEMENT: Documentation (Major Enhancement)</li>
                            <li>IMPROVEMENT: All Navigations (Headers)</li>
                            <li>IMPROVEMENT: Main Parallax Slider</li>
                            <li>IMPROVEMENT: Amazing Home Page</li>
                            <li>IMPROVEMENT: All Footer Options</li>
                            <li>IMPROVEMENT: CSS code structure</li>
                            <li>IMPROVEMENT: JavaScript code structure</li>
                            <li>IMPROVEMENT: Dark Version</li>
                            <li>IMPROVEMENT: Google Map scrolling - added “scrollwheel: false” to page_contacts.js</li>
                            <li>IMPROVEMENT: Footer v1 (social icons replaced withfont-awesome icon tooltips)</li>
                            <li>IMPROVEMENT: Pagination page (added rounded pager examples)</li>
                            <li>IMPROVEMENT: custom.js (added new javascript file to write all custom js changes)</li>
                            <li>IMPROVEMENT: Parallax Backgrounds</li>
                            <li>IMPROVEMENT: "Back To Top" Button image replaced with CSS code</li>
                            <li>FIXED: Navigation Mobile Devices (One Page Template)</li>
                            <li>FIXED: Our Clients Carousel (One Page Template)</li>
                            <li>FIXED: Pricing Pages (Theme color issues)</li>
                            <li>FIXED: Fixed Navigation Colours for Tablets and others devices</li>
                            <li>FIXED: Ladda Buttons (Added missed file laddaButtons.js)</li>
                            <li>FIXED: Profile Theme Colors (added missed 9 theme color files)</li>
                            <li>FIXED: Padding space (Bordered Buttons)</li>
                            <li>FIXED: Navigation Tablet Mode Colors</li>
                            <li>FIXED: Fixed sky-forms datepicker responsive issue on resolution 1024x768</li>
                            <li>FIXED: Page Profile Settings Tab</li>
                        </ul>

                        <h4><span>Version 1.5 – 24 June 2014</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: <strong>One Page Template</strong></li>
                            <li>NEW: Flat Pricing Tables</li>
                            <li>NEW: 40+ PSD Pages</li>
                            <li>NEW: <strong>Dark Layout</strong> Option</li>
                            <li>NEW: Cube Portfolio (<strong>value $8</strong>)</li>
                            <li>NEW: Blog (Grid) Masonry</li>
                            <li>NEW: 3 Footer Options</li>
                            <li>NEW: 3 Header Options</li>
                            <li>NEW: Instagram Icon</li>
                            <li>NEW: Profile Dashboard</li>
                            <li>NEW: Profile Overview</li>
                            <li>NEW: Profile Users</li>
                            <li>NEW: Profile Projects</li>
                            <li>NEW: Profile Comments</li>
                            <li>NEW: Profile History</li>
                            <li>NEW: Profile Settings</li>

                            <li>NEW FEATURES (Profile Pages)
                                <ul>
                                    <li>NEW: 4 Tab Form Sections (Edit Profile, Change Password, Payment Options and
                                        Notification Settings)
                                    </li>
                                    <li>NEW: 2 Social Blocks</li>
                                    <li>NEW: Profile Timeline Block</li>
                                    <li>NEW: Scrollbar</li>
                                    <li>NEW: Sidebar Calendar</li>
                                    <li>NEW: Notifications</li>
                                    <li>NEW: Notes Block</li>
                                    <li>NEW: Events Block</li>
                                    <li>NEW: Colorful Info Blocks (with counters)</li>
                                    <li>NEW: User Info Blocks</li>
                                    <li>NEW: Discussions Blocks</li>
                                    <li>NEW: Alarm Notifications</li>
                                </ul>
                            </li>
                            <li>NEW FEATURES (One Page Template)
                                <ul>
                                    <li>NEW: Full Screen Revolution Slider</li>
                                    <li>NEW: AJAX Portfolio</li>
                                    <li>NEW: Quote Parallax Block</li>
                                    <li>NEW: Beautiful Team Blocks</li>
                                    <li>NEW: Parallax Counter</li>
                                    <li>NEW: Serive Blocks</li>
                                    <li>NEW: News Blocks</li>
                                    <li>NEW: Parallax Twitter Block</li>
                                    <li>NEW: Parallax Clients Section</li>
                                    <li>NEW: Testimonial Carousel</li>
                                    <li>NEW: Contact Forms</li>
                                </ul>
                            </li>

                            <li>UPGRADE: Layer Slider <strong>v5.1.0</strong></li>
                            <li>UPGRADE: Revolution Slider <strong>v4.5 SkyWood</strong></li>
                            <li>UPGRADE: Font Awesome Icons <strong>v4.1.0</strong></li>

                            <li>IMPROVEMENT: Unify Buttons</li>
                            <li>IMPROVEMENT: Main Parallax Slider</li>
                            <li>IMPROVEMENT: Jobs Page (Clients Logos)</li>
                            <li>IMPROVEMENT: Navigation</li>
                            <li>IMPROVEMENT: Blog Magazine</li>
                            <li>IMPROVEMENT: Blog Large (Sidebar News)</li>
                            <li>IMPROVEMENT: Font Awesome Icon Page</li>
                            <li>IMPROVEMENT: Our Work Carousel with "Owl Carousel"</li>

                            <li>FIXED: Navigation for Mobile and Tablet Devices</li>
                            <li>FIXED: Many bugs are fixed in IE8:
                                <ul>
                                    <li>FIXED: Fixed Header Background</li>
                                    <li>FIXED: Twitter Blog</li>
                                    <li>FIXED: Pricing Stickers</li>
                                    <li>FIXED: Easy Block Sections</li>
                                    <li>FIXED: Sky Form Icons</li>
                                    <li>FIXED: Carousel-v1</li>
                                    <li>FIXED: Service Blocks</li>
                                    <li>FIXED: Search blocks</li>
                                    <li>FIXED: Parallax Team Section</li>
                                    <li>FIXED: Parallax Counter</li>
                                    <li>FIXED: Job Banner and Image Inputs</li>
                                </ul>
                            </li>
                        </ul>

                        <h4><span>Version 1.4 – 06 April 2014</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: 5 Theme Colors</li>
                            <li>NEW: Discover Page</li>
                            <li>NEW: Jobs Page</li>
                            <li>NEW: Jobs Inner v1 Page</li>
                            <li>NEW: Jobs Inner v2 Page</li>
                            <li>NEW: Jobs Inner v3 Page</li>
                            <li>NEW: About Us Page</li>
                            <li>NEW: About Me Page</li>
                            <li>NEW: Responsive Corporate Email</li>
                            <li>NEW: Responsive Flat Email</li>
                            <li>NEW: Responsive Modern Email</li>
                            <li>NEW: Pricing Tabels</li>
                            <li>NEW: Light Pricing Tabels</li>
                            <li>NEW: Mega Pricing Tabels</li>
                            <li>NEW: Search Results Page</li>
                            <li>NEW: Search Table Results Page</li>
                            <li>NEW: FAQs Page</li>
                            <li>NEW: 404 Eror v1 Page</li>
                            <li>NEW: 404 Eror v2 Page</li>
                            <li>NEW: Blog Timeline Page</li>
                            <li>NEW: Boxed Pages</li>
                            <li>NEW: Parallax Background</li>
                            <li>NEW: Fixed Header</li>
                            <li>NEW: Static Footer</li>
                            <li>NEW: Sub Menu in Dropdown Navigation</li>
                            <li>NEW: Dropcaps</li>
                            <li>NEW: Bordered Texts</li>
                            <li>NEW: Tooltips</li>
                            <li>NEW: Color Texts</li>
                            <li>NEW: Popovers</li>
                            <li>NEW: Highlights</li>
                            <li>NEW: Heading Options</li>
                            <li>NEW: Deviders</li>
                            <li>NEW: Blockquote Styles</li>
                            <li>NEW: Box Shadows</li>
                            <li>NEW: Testimonials Styles</li>
                            <li>NEW: 7 New Button Colors</li>
                            <li>NEW: Icon Button</li>
                            <li>NEW: Outline Buttons</li>
                            <li>NEW: Rounded Buttons</li>
                            <li>NEW: Dropdown Buttons</li>
                            <li>NEW: Split Dropdowns Button</li>
                            <li>NEW: Collection of Brand and Social Buttons</li>
                            <li>NEW: Button Loading &amp; Hover Effects</li>
                            <li>NEW: Icon Sizes</li>
                            <li>NEW: 10+ Icon Color Styles</li>
                            <li>NEW: Rounded Icons</li>
                            <li>NEW: Circle Icons</li>
                            <li>NEW: Rounded and Circle Social Icons</li>
                            <li>NEW: Line Icons</li>
                            <li>NEW: Unlimited Content Boxes</li>
                            <li>NEW: Colored Content Boxes</li>
                            <li>NEW: Tons of Labels &amp; Badges Styles</li>
                            <li>NEW: Progress Bars</li>
                            <li>NEW: Image Styles</li>
                            <li>NEW: Vimeo &amp; Youtube Video Examples</li>
                            <li>NEW: Soundcloud Music</li>
                            <li>NEW: 5+ Panels</li>
                            <li>NEW: Timeline v1</li>
                            <li>NEW: Timeline v2</li>
                            <li>NEW: Responsive Carousel Examples</li>
                            <li>NEW: General Unify Forms</li>
                            <li>NEW: Datepickers</li>
                            <li>NEW: Validation Forms</li>
                            <li>NEW: Masking Forms</li>
                            <li>NEW: Form Layouts</li>
                            <li>NEW: Checkout Form</li>
                            <li>NEW: Review Form</li>
                            <li>NEW: Order Form</li>
                            <li>NEW: Form States</li>
                            <li>NEW: Form Sliders</li>
                            <li>NEW: Modals</li>
                            <li>NEW: Google Maps Examples</li>
                            <li>NEW: Vector Maps</li>
                            <li>NEW: Animated Pie Charts</li>
                            <li>NEW: Counters</li>
                            <li>NEW: Image Breadcrumbs</li>
                            <li>NEW: Animate CSS</li>
                            <li>NEW: Sub Menu on Sidebar Navigation</li>

                            <li>IMPROVEMENT: Typography Page</li>
                            <li>IMPROVEMENT: About Our Team</li>
                            <li>IMPROVEMENT: Clients Page</li>
                            <li>IMPROVEMENT: Gallery Page</li>
                            <li>IMPROVEMENT: Button Sisez</li>
                            <li>IMPROVEMENT: Disabled State</li>
                            <li>IMPROVEMENT: Icon Styles</li>
                            <li>IMPROVEMENT: Bootstrap Forms</li>
                            <li>IMPROVEMENT: Navigation</li>
                            <li>IMPROVEMENT: Documentation</li>

                            <li>FIXED: Mobile Navigation</li>
                            <li>FIXED: Searchbox for Smaller Width Browser</li>
                            <li>FIXED: FancyBox For Mobile</li>
                            <li>FIXED: Button Sizes</li>
                            <li>FIXED: Button Disable States</li>
                            <li>FIXED: Boxed Layout Issue with FancyBox</li>

                            <li>UPDATED: Bootstrap 3.1.1</li>
                            <li>UPDATED: Awesome Icons 4.0.3</li>
                        </ul>

                        <h4><span>Version 1.3 – 19 October 2013</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: Layer Slider (<strong>value $10</strong>)</li>
                            <li>NEW: Flatty Home Page</li>
                            <li>NEW: Portfolio Home Page</li>
                            <li>NEW: About Us Option Page</li>
                            <li>NEW: Services Option Page</li>
                            <li>NEW: Invoice Page</li>
                            <li>NEW: Funny Boxes</li>
                            <li>NEW: Meet Our Teamm Page</li>
                            <li>NEW: Registration Option Page</li>
                            <li>NEW: Login Option Page</li>
                            <li>NEW: 3 Column Page</li>
                            <li>NEW: Blog/Magazine Page</li>
                            <li>NEW: Blog Medium Page</li>
                            <li>NEW: Blog Full Width Page</li>
                            <li>NEW: Blog Item Option</li>
                            <li>NEW: Contact Option Page</li>
                            <li>NEW: 404 Error Option Page</li>
                            <li>NEW: Soring Plugin</li>
                            <li>NEW: Tweet Blocks</li>
                            <li>NEW: Tab Styles</li>
                            <li>NEW: Header Option</li>
                            <li>NEW: Content Boxes</li>
                            <li>NEW: Rounded Icon Styles</li>
                            <li>NEW: Colored Social Icon</li>
                            <li>NEW: 12 Different Color Panels</li>
                            <li>NEW: Testimonial Blocks</li>
                            <li>NEW: Boxed Layout</li>
                            <li>NEW: Blog Posts</li>
                            <li>NEW: Blog Quick Links</li>
                            <li>NEW: Panel Tabs</li>
                            <li>NEW: Panel Forms</li>
                            <li>NEW: Responsive Video Class</li>
                            <li>NEW: Youtube Video Example</li>
                            <li>NEW: Info Blocks with Icons</li>
                            <li>NEW: Sidebar Navigation</li>
                            <li>NEW: Hover Dropdown Menu</li>

                            <li>UPGRADE: <strong>Twitter Bootstrap 3</strong></li>
                            <li>UPGRADE: jQuery <strong>1.10.2</strong></li>
                            <li>UPGRADE: Revolution Slider <strong>3.0.8</strong></li>
                            <li>UPGRADE: Font Awesome <strong>v3.2.1</strong></li>
                            <li>UPGRADE: Glyphicons Pro Icons</li>

                            <li>IMPROVEMENT: Redesigned All Feature Pages</li>
                            <li>IMPROVEMENT: Redesigned Vertical Parallax Slider</li>
                            <li>IMPROVEMENT: Redesigned Service Page</li>
                            <li>IMPROVEMENT: Navigation (Menu)</li>
                            <li>IMPROVEMENT: Blog Spacing</li>
                            <li>IMPROVEMENT: Blog Tags</li>
                            <li>IMPROVEMENT: Tabs/Accordions</li>
                            <li>IMPROVEMENT: Parallax Slider Arrows</li>

                            <li>FIXED: Navigation for Mobile Devices</li>
                            <li>FIXED: Google Map zoom in/out</li>
                            <li>FIXED: Navigation Toggle Color</li>
                            <li>FIXED: Pricing Tables Color</li>
                            <li>FIXED: IE8 Parallax Arrows</li>
                        </ul>

                        <div class="clearfix"></div>

                        <h4><span>Version 1.2 – 27 May 2013</span></h4>
                        <ul class="margin-bottom-40">
                            <li>NEW: Revolution Slider (<strong>value $12</strong>)</li>
                            <li>NEW: Coming Soon Page <code>page_coming_soon.html</code></li>
                            <li>NEW: Glyphicons Pro (<strong>value $59</strong>)</li>
                            <li>NEW: Four Theme Color Options</li>
                            <li>NEW: Button Styles <code>feature_button.html</code></li>
                            <li>NEW: Boxed Contact Page <code>page_contact1.html</code></li>
                            <li>NEW: Search Page <code>page_search.html</code></li>
                            <li>NEW: Amazing Alternative Home Page <code>page_home5.html</code></li>
                            <li>IMPROVEMENT: Documentation</li>
                            <li>IMPROVEMENT: Paralax Slider (High Resolution)</li>
                            <li>IMPROVEMENT: HTML/CSS & JS code structures</li>
                            <li>UPGRADE: Twitter Bootstrap v2.3.2</li>
                            <li>UPGRADE: Font Awesome v3.1.1</li>
                            <li>
                                FIXED:
                                <ul>
                                    <li>Header Search Block (for responsive)</li>
                                    <li>Footer Subscribe Form (for IE8)</li>
                                    <li>Accardion and Tabs in Firefox browser (added some default bootstrap classes)
                                    </li>
                                </ul>
                            </li>
                        </ul>

                        <div class="clearfix"></div>

                        <h4><span>Version 1.1 – 24 April 2013</span></h4>
                        <ul>
                            <li>UPGRADE: Twitter Bootstrap v2.3.1</li>
                            <li>FIXED: Some page issues in <code>login.html</code> and <code>registration.html</code>
                            </li>
                        </ul>
                        <br>

                        <h4><span>Version 1.0 – 23 April 2013</span></h4>
                        <ul>
                            <li>Initial release</li>
                        </ul>
                    </div><!--/end-->

                    <div class="margin-bottom-50"></div>

                    <!-- Update -->
                    <div id="scroll_upgrade" class="upgrade margin-bottom-70">
                        <h2>Upgrade <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p><span class="label label-blue">Info</span> Please do not forget to <strong>backup</strong>
                            your files before the upgrade. If you come across with any problems during the upgrade
                            please contact our support at <a
                                    href="mailto:support@htmlstream.com">support@htmlstream.com</a></p><br>

                        <p><span class="label label-red">Important!</span> Please include all your custom CSS and
                            JavaScript codes to <code>custom.css</code> and <code>custom.js</code> before the upgrading
                            to the latest version. Otherwise, you may lose your custom styles during the upgrade.</p>
                        <p>The files are located in <code>assets/css/custom.css</code> and
                            <code>assets/js/custom.js</code>. We suggest to write all css/js customizations codes into
                            <code>custom.css</code> and <code>custom.js</code> files.</p><br>

                        <div class="margin-bottom-30"></div>

                        <hr>

                        <!-- v1.9+ Upgrade -->
                        <h4>v1.9+ Upgrade</h4>
                        <p></p>
                        <ul class="margin-bottom-20">
                            <li>Merged <code>plugins.css</code> into <code>blocks.css</code>, now main global CSS files
                                are <strong>app.css</strong> and <strong>blocks.css</strong>. Now, all packages contain
                                <strong>app.css</strong> and <strong>blocks.css</strong> files by default. It helps to
                                use any default elements, blocks etc. in any Unify packages. <a href="#scroll_main">Click
                                    here</a> to learn more about the packages.
                            </li>
                            <li>Once Page default pages moved into <code>Classic</code> folder in the One Pages package
                            </li>
                            <li>Hero-Themes moved to <code>One Pages</code> folder (package) e.g.
                                <code>Hero-Fashion</code>, <code>Hero-WebApp</code> etc.
                            </li>
                            <li><code>Shop-UI</code> folder name changed to <code>E-Commerce</code></li>
                            <li><code>Blog</code> folder name changed to <code>Blog-Magazine</code>, the package will be
                                extended in future updates with other blog and magazine design options.
                            </li>
                            <li><code>One-Page</code> folder name changed to <code>One-Pages</code>, now the package
                                contains dozens thematic design options and counting new demos with each update.
                            </li>
                            <li><code class="bg-color-dark-blue">tab-v5</code> class changed to <code
                                    class="bg-color-dark-blue">tab-v6</code> in E-Commerce CSS folder in order to use
                                other global tabs
                            </li>
                            <li>Removed <code>ie8.css</code> file, Unify does not support anymore IE8 and any older
                                version of browsers
                            </li>
                        </ul>
                        <p>Please check <a href="#scroll_changelog">changelog</a> section for more information.</p>

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.8 Upgrade -->
                        <h4>v1.8 Upgrade</h4>
                        <ul class="margin-bottom-20">
                            <li>added class name <code>bg-color-white</code> to <code>news-v3</code> in HTML files and
                                removed <code>background: #fff;</code> for <strong>.news-v3</strong> from its CSS file.
                            </li>
                        </ul>
                        <p>Please check <a href="#scroll_changelog">changelog</a> section for more information.</p>

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.7 Upgrade -->
                        <h4>v1.7 Upgrade</h4>

                        <p>These files were linked (imported) via CSS in older versions of Unify, starting from <strong>v1.7
                            Unify</strong> all these files are linked in each HTML files in the <code>
                            &lt;head&gt;</code> section:</p>
                        <ol class="margin-bottom-20">
                            <li>Header File <code>header-default.css</code></li>
                            <li>Footer File <code>footer-v1.css</code></li>
                            <li>CSS Plugin <code>animate.css</code></li>
                            <li>Google Fonts</li>
                        </ol>
                        <p class="margin-bottom-40"><span class="label label-blue">Info</span> You may find linked CSS
                            files <a href="#scroll_page_head">here</a></p>

                        <p>Here is the changes made during the v1.7 Unify development:</p>
                        <ul>
                            <li>changed <code>handleScrollBar</code> to <code>initScrollBar</code> (shop.app.js)</li>
                            <li>removed/replaced <code>initMouseWheel</code> from shop.app.js to
                                <code>mouse-wheel.js</code> (assets/js/plugins/..)
                            </li>
                            <li>removed <code>blog_right_sidebar.html</code> and <code>blog_left_sidebar.html</code>
                            </li>
                            <li>removed <code>Breadcrumbs v3</code> and replaced with new design style</li>
                            <li>changed <strong>class name</strong>: <code
                                    class="bg-color-dark-blue">grid-block-v2</code> to <code class="bg-color-dark-blue">block-grid-v2</code>
                                (blocks.css)
                            </li>
                            <li>added <code>custom-cubeportfolio.css</code> to <code>assets/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css</code>
                            </li>
                            <li>changed path: <code>assets/plugins/sky-forms/version-2.0.1</code> to <code>assets/plugins/sky-forms-pro/skyforms</code>
                            </li>
                            <li>changed path:
                                <code>assets/plugins/sky-forms/version-2.0.1/css/custom-sky-forms.css</code> to <code>assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css</code>
                            </li>
                            <li>changed path: <code>assets/ajax/..</code> to <code>assets/ajax/cube-portfolio/..</code>
                            </li>
                            <li>changed path: <code>assets/php/..</code> to <code>assets/php/sky-forms-pro/..</code>
                            </li>
                            <li>changed path: <code>assets/css/plugins/animate.css</code> to <code>assets/plugins/animate.css</code>
                            </li>
                            <li>changed path: <code>assets/css/plugins/hover-effect/..</code> to <code>assets/plugins/hover-effects/..</code>
                            </li>
                            <li>changed path: <code>assets/css/plugins/style-switcher.css</code> to <code>assets/plugins/style-switcher/style-switcher.css</code>
                            </li>
                            <li>changed path: <code>assets/css/plugins/brand-buttons/..</code> to <code>assets/plugins/brand-buttons/..</code>
                            </li>
                            <li>changed path: <code>assets/js/plugins/placeholder-IE-fixes.js</code> to <code>assets/plugins/placeholder-IE-fixes.js</code>
                            </li>
                            <li>changed HTML files name: <code>profile_*</code> to <code>page_profile_*</code></li>
                            <li>changed file name <code>feature_*.hmtl</code> to <code>shortcode_*.hmtl</code></li>
                        </ul>
                        <!-- End v1.7 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.6 Upgrade -->
                        <h4>v1.6 Upgrade</h4>
                        <ul>
                            <li>Almost all plugins are seperated into js files such as Main Parallax Slider, Revolution
                                Slider, Layer Slider etc. to make them easy for controling.
                            </li>
                            <li>Changed <code>themes</code> fodler name to <code>theme-colors</code> which is located in
                                <code>assets/css/</code></li>
                            <li>Created <code>blocks.css</code> and added verity of css codes of blocks to use them
                                globally.
                            </li>
                            <li>
                                Divided Header Options to separate css files <code>assets/css/headers</code>
                                <ul>
                                    <li>Totaly rewrited (improved) almost all header options:</li>
                                    <li><code>header-default.css</code></li>
                                    <li><code>header-v1.css</code></li>
                                    <li><code>header-v2.css</code></li>
                                    <li><code>header-v3.css</code></li>
                                    <li><code>header-v4.css</code></li>
                                    <li><code>header-v5.css</code></li>
                                    <li>You may find more detailed information in the <a href="#scroll_headerDemos">header</a>
                                        section.
                                    </li>
                                </ul>
                            </li>
                            <li>
                                Divided Footer Options to separate css files <code>assets/css/footers</code>. Moreover
                                we added <code>default-footer</code> for the old main footer.
                                <ul>
                                    <li><code>footer-default.css</code></li>
                                    <li><code>footer-v1.css</code></li>
                                    <li><code>footer-v2.css</code></li>
                                    <li><code>footer-v3.css</code></li>
                                    <li><code>footer-v4.css</code></li>
                                    <li><code>footer-v5.css</code></li>
                                    <li><code>footer-v6.css</code></li>
                                    <li><code>footer-v7.css</code></li>
                                    <li>You may find more detailed information in the <a href="#scroll_footerDemos">footer</a>
                                        section.
                                    </li>
                                </ul>
                            </li>
                            <li><strong>One Page:</strong> changed classes <code
                                    class="bg-color-light-green">inner</code> to <code class="bg-color-light-green">call-action-v1-box</code>,
                                <code class="bg-color-dark-blue">inner1</code> to <code class="bg-color-dark-blue">call-action-v1-in</code>
                                and <code class="bg-color-brown">team</code> to <code
                                        class="bg-color-brown">team-v1</code></li>
                            <li><strong>One Page:</strong> footer section code moved into <code>footer-v4.css</code> new
                                file
                            </li>
                            <li><strong>One Page:</strong> Twits (Parallax), Out Clients, Testimonials blocks moved into
                                <code>plugins.css</code></li>
                            <li><strong>One Page:</strong> Quote (Parallax), Meet Our Team, Our Services, Portfolio,
                                Call to Action, latest News blocks moved into <code>blocks.css</code></li>
                            <li>Page <strong>Profile Settings</strong> js Tab id has been changed (fixed).</li>
                        </ul>
                        <!-- End v1.6 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.4 Upgrade -->
                        <h4>v1.4 Upgrade</h4>
                        <ul>
                            <li>Totaly rewrited almost all <code>feature pages</code> and changed their
                                <code>.html</code> file names.
                            </li>
                            <li>Redesigned and improved <code>page_clients.html</code> page.</li>
                            <li>Changed: <code>page_meet_our_team.html</code> to <code>page_about_our_team.html</code>
                            </li>
                            <li>Changed: <code>page_search.html</code> to <code>page_funny_boxes.html</code></li>
                            <li>Rewrited class names for content boxes and funny boxes. More examples on pages: <code>feature_box_colored.html</code>
                                and <code>feature_box_funny.html</code></li>
                            <li>Created some new classes to round and circle elements/blocks. You can use these ready
                                classes <code>.rounded</code>, <code>.rounded-x</code>, <code>.rounded-2x</code>, <code>.rounded-3x</code>,
                                <code>.rounded-4x</code> to round any blocks or elements. <code>.rounded-x</code> used
                                to circle elements and It gives 50% border-radius to any element.
                            </li>
                            <li>Now <code>app.css</code> is built as Unify framework's main stlye. It includes all
                                featres of the Template such as Icons Styles, Buttons, Typography, Content Boxes etc.
                            </li>
                            <li>Redesigned almost all feature elements.</li>
                            <li>Totaly changed <code>header</code> structure. Rewrited both <code>header</code> and
                                <code>topbar</code> blocks. Now <code>topbar</code> is a part of <code>header</code>
                                block.
                            </li>
                            <li><code>header</code> css files are integrated to <code>style.css</code></li>
                            <li><code>responsive.css</code> is integrated to each css files and It's deleted from css
                                folder. Now, no more required to link <code>responsive.css</code> in html files.
                            </li>
                            <li>Added <code>.twitter-time</code> class into <code>&lt;span&gt;</code> for sidebar
                                twitter blocks.
                            </li>
                            <li>Removed <code>dropdown-hover</code> javascript plugin. Now, hover dropdowns work with
                                just css codes.
                            </li>
                            <li>Removed <code>.btn-buy</code> button from the home pages. Instead used default button.
                            </li>
                            <li>Removed <strong>icon <i class="fa fa-angle-down color-red"></i></strong> from the
                                navigation dropdown. Now, dropdown arrows were created from the css.
                            </li>
                        </ul>
                        <!-- End v1.4 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.3 Upgrade -->
                        <h4>v1.3 Upgrade</h4>
                        <p>Since latest version of Unify upgraded to <strong>Twitter Bootstrap 3</strong> all files
                            comes with a huge JavaScript, HTML and CSS changes. <br> We suggest you to add the codes
                            from previous version into v1.3 and use it as a base template.</p>
                        <p>*Please visit the offecial Bootstrap 3 documentation page for more detalied info <a
                                target="_blank" href="http://getbootstrap.com">http://getbootstrap.com</a></p>
                        <!-- End v1.3 Upgrade -->

                        <div class="margin-bottom-30 clearfix"></div>

                        <!-- v1.2 Upgrade -->
                        <h4>v1.2 Upgrade</h4>
                        <p>Here is breifly explained what we changed in v1.2:</p>
                        <ul class="margin-bottom-40">
                            <li>
                                File structures:
                                <ul>
                                    <li>
                                        Changed HTML file names. For example:
                                        <ul>
                                            <li><code>faq.html</code> to <code>page_faq.html</code></li>
                                            <li><code>about.html</code> to <code>page_about.html</code></li>
                                            <li><code>contact.html</code> to <code>page_contact.html</code></li>
                                            <li><code>icons.html</code> to <code>feature_icons.html</code></li>
                                            <li><code>table.html</code> to <code>feature_table</code></li>
                                            <li>and others...</li>
                                        </ul>
                                    </li>
                                    <li>We added all plugins to plugin folder and now all plugins located in <code>assets/plugins/..</code>
                                    </li>
                                </ul>
                            </li>
                            <li>Parallax Slider now on autoplay. Modified file: <code>assets/plugins/parallax-slider/js/jquery.cslider.js</code>
                            </li>
                            <li>Changed <strong>folder</strong> and <strong>file</strong> names from <code>menu</code>
                                to <code>header</code> in CSS folder <code>assets/css/headers/header1.css</code> and
                                <code>assets/css/headers/header2.css</code></li>
                            <li>Changed Modernizr JS file name <code>assets/js/modernizr.custom.js</code></li>
                            <li>
                                Changed top and header ID names to CLASS names and now they are
                                <code>&lt;div class="top"&gt;</code>
                                and
                                <code>&lt;div class="header"&gt;</code>
                            </li>
                            <li>Changed Social Icons class names which is in footer and in other pages.</li>
                            <li>Deleted tag <code>&lt;div id="body"&gt;</code> in all HTML files</li>
                            <li>Added favicon icon <code>&lt;link rel="shortcut icon" href="favicon.ico"&gt;</code></li>
                        </ul>
                        <p><span class="label label-info">Info</span> We will improve Unify Documentation in the future
                            updates with more detailed structures. Meanwhile, If you come across any problem during the
                            upgrade please contact to our support at <a href="mailto:support@htmlstream.com">support@htmlstream.com</a>
                        </p>
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
                        <p>Starting with version 3.0, Bootstrap adopted a mobile first design philosophy, emphasizing
                            responsive design by default.</p>
                        <h4>Bootstrap Translations</h4>
                        <p> If you like to learn more about Bootstrap in diffirent languages please click on eof the
                            link below</p>
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
                        <p>Specifically, Bootstrap supports the latest versions of the following browsers and platforms.
                            On Windows, Bootstrap supports Internet Explorer 8-11. More specific support information is
                            provided below.</p>
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
                        <p>Unofficially, Bootstrap should look and behave well enough in Chromium and Chrome for Linux,
                            Firefox for Linux, and Internet Explorer 7, though they are not officially supported. For a
                            list of some of the browser bugs that Bootstrap has to grapple with, see Bootstrap <a
                                    target="_blank" href="http://getbootstrap.com/browser-bugs/">Wall of browser
                                bugs.</a></p>
                        <h4>Internet Explorer 8 and 9</h4>
                        <p>Internet Explorer 8 and 9 are also supported, however, please be aware that some CSS3
                            properties and HTML5 elements are not fully supported by these browsers. In addition,
                            Internet Explorer 8 requires the use of <a target="_blank"
                                                                       href="https://github.com/scottjehl/Respond">Respond.js </a>
                            to enable media query support.</p>
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
                        <p>Visit Can <a target="_blank" href="http://caniuse.com/">I use... </a>for details on browser
                            support of CSS3 and HTML5 features.</p>

                        <h4>Internet Explorer 8 and Respond.js</h4>
                        <p>Beware of the following caveats when using Respond.js in your development and production
                            environments for Internet Explorer 8.</p>
                        <h5><strong>Respond.js and cross-domain CSS</strong></h5>
                        <p>Using Respond.js with CSS hosted on a different (sub)domain (for example, on a CDN) requires
                            some additional setup. <a target="_blank"
                                                      href="https://github.com/scottjehl/Respond/blob/master/README.md#cdnx-domain-setup">See
                                the Respond.js docs </a>for details.</p>
                        <h5><strong>Respond.js and <code>file://</code></strong></h5>
                        <p>Due to browser security rules, Respond.js doesn't work with pages viewed via the file://
                            protocol (like when opening a local HTML file). To test responsive features in IE8, view
                            your pages over HTTP(S). <a target="_blank"
                                                        href="https://github.com/scottjehl/Respond/blob/master/README.md#support--caveats">See
                                the Respond.js docs </a>for details.</p>
                        <h5><strong>Respond.js and <code>@import</code></strong></h5>
                        <p>Respond.js doesn't work with CSS that's referenced via @import. In particular, some Drupal
                            configurations are known to use @import. See the <a target="_blank"
                                                                                href="https://github.com/scottjehl/Respond/blob/master/README.md#support--caveats">Respond.js
                                docs</a> for details.</p>
                        <h4>Internet Explorer 8 and box-sizing</h4>
                        <p>IE8 does not fully support <code>box-sizing: border-box;</code> when combined with <code>min-width</code>,
                            <code>max-width</code>, <code>min-height</code>, or <code>max-height</code>. For that
                            reason, as of v3.0.1, we no longer use <code>max-width</code> on <code>.container</code>s.
                        </p>
                        <h4>Internet Explorer 8 and @font-face</h4>
                        <p>
                        <p>IE8 has some issues with <code>@font-face</code> when combined with <code>:before</code>.
                            Bootstrap uses that combination with its Glyphicons. If a page is cached, and loaded without
                            the mouse over the window (i.e. hit the refresh button or load something in an iframe) then
                            the page gets rendered before the font loads. Hovering over the page (body) will show some
                            of the icons and hovering over the remaining icons will show those as well. <a
                                    target="_blank" href="https://github.com/twbs/bootstrap/issues/13863">See issue
                                #13863</a> for details.</p></p>
                        <!-- End Bootsrap -->

                        <hr>

                        <!-- Sublime text editor  -->
                        <h3>Sublime Text Editor</h3>
                        <p>We use Sublime text editor for coding. If you would like to use Sublime text editor please <a
                                target="_blank" href="http://www.sublimetext.com/">click here "Sublime Text Editor"</a>
                            for more detailed information.</p><br>
                        <!-- End Sublime text editor -->
                    </div>

                    <!-- Documentation -->
                    <div id="scroll_end">
                        <h2>End of Documentation <a href="#top">top <i class="fa fa-angle-up"></i></a></h2>
                        <hr>
                        <p>Once again, thank you for purchasing Unify Template.</p>
                        <p>With much love <i class="fa fa-heart color-red"></i> <strong>Unify team.</strong></p>
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
