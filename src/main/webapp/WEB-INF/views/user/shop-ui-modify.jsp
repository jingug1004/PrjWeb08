<%--
  Created by IntelliJ IDEA.
  User: macbook pro
  Date: 2017-02-23
  Time: 오후 8:37
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
                <p>지금 회원 수정하신 후 UNIFY의 다양한 서비스를 만나보세요.</p><br>
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
                    <h3>전 세계 <span class="shop-green">1,913,000명 </span>이상의 회원</h3>
                    <img class="img-responsive" src="../assets/img/map.png" alt="">
                </div>
            </div>

            <div class="col-md-5">
                <%--<form id="sky-form4" class="log-reg-block sky-form">--%>
                <form id="sky-form4" class="log-reg-block sky-form" action="/user/registPost" method="post">
                <%--<form id="sky-form4" class="log-reg-block sky-form" action="/user/shop-ui-register03" method="post">--%>
                    <h2>Create New Account</h2>

                    <div class="login-input reg-input">
                        <div class="row">
                            <div class="col-sm-6">
                                <section>
                                    <label class="input">
                                        <input type="text" name="uid" placeholder="USER ID"
                                               class="form-control" value="${login.uid}" readonly="readonly">
                                        <form:errors path="uid" cssClass="error"/>
                                    </label>
                                </section>
                            </div>
                            <div class="col-sm-6">
                                <section>
                                    <label class="input">
                                        <input type="text" name="uname" placeholder="User name"
                                               class="form-control">
                                        <form:errors path="uname" cssClass="error"/>
                                        <%--messages.properties 안에 경로 레벨과 같아야 함!--%>
                                    </label>
                                </section>
                            </div>
                        </div>
                        <label class="select margin-bottom-15">
                            <select name="ugender" class="form-control">
                                <%--<option value="0" selected disabled--%>
                                <option value="0" selected="" >Gender</option>
                                <%--<option value="1">Male</option>--%>
                                <option value="M" <c:if test="남자">selected</c:if>>Male</option>
                                <%--<option value="2" <c:if test="${여자}">selected</c:if>>Female</option>--%>
                                <%--<option value="2" <c:if test="${"여자"}">selected</c:if>>Female</option>--%>
                                <%--<option value="여자" <c:if test="${reg_gender == 2}">selected</c:if>>Female</option>--%>
                                <%--바로 위 HTTP Status 500 오류 - "${여자}" contains invalid expression(s):
                                    javax.el.ELException: Failed to parse the expression [${여자}]--%>
                                <option value="F" <c:if test="${reg_gender == 2}">selected</c:if>>Female</option>
                                <option value="E" <c:if test="${reg_gender == 3}">selected</c:if>>Other</option>
                            </select>
                        </label>
                        <div class="row margin-bottom-10">
                            </label>
                            <div class="col-xs-6">
                                <label class="select">
                                    <select name="umonth" class="form-control">
                                        <option selected="" value="0">Month</option>
                                        <%--<option>January</option>--%>
                                        <option value="01" <%--<c:if test="${reg_month == 1}">selected</c:if>--%>>January
                                        </option>
                                        <option value="02" <c:if test="${reg_month == 2}">selected</c:if>>February
                                        </option>
                                        <option value="03" <%--<c:if test="${reg_month == 3}">selected</c:if>--%>>March</option>
                                        <option value="04" <c:if test="${reg_month == 4}">selected</c:if>>April</option>
                                        <option value="05" <c:if test="${reg_month == 5}">selected</c:if>>May</option>
                                        <option value="06" <c:if test="${reg_month == 6}">selected</c:if>>June</option>
                                        <option value="07" <c:if test="${reg_month == 7}">selected</c:if>>July</option>
                                        <option value="08" <c:if test="${reg_month == 8}">selected</c:if>>August</option>
                                        <option value="09" <c:if test="${reg_month == 9}">selected</c:if>>September
                                        </option>
                                        <%--org.springframework.validation.BeanPropertyBindingResult:
                                        1 errors Field error in object 'userVO' on field 'umonth':
                                        rejected value [10월]; codes [typeMismatch.userVO.umonth,typeMismatch.umonth,
                                        typeMismatch.int,typeMismatch]; arguments [org.springframework.context.support.
                                        DefaultMessageSourceResolvable: codes [userVO.umonth,umonth]; arguments [];
                                        default message [umonth]]; default message [Failed to convert property value of type
                                        [java.lang.String] to required type [int] for property 'umonth';
                                        nested exception is java.lang.NumberFormatException: For input string: "10월"]--%>
                                        <%--<option value="10월">October</option>--%>
                                        <option value="10" <c:if test="${reg_month == 10}">selected</c:if>>October
                                            <%--<option value="11" <c:if test="${reg_month == 11}">selected</c:if>>November--%>
                                        <option value="11" <c:if test="${reg_month == 11}">selected</c:if>>November
                                        </option>
                                        <%--HTTP Status 500 오류 - "${reg_month == 12월}" contains invalid expression(s):
                                        javax.el.ELException: Failed to parse the expression [${reg_month == 12월}]--%>
                                        <%--<option value="12" <c:if test="${reg_month == 12}">selected</c:if>>December--%>
                                        <option value="12" <c:if test="${reg_month == 12}">selected</c:if>>December
                                        </option>
                                    </select>
                                </label>
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="uday" placeholder="Day" class="form-control" maxlength="2">
                            </div>
                            <div class="col-xs-3">
                                <input type="text" name="uyear" placeholder="Year" class="form-control" maxlength="4">
                            </div>
                        </div>
                        <section>
                            <label class="input">
                                <input type="text" name="nickname" placeholder="Nickname" class="form-control">
                                <form:errors path="nickname" cssClass="error"/>
                            </label>
                        </section>
                        <section>
                            <label class="input">
                                <input type="email" name="email" placeholder="Email address" class="form-control">
                                <form:errors path="email" cssClass="error"/>
                            </label>
                        </section>
                        <section>
                            <label class="input">
                                <input type="password" name="upw" placeholder="Password" id="password"
                                       class="form-control">
                                <form:errors path="upw" cssClass="error"/>
                            </label>
                        </section>
                        <section>
                            <label class="input">
                                <input type="password" name="upwconfirm" placeholder="Confirm password"
                                       class="form-control">
                                <form:errors path="upwconfirm" cssClass="error"/>
                            </label>
                        </section>
                    </div>

                    <label class="checkbox margin-bottom-10">
                        <input type="checkbox" name="checkbox"/>
                        <i></i>
                        최신 뉴스를 받아 보려면 '뉴스 레터 구독'
                    </label>
                    <%--<label class="checkbox margin-bottom-20">--%>
                        <%--<input type="checkbox" name="checkbox"/>--%>
                        <%--<i></i>--%>
                        <%--저는 <a href="#">이용약관 &amp; 운영방침</a>에 동의한 것을 읽었습니다.--%>
                    <%--</label>--%>
                    <button class="btn-u btn-u-sea-shop btn-block margin-bottom-20" type="submit">Modify Account
                    </button>
                </form>

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
            <a target="_blank" href="https://www.facebook.com/jingug1004" class="g-popup--fb__logo"><img alt="facebook" src="/assets/img/others/fb.png" width="110"></a>
            <div class="g-popup--fb-message">Click <strong>"Like"</strong><br>to read our blog on Facebook</div>
        </div>
        <div class="g-popup--fb-widjet">
            <div id="fb-root"></div>
            <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.4&appId=118547268248380";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <div class="fb-like" data-href="https://www.facebook.com/htmlstream/" data-width="270" data-layout="standard" data-action="like" data-show-faces="true" data-share="false"></div>
        </div>
        <a href="javascript:void(0);" class="g-popup__close g-popup--fb__close"><span class="icon-close" aria-hidden="true"></span></a>
    </div>
</div>
<!-- End Wait Block -->

<%@ include file="../include/footer.jsp" %>

