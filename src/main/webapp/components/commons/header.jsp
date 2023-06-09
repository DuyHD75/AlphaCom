<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 5/24/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<header>
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
<%--                <li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>--%>
                <c:if test="${sessionScope.acc != null}">
                    <li><a href="./profileCustomer"><i class="fa fa-user-o"></i>${sessionScope.acc.name}</a></li>
                    <li><a href="./logout">Logout</a></li>
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
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="./home" class="logo">
                            <img src="imgs/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Category 01</option>
                                <option value="1">Category 02</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
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
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="../.././img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes
                                                here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00
                                            </h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="../.././img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes
                                                here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00
                                            </h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">View Cart</a>
                                    <a href="#">Checkout <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

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
</html>
