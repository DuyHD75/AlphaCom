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
    <link rel="icon" href="imgs/logos/360_F_451269306_U5VVjfXzU2OZLyaLOKmkI73SCwBcjgvF.jpg" type="image/x-icon">

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


         .form__msg {
             font-size: 12px;
             color: red;
             margin: 4px 0 12px 4px;
             line-height: 12px;
             font-weight: 500;
         }
        .form__group-change {
            width: 100%;
            display: flex;
            align-items: baseline;
            flex-wrap: wrap;
        }
    </style>

</head>
<body>

<%@include file="../../components/commons/header.jsp" %>
<%@include file="../../components/commons/navigationbar.jsp" %>


<div class="body-container">
    <div class="body-container__profile ${hide}">

        <div class="profile__header">
            <h3 class="profile__heading">My Profile</h3>
            <div class="profile__title">Manage profile information for account security</div>
        </div>
        <div class="profile__body">
            <form action="profileCustomer?action=updateProfile" method="post" class="profile__form" id="form-profile">
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

    <div class="body-container__profile hide ${show}">
        <div class="profile__header" style="margin-bottom: 16px;">
            <h3 class="profile__heading">Change Password</h3>
            <div class="profile__title">Change Password for account security</div>
        </div>
        <div class="profile__body">
            <span class="form__msg" style="color: green; font-size: 20px;">${success}</span>
            <form action="profileCustomer?action=changePassword" method="post" class="profile__form" id="form-change-password">
                <div class="form__group-change">
                    <input id="oldpassword" name="oldpassword" class="form__input" value="" type="password" placeholder="Old Password" />
                    <h3 class="form__msg" >${msg}</h3>
                </div>
                <div class="form__group-change">
                    <input id="newpassword" name="newpassword" class="form__input" value="" type="password" placeholder="New Password" />
                    <span class="form__msg"></span>
                </div>
                <div class="form__group-change">
                    <input id="confirmnewpassword" name="confirmnewpassword" class="form__input" value="" type="password" placeholder="Comfirm New Password" />
                    <span class="form__msg"></span>
                </div>
                <button class="btn form__btn">Save</button>
            </form>
        </div>
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

    Validator({
        form: '#form-change-password',
        formGroupSelector: '.form__group-change',
        erorrSelector: '.form__msg',
        password: '#form-change-password #newpassword',
        confirmPassword: '#form-change-password #confirmnewpassword',
        rules: [
            Validator.isRequired('#oldpassword'),
            Validator.isPassword('#oldpassword', 8),
            Validator.isRequired('#newpassword'),
            Validator.isPassword('#newpassword', 8),
            Validator.isConfirmedPassword('#newpassword', function () {
                return document.querySelector('#form-change-password #confirmnewpassword').value;
            }, 'New Password and Comfirm New Password must be the same'),
            Validator.isRequired('#confirmnewpassword'),
            Validator.isPassword('#confirmnewpassword', 8),
            Validator.isConfirmed('#confirmnewpassword', function () {
                return document.querySelector('#form-change-password #newpassword').value;
            }, 'New Password and Comfirm New Password must be the same'),
        ],

    });

</script>
</body>
</html>

