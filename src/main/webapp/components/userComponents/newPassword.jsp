

<!doctype html>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Verification Page</title>
	<link
			href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
			rel='stylesheet'>
	<link
			href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
			rel='stylesheet'>
	<script type='text/javascript'
			src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body >



<!-- Container containing all contents -->
<div class="modal__auth">
	<div class="container">
		<div class="m-col-1 container__form container__forgor-password">

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
					<a class="form__back" href="forgotPassword.jsp">Back forgot password</a>
				</div>
				<button class="btn form__btn" type="submit">Change password</button>
			</form>
		</div>
	</div>
</div>


<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<script src="./assets/js/validator.js"></script>
<script src="./assets/js/change.js"></script>
<script>
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