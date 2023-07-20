<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>

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
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
         #googleMap {
             width: 100%;
             height: 400px;
         }
    </style>

</head>
<body>

<jsp:include page="../../components/commons/header.jsp"></jsp:include>
<jsp:include page="../../components/commons/navigationbar.jsp"></jsp:include>

<section class="checkout-orders">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 billing-address">
                <form action="checkout?action=placedOrder" method="post" id="form-checkout">
                    <h4 class="text-success" style="font-weight: 500;">${msg}</h4>
                    <h3 class="heading">BILLING ADDRESS</h3>

                    <div class="flex">
                        <div class="inputBox">
<%--                            <label>Full name</label>--%>
                            <input id="name" type="text" name="name" placeholder="Enter your name"
                                   value="${infomation.name}"
                                   class="box">
                            <span class="form__msg"></span>
                        </div>


                        <div class="inputBox">
<%--                            <label>Phone Number</label>--%>
                            <input id="phone" type="number" name="number" placeholder="enter your number"
                                   value="${infomation.phone}"
                                   class="box" min="0" max="9999999999" onkeypress="if (this.value.length == 10)
                                               return false;" required>
                            <span class="form__msg"></span>
                        </div>

                        <div class="inputBox">
<%--                            <label>Email</label>--%>
                            <input type="email" name="email" placeholder="enter your email"
                                   value="${infomation.email}"
                                   class="box" maxlength="50" required readonly style="text-transform: none">
                            <span class="form__msg"></span>
                        </div>

                        <div class="inputBox">
                            <%--                            <label>address </label>--%>
                            <input  type="text" placeholder="Enter Your Address"
                                   value="${infomation.address}"
                                   class="box" maxlength="50" required>
                            <span class="form__msg"></span>
                        </div>

                        <div class="inputBox">
<%--                            <label>address </label>--%>
                            <input onchange="calcRoute()" id="flat" type="text" name="flat" placeholder="Enter Your Address"
                                   class="box" maxlength="50" required>
                            <span class="form__msg"></span>
                        </div>
                        <div class="inputBox">
<%--                            <label>address</label>--%>
                            <input type="hidden" id="from" value="Đại học FPT Đà Nẵng, Khu đô thị FPT City, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng, Việt Nam" class="form-control" name="address" >
                            <span class="form__msg"></span>
                        </div>

                        <div class="container">
                            <div id="output"></div>

                            <div class="container-fluid row">
                                <div class="col-sm-12" id="googleMap">

                                </div>
                            </div>
                        </div>


                        <div class="inputBox">
