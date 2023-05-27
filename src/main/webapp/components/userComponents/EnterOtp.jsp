
<html>
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OTP Page</title>
	<link rel="stylesheet" href="./assets/css/login.css">
	<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.0-web/fontawesome-free-6.4.0-web/css/all.min.css">
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

	</style>
</head>

<body>
<div class="modal__auth">
	<div class="container" id="container">
		<!-- sign in -->
		<div class="m-col-1 container__form container__otp">
			<form action="ValidateOtp" method="post" class="form" id="form-otp">
				<i class="fa-solid fa-lock"></i>
				<h1 class="form__heading">Enter <span>OTP</span></h1>

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
	</div>
</div>
</body>
</html>