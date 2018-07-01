<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!--=== Header v5 ===-->
<%--...--%>
<!--=== End Header v5 ===-->
<%@ include file="include/header.jsp" %>

<%--<ul>--%>
<%--<li><a href="admin/admin">관리자</a></li>--%>
<%--<li><a href="contents">컨텐츠</a></li></li>--%>
<%--</ul>--%>

<%--
<h1>
helloworld!
</h1>

<h2>
    ${result}
</h2>
--%>


<!--=== Slider ===-->
<div class="tp-banner-container">
    <div class="tp-banner">
        <ul>
            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 1">
                <!-- MAIN IMAGE -->
                <img src="assets/img/president01.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top"
                     data-bgrepeat="no-repeat">

                <div class="tp-caption revolution-ch1 sft start"
                     data-x="center"
                     data-hoffset="0"
                     data-y="100"
                     data-speed="1500"
                     data-start="500"
                     data-easing="Back.easeInOut"
                     data-endeasing="Power1.easeIn"
                     data-endspeed="300">
                    The New <br>
                    <strong>KOREA</strong><br>
                    is here
                </div>

                <!-- LAYER -->
                <div class="tp-caption sft"
                     data-x="center"
                     data-hoffset="0"
                     data-y="380"
                     data-speed="1600"
                     data-start="1800"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 2">
                <!-- MAIN IMAGE -->
                <img src="assets/img/president02.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top"
                     data-bgrepeat="no-repeat">

                <div class="tp-caption revolution-ch3 sft start"
                     data-x="center"
                     data-hoffset="0"
                     data-y="140"
                     data-speed="1500"
                     data-start="500"
                     data-easing="Back.easeInOut"
                     data-endeasing="Power1.easeIn"
                     data-endspeed="300">
                    Latest <strong>LEADER</strong> Trends
                </div>

                <!-- LAYER -->
                <div class="tp-caption revolution-ch4 sft"
                     data-x="center"
                     data-hoffset="-14"
                     data-y="210"
                     data-speed="1400"
                     data-start="2000"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    새로운 개념의 시대를 앞서가는 리더 <br>
                    끝없는 도전으로 스스로의 한계 탈피
                </div>

                <!-- LAYER -->
                <div class="tp-caption sft"
                     data-x="center"
                     data-hoffset="0"
                     data-y="300"
                     data-speed="1600"
                     data-start="1800"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 3">
                <!-- MAIN IMAGE -->
                <img src="assets/img/president03.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="right top"
                     data-bgrepeat="no-repeat">

                <div class="tp-caption revolution-ch3 sft start"
                     data-x="right"
                     data-hoffset="5"
                     data-y="130"
                     data-speed="1500"
                     data-start="500"
                     data-easing="Back.easeInOut"
                     data-endeasing="Power1.easeIn"
                     data-endspeed="300">
                    <strong>Luxury</strong> Government Administration
                </div>

                <!-- LAYER -->
                <div class="tp-caption revolution-ch4 sft"
                     data-x="right"
                     data-hoffset="0"
                     data-y="210"
                     data-speed="1400"
                     data-start="2000"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    미세한 소리까지 경청<br/>대통령 본연의 멋과 가치,<br/><br/><br/><br/>
                    원칙을 최대한 지켜 대통령 본연의<br/>소통을 뼛속까지 그대로 전달<br/>
                </div>

                <!-- LAYER -->
                <div class="tp-caption sft"
                     data-x="right"
                     data-hoffset="0"
                     data-y="300"
                     data-speed="1600"
                     data-start="2800"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 4">
                <!-- MAIN IMAGE -->
                <img src="assets/img/president04.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top"
                     data-bgrepeat="no-repeat">

                <div class="tp-caption revolution-ch1 sft start"
                     data-x="center"
                     data-hoffset="0"
                     data-y="100"
                     data-speed="1500"
                     data-start="500"
                     data-easing="Back.easeInOut"
                     data-endeasing="Power1.easeIn"
                     data-endspeed="300">
                    Power Accesories
                </div>

                <!-- LAYER -->
                <div class="tp-caption revolution-ch2 sft"
                     data-x="center"
                     data-hoffset="0"
                     data-y="280"
                     data-speed="1400"
                     data-start="2000"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    Super Promotion
                </div>

                <!-- LAYER -->
                <div class="tp-caption sft"
                     data-x="center"
                     data-hoffset="0"
                     data-y="370"
                     data-speed="1600"
                     data-start="2800"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">View More</a>
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>
            </li>
            <!-- END SLIDE -->

            <!-- SLIDE -->
            <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000"
                data-title="Slide 5">
                <!-- MAIN IMAGE -->
                <img src="assets/img/president05.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="right top"
                     data-bgrepeat="no-repeat">

                <div class="tp-caption revolution-ch5 sft start"
                     data-x="right"
                     data-hoffset="5"
                     data-y="130"
                     data-speed="1500"
                     data-start="500"
                     data-easing="Back.easeInOut"
                     data-endeasing="Power1.easeIn"
                     data-endspeed="300">
                    <strong>People</strong> Collection
                </div>

                <!-- LAYER -->
                <div class="tp-caption revolution-ch4 sft"
                     data-x="right"
                     data-hoffset="-14"
                     data-y="210"
                     data-speed="1400"
                     data-start="2000"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    여러 목소리로 삶을 더 즐겁게<br/>바꿀 준비 되셨나요?<br><br/><br/><br/>
                    단지 보고 들었던 모든 것들이<br/>이야기가 넘치는 소재로 바뀝니다.<br/>
                </div>

                <!-- LAYER -->
                <div class="tp-caption sft"
                     data-x="right"
                     data-hoffset="0"
                     data-y="300"
                     data-speed="1600"
                     data-start="2800"
                     data-easing="Power4.easeOut"
                     data-endspeed="300"
                     data-endeasing="Power1.easeIn"
                     data-captionhidden="off"
                     style="z-index: 6">
                    <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
                </div>
            </li>
            <!-- END SLIDE -->
        </ul>
        <div class="tp-bannertimer tp-bottom"></div>
    </div>