<%--                            <label>payment method</label>--%>
                            <select name="method" id="payment-method" class="box" required onChange="toggleCreditCard()">
                                <option value="Cash On Delivery">Cash On Delivery</option>
                                <option value="PAYPAL">PAYPAL | Credit Card | Debit Card</option>
                                <option value="VNPAY">VNPAY</option>
                            </select>
                            <span class="form__msg"></span>
                        </div>



                        <%--            thêm mới --%>
                        <div style="margin-left: 20px" class="credit_box" id="credit_box">
                            <h4>Chọn phương thức thanh toán</h4>
                            <div class="form-group">
                                <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                                <input type="radio" Checked="True" id="bankCode1" name="bankCode" value="">
                                <label for="bankCode1">Cổng thanh toán VNPAYQR</label><br>

                                <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                                <input type="radio" id="bankCode2" name="bankCode" value="VNPAYQR">
                                <label for="bankCode2">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                                <input type="radio" id="bankCode3" name="bankCode" value="VNBANK">
                                <label for="bankCode3">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                                <input type="radio" id="bankCode4" name="bankCode" value="INTCARD">
                                <label for="bankCode4">Thanh toán qua thẻ quốc tế</label><br>

                            </div>
                            <div class="form-group">
                                <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                                <input type="radio" id="language1" Checked="True" name="language" value="vn">
                                <label for="language1">Tiếng việt</label><br>
                                <input type="radio" id="language2" name="language" value="en">
                                <label for="language2">Tiếng anh</label><br>

                            </div>
                        </div>

                        <%--            <div class="credit_box" id="credit_box">--%>
                        <%--              <div class="inputBox">--%>
                        <%--                <label>Account Number </label>--%>
                        <%--                <input id="accountNumber" type="number" name="accountNumber" placeholder="Enter your account number"--%>
                        <%--                       value=""--%>
                        <%--                       class="box" min="0" max="9999999999" >--%>
                        <%--                <span class="form__msg"></span>--%>
                        <%--              </div>--%>

                        <%--              <div class="inputBox">--%>
                        <%--                <label>Bank Name </label>--%>
                        <%--                <input id="bank_name" type="text" name="bank_name" placeholder="Enter bank name"--%>
                        <%--                       value=""--%>
                        <%--                       class="box" maxlength="50"  >--%>
                        <%--                <span class="form__msg"></span>--%>
                        <%--              </div>--%>
                        <%--            </div>--%>

                        <div class="input-checkbox" style="margin-left: 12px;">
                            <input type="checkbox" id="ExportBill" name="ExportBill">
                            <label for="ExportBill">
                                <span></span>
                                Send bill via my email
                            </label>
                        </div>

                    </div>
                    <input type="hidden" name="pid" value="${pid}">
                    <input type="hidden" name="price" value="${price}">
                    <input type="hidden" name="amount" value="${amount}">
                    <input type="hidden" name="productName" value="${pname}">
                    <input type="hidden" name="isBuyNow" value="${isBuyNow}">
                    <input type="submit" name="order"
                           class="btn primary-btn order-submit"
                           value="place order">

                </form>

            </div>

            <div class="col-md-6 col-sm-12 form-order">
                <div class="orders-container">
                    <div class="section-title text-center">
                        <h3 class="heading" style="font-size: 2.5rem;">Your Order</h3>
                    </div>
                    <div class="display-orders">

                        <c:if test="${pname != null}">
                            <c:set var="totalPro" value="0" />
                            <c:set var="grandTotal" value="0" />
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>PRODUCT</strong></div>
                                    <div><strong>TOTAL</strong></div>
                                </div>
                                <div class="order-list" style="" >
                                    <div class="order-products">
                                        <input type="hidden" name="total_products" value="${totalPro + amount}">
                                        <input type="hidden" name="total_price" value="${price * amount}">

                                        <div class="order-col">
                                            <div> <img src="imgs/productImg/${pimg}" width="40px" height="40px">
                                                    ${amount} x ${pname}
                                            </div>
                                            <div style="color: var(--main-color); font-weight: 700;">${price}</div>
                                        </div>
                                        <c:set var="grandTotal" value="${grandTotal + price * amount}" />

                                    </div>
                                </div>

                                <div class="order-col">
                                    <div><strong>SHIPING</strong></div>
                                    <div><strong>FREE</strong></div>
                                </div>
                                <div class="order-col">
                                    <div><strong>TOTAL</strong></div>
                                    <div><strong class="order-total">${grandTotal}</strong></div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${pname == null}">
                            <c:choose>
                                <c:when test='${requestScope["listCart"] != null}'>
                                    <c:set var="totalPro" value="0" />
                                    <c:set var="grandTotal" value="0" />


                                    <div class="order-summary">
                                        <div class="order-col">
                                            <div><strong>PRODUCT</strong></div>
                                            <div><strong>TOTAL</strong></div>
                                        </div>
                                        <div class="order-list" style="" >
                                            <c:forEach items="${listCart}" var="cart">
                                                <div class="order-products">
                                                    <input type="hidden" name="total_products" value="${totalPro + cart.amount}">
                                                    <input type="hidden" name="total_price" value="${cart.getFinalPrice() * cart.amount}">

                                                    <div class="order-col">
                                                        <div> <img src="imgs/productImg/${cart.getProductInfo().getImg1()}" width="40px" height="40px">
                                                                ${cart.amount} x ${cart.getProductInfo().getProduct().getName()}

                                                        </div>
                                                        <div style="color: var(--main-color); font-weight: 700;">${cart.getFinalPrice()}</div>
                                                    </div>
                                                    <c:set var="grandTotal" value="${grandTotal + cart.getFinalPrice() * cart.amount}" />

                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="order-col">
                                            <div><strong>SHIPING</strong></div>
                                            <div><strong>FREE</strong></div>
                                        </div>
                                        <div class="order-col">
                                            <div><strong>TOTAL</strong></div>
                                            <div><strong class="order-total">${grandTotal}</strong></div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div>
                                        <p class="empty">Do not product!</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                        <div class="input-checkbox">
                            <input type="checkbox" id="terms" checked>
                            <label for="terms">
                                <span></span>
                                I've read and accept the <a href="#">terms & conditions</a>
                            </label>
                        </div>


                    </div>

                </div>


            </div>
        </div>
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
<script src="js/validator.js" type="text/javascript"></script>

<script>
    function toggleCreditCard() {
        const paymentMethod = document.getElementById("payment-method").value;
        const creditBoxs = document.getElementById("credit_box");
        if (paymentMethod === "VNPAY") {
            creditBoxs.style.display = "block";
            // Validator({
            //   form: '#form-checkout',
            //   formGroupSelector: '.inputBox',
            //   erorrSelector: '.form__msg',
            //   rules: [
            //     Validator.isRequired('#accountNumber', "Can't be empty"),
            //     Validator.isRequired('#bank_name', "Can't be empty"),
            //   ],
            // });
        } else {
            creditBoxs.style.display = "none";
            // Validator({
            //   form: '#form-checkout',
            //   formGroupSelector: '.inputBox',
            //   erorrSelector: '.form__msg',
            //   rules: [
            //   ],
            // });
        }
    }
</script>

<script>
    Validator({
        form: '#form-checkout',
        formGroupSelector: '.inputBox',
        erorrSelector: '.form__msg',
        rules: [
            Validator.isRequired('#name', "Your name can't empty"),
            Validator.isRequired('#phone', "Your phone can't empty"),
            Validator.isPhoneNumber('#phone', ''),
            Validator.isRequired('#flat', "Your address can't empty"),
        ],
        //			onSubmit: function (data) {
        //				// call API
        //				console.log(data);
        //			}
    });
</script>

//FOR API GG MAP
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAMo1YG3amcpf-EbK3c70f_YX3T6VJG7Bs&libraries=places"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/GGMapApi.js">
</script>

///
</body>
</html>