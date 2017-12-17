<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ page session="false" %>--%>

<%@include file="../include/header.jsp" %>

<!--=== Breadcrumbs v4 ===-->
<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name">프로덕트 필터 페이지</span>
        <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="">Product</a></li>
            <li class="active">Product Filter Page</li>
        </ul>
    </div><!--/end container-->
</div>
<!--=== End Breadcrumbs v4 ===-->

<!--=== Content Part 여기서부터 ===-->
<div class="content container">
    <div class="row">
        <div class="col-md-3 filter-by-block md-margin-bottom-60">
            <h1>Filter By</h1>
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Brands
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled checkbox-list">
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked/>
                                        <i></i>
                                        Calvin Klein
                                        <small><a href="#">(23)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked/>
                                        <i></i>
                                        Gucci
                                        <small><a href="#">(4)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        Adidas
                                        <small><a href="#">(11)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        Puma
                                        <small><a href="#">(3)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        Zara
                                        <small><a href="#">(87)</a></small>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->

            <div class="panel-group" id="accordion-v2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseTwo">
                                Categories
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled checkbox-list">
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked/>
                                        <i></i>
                                        Clothes
                                        <small><a href="#">(23)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked/>
                                        <i></i>
                                        Glasses
                                        <small><a href="#">(4)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        Shoes
                                        <small><a href="#">(11)</a></small>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->

            <div class="panel-group" id="accordion-v3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v3" href="#collapseThree">
                                Size
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled checkbox-list">
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        S
                                        <small><a href="#">(23)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked/>
                                        <i></i>
                                        M
                                        <small><a href="#">(4)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        L
                                        <small><a href="#">(11)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"/>
                                        <i></i>
                                        XL
                                        <small><a href="#">(3)</a></small>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->

            <div class="panel-group" id="accordion-v4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v4" href="#collapseFour">
                                Price
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="slider-snap"></div>
                            <p class="slider-snap-text">
                                <span class="slider-snap-value-lower"></span>
                                <span class="slider-snap-value-upper"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->

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
                            <ul class="list-inline product-color-list">
                                <div class="list-inline product-color-list">
                                <li><a href="#"><img src="/assets/img/colors/001.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/002.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/003.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/004.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/005.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/006.png" alt=""></a></li></div>
                                <div class="list-inline product-color-list">
                                <li><a href="#"><img src="/assets/img/colors/007.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/008.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/009.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/010.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/011.png" alt=""></a></li>
                                <li><a href="#"><img src="/assets/img/colors/012.png" alt=""></a></li></div>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->

            <div class="panel-group margin-bottom-30" id="accordion-v6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion-v6" href="#collapseSix">
                                Rating
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="stars-ratings stars-ratings-label">
                                <input type="radio" name="stars-rating" id="stars-rating-5">
                                <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-4">
                                <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-3">
                                <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-2">
                                <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                                <input type="radio" name="stars-rating" id="stars-rating-1">
                                <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/end panel group-->
            <button type="button" class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block">Reset
            </button>
        </div>

        <div class="col-md-9">
            <div class="row margin-bottom-5">
                <div class="col-sm-4 result-category">
                    <h2>Men</h2>
                    <small class="shop-bg-red badge-results">44 Results</small>
                </div>
                <div class="col-sm-8">
                    <ul class="list-inline clear-both">
                        <li class="grid-list-icons">
                            <a href="/product/productList"><i class="fa fa-th-list"></i></a>
                            <a href="/product/productListGrid"><i class="fa fa-th"></i></a>
                        </li>
                        <li class="sort-list-btn">
                            <h3>Sort By :</h3>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    Popularity <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">All</a></li>
                                    <li><a href="#">Best Sales</a></li>
                                    <li><a href="#">Top Last Week Sales</a></li>
                                    <li><a href="#">New Arrived</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="sort-list-btn">
                            <h3>Show :</h3>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    20 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">All</a></li>
                                    <li><a href="#">10</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">3</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div><!--/end result category-->

            <div class="filter-results">
                <div class="row illustration-v2 margin-bottom-30">
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/16.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            <div class="shop-rgba-dark-green rgba-banner">New</div>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$60.00</span>
                                    <span class="title-price line-through">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/17.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$60.00</span>
                                    <span class="title-price line-through">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/18.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row illustration-v2 margin-bottom-30">
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/21.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/22.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$60.00</span>
                                    <span class="title-price line-through">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/23.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            <div class="shop-rgba-red rgba-banner">Out of stock</div>
                        </div>
                        <div class="product-description product-description-brd">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row illustration-v2">
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/16.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            <div class="shop-rgba-dark-green rgba-banner">New</div>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$60.00</span>
                                    <span class="title-price line-through">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/17.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$60.00</span>
                                    <span class="title-price line-through">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-img product-img-brd">
                            <a href="#"><img class="full-width img-responsive" src="/assets/img/blog/18.jpg" alt=""></a>
                            <a class="product-review" href="shop-ui-inner.html">Quick review</a>
                            <a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-description product-description-brd margin-bottom-30">
                            <div class="overflow-h margin-bottom-5">
                                <div class="pull-left">
                                    <h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
                                    <span class="gender text-uppercase">Men</span>
                                    <span class="gender">Suits - Blazers</span>
                                </div>
                                <div class="product-price">
                                    <span class="title-price">$95.00</span>
                                </div>
                            </div>
                            <ul class="list-inline product-ratings">
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating-selected fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li><i class="rating fa fa-star"></i></li>
                                <li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!--/end filter resilts-->

            <div class="text-center">
                <ul class="pagination pagination-v2">
                    <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                    <li><a href="#">1</a></li>
                    <li class="active"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
            </div><!--/end pagination-->
        </div>
    </div><!--/end row-->
