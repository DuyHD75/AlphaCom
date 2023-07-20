<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom stlylesheet -->

    <link rel="stylesheet" href="css/style.css">


    <style>
        .form__msg {
            font-size: 12px;
            color: red;
            margin: 0 0 12px 4px;
            line-height: 12px;
            font-weight: 500;
        }
    </style>


</head>
<body>
<%@include file="../commons/header.jsp" %>
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
                    <li><a href="#">${pdDetail.getProduct().getCategory()}</a></li>
                    <li class="active">${pdDetail.getProduct().getName()}</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION Main Product-->
<div class="section product_details">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg1()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg3()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg1()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg2()}" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg1()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg3()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg1()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="imgs/productImg/${pdDetail.getImg2()}" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${pdDetail.getProduct().getName()}</h2>
                    <div>
                        <div class="product-rating">
                            <c:set var="idx" value="0"/>
                            <div class="rating-stars">
                                <c:forEach begin="1" end="${pdRatingReviews.getAvgrating()}">
                                    <i class="fa fa-star"></i>
                                    <c:set var="idx" value="${idx + 1}"/>
                                </c:forEach>

                                <c:if test="${idx < 5}">
                                    <c:set var="idx" value="${5 - idx}"/>
                                    <c:forEach begin="1" end="${idx}">
                                        <i class="fa fa-star-o"></i>
                                    </c:forEach>
                                </c:if>

                            </div>
                        </div>
                        <a class="review-link" href="#tab1">${fn:length(pdReviews)} Review(s) | Add your review</a>
                    </div>


                    <div>
                        <c:choose>
                            <c:when test="${pdDiscount != null}">
                                <c:set var="finalPrice"
                                       value="${Math.ceil(pdDetail.getPrice() - (pdDetail.getPrice() * pdDiscount.getDis_amount()))}"/>
                            </c:when>

                            <c:otherwise>
                                <c:set var="finalPrice" value="${pdDetail.getPrice()}"/>
                            </c:otherwise>
                        </c:choose>

                        <h3 class="product-price">$${finalPrice}
                            <c:if test="${pdDiscount != null}">
                                <del
                                        class="product-old-price">$${pdDetail.getPrice()}
                                </del>
                            </c:if>
                        </h3>
                        <span class="product-available">In Stock</span>
                    </div>
                    <p>${pdDetail.getProduct().getDesc()}</p>



                    <form id="productForm" method="post">
                        <input type="hidden" name="name" value="${pdDetail.getProduct().getName()}">
                        <input type="hidden" name="img" value="${pdDetail.getImg1()}">
                        <input type="hidden" name="price" value="${pdDetail.getPrice()}">
                        <div class="add-to-cart">
                            <div class="qty-label" style="width: 100%; margin-bottom: 28px;">
