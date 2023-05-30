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
    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="./css/login.css">

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        #form-otp i{
            font-size: 140px;
            margin-bottom: 24px;
        }

        .container__otp {
            left: 0;
            right: 0;
            width: 60%;
            margin: auto;
        }

        .hide {
            display: none;
        }

        .show {
            display: block;
        }

    </style>

</head>
<body>
<div class="modal__auth">
    <div class="container" id="container">
        <!-- forgot password -->
        <div class="m-col-1 container__form container__forgor-password ${hide}">
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
<%--        OTP--%>
        <div class="m-col-1 container__form container__otp hide ${show}">
            <form action="ValidateOtp" method="post" class="form" id="form-otp">
                <i class="fa-solid fa-lock"></i>
                <h1 class="form__heading">Enter <span>OTP</span></h1>
                <span class="form__msg" style="color: green">
                    ${message1}
                    <span class="form__msg">${message}</span>
                </span>



                <div class="form__group">
                    <input id="otp" name="otp" class="form__input" type="number" placeholder="OTP" />
                    <span class="form__msg"></span>
                </div>

                <div class="form__switch">
                    <a class="form__back" href="./loginCustomer">Back to Sign in</a>
                </div>

                <button class="btn form__btn" type="submit">Reset Password</button>
            </form>
        </div>
<%--        new password--%>
        <div class="m-col-1 container__form container__forgor-password hide ${show1}">
            <form action="newPassword" method="post" class="form" id="form-change-password">
                <h1 class="form__heading"><span>Change</span> password</h1>

                <div class="form__group">
                    <input name="password" id="password" class="form__input" type="password" placeholder="New password" />
                    <span class="form__msg"></span>
                </div>

                <div class="form__group">
                    <input name="confPassword" id="confPassword" class="form__input" type="password" placeholder="New password comfirmation" />
                    <span class="form__msg"></span>
                </div>

                <div class="form__switch">
                    <a class="form__back" href="./forgotPassword">Back forgot password</a>
                </div>
                <button class="btn form__btn" type="submit">Change password</button>
            </form>
        </div>
    </div>
</div>

<script src="./js/validator.js"></script>

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

    Validator({
        form: '#form-change-password',
        formGroupSelector: '.form__group',
        erorrSelector: '.form__msg',
        password: '#form-change-password #password',
        confirmPassword: '#form-change-password #confPassword',
        rules: [
            Validator.isRequired('#password', 'Please enter your password'),
            Validator.isPassword('#password', 8),
            Validator.isConfirmedPassword('#password', function () {
                return document.querySelector('#form-change-password #confPassword').value;
            }, 'Password and Comfirmpassword must be the same'),
            Validator.isRequired('#confPassword'),
            Validator.isConfirmed('#confPassword', function () {
                return document.querySelector('#form-change-password #password').value;
            }, 'Password and Comfirmpassword must be the same'),
        ],
        // onSubmit: function (data) {
        // 	// call API
        // 	console.log(data);
        // }
    });
</script>
</body>
</html>