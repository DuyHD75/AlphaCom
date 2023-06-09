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

    <title>Alpha Electro | WishList</title>

    <%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <%--    <link href="/css/wishList.css" rel="stylesheet">--%>


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
</head>
<body>
<%@include file="../commons/header.jsp" %>
<!-- HEADER -->
<%@include file="../commons/navigationbar.jsp" %>
<!-- /NAVIGATION -->
<!-- PAGE CONTENT-->

<!-- PAGE CONTENT-->

<div class="container" style="margin-top: 50px">

    <div class="row">
        <c:forEach items="${DiscountAvailable}" var="disListAvai" varStatus="loop">
            <div class="col-xs-12 col-md-6 bootstrap snippets bootdeys">
                <!-- product -->
                <div class="product-content product-wrap clearfix">
                    <div class="row">
                        <div class="col-md-5 col-sm-12 col-xs-12">
                            <div class="product-image">
                                <img src="imgs/productImg/${disListAvai.getImg()}" alt="194x228" class="img-responsive">

                                </span>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-deatil">
                                <h5 class="name">
                                    <a href="#">
                                            ${disListAvai.getProduct_name()}
                                    </a>
                                </h5>
                                <p class="price-container">
                                <h4 class="product-price" style="color: #D10024">
                                    $${count.get(loop.index)}
                                        <%--                                ${disList.get(disList.indexOf(disListAvai)).getDis_amount()}--%>
                                        <%--                                <%--%>
                                        <%--                                    List<ProductDiscount> discountList = (ArrayList<ProductDiscount>)request.getAttribute("disList");--%>
                                        <%--                                    discountList.indexOf()--%>
                                        <%--                                %>--%>
                                    <del
                                            class="product-old-price" style="color: black; font-size:80%">$${disListAvai.getPrice()}

                                    </del>
                                </h4>
                                </p>



                                <span class="tag1"></span>
                            </div>
                                <%--                        <div class="description">--%>
                                <%--                            <p>Proin in ullamcorper lorem. Maecenas eu ipsum </p>--%>
                                <%--                        </div>--%>
                            <div class="product-info smart-form">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a href="javascript:void(0);" class="btn btn-success"
                                           style="background-color: #D10024; border-color: black ">Add to cart</a>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div class="rating" style="color: red">
                                            <display:column>
                                                <c:choose>
                                                    <c:when test="${wishList.getRating()==1}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i> </c:when>
                                                    <c:when test="${wishList.getRating()==2}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i></c:when>
                                                    <c:when test="${wishList.getRating()==3}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i></c:when>
                                                    <c:when test="${wishList.getRating()==4}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star-o "></i>
                                                    </c:when>
                                                    <c:when test="${wishList.getRating()==5}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star "></i></c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-star-o"></i></label>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <br>
                                    <a href="wishList?action=deleteFromWishList&&pid=${disListAvai.getProduct_id()}">delete</a>
<%--                                    <form action="wishList?action=deleteFromWishList&&pid=${disListAvai.getProduct_id()}"--%>
<%--                                          method="post">--%>
<%--                                        <input type="submit" value="delete">--%>
<%--                                    </form>--%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end product -->
            </div>
        </c:forEach>
        <c:forEach items="${list}" var="wishList">
            <div class="col-xs-12 col-md-6 bootstrap snippets bootdeys">
                <!-- product -->
                <div class="product-content product-wrap clearfix">
                    <div class="row">
                        <div class="col-md-5 col-sm-12 col-xs-12">
                            <div class="product-image">
                                <img src="imgs/productImg/${wishList.getImg()}" alt="194x228" class="img-responsive">

                                </span>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-12 col-xs-12">
                            <div class="product-deatil">
                                <h5 class="name">
                                    <a href="#">
                                            ${wishList.getProduct_name()}
                                    </a>
                                </h5>
                                <p class="price-container">
                                <h4 class="product-price" style="color: #D10024">$${wishList.getPrice()}
                                    <del
                                            class="product-old-price" style="color: black; font-size:80%">

                                    </del>
                                </h4>
                                </p>



                                <span class="tag1"></span>
                            </div>
                                <%--                        <div class="description">--%>
                                <%--                            <p>Proin in ullamcorper lorem. Maecenas eu ipsum </p>--%>
                                <%--                        </div>--%>
                            <div class="product-info smart-form">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a href="javascript:void(0);" class="btn btn-success"
                                           style="background-color: #D10024; border-color: black ">Add to cart</a>
                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <div class="rating" style="color: red">
                                            <display:column>
                                                <c:choose>
                                                    <c:when test="${wishList.getRating()==1}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i> </c:when>
                                                    <c:when test="${wishList.getRating()==2}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i></c:when>
                                                    <c:when test="${wishList.getRating()==3}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i></c:when>
                                                    <c:when test="${wishList.getRating()==4}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star-o "></i>
                                                    </c:when>
                                                    <c:when test="${wishList.getRating()==5}">
                                                        <i class="fa fa-star"></i></label>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star "></i>
                                                        <i class="fa fa-star "></i></c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-star-o"></i></label>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o "></i>
                                                        <i class="fa fa-star-o "></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <br>
                                    <form action="wishList?action=deleteFromWishList&&pid=${wishList.getProduct_id()}"
                                          method="post">
                                        <input type="submit" value="delete">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end product -->
            </div>
        </c:forEach>

    </div>
</div>
<!--// PAGE CONTENT -->
<%--PAGE CONTENT--%>


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


<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
<%--        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"--%>
<%--        crossorigin="anonymous"></script>--%>

</body>
</html>