</div>
<!--=== End Slider ===-->

<!--=== Product Content ===-->
<div class="container content-md">
    <!--=== Illustration v1 ===-->
    <div class="row margin-bottom-60">
        <div class="col-md-6 md-margin-bottom-30">
            <div class="overflow-h">
                <div class="illustration-v1 illustration-img1">
                    <div class="illustration-bg">
                        <div class="illustration-ads ad-details-v1">
                            <h3>NEW YEAR <strong>SALE</strong> 30% - 60% <strong>off</strong></h3>
                            <a class="btn-u btn-brd btn-brd-hover btn-u-light" href="#">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="overflow-h">
                <a class="illustration-v1 illustration-img2" href="#">
					<span class="illustration-bg">
						<span class="illustration-ads ad-details-v2">
							<span class="item-time">Spring 2014</span>
							<span class="item-name">Lacoste</span>
						</span>
					</span>
                </a>
            </div>
        </div>
    </div><!--/end row-->
    <!--=== End Illustration v1 ===-->

    <div class="heading heading-v1 margin-bottom-20">
        <h2>Featured products</h2>
        <p>새로운 개념의 정치! 혁신적인 방식으로 기존의 고정관념에서 벗어난 철학과 소통을 선보입니다.<br/>일상 속에 자연스럽게 스며드는 복지에 실용적인 사용성까지 더한 원칙들, 우리가 기다렸던 바로
            그 새로운 시작입니다.
        <p>
    </div>

    <!--=== Illustration v2 ===-->
    <div class="illustration-v2 margin-bottom-60">
        <div class="customNavigation margin-bottom-25">
            <a class="owl-btn prev rounded-x"><i class="fa fa-angle-left"></i></a>
            <a class="owl-btn next rounded-x"><i class="fa fa-angle-right"></i></a>
        </div>

        <ul class="list-inline owl-slider">
            <c:forEach items="${random10BoardsList}" var="boardVO" varStatus="itr">
                <li class="item">
                    <div class="product-img">
                        <a href="shop-ui-inner.html">
                            <img class="full-width img-responsive"
                                 src="/assets/img/aUpload${boardVO.fullname}"
                                 alt=""></a>
                        <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                        <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                    <div class="product-description product-description-brd">
                        <div class="overflow-h margin-bottom-5">
                            <div class="pull-left">
                                <h4 class="title-price"><a href="shop-ui-inner.html">${boardVO.title}</a></h4>
                                <span class="gender text-uppercase">GIRL</span>
                                <span class="gender">Suits - Schoollooks</span>
                            </div>
                            <div class="product-price">
                                <span class="title-price">123,000</span>
                            </div>
                        </div>
                        <ul class="list-inline product-ratings">
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating-selected fa fa-star"></i></li>
                            <li><i class="rating fa fa-star"></i></li>
                            <li><i class="rating fa fa-star"></i></li>
                            <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"
                                                     data-placement="left" class="tooltips" href="#"><i
                                    class="fa fa-heart"></i></a></li>
                        </ul>
                    </div>
                </li>
            </c:forEach>
            <%--<li class="item">--%>
                <%--<div class="product-img">--%>
                    <%--<a href="shop-ui-inner.html"><img class="full-width img-responsive"--%>
                                                      <%--src="https://ae01.alicdn.com/kf/HTB1CLXcPFXXXXXbXFXXq6xXFXXXy/2017-New-Fashion-Winter-Coats-Women-Europe-Long-Jacket-Green-Wool-Long-Trench-Coat.jpg_640x640.jpg"--%>
                                                      <%--alt=""></a>--%>
                    <%--<a class="product-review" href="shop-ui-inner.html">Quick review</a>--%>
                    <%--<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>--%>
                <%--</div>--%>
                <%--<div class="product-description product-description-brd">--%>
                    <%--<div class="overflow-h margin-bottom-5">--%>
                        <%--<div class="pull-left">--%>
                            <%--<h4 class="title-price"><a href="shop-ui-inner.html">Community S</a></h4>--%>
                            <%--<span class="gender text-uppercase">Women</span>--%>
                            <%--<span class="gender">Outers - Coat</span>--%>
                        <%--</div>--%>
                        <%--<div class="product-price">--%>
                            <%--<span class="title-price">60,000</span>--%>
                            <%--<span class="title-price line-through">70,000</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<ul class="list-inline product-ratings">--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"--%>
                                                 <%--data-placement="left" class="tooltips" href="#"><i--%>
                                <%--class="fa fa-heart"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="item">--%>
                <%--<div class="product-img">--%>
                    <%--<a href="shop-ui-inner.html"><img class="full-width img-responsive"--%>
                                                      <%--src="http://cdn1-www.momtastic.com/assets/uploads/2015/03/Nelly-Stella-dress-with-cut-out-sleeves.jpg"--%>
                                                      <%--alt=""></a>--%>
                    <%--<a class="product-review" href="shop-ui-inner.html">Quick review</a>--%>
                    <%--<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>--%>
                    <%--<div class="shop-rgba-red rgba-banner">Out of stock</div>--%>
                <%--</div>--%>
                <%--<div class="product-description product-description-brd">--%>
                    <%--<div class="overflow-h margin-bottom-5">--%>
                        <%--<div class="pull-left">--%>
                            <%--<h4 class="title-price"><a href="shop-ui-inner.html">Joy of family</a></h4>--%>
                            <%--<span class="gender text-uppercase">CHILDREN</span>--%>
                            <%--<span class="gender">Outers - Coat</span>--%>
                        <%--</div>--%>
                        <%--<div class="product-price">--%>
                            <%--<span class="title-price">67,000</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<ul class="list-inline product-ratings">--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"--%>
                                                 <%--data-placement="left" class="tooltips" href="#"><i--%>
                                <%--class="fa fa-heart"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="item">--%>
                <%--<div class="product-img">--%>
                    <%--<a href="shop-ui-inner.html"><img class="full-width img-responsive"--%>
                                                      <%--src="https://s-media-cache-ak0.pinimg.com/564x/b6/28/4d/b6284d49d9b351dbba981d896e64f522.jpg"--%>
                                                      <%--alt=""></a>--%>
                    <%--<a class="product-review" href="shop-ui-inner.html">Quick review</a>--%>
                    <%--<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>--%>
                    <%--<div class="shop-rgba-dark-green rgba-banner">New</div>--%>
                <%--</div>--%>
                <%--<div class="product-description product-description-brd">--%>
                    <%--<div class="overflow-h margin-bottom-5">--%>
                        <%--<div class="pull-left">--%>
                            <%--<h4 class="title-price"><a href="shop-ui-inner.html">Don't tell BF</a></h4>--%>
                            <%--<span class="gender text-uppercase">Women</span>--%>
                            <%--<span class="gender">Suits - Onepiece</span>--%>
                        <%--</div>--%>
                        <%--<div class="product-price">--%>
                            <%--<span class="title-price">87,000</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<ul class="list-inline product-ratings">--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"--%>
                                                 <%--data-placement="left" class="tooltips" href="#"><i--%>
                                <%--class="fa fa-heart"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="item">--%>
                <%--<div class="product-img">--%>
                    <%--<a href="shop-ui-inner.html"><img class="full-width img-responsive"--%>
                                                      <%--src="http://img.yonhapnews.co.kr//etc/inner/KR/2012/01/11//AKR20120111074800003_01_i.jpg"--%>
                                                      <%--alt=""></a>--%>
                    <%--<a class="product-review" href="shop-ui-inner.html">Quick review</a>--%>
                    <%--<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>--%>
                <%--</div>--%>
                <%--<div class="product-description product-description-brd">--%>
                    <%--<div class="overflow-h margin-bottom-5">--%>
                        <%--<div class="pull-left">--%>
                            <%--<h4 class="title-price"><a href="shop-ui-inner.html">Baby Baby Baby</a></h4>--%>
                            <%--<span class="gender text-uppercase">Baby</span>--%>
                            <%--<span class="gender">Suits - set</span>--%>
                        <%--</div>--%>
                        <%--<div class="product-price">--%>
                            <%--<span class="title-price">45,000</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<ul class="list-inline product-ratings">--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"--%>
                                                 <%--data-placement="left" class="tooltips" href="#"><i--%>
                                <%--class="fa fa-heart"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</li>--%>
            <%--<li class="item">--%>
                <%--<div class="product-img">--%>
                    <%--<a href="shop-ui-inner.html"><img class="full-width img-responsive"--%>
                                                      <%--src="http://g03.a.alicdn.com/kf/HTB1pRN5OXXXXXciXpXXq6xXFXXXs/Cenmon-%EC%88%A0-%EC%B2%B4%EC%9D%B8-%EA%B8%B4-%EB%AA%A9%EA%B1%B8%EC%9D%B4-%ED%8E%9C%EB%8D%98%ED%8A%B8-%EC%9D%98%EC%83%81-%EB%B3%B4%EC%84%9D-%EC%9C%A0%ED%96%89-%EC%95%A1%EC%84%B8%EC%84%9C%EB%A6%AC-%EC%97%AC%EC%84%B1-Colar-%EB%AA%A9%EA%B1%B8%EC%9D%B4.jpg"--%>
                                                      <%--alt=""></a>--%>
                    <%--<a class="product-review" href="shop-ui-inner.html">Quick review</a>--%>
                    <%--<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>--%>
                    <%--<div class="shop-rgba-red rgba-banner">Out of stock</div>--%>
                <%--</div>--%>
                <%--<div class="product-description product-description-brd">--%>
                    <%--<div class="overflow-h margin-bottom-5">--%>
                        <%--<div class="pull-left">--%>
                            <%--<h4 class="title-price"><a href="shop-ui-inner.html">It's my life</a></h4>--%>
                            <%--<span class="gender text-uppercase">Women</span>--%>
                            <%--<span class="gender">Accessory - Necklace</span>--%>
                        <%--</div>--%>
                        <%--<div class="product-price">--%>
                            <%--<span class="title-price">168,000</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<ul class="list-inline product-ratings">--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating-selected fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li><i class="rating fa fa-star"></i></li>--%>
                        <%--<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"--%>
                                                 <%--data-placement="left" class="tooltips" href="#"><i--%>
                                <%--class="fa fa-heart"></i></a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</li>--%>
        </ul>
    </div>
    <!--=== End Illustration v2 ===-->

    <%--09.home.jsp의 가운데 카테고리 CSS 코넥트 연결 안 되는 이슈 해결(지금은 주석처리 해놨음)--%>
    <!--=== Illustration v3 ===-->
    <div class="row margin-bottom-50">
        <div class="col-md-4 md-margin-bottom-30">
            <div class="overflow-h">
                <a class="illustration-v3 illustration-img1"
                   href="#">
					<span class="illustration-bg">
                         <span class="illustration-ads">
							<span class="illustration-v3-category">
								<span class="product-category">고용노동부</span>
								<span class="product-amount">87 Items</span>
							</span>
						</span>
					</span>
                </a>
            </div>
        </div>
        <div class="col-md-4 md-margin-bottom-30">
            <div class="overflow-h">
                <a class="illustration-v3 illustration-img2"
                   href="http://www.dove.com/content/dam/unilever/dove/global/general_image/personal_care_unidentified/personal_care_unidentified/day10_shot04_076_hero-293217.jpg.ulenscale.767x360.jpg">
					<span class="illustration-bg">
						<span class="illustration-ads">
							<span class="illustration-v3-category">
								<span class="product-category">통일부</span>
								<span class="product-amount">156 Items</span>
							</span>
						</span>
					</span>
                </a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="overflow-h">
                <a class="illustration-v3 illustration-img3"
                   href="http://mummyfique.com/wp-content/uploads/2016/12/MFE-side-ad-1.jpg">
					<span class="illustration-bg">
						<span class="illustration-ads">
							<span class="illustration-v3-category">
								<span class="product-category">환경부</span>
								<span class="product-amount">68 Items</span>
							</span>
						</span>
					</span>
                </a>
            </div>
        </div>
    </div>
    <%--<!--=== End Illustration v3 ===-->--%>

    <div class="heading heading-v1 margin-bottom-40">
        <h2>Latest products</h2>
    </div>

    <!--=== Illustration v2 ===-->
    <div class="row illustration-v2">
        <div class="col-md-3 col-sm-6 md-margin-bottom-30">
            <div class="product-img">
                <a href="shop-ui-inner.html"><img class="full-width img-responsive"
                                                  src="https://ae01.alicdn.com/kf/HTB1W6VEJpXXXXbQXFXXq6xXFXXXa/Summer-women-font-b-dress-b-font-Europe-and-America-in-spring-and-summer-haute-couture.jpg"
                                                  alt=""></a>
                <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
            </div>
            <div class="product-description product-description-brd">
                <div class="overflow-h margin-bottom-5">
                    <div class="pull-left">
                        <h4 class="title-price"><a href="shop-ui-inner.html">Anywhere Whatever</a></h4>
                        <span class="gender text-uppercase">Woman</span>
                        <span class="gender">Suits - Two Piece</span>
                    </div>
                    <div class="product-price">
                        <span class="title-price">75,000</span>
                    </div>
                </div>
                <ul class="list-inline product-ratings">
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"
                                             data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 md-margin-bottom-30">
            <div class="product-img">
                <a href="shop-ui-inner.html"><img class="full-width img-responsive"
                                                  src="https://s-media-cache-ak0.pinimg.com/236x/15/d7/9d/15d79da32b5b69a62f8b6d109630b866.jpg"
                                                  alt=""></a>
                <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
            </div>
            <div class="product-description product-description-brd">
                <div class="overflow-h margin-bottom-5">
                    <div class="pull-left">
                        <h4 class="title-price"><a href="shop-ui-inner.html">Alaways It's sunny</a></h4>
                        <span class="gender text-uppercase">GIRL</span>
                        <span class="gender">Suits - One Piece</span>
                    </div>
                    <div class="product-price">
                        <span class="title-price">58,000</span>
                        <span class="title-price line-through">68,000</span>
                    </div>
                </div>
                <ul class="list-inline product-ratings">
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"
                                             data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 md-margin-bottom-30">
            <div class="product-img">
                <a href="shop-ui-inner.html"><img class="full-width img-responsive"
                                                  src="http://image.dhgate.com/0x0/f2/albu/g2/M01/44/97/rBVaGlbRBKyAPVG8AAKKg_G2kJ8367.jpg"
                                                  alt=""></a>
                <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                <div class="shop-rgba-red rgba-banner">Out of stock</div>
            </div>
            <div class="product-description product-description-brd">
                <div class="overflow-h margin-bottom-5">
                    <div class="pull-left">
                        <h4 class="title-price"><a href="shop-ui-inner.html">I wannabe mom</a></h4>
                        <span class="gender text-uppercase">GIRL</span>
                        <span class="gender">Bottom - Skirt</span>
                    </div>
                    <div class="product-price">
                        <span class="title-price">45,000</span>
                    </div>
                </div>
                <ul class="list-inline product-ratings">
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"
                                             data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 md-margin-bottom-30">
            <div class="product-img">
                <a href="shop-ui-inner.html"><img class="full-width img-responsive"
                                                  src="http://www.dhresource.com/260x260s/f2-albu-g5-M00-E3-E7-rBVaJFi761GAVVvbAAGiBhA4wOw827.jpg/hot-kid-girls-dress-plaid-bowknot-belt-vest.jpg"
                                                  alt=""></a>
                <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                <div class="shop-rgba-dark-green rgba-banner">New</div>
            </div>
            <div class="product-description product-description-brd">
                <div class="overflow-h margin-bottom-5">
                    <div class="pull-left">
                        <h4 class="title-price"><a href="shop-ui-inner.html">Happy Thing</a></h4>
                        <span class="gender text-uppercase">CHILDREN</span>
                        <span class="gender">Suits - One Piece</span>
                    </div>
                    <div class="product-price">
                        <span class="title-price">35,000</span>
                    </div>
                </div>
                <ul class="list-inline product-ratings">
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating-selected fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li><i class="rating fa fa-star"></i></li>
                    <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip"
                                             data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--=== End Illustration v2 ===-->
