<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Alpha Electro | About Us</title>
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



<%--  ABOUT SECTION--%>
<section class="about">

    <div class="container">
        <div class="row">

            <div class="image col-md-6 col-12">
                <img src="imgs/userImg/about-img.svg" alt="">
            </div>

            <div class="content col-md-6 col">
                <h3>why choose us?</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam veritatis minus et similique
                    doloribus?
                    Harum molestias tenetur eaque illum quas? Obcaecati nulla in itaque modi magnam ipsa molestiae ullam
                    consequuntur.</p>
                <a href="#newsletter" class="btn primary-btn">contact us</a>
            </div>

        </div>
    </div>

</section>

<section class="reviews">

    <div class="reviews-slider container">
        <h1 class="heading">Client's reviews</h1>

        <div class="fade in active review-wrapper row" data-nav="#slick-nav-2">

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-1.png" alt="">
                <p>Great selection, competitive prices, and easy checkout. Electro's website is my go-to for all my electronic needs.</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Chirst Sam</h3>
            </div>

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-2.png" alt="">
                <p>User-friendly interface, quick delivery, and top-notch products. Electro's website never disappoints!</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Lioe nemesi</h3>
            </div>

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-3.png" alt="">
                <p>Impressive range of electronics, hassle-free ordering, and prompt shipping. Highly recommended!</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Hanabi Doe</h3>
            </div>

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-4.png" alt="">

                <p>Satisfied with my purchase from Electro's website. Excellent service and quality products</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Matib Meroki</h3>
            </div>

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-5.png" alt="">

                <p>Electro's website is a tech lover's dream. Found exactly what I needed and had a smooth shopping experience.</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Alex Sander</h3>
            </div>

            <div class="swiper-slide slide">
                <img src="imgs/userImg/pic-6.png" alt="">

                <p>Efficient website, reliable shipping, and great customer support. Electro's website exceeded my expectations.</p>
                <div class="stars">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <h3>Swmitch</h3>
            </div>

        </div>


        <div id="slick-nav-2" class="products-slick-nav"></div>

    </div>
</section>

<%-- / ABOUT SECTION--%>

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
