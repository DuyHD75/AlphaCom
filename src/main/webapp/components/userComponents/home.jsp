<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Alpha Electro | Home</title>

    <link rel="icon" href="/imgs/logo.png">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="icon" href="imgs/logos/360_F_451269306_U5VVjfXzU2OZLyaLOKmkI73SCwBcjgvF.jpg" type="image/x-icon">

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link rel="stylesheet" href="css/style.css">


</head>

<body>
<!-- HEADER -->
<%@include file="../commons/header.jsp" %>
<!-- /HEADER -->



<!-- HOME BANNER -->
<session class="home_banner_container">
    <div class="home_bg">
        <div class="swiper-wrapper container">

            <div class="swiper-slide slide row row-content">
                <div class="content col-md-6 col-12">
                    <h3>${pdLaptop.get(0).getProduct().getName()}</h3>
                    <span>${pdLaptop.get(0).getProduct().getDesc()}</span>

                    <div class="product-rating">
                        <i class='bx bxl-docker'></i>

                        <span>$${pdLaptop.get(0).getPrice()}/-</span>

                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <form action="./checkout?action=BuyNow&&pid=${pdLaptop.get(0).getProduct().getId()}" method="post">
                        <input type="hidden" name="name" value="${pdLaptop.get(0).getProduct().getName()}">
                        <input type="hidden" name="img" value="${pdLaptop.get(0).getImg1()}">
                        <input type="hidden" name="price" value="${pdLaptop.get(0).getPrice()}">
                        <input type="hidden" name="amount" value="1">
                        <c:set var="disabled" value=""/>

                        <c:if test="${pdLaptop.get(0).getProduct().getAmount_remaining() == 0}">
                            <c:set var="disabled" value="disabled"/>
                        </c:if>

                        <button class="btn" ${disabled}>BUY now</button>
                        <c:set var="disabled" value=""/>
                    </form>
                </div>

                <div class="image col-md-6 col-12">
                    <img src="imgs/productImg/${pdLaptop.get(0).getImg1()}" alt="">
                </div>
            </div>

            <div class="swiper-slide slide row row-content">
                <div class="content col-md-6 col-12">
                    <h3>${pdLaptop.get(1).getProduct().getName()}</h3>
                    <span>${pdLaptop.get(1).getProduct().getDesc()}</span>

                    <div class="product-rating">
                        <i class='bx bxl-docker'></i>

                        <span>$${pdLaptop.get(1).getPrice()}/-</span>

                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <form action="./checkout?action=BuyNow&&pid=${pdLaptop.get(1).getProduct().getId()}" method="post">
                        <input type="hidden" name="name" value="${pdLaptop.get(1).getProduct().getName()}">
                        <input type="hidden" name="img" value="${pdLaptop.get(1).getImg1()}">
                        <input type="hidden" name="price" value="${pdLaptop.get(1).getPrice()}">
                        <input type="hidden" name="amount" value="1">
                        <c:set var="disabled" value=""/>
                        <c:if test="${pdLaptop.get(1).getProduct().getAmount_remaining() == 0}">
                            <c:set var="disabled" value="disabled"/>
                        </c:if>

                        <button class="btn" ${disabled}>BUY now</button>
                        <c:set var="disabled" value=""/>
                    </form>
                </div>

                <div class="image col-md-6 col">
                    <img src="imgs/productImg/${pdLaptop.get(1).getImg1()}" alt="">
                </div>
            </div>

            <div class="swiper-slide slide row row-content">
                <div class="content col-md-6 col-12">
                    <h3>${pdLaptop.get(2).getProduct().getName()}</h3>
                    <span>${pdLaptop.get(2).getProduct().getDesc()}</span>

                    <div class="product-rating">
                        <i class='bx bxl-docker'></i>

                        <span>$${pdLaptop.get(2).getPrice()}/-</span>

                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <form action="./checkout?action=BuyNow&&pid=${pdLaptop.get(2).getProduct().getId()}" method="post">
                        <input type="hidden" name="name" value="${pdLaptop.get(2).getProduct().getName()}">
                        <input type="hidden" name="img" value="${pdLaptop.get(2).getImg1()}">
                        <input type="hidden" name="price" value="${pdLaptop.get(2).getPrice()}">
                        <input type="hidden" name="amount" value="1">
                        <c:if test="${pdLaptop.get(2).getProduct().getAmount_remaining() == 0}">
                            <c:set var="disabled" value="disabled"/>
                        </c:if>
                        <button class="btn" ${disabled}>BUY now</button>
                        <c:set var="disabled" value=""/>

                    </form>
                </div>

                <div class="image col-md-6 col-12">
                    <img src="imgs/productImg/${pdLaptop.get(2).getImg1()}" alt="">
                </div>
            </div>

        </div>
    </div>

    <div class="swiper-pagination"></div>
</session>
<!-- HOME BANNER -->


<!-- NAVIGATION -->
<%@include file="../commons/navigationbar.jsp" %>
<!-- /NAVIGATION -->