</div>
<!--=== End Product Content ===-->

<!--=== Twitter-Block ===-->
<div class="parallaxBg twitter-block margin-bottom-60">
    <div class="container">
        <div class="heading heading-v1 margin-bottom-20">
            <h2>Latest Tweets</h2>
        </div>

        <div id="carousel-example-generic-v5" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li class="active rounded-x" data-target="#carousel-example-generic-v5" data-slide-to="0"></li>
                <li class="rounded-x" data-target="#carousel-example-generic-v5" data-slide-to="1"></li>
                <li class="rounded-x" data-target="#carousel-example-generic-v5" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item active">
                    <p>UNIFY는 매출액이 목표치에 이르렀으며 UNIFY의 성공에 참여해 주신 모든 고객 여러분께 감사드리고 싶습니다.<br/> <br/><a
                            href="https://youtu.be/VCX5tPdGpmg">https://youtu.be/VCX5tPdGpmg</a>
                    <p>
                    <%--<p><a href="https://twitter.com/jingug1004">@jingug1004</a></p>--%>
                    <ul class="list-inline twitter-icons">
                        <li><a href="#"><i class="fa fa-reply"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                    </ul>
                </div>
                <div class="item">
                    <p>UNIFY의 사회기부 활동 및 운동<br/><br/></p>
                    <p><a href="https://youtu.be/UoB0IkaNIIc">@social dominate operation</a></p>
                    <ul class="list-inline twitter-icons">
                        <li><a href="#"><i class="fa fa-reply"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                    </ul>
                </div>
                <div class="item">
                    <p>21c 새로운 창의적인 것들에 대하여 필요한 모든 것을 보여줍니다. <br/><br/><a href="#">http://publicdomainarchive.com</a>
                    </p>
                    <p><a href="https://youtu.be/UlqNxG95CRE">@Kim</a></p>
                    <ul class="list-inline twitter-icons">
                        <li><a href="#"><i class="fa fa-reply"></i></a></li>
                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                    </ul>
                </div>
            </div>

            <div class="carousel-arrow">
                <a class="left carousel-control" href="#carousel-example-generic-v5" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic-v5" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<!--=== End Twitter-Block ===-->

