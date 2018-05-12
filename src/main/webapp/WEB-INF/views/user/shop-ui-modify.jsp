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

<style>
    .product-color label:hover {
        cursor: pointer;
        border: 2px solid #18ba9b;
    }

    .product-color input:checked ~ label {
        border: 2px solid #18ba9b;
    }

    .product-color input[type=radio] {
        display: none;
    }

    .product-color label {
        /*width: 50px;*/
        /*height: 50px;*/
        /*float: right;*/
        /*padding: 5px;*/
        /*display: block;*/
        /*font-size: 24px;*/
        /*text-align: center;*/
    }

</style>

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
                    <h3>전 세계 <span class="shop-green" id="ui-register-num">${uiregister}</span>명 이상의 회원</h3>
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
                                <option value="" selected="">정치성향</option>
                                <option value="A1 자유주의 보수적" <c:if test="남자">selected</c:if>>A1 자유주의 보수적</option>
                                <option value="B1 권위주의 보수적" <c:if test="남자">selected</c:if>>B1 권위주의 보수적</option>
                                <option value="C1 매우 보수적" <c:if test="남자">selected</c:if>>C1 매우 보수적</option>
                                <option value="D1 약간 보수적" <c:if test="${reg_gender == 2}">selected</c:if>>D1 약간 보수적</option>
                                <option value="X0 관심형 중도적" <c:if test="${reg_gender == 3}">selected</c:if>>X0 관심형 중도적</option>
                                <option value="Y0 중도적" <c:if test="${reg_gender == 3}">selected</c:if>>Y0 중도적</option>
                                <option value="Z0 방임형 중도적" <c:if test="${reg_gender == 3}">selected</c:if>>Z0 방임형 중도적</option>
                                <option value="D2 약간 진보적" <c:if test="${reg_gender == 3}">selected</c:if>>D2 약간 진보적</option>
                                <option value="C2 매우 진보적" <c:if test="${reg_gender == 3}">selected</c:if>>C2 매우 진보적</option>
                                <option value="B2 권위주의 진보적" <c:if test="${reg_gender == 3}">selected</c:if>>B2 권위주의 진보적</option>
                                <option value="A2 자유주의 진보적" <c:if test="${reg_gender == 3}">selected</c:if>>A2 자유주의 진보적</option>
                            </select>
                        </label>

                        <div class="panel-group" id="accordion-v5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h2 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-v5" href="#collapseFive">
                                            Color
                                            <i class="fa fa-angle-down"></i>
                                        </a>
                                    </h2>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <ul class="list-inline product-color-list product-color ls-ct-center">
                                            <div class="list-inline product-color-list product-color ls-ct-center">
                                                <li>
                                                    <input type="radio" id="choice001" name="uday" value="001">
                                                    <label class="color-one" for="choice001"><img
                                                            src="/assets/img/colors/001.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice002" name="uday" value="002">
                                                    <label class="color-one" for="choice002"><img
                                                            src="/assets/img/colors/002.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice003" name="uday" value="003">
                                                    <label class="color-one" for="choice003"><img
                                                            src="/assets/img/colors/003.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice004" name="uday" value="004">
                                                    <label class="color-one" for="choice004"><img
                                                            src="/assets/img/colors/004.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice005" name="uday" value="005">
                                                    <label class="color-one" for="choice005"><img
                                                            src="/assets/img/colors/005.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice006" name="uday" value="006">
                                                    <label class="color-one" for="choice006"><img
                                                            src="/assets/img/colors/006.png" alt=""></label>
                                                </li>
                                            </div>
                                            <div class="list-inline product-color-list product-color ls-ct-center">
                                                <li>
                                                    <input type="radio" id="choice007" name="uday" value="007">
                                                    <label class="color-one" for="choice007"><img
                                                            src="/assets/img/colors/007.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice008" name="uday" value="008">
                                                    <label class="color-one" for="choice008"><img
                                                            src="/assets/img/colors/008.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice009" name="uday" value="009">
                                                    <label class="color-one" for="choice009"><img
                                                            src="/assets/img/colors/009.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice010" name="uday" value="010">
                                                    <label class="color-one" for="choice010"><img
                                                            src="/assets/img/colors/010.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice011" name="uday" value="011">
                                                    <label class="color-one" for="choice011"><img
                                                            src="/assets/img/colors/011.png" alt=""></label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="choice012" name="uday" value="012">
                                                    <label class="color-one" for="choice012"><img
                                                            src="/assets/img/colors/012.png" alt=""></label>
                                                </li>
                                            </div>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!--/end panel group-->

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

