
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication Page</title>

    <!--Css link-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="modal__auth">
        <div class="container ${addClass}" id="container">
            <!-- sign up -->
            <div class="m-col-1 container__form container__sign-up">
                <form action="signupCustomer" method="post" class="form" id="form-sign-up">
                    <h1 class="form__heading"><span>Create</span> Account</h1>
                    <div class="form__social">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                    <span class="form__decs">or use your email for registration</span>
                    <span class="form__msg">${messSignup}</span>

                    <div class="form__group">
                        <input name="fullname" id="fullname" class="form__input" type="text" placeholder="FullName" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__group">
                        <input name="email" id="email" class="form__input" type="email" placeholder="Email" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__group">
                        <input name="phonenumber" id="phonenumber" class="form__input" type="tel" placeholder="Phone number" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__group">
                        <input name="password" id="password" class="form__input" type="password" placeholder="Password" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__group">
                        <input name="password-comfirmation" id="password-comfirmation" class="form__input" type="password" placeholder="Password comfirmation" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__switch">
                        <div></div>
                        <a href="loginCustomer" class="form__switch-sign-in-btn" id="signIn-t-m">Sign in</a>
                    </div>

                    <button class="btn form__btn" type="submit">Sign Up</button>
                </form>
            </div>
            <!-- sign in -->
            <div class="m-col-1 container__form container__sign-in">
                <form action="loginCustomer" method="post" class="form" id="form-sign-in">
                    <h1 class="form__heading"><span>Sign</span> in</h1>
                    <div class="form__social">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                    <span class="form__decs">or use your account</span>
                    <span class="form__msg">${messLogin}</span>

                    <div class="form__group">
                        <input id="email" name="email" class="form__input" value="${email}" type="email" placeholder="Email" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__group">
                        <input id="password" name="password" class="form__input" value="${password}" type="password" placeholder="Password" />
                        <span class="form__msg"></span>
                    </div>

                    <div class="form__switch">
                        <a class="form__forgot-password" href="forgotpassword.html">Forgot your password?</a>
                        <a href="signupCustomer" class="form__switch-sign-up-btn" id="signUp-t-m">Sign up</a>
                    </div>
                    <button class="btn form__btn" type="submit">Sign In</button>
                </form>
            </div>
            <!-- overlay -->
            <div class="container__overlay">
                <div class="overlay">
                    <div class="overlay__panel overlay__left">
                        <h1 class="overlay__heading"><span>Welcome</span> Back!</h1>
                        <p class="description-overlay">To keep connected with us please login with your personal info</p>
                        <a href="loginCustomer" class="btn ghost" id="signIn">Sign In</a>
                    </div>
                    <div class="overlay__panel overlay__right">
                        <h1 class="overlay__heading"><span>Hello,</span> Friend!</h1>
                        <p class="description-overlay">Enter your personal details and start journey with us</p>
                        <a href="signupCustomer" class="btn ghost" id="signUp">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/login.js" type="text/javascript"></script>
    <script src="js/validator.js" type="text/javascript"></script>
    <script>

        Validator({
            form: '#form-sign-up',
            formGroupSelector: '.form__group',
            erorrSelector: '.form__msg',
            password: '#form-sign-up #password',
            confirmPassword: '#form-sign-up #password-comfirmation',
            rules: [
                Validator.isRequired('#fullname', 'Please enter your full name'),
                Validator.isRequired('#email', 'Please enter your email address'),
                Validator.isEmail('#email'),
                Validator.isRequired('#phonenumber', 'Please enter your phone number'),
                Validator.isPhoneNumber('#phonenumber'),
                Validator.isRequired('#password', 'Please enter your password'),
                Validator.isPassword('#password', 8),
                Validator.isConfirmedPassword('#password', function () {
                    return document.querySelector('#form-sign-up #password-comfirmation').value;
                }, 'Password and Comfirmpassword must be the same'),
                Validator.isRequired('#password-comfirmation'),
                Validator.isConfirmed('#password-comfirmation', function () {
                    return document.querySelector('#form-sign-up #password').value;
                }, 'Password and Comfirmpassword must be the same'),
            ],
            //			onSubmit: function (data) {
            //				// call API
            //				console.log(data);
            //			}
        });

        Validator({
            form: '#form-sign-in',
            formGroupSelector: '.form__group',
            erorrSelector: '.form__msg',
            rules: [
                Validator.isRequired('#email', 'Enter your email address to sign in'),
                Validator.isEmail('#email'),
                Validator.isRequired('#password', 'Enter your password to sign in'),
                Validator.isPassword('#password', 8),
            ],
            //			onSubmit: function (data) {
            //				// call API
            //				console.log(data);
            //			}
        });

    </script>
</body>
</html>