<div class="container">
    <!--=== Product Service ===-->
    <div class="row margin-bottom-60">
        <div class="col-md-4 product-service md-margin-bottom-30">
            <div class="product-service-heading">
                <i class="fa fa-truck"></i>
            </div>
            <div class="product-service-in">
                <h3>Reasonable Delivery</h3>
                <p>1등 정치는 달라야 합니다.<br/>눈에 보이는 복지,<br/>서비스 혜택은 물론<br/>
                    보이지 않는 분위기, 안정감, 신뢰까지<br/>누구나 원하는 것을<br/>얻을 수 있어야 합니다.<br/></p>
                <a href="#">+Read More</a>
            </div>
        </div>
        <div class="col-md-4 product-service md-margin-bottom-30">
            <div class="product-service-heading">
                <i class="icon-earphones-alt"></i>
            </div>
            <div class="product-service-in">
                <h3>Customer Service</h3>
                <p>국민이 원하는 것은 무엇이든<br/>만족하고 소통할 수 있도록<br/>UNIFY는 외형의 성장을 넘어<br/>
                    투명경영, 윤리경영을 바탕으로<br/> 더 큰 만족을 위해<br/>최선을 다하고 있습니다.</p>
                <a href="#">+Read More</a>
            </div>
        </div>
        <div class="col-md-4 product-service">
            <div class="product-service-heading">
                <i class="icon-refresh"></i>
            </div>
            <div class="product-service-in">
                <h3>Free Returns</h3>
                <p>앞으로도 UNIFY는 보다 가치있는<br/>서비스를 통해 사회 무형 서비스의<br/>
                    리더로서 지속적인 혁신을<br/>이루어 나가겠습니다.</p>
                <a href="#">+Read More</a>
            </div>
        </div>
    </div><!--/end row-->
    <!--=== End Product Service ===-->

    <!--=== Illustration v4 ===-->
    <div class="row illustration-v4 margin-bottom-40">
        <div class="col-md-4">
            <div class="heading heading-v1 margin-bottom-20">
                <h2>Top Good</h2>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/08.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Yuketen</a> – <a href="shop-ui-inner.html">Derby Pants</a></h4>
                    <span class="thumb-product-type">Footwear - Oxfords</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price line-through">75,000</li>
                    <li class="thumb-product-price">65,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/09.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Missi</a> – <a href="shop-ui-inner.html">Doran Hat</a></h4>
                    <span class="thumb-product-type">Headwear - Havard</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">45,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/03.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Nani</a> – <a href="shop-ui-inner.html">Hoga Belts</a></h4>
                    <span class="thumb-product-type">Bodywear - MIT</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">31,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="heading heading-v1 margin-bottom-20">
                <h2>Best G/B</h2>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/02.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Brian</a> – <a href="shop-ui-inner.html">Koi Eye-glass</a></h4>
                    <span class="thumb-product-type">Eyewear - Juliad</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">24,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/10.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">GuiGui</a> – <a href="shop-ui-inner.html">Miami Persue</a></h4>
                    <span class="thumb-product-type">Accesory - Queen's</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">175,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/06.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Nakatati</a> – <a href="shop-ui-inner.html">NYC Shoe</a></h4>
                    <span class="thumb-product-type">Footwear - Washington</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price line-through">138,000</li>
                    <li class="thumb-product-price">128,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-4 padding">
            <div class="heading heading-v1 margin-bottom-20">
                <h2>Top Bad</h2>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/07.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Owen</a> – <a href="shop-ui-inner.html">Primera Shirts</a></h4>
                    <span class="thumb-product-type">Topwear - War</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price line-through">68,000</li>
                    <li class="thumb-product-price">58,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/04.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Nani</a> – <a href="shop-ui-inner.html">Leon Hat</a></h4>
                    <span class="thumb-product-type">Headwear - Vera</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">45,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
            <div class="thumb-product">
                <img class="thumb-product-img" src="assets/img/thumb/05.jpg" alt="">
                <div class="thumb-product-in">
                    <h4><a href="shop-ui-inner.html">Hudson</a> – <a href="shop-ui-inner.html">EU watch</a></h4>
                    <span class="thumb-product-type">Handwear - classic</span>
                </div>
                <ul class="list-inline overflow-h">
                    <li class="thumb-product-price">127,000</li>
                    <li class="thumb-product-purchase"><a href="#"><i class="fa fa-shopping-cart"></i></a> | <a
                            href="#"><i class="fa fa-heart"></i></a></li>
                </ul>
            </div>
        </div>
    </div><!--/end row-->
    <!--=== End Illustration v4 ===-->
