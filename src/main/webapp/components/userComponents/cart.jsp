<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopping cart</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
    <link rel="icon" href="imgs/logos/360_F_451269306_U5VVjfXzU2OZLyaLOKmkI73SCwBcjgvF.jpg" type="image/x-icon">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- custom css file link  -->

    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<!-- HEADER -->
<jsp:include page="../../components/commons/header.jsp"></jsp:include>
<jsp:include page="../../components/commons/navigationbar.jsp"></jsp:include>

<section class="products shopping-cart">
    <div class="container">
        <h3 class="heading">shopping cart</h3>

        <c:set var="grandTotal" value="0"/>

        <div class="box-container">
            <c:choose>
                <c:when test='${requestScope["listCart"] != null}'>
                    <c:forEach items="${listCart}" var="cart">

                        <div class="box">
                            <input type="hidden" name="pid" value="${cart.getProductInfo().getProduct().getId()}">

                            <a href="view_product?pid=${cart.getProductInfo().getProduct().getId()}"
                               class="fa fa-eye"></a>


                            <a href="view_product?pid=${cart.getProductInfo().getProduct().getId()}">
                                <img src="imgs/productImg/${cart.getProductInfo().getImg1()}" alt="">
                            </a>


                            <div class="name">${cart.getProductInfo().getProduct().getName()}</div>
                            <form action="cart?action=updateAmountCart&&pid=${cart.getProductInfo().getProduct().getId()}"
                                  method="post">
                                <div class="flex">
                                    <div class="price">${cart.getFinalPrice()}</div>
                                    <input type="number" name="qty" class="qty" min="1" max="${cart.getProductInfo().getProduct().getAmount_remaining()}" onkeypress="if (this.value.length == 2)
                                        return false;" value="${cart.amount}">
                                    <button type="submit" class="fa fa-edit" name="submit_btn"></button>
                                </div>
                            </form>
                            <div class="sub-total">
                                Sub Total :
                                <span>

                                <c:set var="subTotal" value="0"/>
                                <c:forEach begin="1" end="${cart.amount}">
                                    <c:set var="subTotal" value="${subTotal + cart.getFinalPrice()}"/>
                                </c:forEach>
                               ${subTotal}
                            </span>
                            </div>

                            <form action="cart?action=deleteFromCart&&pid=${cart.getProductInfo().getProduct().getId()}"
                                  method="post">
                                <input type="submit" value="delete"
                                       onclick="return confirm('Delete this from cart?');"
                                       class="delete-btn" name="submit_btn">
                            </form>


                            <c:set var="grandTotal" value="${grandTotal + subTotal}"/>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
            <c:if test="${grandTotal == 0}">
                <p class="empty">Empty Products, Shopping now!</p>
            </c:if>
        </div>


        <div class="cart-total">
            <p>Grand Total : <span>${grandTotal}</span></p>
            <a href="store" class="option-btn">Continue shopping</a>

            <a href="cart?action=deletaAllCart" class="delete-btn ${grandTotal > 1 ? "" : "disabled"}"
               onclick="return confirm('delete all from cart?');">delete all item</a>


            <c:set var="disabled" value=""/>

            <c:if test="${overAmount == true}">
                <c:set var="disabled" value="disabled"/>
            </c:if>


            <a href="checkout?action=checkout" class="btn ${disabled} ${grandTotal > 1 ? "" : "disabled"} ">Proceed to
                checkout</a>

        </div>

    </div>

</section>

<jsp:include page="../../components/commons/newsletter.jsp"></jsp:include>
<jsp:include page="../../components/commons/footer.jsp"></jsp:include>


<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>


</body>
</html>