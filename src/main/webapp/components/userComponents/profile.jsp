<%--
  Created by IntelliJ IDEA.
  User: DOANCONGHUUNGHIA
  Date: 5/26/2023
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Personal Profile</title>

    <link rel="icon" href="/imgs/logo.png">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="./css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="./css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="./css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <!-- Custom stlylesheet -->
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- HEADER -->
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
                        <a href="#" class="logo">
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
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <div class="qty">2</div>
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
<!-- /HEADER -->

<div class="body-container">
    <div class="body-container__profile">
        <div class="profile__header">
            <h3 class="profile__heading">My Profile</h3>
            <div class="profile__title">Manage profile information for account security</div>
        </div>
        <div class="profile__body">
            <form action="profileCustomer" method="post" class="profile__form" id="form-profile">
                <div class="form__group">
                    <label for="fullname" class="form__label">Fullname</label>
                    <input name="fullname" id="fullname" class="form__input" type="text" value="${infomation.name}"
                           required/>
                </div>
                <div class="form__group">
                    <label for="email" class="form__label">Email</label>
                    <input name="email" id="email" class="form__input" type="text" value="${infomation.email}"
                           readonly required/>
                </div>
                <div class="form__group">
                    <label for="phonenumber" class="form__label">Phone number</label>
                    <input name="phonenumber" id="phonenumber" class="form__input" type="text" value="${infomation.phone}"
                           required/>
                </div>
                <div class="form__group">
                    <label for="address" class="form__label">Address</label>
                    <input name="address" id="address" class="form__input" type="text"
                           value="${infomation.address}" required/>
                </div>
                <div class="form__group">
                    <label class="form__label">Gender</label>
                    <div class="form__group-inside">
                        <div>
                            <input name="gender" class="form__check" id="male" type="radio" value="Male"/>
                            <span class="checkmark"></span>
                            <label for="male" class="">Male</label>
                        </div>

                        <div>
                            <input name="gender" class="form__check" id="female" type="radio" value="Female"/>
                            <span class="checkmark"></span>
                            <label for="female" class="">Female</label>
                        </div>

                        <div>
                            <input name="gender" class="form__check" id="orther" type="radio" value="Orther"/>
                            <span class="checkmark"></span>
                            <label for="orther" class="">Orther</label>
                        </div>
                    </div>
                </div>
                <div class="form__group">
                    <label class="form__label">BirthDay</label>
                    <div class="form__group-inside">
                        <div>
                            <label for="year" class=""></label>
                            <select class="form__select" name="year" id="year" size="1">
                            </select>
                        </div>

                        <div>
                            <label for="month" class=""></label>
                            <select class="form__select" name="month" id="month" size="1">
                            </select>
                        </div>

                        <div>
                            <label for="day" class=""></label>
                            <select class="form__select" name="day" id="day" size="1">
                                <option value=" " selected="selected">-- Day --</option>
                            </select>
                        </div>
                    </div>
                </div>
                <button class="btn form__btn">Save</button>
            </form>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
                            ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i
                            class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/slick.min.js"></script>
<script src="./js/nouislider.min.js"></script>
<script src="./js/jquery.zoom.min.js"></script>
<script src="./js/main.js"></script>

<script>
    $(function () {
        //Năm tự động điền vào select
        var seYear = $('#year');
        var date = new Date();
        var cur = date.getFullYear();

        seYear.append('<option value="">-- Year --</option>');
        for (i = cur; i >= 1900; i--) {
            seYear.append('<option value="' + i + '">' + i + '</option>');
        }
        ;

        //Tháng tự động điền vào select
        var seMonth = $('#month');
        var date = new Date();

        var month = new Array();
        month[1] = "January";
        month[2] = "February";
        month[3] = "March";
        month[4] = "April";
        month[5] = "May";
        month[6] = "June";
        month[7] = "July";
        month[8] = "August";
        month[9] = "September";
        month[10] = "October";
        month[11] = "November";
        month[12] = "December";

        seMonth.append('<option value="">-- Month --</option>');
        for (i = 12; i > 0; i--) {
            seMonth.append('<option value="' + i + '">' + month[i] + '</option>');
        }
        ;

        //Ngày tự động điền vào select
        function dayList(month, year) {
            var day = new Date(year, month, 0);
            return day.getDate();
        }

        $('#year, #month').change(function () {
            //Đoạn code lấy id không viết bằng jQuery để phù hợp với đoạn code bên dưới
            var y = document.getElementById('year');
            var m = document.getElementById('month');
            var d = document.getElementById('day');

            var year = y.options[y.selectedIndex].value;
            var month = m.options[m.selectedIndex].value;
            var day = d.options[d.selectedIndex].value;
            if (day == ' ') {
                var days = (year == ' ' || month == ' ') ? 31 : dayList(month, year);
                d.options.length = 0;
                d.options[d.options.length] = new Option('-- Day --', ' ');
                for (var i = 1; i <= days; i++)
                    d.options[d.options.length] = new Option(i, i);
            }
        });
    });
</script>
</body>
</html>