</div>
<!--/end cotnainer-->

<!--=== Collection Banner ===-->
<div class="collection-banner">
    <div class="container">
        <div class="col-md-7 md-margin-bottom-50">
            <h2>Life collection</h2>
            <p>특별한 날을 위한 특별한 선택! 주인공은 바로 나!<br>UNIFY는 다양한 목소리와 소식으로 유행에 앞선 Collection을 제공합니다.</p><br>
            <a href="#" class="btn-u btn-brd btn-brd-hover btn-u-light">Shop Now</a>
        </div>
        <div class="col-md-5">
            <div class="overflow-h">
                <span class="percent-numb">50</span>
                <div class="percent-off">
                    <span class="discount-percent">%</span>
                    <span class="discount-off">off</span>
                </div>
                <div class="new-offers shop-bg-green rounded-x">
                    <p>new</p>
                    <span>Products</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--=== End Collection Banner ===-->

<!--=== Sponsors ===-->
<div class="container content">
    <div class="heading heading-v1 margin-bottom-40">
        <h2>Sponsors</h2>
        <p>UNIFY는 취약계층에게 사회서비스 또는 일자리를 제공하여 지역주민의 삶의 질을 높이는 등의<br/>사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 수행하는 기업과 함께
            합니다.</p>
    </div>

    <ul class="list-inline owl-slider-v2">
        <li class="item first-child">
            <img src="assets/img/clients/01.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/02.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/03.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/04.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/05.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/06.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/07.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/08.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/09.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/10.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/11.png" alt="">
        </li>
        <li class="item">
            <img src="assets/img/clients/12.png" alt="">
        </li>
    </ul><!--/end owl-carousel-->
</div>
<!--=== End Sponsors ===-->

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


<!--=== Footer v4 ===-->
<%--...--%>
<!--=== End Footer v4 ===-->


<%@ include file="include/footer.jsp" %>

