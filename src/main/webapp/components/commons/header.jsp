<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 5/24/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<body>
<%
    String currentPage = request.getRequestURI();
    session.setAttribute("currentPage", currentPage);
%>
<header>
    <c:choose>
        <c:when test="${not empty error}">
            <div class="error" style="background-color: transparent; position: relative">
                <span>${error}</span>
              <i class="fa-solid fa-x" onclick="this.parentElement.remove();"></i>
            </div>
        </c:when>

        <c:when test="${not empty message}">
            <div class="message" style="background-color: #fff">
                <span>${message}</span>
           <i class="fa-solid fa-x" onclick="this.parentElement.remove();"></i>
            </div>
        </c:when>
    </c:choose>

    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +84-3455-77-99</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i>AlphElectro@gmail.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i>1234 Da Nang, Viet Nam</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                <c:if test="${sessionScope.acc != null}">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="cursor: pointer"/>
                            <i class="fa fa-user-o"></i>
                            ${sessionScope.acc.name}
                        </a>
                        <div class="account-dropdown">
                            <div class="account-list">
                                <div class="account-link">
                                    <a href="profileCustomer?action=viewProfile">My profile</a>
                                </div>
                                <div class="account-link">
                                    <a href="profileCustomer?action=changePassword">Change password</a>

                                </div>
                                <div class="account-link">
                                    <a href="order?action=viewOrder">View Order</a>
                                </div>
                                <div class="account-link">
                                    <a href="./logout">Logout</a>
                                </div>
                            </div>

                        </div>
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc == null}">
                    <li><a href="./loginCustomer"><i class="fa fa-user-o"></i>Login </a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3 col-sm-4 col-xs-4">
                    <div class="header-logo">
                      
                        <a href="./home" class="logo">
                          
                            <img src="imgs/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6 hidden-sm hidden-xs">
                    <div class="header-search">

                        <form action="./store?process=3" method="post">
                            <input class="input" placeholder="Search here" name="searchKey">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 col-sm-8 col-xs-8 text-justify clearfix">
                    <div class="header-ctn">

                        <!-- Wishlist -->
                        <div>
                            <a href="./wishList">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <c:if test="${sessionScope.acc == null}">
                                    <div class="qty">0</div>
                                </c:if>
                                <c:if test="${sessionScope.acc != null}">
                                    <div class="qty">${sessionScope.numWish}</div>
                                </c:if>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown ${open}">
                            <%
                                session.removeAttribute("open");
                            %>
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="cursor: pointer"/>
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">
                                    <c:if test="${countProductInCart == null}">0</c:if>
                                    ${countProductInCart}
                                </div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">

                                    <c:if test="${countProductInCart == 0 || countProductInCart == null}">
                                        <h5 style="text-align: center;">There are no products yet. <br> Shop now.</h5>
                                    </c:if>
                                    <c:set var="idx" value="0"/>
                                    <c:forEach var="cart" items="${listCart}">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="imgs/productImg/${cart.getProductInfo().getImg1()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="view_product?pid=${cart.getProductInfo().getProduct().getId()}">${cart.getProductInfo().getProduct().getName()}</a></h3>
                                                <h4 class="product-price"><span class="qty">
                                                    ${cart.amount}  x</span>${cart.getFinalPrice()}
                                                    <a href="cart?action=deleteFromCartHeader&&pid=${cart.getProductInfo().getProduct().getId()}&&pidDetail=${pdDetail.getProduct().getId()}" class="delete" onclick="return confirm('Delete this from cart?');" style="cursor: pointer" >Delete</a>
                                                </h4>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="cart-btns">
                                    <a href="cart?action=viewCart">View Cart</a>
                                    <a href="checkout?action=checkout">Checkout <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Search toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-search"></i>
                                <span>Search</span>
                            </a>
                        </div>
                        <!-- /Search toogle -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
</body>