<!-- SECTION COLLECTIONS-->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="imgs/productImg/ASUSVivo1.webp" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Laptop<br>Collection</h3>
                        <a href="./store?category=Laptop" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="imgs/categoryImg/Corsair%20HS70%20Pro%20Wireless%20Carbon%201.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Accessories<br>Collection</h3>
                        <a href="./store?category=Headphone" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="imgs/categoryImg/GVNHomeworkI5gen121.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>PC<br>Collection</h3>
                        <a href="./store?category=PC" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION NEW PRODUCT OK-->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h3 class="title">New Products</h3>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">

                                <c:set var="idx" value="0"/>
                                <c:forEach items="${products}" var="p">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="imgs/productImg/${p.getImg1()}" alt="">
                                            <div class="product-label">
                                                <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                    <span class="sale">${pdDiscount.get(idx).getDis_amount() * 100} %</span>
                                                </c:if>
                                                <c:set var="status" value=""></c:set>
                                                <c:set var="Disabled" value=""></c:set>
                                                <c:if test="${p.getProduct().getAmount_remaining() == 0}">
                                                    <c:set var="status" value="SOLD OUT"></c:set>
                                                    <c:set var="Disabled" value="return false;"></c:set>
                                                </c:if>
                                                <c:if test="${p.getProduct().getAmount_remaining() != 0}">
                                                    <c:set var="status" value="NEW"></c:set>
                                                </c:if>
                                                <span class="new">${status}</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${p.getProduct().getCategory()}</p>

                                            <h3 class="product-name"><a
                                                    href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                            </h3>

                                            <c:choose>
                                                <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                    <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:set var="finalPrice" value="${p.getPrice()}"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <h4 class="product-price">$${finalPrice}
                                                <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                    <del
                                                            class="product-old-price">$${p.getPrice()}
                                                    </del>
                                                </c:if>
                                            </h4>

                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>


                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><a href="wishList?action=addToWishList&&pid=${p.getProduct().getId()}"><i
                                                        class="fa fa-heart-o"></i></a><span
                                                        class="tooltipp">add to wishlist</span></button>
                                                <button class="add-to-compare"><i
                                                        class="fa fa-exchange"></i><span
                                                        class="tooltipp">add to compare</span></button>
                                                <button class="quick-view"><i class="fa fa-eye"></i><span
                                                        class="tooltipp">quick view</span></button>
                                            </div>

                                        </div>


                                        <div class="add-to-cart">
                                            <a class="add-to-cart-btn" onclick="${Disabled}" href="cart?action=AddToCart&&pid=${p.getProduct().getId()}"><i
                                                    class="fa fa-shopping-cart"></i> add to cart
                                            </a>
                                        </div>
                                    </div>
                                    <c:set var="idx" value="${idx + 1}"/>
                                </c:forEach>

                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">

        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3>02</h3>
                                <span>Days</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>10</h3>
                                <span>Hours</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>34</h3>
                                <span>Mins</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>60</h3>
                                <span>Secs</span>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">hot deal this week</h2>
                    <p>New Collection Up to 50% OFF</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION TOP SELLING-->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- section title -->
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h3 class="title">Top selling</h3>

                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <!-- product -->
                                <c:set var="idx" value="0"/>
                                <c:forEach items="${pdMonitors}" var="p">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="imgs/productImg/${p.getImg1()}" alt="">
                                            <div class="product-label">
                                                <span class="new">NEW</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${p.getProduct().getCategory()}</p>

                                            <h3 class="product-name"><a
                                                    href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                            </h3>


                                            <c:choose>
                                                <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                    <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:set var="finalPrice" value="${p.getPrice()}"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <h4 class="product-price">$${finalPrice}
                                                <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                    <del
                                                            class="product-old-price">$${p.getPrice()}
                                                    </del>
                                                </c:if>
                                            </h4>

                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>

                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i
                                                        class="fa fa-heart-o"></i><span
                                                        class="tooltipp">add to wishlist</span></button>
                                                <button class="add-to-compare"><i
                                                        class="fa fa-exchange"></i><span
                                                        class="tooltipp">add to compare</span></button>
                                                <button class="quick-view"><i class="fa fa-eye"></i><span
                                                        class="tooltipp">quick view</span></button>
                                            </div>

                                        </div>


                                        <div class="add-to-cart">
                                            <a class="add-to-cart-btn" href="cart?action=AddToCart&&pid=${p.getProduct().getId()}"><i
                                                    class="fa fa-shopping-cart"></i> add to cart
                                            </a>
                                        </div>
                                    </div>
                                    <c:set var="idx" value="${idx + 1}"/>
                                </c:forEach>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION TOPSELLING-->

<!-- SECTION WIDGET-->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">TOP MONITOR</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <!-- product widget -->
                        <c:forEach items="${pdMonitors}" var="p" begin="0" end="2">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>


                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <c:forEach items="${pdMonitors}" var="p" begin="3" end="5">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>

                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->


                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top KEYBOARD</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <c:forEach items="${pdKeyBoard}" var="p" begin="0" end="2">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>

                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <c:forEach items="${pdKeyBoard}" var="p" begin="3" end="5">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>

                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->


                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top HEADPHONE</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        <!-- product widget -->
                        <c:forEach items="${pdHeadPhone}" var="p" begin="0" end="2">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>

                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->
                    </div>

                    <div>
                        <c:forEach items="${pdHeadPhone}" var="p" begin="3" end="5">
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="imgs/productImg/${p.getImg1()}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getProduct().getCategory()}</p>
                                    <h3 class="product-name"><a
                                            href="./view_product?pid=${p.getProduct().getId()}">${p.getProduct().getName()}</a>
                                    </h3>

                                    <c:choose>
                                        <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <c:set var="finalPrice" value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:set var="finalPrice" value="${p.getPrice()}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <h4 class="product-price">$${finalPrice}
                                        <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                            <del
                                                    class="product-old-price">$${p.getPrice()}
                                            </del>
                                        </c:if>
                                    </h4>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /product widget -->


                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>


    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<%@include file="../commons/newsletter.jsp" %>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<%@include file="../commons/footer.jsp" %>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>
