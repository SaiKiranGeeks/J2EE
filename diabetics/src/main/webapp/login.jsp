<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
						    <img src="images/semohealth.jpg" alt="sing up image">
						  
							<img src="images/semologocenter.jpg" alt="sing up image">
						</figure>

					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="User Name" required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required="required" />
							</div>



							<div class="form-group">
								<h4>Security Questions:</h4>
								<select id="mylist" name="mylist">
									<option
										value="What is the name of a college you applied to but didnot attend"
										id="question1" name="question1">What is the name of a
										college you applied to but didnot attend</option>
									<option
										value="What was the name of the first school you remember attending"
										id="question2" name="question2">What was the name of
										the first school you remember attending</option>
									<option
										value="Where was the destination of your most memorable school field trip"
										id="question3" name="question3">Where was the
										destination of your most memorable school field trip</option>
									<option
										value="What was your maths teachers surname in your 8th year of school"
										id="question4" name="question4">What was your maths
										teachers surname in your 8th year of school</option>
									<option value="What was the name of your first stuffed toy"
										id="question5" name="question5">What was the name of
										your first stuffed toy</option>
									<option value="What was your driving instructors first name"
										id="question6" name="question6">What was your driving
										instructors first name</option>

								</select>

							</div>

							<div class="form-group">

								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="q1" id="q1" placeholder="Answer"
									required="required" />
							</div>


							<div class="form-group">
								<select id="mylist_2" name="mylist_2">

									<option
										value="What is the name of a college you applied to but didnot attend"
										id="question1" name="question1">What is the name of a
										college you applied to but didnot attend</option>
									<option
										value="What was the name of the first school you remember attending"
										id="question2" name="question2">What was the name of
										the first school you remember attending</option>
									<option
										value="Where was the destination of your most memorable school field trip"
										id="question3" name="question3">Where was the
										destination of your most memorable school field trip</option>
									<option
										value="What was your maths teachers surname in your 8th year of school"
										id="question4" name="question4">What was your maths
										teachers surname in your 8th year of school</option>
									<option value="What was the name of your first stuffed toy"
										id="question5" name="question5">What was the name of
										your first stuffed toy</option>
									<option value="What was your driving instructors first name"
										id="question6" name="question6">What was your driving
										instructors first name</option>

								</select>
							</div>
							<div class="form-group">

								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="q2" id="q2" placeholder="Answer"
									required="required" />
							</div>

							<div class="form-group">
								<select id="mylist_3" name="mylist_3">

									<option
										value="What is the name of a college you applied to but didnot attend"
										id="question1" name="question1">What is the name of a
										college you applied to but didnot attend</option>
									<option
										value="What was the name of the first school you remember attending"
										id="question2" name="question2">What was the name of
										the first school you remember attending</option>
									<option
										value="Where was the destination of your most memorable school field trip"
										id="question3" name="question3">Where was the
										destination of your most memorable school field trip</option>
									<option
										value="What was your maths teachers surname in your 8th year of school"
										id="question4" name="question4">What was your maths
										teachers surname in your 8th year of school</option>
									<option value="What was the name of your first stuffed toy"
										id="question5" name="question5">What was the name of
										your first stuffed toy</option>
									<option value="What was your driving instructors first name"
										id="question6" name="question6">What was your driving
										instructors first name</option>

								</select>
							</div>
							<div class="form-group">

								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="q3" id="q3" placeholder="Answer"
									required="required" />
							</div>

							<span>Or create your own question:</span> <br /> <Span  placeholder="Input your Own Question"
								for="customQuestion">Custom question:</Span>


							<div class="form-group">
								<input type="text" id="customQuestion" name="customQuestion">

							</div>

							<div class="form-group">
								<label for="pass"><i class=""></i></label> <input
									type="password" name="customAnswer" id="customAnswer"
									placeholder="Answer"  />


							</div>


							<div class="form-group">
								<input type="hidden" name="selected-image" id="selected-image">
							</div>
							<div class="grid">

								<img src="images/image1.jpg" alt="Image 1.jpg"
									onclick="selectImage(this)"> <img src="images/image2.jpg"
									alt="Image 2.jpg" onclick="selectImage(this)"> <img
									src="images/image3.jpg" alt="Image 3.jpg"
									onclick="selectImage(this)"> <img src="images/image4.jpg"
									alt="Image 4.jpg" onclick="selectImage(this)"> <img
									src="images/image5.jpg" alt="Image 5.jpg"
									onclick="selectImage(this)"> <img src="images/image6.jpg"
									alt="Image 6.jpg" onclick="selectImage(this)"> <img
									src="images/image7.jpg" alt="Image 7.jpg"
									onclick="selectImage(this)"> <img src="images/image8.jpg"
									alt="Image 8.jpg" onclick="selectImage(this)"> <img
									src="images/image9.jpg" alt="Image 9.jpg"
									onclick="selectImage(this)">
							</div>




							<div class="form-group">
								<a href="forgotPassword.jsp">Forgot Password?"</a>
							</div>
							
							<!--  	<div class="row justify-content-center">

								<select id="mylist">
									<option value="">- Choose Authentication Type -</option>
									<option value="ImageLogin.jsp" id="question1" name="imagelogin">
										Login with Images</option>
									<option value="securitylogin.jsp" id="question2"
										name="securitylogin">Login with Security Questions</option>
									<option value="login.jsp" id="question3" name="password">Login
										with Password</option>
								</select>

							</div> -->
						
							<div class="row justify-content-center">
								<h5>
									Don't have an Account?<span><a href="register.jsp"
										class="text-danger"> Register Now!</a></span>
								</h5>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>

					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var images = document.querySelectorAll('.grid img');
		images.forEach(function(image) {
			image.addEventListener('click', function() {

				const selectedAlt = this.getAttribute('alt');
				console.log(selectedAlt); // prints the alt attribute value of the clicked image

				document.getElementById("selected-image").value = selectedAlt;

				// Remove the 'selected' class from all images
				images.forEach(function(img) {
					img.classList.remove('selected');
				});
				// Add the 'selected' class to the clicked image
				image.classList.add('selected');
			});
		});

		document.getElementById("mylist").addEventListener("change",
				function() {
					// get the selected value
					var selectedValue = this.value;
					// redirect to selected page
					if (selectedValue !== "") {
						//window.location.href = selectedValue;
					}
				});

		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Wrong Username or Password", "error");
		} else if (status == "invalidEmail") {
			swal("Sorry", "Please Enter Correct Email Address", "error");
		} else if (status == "invalidUpwd") {
			swal("Sorry", "Please Enter Password", "error");
		} else if (status == "resetSuccess") {
			swal("Congrats", "Password Reset Successfully", "success");
		} else if (status == "resetFailed") {
			swal("Sorry", "Password Reset Failed", "error");
		}
	</script>
</body>
</html>