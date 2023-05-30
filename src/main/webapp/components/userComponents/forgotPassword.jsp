<%--
  Created by IntelliJ IDEA.
  User: hoangdat
  Date: 5/25/2023
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password Page</title>
    <!--Css link-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="modal__auth">
    <div class="container" id="container">
        <!-- sign in -->
        <div class="m-col-1 container__form container__forgor-password">
            <form action="forgotPassword" method="post" class="form" id="form-forgor-password">
                <h1 class="form__heading"><span>Forgot</span> password</h1>
                <span class="form__msg">${mess}</span>

                <div class="form__group">
                    <input id="email" name="email" class="form__input" type="email" placeholder="Email" />
                    <span class="form__msg"></span>
                </div>

                <div class="form__switch">
                    <a class="form__back" href="./loginCustomer">Back to Sign in</a>
                </div>

                <button class="btn form__btn" type="submit">Send My Email</button>
            </form>
        </div>
    </div>
</div>

<script src="./assets/js/validator.js"></script>
<script src="./assets/js/change.js"></script>

<script>
    Validator({
        form: '#form-forgor-password',
        formGroupSelector: '.form__group',
        erorrSelector: '.form__msg',
        rules: [
            Validator.isRequired('#email', 'Enter your email address'),
            Validator.isEmail('#email'),
        ],
        // onSubmit: function (data) {
        //     // call API
        //     console.log(data);
        // }
    });
</script>
</body>
</html>