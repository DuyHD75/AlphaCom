<%@ page import="java.util.List" %>
<%@ page import="com.code.alphavn.model.WishListProduct" %>
<%@ page import="com.code.alphavn.model.ProductDiscount" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Le_Nin
  Date: 6/1/2023
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>
<%@include file="../commons/header.jsp" %>
<!-- HEADER -->
<%@include file="../commons/navigationbar.jsp" %>
<!-- /NAVIGATION -->

<!-- PAGE CONTENT-->

<section class="products shopping-cart">
    <div class="container">
        <h3 class="heading">WishList</h3>

        <c:set var="grandTotal" value="0"/>

        <div class="box-container">
            <c:choose>
                <c:when test='${requestScope["list"] != null}'>
                    <c:forEach items="${list}" var="p">

                        <div class="box">
                            <input type="hidden" name="pid" value="${p.getProduct_id()}">

                            <a href="view_product?pid=${p.getProduct_id()}"
                               class="fa fa-eye"></a>


                            <a href="view_product?pid=${p.getProduct_id()}">
                                <img src="imgs/productImg/${p.getImg()}" alt="">
                            </a>


                            <div class="name">${p.getProduct_name()}</div>

                                <div class="flex">
                                    <div class="price">${p.getPrice()}</div>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            <div class="flex">

                            <form action="./cart?action=AddToCart&&pid=${p.getProduct_id()}"
                                  method="post">
                                <input type="submit" value="Add to cart"
                                       class="delete-btn" name="submit_btn">
                            </form>

                            <form action="./wishList?action=deleteFromWishList&&pid=${p.getProduct_id()}"
                                  method="post">
                                <input type="submit" value="delete"
                                       onclick="return confirm('Delete this from WISHLIST?');"
                                       class="delete-btn" name="submit_btn">
                            </form>

                            </div>


                            <c:set var="grandTotal" value="${grandTotal + subTotal}"/>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                        <p class="empty">Empty Products, Shopping now!</p>
                </c:otherwise>
            </c:choose>

        </div>



    </div>

</section>
<!-- PAGE CONTENT-->


<%@include file="../commons/newsletter.jsp" %>
<!-- /NEWSLETTER -->

<!-- FOOTER -->

<%@include file="../commons/footer.jsp" %>
<!-- /FOOTER -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>


</body>
</html>
