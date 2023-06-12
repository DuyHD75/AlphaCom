<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>


</head>
<body>


<!-- HEADER -->
<%@include file="../commons/header.jsp" %>
<!-- /HEADER -->
<!-- NAVIGATION -->
<%@include file="../commons/navigationbar.jsp" %>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                    <li><a href="./store?category=${category}">${category} Categories</a></li>
                    <c:choose>
                        <c:when test="${category != null}">
                            <li class="active" id="breadcrumb-item">${category} ( ${products.size()} Results )</li>
                        </c:when>
                        <c:when test="${searchKey != null}">
                            <li class="active" id="breadcrumb-item">Search ${searchKey} ( ${products.size()} Results )
                            </li>
                        </c:when>
                    </c:choose>

                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->


<!-- SECTION CATEGORY -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Categories</h3>
                    <div class="checkbox-filter">

                        <c:set var="idx" value="1"/>
                        <c:forEach items="${categories}" var="cate">
                            <div class="input-radio">
                                <a href="./store?category=${cate.getCategory_name()}">

                                        <%-- THE CATEGORY IS CHECKED --%>
                                    <c:if test="${category == cate.getCategory_name()}">
                                        <input type="radio" name="category" id="category_checked"
                                               value="${cate.getCategory_name()} checked=" checked">
                                        <label for="category">
                                            <span></span>
                                                ${cate.getCategory_name()}
                                            <small>(${products.size()})</small>
                                        </label>
                                    </c:if>

                                        <%-- THE CATEGORY IS CHECKED --%>
                                    <c:if test="${category != cate.getCategory_name()}">
                                        <label for="category">
                                            <span></span>
                                                ${cate.getCategory_name()}
                                            <small></small>
                                        </label>
                                    </c:if>

                                </a>
                            </div>
                            <c:set var="idx" value="${idx + 1}"/>
                        </c:forEach>

                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Price</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>
                        <div class="input-number price-min">
                            <input id="price-min" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span> - </span>
                        <div class="input-number price-max">
                            <input id="price-max" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->


                <!-- aside Widget PRODUCT  -->
                <div class="aside">
                    <h3 class="aside-title">Top selling</h3>

                    <c:set var="idx" value="0"/>

                    <c:forEach items="${products}" var="product" begin="0" end="2">

                        <div class="product-widget">
                            <div class="product-img">
                                <img src="imgs/productImg/${product.getImg1()}" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"
                                   id="product-category">${product.getProduct().getCategory()}</p>
                                <h3 class="product-name"><a
                                        href="./view_product?pid=${product.getProduct().getId()}">${product.getProduct().getName()}</a>
                                </h3>

                                <c:choose>
                                    <c:when test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == product.getProduct().getId()}">
                                        <c:set var="finalPrice"
                                               value="${Math.ceil(product.getPrice() - (product.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:set var="finalPrice" value="${product.getPrice()}"/>
                                    </c:otherwise>
                                </c:choose>

                                <h4 class="product-price">$${finalPrice}
                                    <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == product.getProduct().getId()}">
                                        <del
                                                class="product-old-price">$${product.getPrice()}
                                        </del>
                                    </c:if>
                                </h4>
                            </div>

                        </div>
                        <c:set var="idx" value="${idx + 1}"/>
                    </c:forEach>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->


            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select" id="price-order">
                                <option value="2" selected>Select Option Sort</option>
                                <option value="0">Price Increaing</option>
                                <option value="1">Price Decreasing</option>
                            </select>
                        </label>


                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                <!-- /store top filter -->

                <!-- store products -->
                <%-- PAGICINATION--%>


                <c:set var="pageSize" value="6"/>
                <c:set var="size" value="1"/>

                <c:set var="totalpages" value="${Math.ceil(products.size() / 6)}"/>


                <fmt:parseNumber var="totalpagesInt" value="${totalpages}" integerOnly="true"/>
                <c:set var="totalpages" value="${totalpagesInt}"/>


                <c:set var="currpage" value="${size eq null ? 1 : size}"/>

                <c:set var="beginIdx" value="${(currpage -1) * pageSize}"/>
                <c:set var="endIdx" value="${currpage * pageSize -1}"/>


                <input type="hidden" value="${totalpages}" id="total_pages">

                <input type="hidden" value="${category}" id="category_value">
                <%-- PAGICINATION--%>

                <%-- SET THE INDEX OF DISCOUNT LIST--%>
                <c:set var="idx" value="0"/>


                <div class="row" id="store-list">
                    <!-- product -->
                    <div class="store_list_container">
                        <c:forEach items="${products}" var="p" begin="${beginIdx}" end="${endIdx}">

                            <div class="col-md-4 col-xs-6">
                                <div class="product">


                                    <div class="product-img">
                                        <img src="imgs/productImg/${p.getImg1()}" alt="">
                                        <div class="product-label">
                                            <c:if test="${pdDiscount != null && pdDiscount.size() > idx && pdDiscount.get(idx).getPid() == p.getProduct().getId()}">
                                                <span class="sale">${pdDiscount.get(idx).getDis_amount() * 100} %</span>
                                            </c:if>
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
                                                <c:set var="finalPrice"
                                                       value="${Math.ceil(p.getPrice() - (p.getPrice() * pdDiscount.get(idx).getDis_amount()))}"/>
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
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                    class="tooltipp">add to wishlist</span></button>
                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                    class="tooltipp">add to compare</span></button>
                                            <button class="quick-view"
                                                    href="./view_product?pid=${p.getProduct().getId()}"><i
                                                    class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <form action="./cart?action=storeAddToCart&&pid=${p.getProduct().getId()}"
                                              method="post">
                                            <button class="add-to-cart-btn"><i
                                                    class="fa fa-shopping-cart"></i> add to cart
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <c:set var="idx" value="${idx + 1}"/>
                        </c:forEach>
                    </div>
                    <!-- /product -->
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->

                <%-- TEST PAGE--%>
                <div class="store-filter clearfix">
                    <span class="store-qty">Showing ${category != null ? "all" : category} products</span>
                    <ul class="store-pagination" id="store-pagination">
                        <li id="nav-page-prev" value="${currpage - 1}">
                            <a href="#">
                                <i class="fa fa-angle-left"></i>
                            </a>
                        </li>

                        <li class="active" id="curr_page">${currpage}</li>

                        <li id="nav-page-next" value="${currpage + 1}">
                            <a href="#">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <%-- TEST PAGE--%>

                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
            <%--  / ROW--%>
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->
</div>

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