</div><!--/end container-->
<!--=== End Content Part ===-->

<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<script>
    var result = '${msg}';

    if (result == 'SUCCESS') {
        alert("처리가 완료되었습니다.");
    }
</script>

<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--ex) www.profile.com?name=hyewon&age=25--%>
<script>

    // list(리스트)의 g/b 넘버 포맷팅 Todo: 나머지 넘버 포맷팅 해야함
    $('.listgcnt').number(true);
    $('.listgbcnt').number(true);
    $('.listbcnt').number(true);
    $('.listscnt').number(true);
    $('.listvcnt').number(true);

    function getUrlParams() {
        var params = {};
        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
            params[key] = value;
        });
        return params;
    }

    $(document).ready(function () {

        var allUrlAddr = $(location).attr('href');

        $('#searchBtn01').on("click", function (event) { // cate
            self.location = "list"
                + '${pageMaker.makeQuery(1)}'
                + "&searchType="
                + $("select option:selected").val()
                + "&keyword="
                + $('#keywordInputCate').val()
                + "&cate="
                + oParams.cate;
        });

        $('#searchBtn02').on("click", function (event) { // 전체 검색
            self.location = "listAny"
                + '${pageMaker.makeQuery(1)}'
                // + "&searchType="
                // + $("select option:selected").val()
                + "&keyword="
                + $('#keywordInputCate').val();
            // + "&cate="
            // + oParams.cate;
        });

        window.onload = function () {
            oParams = getUrlParams();
        }

        // 새 글 등록
        $('#newBtn').on("click", function (evt) {
            self.location = 'register?cate='
                + oParams.cate;
            <%--+ '${getQuerystring(cate)}';--%>
        });

//        alert("prevSelfLocation : " + prevSelfLocation);
//        var prevSelfLocation = "";

        $('#goodSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=gc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=gc";
            }
        });

        $('#gbSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=gbc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=gbc";
            }
        });

        $('#badSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=bc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=bc";
            }
        });

        $('#spamSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=sc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=sc";
            }
        });

        $('#viewSort').on("click", function (event) {

            var criUrlParam = "&cntSortType=vc";
            var temp = allUrlAddr + "";

            if (temp.match(criUrlParam)) {
                return true;
            } else {
                self.location = temp + "&cntSortType=vc";
            }
        });

        function pad(n, width) {
            n = n + '';
            return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;

        }

//
//        var number = $('.bringBoardVOgetcolor').val();
//
//        console.log("lllll~~~~~ number : " + number);
//
//        var tempUrl01 = "/assets/img/colors/";
//        var tempUrl02 = pad(number, 3);
//        var tempUrl03 = ".png";
//
//        var tempUrl = "";
//        var temp = tempUrl.concat(tempUrl01, tempUrl02, tempUrl03);
//
//        console.log("lllll~~~~~ temp : " + temp);
//
//        $('.getColor').prop("src", temp);

        <%--$("#getColor").each(function (itr) {--%>
            <%--&lt;%&ndash;$(this).after($m[${list}]);&ndash;%&gt;--%>
            <%--console.log("lllll~~~~~ {itr} : " + itr.length);--%>

            <%--var number = $('#bringBoardVOgetcolor').val();--%>

            <%--console.log("lllll~~~~~ number : " + number);--%>

            <%--var tempUrl01 = "/assets/img/colors/";--%>
            <%--var tempUrl02 = pad(number, 3);--%>
            <%--var tempUrl03 = ".png";--%>

            <%--var tempUrl = "";--%>
            <%--var temp = tempUrl.concat(tempUrl01, tempUrl02, tempUrl03);--%>

            <%--console.log("lllll~~~~~ temp : " + temp);--%>

            <%--$('.getColor')[itr.current()].prop("src", temp);--%>
        <%--});--%>
        <%--&lt;%&ndash;$(".reptilia").remove();&ndash;%&gt;--%>

    });

</script>

<%@include file="../include/footer.jsp" %>
