<%--
  Created by IntelliJ IDEA.
  User: wtime
  Date: 2017-02-23
  Time: 오후 1:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!--=== Header v5 ===-->
<%--...--%>
<!--=== End Header v5 ===-->
<%@ include file="../include/header.jsp" %>

<!--=== Breadcrumbs v4 ===-->
<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name">Log In</span>
        <h1>새로운 품격을 위한 <span class="shop-green">시작</span></h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="../home.jsp">Home</a></li>
            <li><a href="">Product</a></li>
            <li class="active">Log In</li>
        </ul>
    </div><!--/end container-->
</div>
<!--=== End Breadcrumbs v4 ===-->

<!--=== Registre ===-->
<div class="log-reg-v3 content-md margin-bottom-30">
    <div class="container">
        <div class="row">
            <div class="col-md-7 md-margin-bottom-50">
                <h2 class="welcome-title">Welcome to UNIFY</h2>
                <p>지금 회원 가입하신 후 UNIFY의 다양한 서비스를 만나보세요.</p><br>
                <div class="row margin-bottom-50">
                    <div class="col-sm-4 md-margin-bottom-20">
                        <div class="site-statistics">
                            <span>20,039</span>
                            <small>Products</small>
                        </div>
                    </div>
                    <div class="col-sm-4 md-margin-bottom-20">
                        <div class="site-statistics">
                            <span>54,283</span>
                            <small>Reviews</small>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="site-statistics">
                            <span>376k</span>
                            <small>Sale</small>
                        </div>
                    </div>
                </div>
                <div class="members-number">
                    <h3>전 세계 <span class="shop-green" id="ui-register-num">${uiregister}</span>명 이상의 회원</h3>
                    <img class="img-responsive" src="../assets/img/map.png" alt="">
                </div>
            </div>

            <div class="col-md-5">
                <%--<form id="sky-form4" class="log-reg-block sky-form">--%>
                <%--<form id="sky-form4" class="log-reg-block sky-form" action="/user/registPost" method="post">--%>
                <div id="sky-form4" class="log-reg-block sky-form">
                    <h2>회원 가입 완료</h2>

                    <p align="center">
                    회원 가입을 축하드립니다. <b>${userVO.uid}</b>님!<br><br>

                    귀하의 ID는 <b>${userVO.uid}</b>이며, 별명은 <b>${userVO.nickname}</b>,<br>
                    존경하는 정치인으로는 <b>${userVO.uname}</b>,<br>
                    이메일 주소는 <b>${userVO.email}</b>이십니다.<br><br>

                    회원가입으로 <b>100만 포인트</b>가 지급되었습니다.<br><br>

                    앞으로 더욱 발전하는 UNIFY가 되겠습니다.<br><br>

                    로그인 하시고 즐거운 시간 보내시기 바랍니다.<br><br>

                    감사합니다.
                    </p>

                    <%--<label class="checkbox margin-bottom-10">--%>
                        <%--<input type="checkbox" name="checkbox"/>--%>
                        <%--<i></i>--%>
                        <%--최신 뉴스를 받아 보려면 '뉴스 레터 구독'--%>
                    <%--</label>--%>
                    <%--<label class="checkbox margin-bottom-20">--%>
                    <%--<input type="checkbox" name="checkbox"/>--%>
                    <%--<i></i>--%>
                    <%--저는 <a href="#">이용약관 &amp; 운영방침</a>에 동의한 것을 읽었습니다.--%>
                    <%--</label>--%>
                    <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20" >
                        <a href="<c:url value="/"/>">
                            Home</a></button>
                </div>

                <div class="margin-bottom-20"></div>
                <p class="text-center">계정을 가지고 계신가요? <a href="shop-ui-login.jsp">Login</a></p>
            </div>
        </div><!--/end row-->
    </div><!--/end container-->
</div>
<!--=== End Registre ===-->

<!--=== Shop Suvbscribe ===-->
<div class="shop-subscribe">
    <div class="container">
        <div class="row">
            <div class="col-md-8 md-margin-bottom-20">
                <h2>subscribe to our weekly <strong>newsletter</strong></h2>
            </div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Email your email...">
                    <span class="input-group-btn">
								<button class="btn" type="button"><i class="fa fa-envelope-o"></i></button>
							</span>
                </div>
            </div>
        </div>
    </div><!--/end container-->
</div>
<!--=== End Shop Suvbscribe ===-->

<!-- Wait Block 페이스북 팝업 -->
<div class="g-popup-wrapper">
    <div class="g-popup g-popup--fb">
        <div class="g-popup--fb-title">
            <a target="_blank" href="https://www.facebook.com/jingug1004" class="g-popup--fb__logo"><img alt="facebook"
                                                                                                         src="/assets/img/others/fb.png"
                                                                                                         width="110"></a>
            <div class="g-popup--fb-message">Click <strong>"Like"</strong><br>to read our blog on Facebook</div>
        </div>
        <div class="g-popup--fb-widjet">
            <div id="fb-root"></div>
            <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.4&appId=118547268248380";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <div class="fb-like" data-href="https://www.facebook.com/htmlstream/" data-width="270"
                 data-layout="standard" data-action="like" data-show-faces="true" data-share="false"></div>
        </div>
        <a href="javascript:void(0);" class="g-popup__close g-popup--fb__close"><span class="icon-close"
                                                                                      aria-hidden="true"></span></a>
    </div>
</div>
<!-- End Wait Block -->

<script>
    $('#ui-register-num').number(true);
    <%--console.log("{uiregister} : " + ${uiregister});--%>

</script>

<%@ include file="../include/footer.jsp" %>

