<%--
  Created by IntelliJ IDEA.
  User: Le_Nin
  Date: 6/22/2023
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Alpha Electro | Personal Profile</title>

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

  <style>
    .show {
      display: block;
    }
    .hide {
      display: none;
    }


    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 0;
    }

    .container-review {
      max-width: 600px;
      margin: 20px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 24px;
      margin-bottom: 20px;
      text-align: center;
    }

    form {
      text-align: left;
    }

    .detail-row {
      display: flex;
      margin-bottom: 10px;
    }

    .detail-row label {
      flex: 0 0 150px;
      font-weight: bold;
    }

    .detail-row span {
      flex: 1;
    }

    .submit-row {
      margin-top: 20px;
      text-align: center;
    }

    input[type="submit"] {
      padding: 10px 20px;
      font-size: 16px;
      background-color: var(--main-color);
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: var(--red);
    }
  </style>

</head>
<body>

<%@include file="../../components/commons/header.jsp" %>
<%@include file="../../components/commons/navigationbar.jsp" %>


<div class="container-review ${hide}">
  <h1>Please Review Before Paying</h1>
  <form action="paypalPayment?action=receipt" method="post">
    <div class="transaction-details">
      <input type="hidden" name="paymentId" value="${param.paymentId}" />
      <input type="hidden" name="PayerID" value="${param.PayerID}" />

      <div class="detail-row">
        <label>Description:</label>
        <span>${transaction.description}</span>
      </div>
      <div class="detail-row">
        <label>Subtotal:</label>
        <span>${transaction.amount.details.subtotal} USD</span>
      </div>
      <div class="detail-row">
        <label>Shipping:</label>
        <span>${transaction.amount.details.shipping} USD</span>
      </div>
      <div class="detail-row">
        <label>Tax:</label>
        <span>${transaction.amount.details.tax} USD</span>
      </div>
      <div class="detail-row">
        <label>Total:</label>
        <span>${transaction.amount.total} USD</span>
      </div>
    </div>
    <div class="payer-info">
      <div class="detail-row">
        <label>First Name:</label>
        <span>${payer.firstName}</span>
      </div>
      <div class="detail-row">
        <label>Last Name:</label>
        <span>${payer.lastName}</span>
      </div>
      <div class="detail-row">
        <label>Email:</label>
        <span>${payer.email}</span>
      </div>
    </div>
    <div class="shipping-address">
      <div class="detail-row">
        <label>Recipient Name:</label>
        <span>${shippingAddress.recipientName}</span>
      </div>
      <div class="detail-row">
        <label>Line 1:</label>
        <span>${shippingAddress.line1}</span>
      </div>
      <div class="detail-row">
        <label>City:</label>
        <span>${shippingAddress.city}</span>
      </div>
      <div class="detail-row">
        <label>State:</label>
        <span>${shippingAddress.state}</span>
      </div>
      <div class="detail-row">
        <label>Country Code:</label>
        <span>${shippingAddress.countryCode}</span>
      </div>
      <div class="detail-row">
        <label>Postal Code:</label>
        <span>${shippingAddress.postalCode}</span>
      </div>
    </div>
    <div class="submit-row">
      <input type="submit" value="Pay Now" />
    </div>
    <input type="hidden" name="pid" value="${pid}">
    <input type="hidden" name="price" value="${price}">
    <input type="hidden" name="amount" value="${amount}">
  </form>
</div>

<div class="container-review hide ${show}">
  <div align="center">
    <h1 style="color: green">Payment Done. Thank you for purchasing our products</h1>
    <br/>
    <h2>Receipt Details:</h2>
    <table>
      <tr>
        <td><b>Merchant:</b></td>
        <td>Alpha Electro</td>
      </tr>
      <tr>
        <td><b>Payer:</b></td>
        <td>${payer.firstName} ${payer.lastName}</td>
      </tr>
      <tr>
        <td><b>Description:</b></td>
        <td>${transaction.description}</td>
      </tr>
      <tr>
        <td><b>Subtotal:</b></td>
        <td>${transaction.amount.details.subtotal} USD</td>
      </tr>
      <tr>
        <td><b>Shipping:</b></td>
        <td>${transaction.amount.details.shipping} USD</td>
      </tr>
      <tr>
        <td><b>Tax:</b></td>
        <td>${transaction.amount.details.tax} USD</td>
      </tr>
      <tr>
        <td><b>Total:</b></td>
        <td>${transaction.amount.total} USD</td>
      </tr>
    </table>
  </div>
  <div class="submit-row">
    <a type="submit" value="View Order" href="order?action=viewLastOrder">View Order</a>
  </div>
</div>



      <p>
        &nbsp;
      </p>
      <footer class="footer">
        <p>&copy; VNPAY 2020</p>
      </footer>
    </div>
  </div>
  <div class="submit-row">
    <a type="submit" value="View Order" href="order?action=viewLastOrder">View Order</a>
  </div>
</div>
<!-- FOOTER -->

<%@include file="../../components/commons/newsletter.jsp"%>
<%@include file="../../components/commons/footer.jsp"%>

<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/slick.min.js"></script>
<script src="./js/nouislider.min.js"></script>
<script src="./js/jquery.zoom.min.js"></script>
<script src="./js/main.js"></script>
<script src="js/validator.js"></script>

<script>

</script>
</body>
</html>