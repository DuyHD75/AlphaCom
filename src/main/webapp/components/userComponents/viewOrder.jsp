<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>orders</title>
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


    <!-- Custom CSS file link  -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/cart.css">

</head>
<body>

<jsp:include page="../../components/commons/header.jsp"></jsp:include>
<jsp:include page="../../components/commons/navigationbar.jsp"></jsp:include>

<section class="orders" style="margin: 80px 0">
    <div class="container">
        <h1 class="heading">placed orders</h1>
        <h4 style="color: green"> ${success}</h4>
        <h4 style="color: red">  ${warning}</h4>

        <div class="box-container">

            <%--        <c:choose>--%>
            <%--            <c:when test='${requestScope["orders"] != null}'>--%>
            <c:forEach items="${orders}" var="ord">
                <div class="box">
                    <p> Placed on : <span>${ord.getOrderDate()}</span> </p>
                    <p> Name : <span>${ord.getCustomer().getName()}</span> </p>
                    <p> Email : <span>${ord.getCustomer().getEmail()}</span> </p>
                    <p> Phone Number : <span>${ord.getCustomer().getPhone()}</span> </p>
                    <p> Address : <span>${ord.getCustomer().getAddress()}</span> </p>
                    <p> Payment method : <span
                            style="color: ${ord.getPaymentMethod() == "Pending" ? red : green} ">
                            ${ord.getPaymentMethod()}
                    </span>
                    </p>
                    <c:set var="totalPrice" value="0" />
                    <p>Products: <br>
                        <c:forEach items="${ord.getOrderDetail()}" var="orderDetail" >
                                <span>
                                   [ ${orderDetail.getProduct().getProduct().getName()} : ${orderDetail.getPrice()} x ${orderDetail.getQuantityOrdered()}] <br>
                                </span>
                            <c:set  var="totalPrice"
                                    value="${totalPrice + (orderDetail.getPrice() * orderDetail.getQuantityOrdered()) }"/>
                        </c:forEach>
                    </p>

                    <p>Grand Total: <span>${totalPrice}</span></p>
                    <p>Status: <span>${ord.getStatus()}</span></p>
                    <p>
                        <c:set var="PendingStatus" value="Pending"/>
                            <c:choose>
                            <c:when test="${ord.getStatus() == PendingStatus}">
                                <a class="btn" href="order?action=cancelOrder&&oid=${ord.getId()}" onclick="return confirm('Are you sure cancel this order?');">
                                    Cancel Order
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn disabled" href="order?action=cancelOrder&&oid=${ord.getId()}" onclick="return confirm('Are you sure cancel this order?');">
                                    Cancel Order
                                </a>
                            </c:otherwise>
                            </c:choose>
                    </p>
                </div>
            </c:forEach>

            <%--            </c:when>--%>

            <%--        </c:choose>--%>

        </div>
    </div>



</section>


<jsp:include page="../../components/commons/newsletter.jsp"></jsp:include>
<jsp:include page="../../components/commons/footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>




</body>
</html>