<%--                                <span style="padding-right:10px; color: var(--black); font-size: 14px; font-weight: 600;">--%>
<%--                                    Available: ${pdDetail.getProduct().getAmount_remaining()}--%>
<%--                                </span>--%>
                                <div class="input-number">
                                    <input id="amountAvailable" name="amount" type="number" value="1" min="1" max="${pdDetail.getProduct().getAmount_remaining()}"/>
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>

                            <div style="display: flex; justify-content: space-around">
                                <c:set var="disabled" value=""/>
                                <c:if test="${pdDetail.getProduct().getAmount_remaining() == 0}">
                                    <c:set var="disabled" value="disabled"/>
                                </c:if>
                                <button type="submit" class="add-to-cart-btn" ${disabled} onclick="addToCart()"><i class="fa fa-shopping-cart"></i>
                                    add to cart
                                </button>

                                <button type="submit" class="add-to-cart-btn" ${disabled} onclick="buyNow()"><i class="fa fa-shopping-cart"></i>
                                    buy now
                                </button>
                            </div>
                        </div>
                    </form>
                  
                    <ul class="product-btns">
                        <li><a href="wishList?action=addToWishList&&pid=${pdDetail.getProduct().getId()}"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Category:</li>
                        <li><a href="#">${pdDetail.getProduct().getCategory()}</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab review -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Reviews (${fn:length(pdReviews)}) </a></li>
                        <li><a data-toggle="tab" href="#tab3">Description</a></li>
                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">


                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>${pdRatingReviews.getAvgrating()}</span>
                                            <c:set var="idx" value="0"/>
                                            <div class="rating-stars">
                                                <c:forEach begin="1" end="${pdRatingReviews.getAvgrating()}">
                                                    <i class="fa fa-star"></i>
                                                    <c:set var="idx" value="${idx + 1}"/>
                                                </c:forEach>

                                                <c:if test="${idx < 5}">
                                                    <c:set var="idx" value="${5 - idx}"/>
                                                    <c:forEach begin="1" end="${idx}">
                                                        <i class="fa fa-star-o"></i>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <c:set var="prg"
                                                           value="${(pdRatingReviews.getRating5()/(pdRatingReviews.getRating1()+pdRatingReviews.getRating2()+pdRatingReviews.getRating3()+pdRatingReviews.getRating4()+pdRatingReviews.getRating5()))*100}"/>
                                                    <div style="width: ${prg}%;"></div>
                                                </div>
                                                <span class="sum">${pdRatingReviews.getRating5()}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <c:set var="prg"
                                                           value="${(pdRatingReviews.getRating4()/(pdRatingReviews.getRating1()+pdRatingReviews.getRating2()+pdRatingReviews.getRating3()+pdRatingReviews.getRating4()+pdRatingReviews.getRating5()))*100}"/>
                                                    <div style="width: ${prg}%;"></div>
                                                </div>
                                                <span class="sum">${pdRatingReviews.getRating4()}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <c:set var="prg"
                                                           value="${(pdRatingReviews.getRating3()/(pdRatingReviews.getRating1()+pdRatingReviews.getRating2()+pdRatingReviews.getRating3()+pdRatingReviews.getRating4()+pdRatingReviews.getRating5()))*100}"/>
                                                    <div style="width: ${prg}%;"></div>
                                                </div>
                                                <span class="sum">${pdRatingReviews.getRating3()}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <c:set var="prg"
                                                           value="${(pdRatingReviews.getRating2()/(pdRatingReviews.getRating1()+pdRatingReviews.getRating2()+pdRatingReviews.getRating3()+pdRatingReviews.getRating4()+pdRatingReviews.getRating5()))*100}"/>
                                                    <div style="width: ${prg}%;"></div>
                                                </div>
                                                <span class="sum">${pdRatingReviews.getRating2()}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <c:set var="prg"
                                                           value="${(pdRatingReviews.getRating1()/(pdRatingReviews.getRating1()+pdRatingReviews.getRating2()+pdRatingReviews.getRating3()+pdRatingReviews.getRating4()+pdRatingReviews.getRating5()))*100}"/>
                                                    <div style="width: ${prg}%;"></div>
                                                </div>
                                                <span class="sum">${pdRatingReviews.getRating1()}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <c:forEach items="${pdReviews}" var="pr">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">${pr.getCus_name()}</h5>
                                                        <p class="date">${pr.getCreate_at()}</p>
                                                        <div class="review-rating">
                                                            <c:set var="idx" value="0"/>
                                                            <div class="rating-stars">
                                                                <c:forEach begin="1" end="${pr.getRating()}">
                                                                    <i class="fa fa-star"></i>
                                                                    <c:set var="idx" value="${idx + 1}"/>
                                                                </c:forEach>

                                                                <c:if test="${idx < 5}">
                                                                    <c:set var="idx" value="${5 - idx}"/>
                                                                    <c:forEach begin="1" end="${idx}">
                                                                        <i class="fa fa-star-o"></i>
                                                                    </c:forEach>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>${pr.getComment()}</p>
                                                    </div>
                                                </li>

                                            </c:forEach>
                                        </ul>
                                        <%--<ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>--%>


                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div>
                                        <form action="" method="post" class="review-form" id="review-form">
                                            <div class="form__group">
                                                <input class="input" type="text" id="name" name="name"
                                                       value="${infomation.name}"
                                                       placeholder="Your Name" readonly>
                                                <span class="form__msg"></span>
                                            </div>
                                            <div class="form__group">
                                                <input class="input" type="email" id="email" name="email"
                                                       value="${infomation.email}" placeholder="Your Email" readonly>
                                                <span class="form__msg"></span>
                                            </div>
                                            <div class="form__group">
                                                    <textarea class="input" id="comment" name="comment"
                                                              placeholder="Your Review"></textarea>
                                                <span class="form__msg"></span>
                                            </div>


                                            <div class="input-rating form__group">

                                                <div class="stars ">
                                                    <span>Your Rating: </span>
                                                    <input id="star5" name="rating" value="5" type="radio"><label
                                                        for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label
                                                        for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label
                                                        for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label
                                                        for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label
                                                        for="star1"></label> <br>

                                                </div>
                                                <br>
                                                <span class="form__msg"></span>
                                            </div>
                                            <div class="form__group hide ${show}">
                                                <input id="otp" name="otp" class="form__input" type="number"
                                                       placeholder="OTP"/>
                                                <span class="form__msg">${message1}</span>
                                            </div>
                                            <button type="submit" class="primary-btn">Submit</button>
                                        </form>
                                        <div class="error-message" style="display:none;">Please select a rating</div>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <p>${pdDetail.getProduct().getDesc()}.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab1  -->
                        <div id="tab3" class="tab-pane fade in ">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <p>${pdDetail.getProduct().getDesc()}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->


                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->


<!-- Section Related product -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12 text-center">
                <div class="section-title">
                    <h3 class="title">Related Products</h3>
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

                                <c:forEach items="${pdCategory}" var="p">
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

                                            <h4 class="product-price">$${p.getPrice()}
                                                <del
                                                        class="product-old-price">$990.00
                                                </del>
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

                                            <form action="cart?action=AddToCart&&pid=${p.getProduct().getId()}&&pidDetail=${pdDetail.getProduct().getId()}"
                                                  method="post">
                                                <button class="add-to-cart-btn"><i
                                                        class="fa fa-shopping-cart"></i> add to cart
                                                </button>
                                            </form>
                                        </div>
                                    </div>

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
<!-- /Section -->

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


<script src="js/validator.js"></script>

<script>
    Validator({
        form: '#review-form',
        formGroupSelector: '.form__group',
        erorrSelector: '.form__msg',

        rules: [
            Validator.isRequiredCheck('input[name="rating"]', 'Please rating'),
            Validator.isRequired('#name', 'Enter your name to review'),
            Validator.isRequired('#email', 'Enter your email address to review'),
            Validator.isEmail('#email'),
            Validator.isRequired('#comment', 'Enter your comment to review'),
        ],
        // onSubmit: function (data) {
        // 	// call API
        // 	console.log(data);
        // }
    });

    function addToCart() {
        document.getElementById('productForm').action = './cart?action=AddToCart&&pid=${pdDetail.getProduct().getId()}&&pidDetail=${pdDetail.getProduct().getId()}';
        document.getElementById('productForm').submit();
    }

    function buyNow() {
        document.getElementById('productForm').action = './checkout?action=BuyNow&&pid=${pdDetail.getProduct().getId()}';
        document.getElementById('productForm').submit();
    }

</script>

</body>
</html>