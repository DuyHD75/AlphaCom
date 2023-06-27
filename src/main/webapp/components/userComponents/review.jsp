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
    <form action="execute_payment" method="post">
        <div class="transaction-details">
            <input type="hidden" name="paymentId" value="123" />
            <input type="hidden" name="PayerID" value="1" />

            <div class="detail-row">
                <label>Description:</label>
                <span>Product1 x 2 | Product 2 x 5</span>
            </div>
            <div class="detail-row">
                <label>Subtotal:</label>
                <span>1000 USD</span>
            </div>
            <div class="detail-row">
                <label>Shipping:</label>
                <span>0 USD</span>
            </div>
            <div class="detail-row">
                <label>Tax:</label>
                <span>0 USD</span>
            </div>
            <div class="detail-row">
                <label>Total:</label>
                <span>1000 USD</span>
            </div>
        </div>
        <div class="payer-info">
            <div class="detail-row">
                <label>First Name:</label>
                <span>Nin</span>
            </div>
            <div class="detail-row">
                <label>Last Name:</label>
                <span>Lê Hoàng</span>
            </div>
            <div class="detail-row">
                <label>Email:</label>
                <span>ninlh123@gmail.com</span>
            </div>
        </div>
        <div class="shipping-address">
            <div class="detail-row">
                <label>Recipient Name:</label>
                <span>Lê Hoàng Nin</span>
            </div>
            <div class="detail-row">
                <label>Line 1:</label>
                <span>line1</span>
            </div>
            <div class="detail-row">
                <label>City:</label>
                <span>town 1</span>
            </div>
            <div class="detail-row">
                <label>State:</label>
                <span>đà nẵng</span>
            </div>
            <div class="detail-row">
                <label>Country Code:</label>
                <span>VN</span>
            </div>
            <div class="detail-row">
                <label>Postal Code:</label>
                <span>555700</span>
            </div>
        </div>
        <div class="submit-row">
            <input type="submit" value="Pay Now" />
        </div>
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
                <td>Company ABC Ltd.</td>
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
        <input type="submit" value="Print Receipt" onclick="window.print()"/>
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

