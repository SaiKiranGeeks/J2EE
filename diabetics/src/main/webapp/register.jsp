<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Main js -->
<script src="myscript.js"></script>
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign Up</h2>

						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="fullname" id="fullname" placeholder="Full Name"
									required="required" />
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="User Name"
									required="required" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email"
									required="required" />
							</div>
							<div class="password-strength">
								<span>Strength:</span> <span id="password-strength-meter"></span>
							</div>

							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password"
									required="required" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required="required" />
							</div>
							<div class="form-group">
								<label for="Date Of Birth"><i
									class="zmdi zmdi-lock-outline"></i></label> <input type="date"
									name="birthday" id="birthday" placeholder="Date Of Birth"
									required="required" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" required="required" />
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
							
								<span>Or create your own question:</span>
							<br/>
						

								<Span for="customQuestion">Custom question:</Span>
							

							<div class="form-group">
								<input type="text" id="customQuestion" name="customQuestion" placeholder="Input your own Question" >
								

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
							

							<div class="row justify-content-center">
								<h4>
									Already Have An Account?<span><a href="login.jsp"
										class="text-danger">Log In</a></span>
								</h4>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>

						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/semohealth.jpg" alt="sing up image">
							 
							<img src="images/semologocenter.jpg" alt="sing up image">
						</figure>
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

	<script>
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

		function showSuccessMessage() {
			alert("Account created successfully!");
			// OR
			// swal("Congrats","Account Created Successfully","success").then(function() {
			//   window.location.href = "login.jsp";
			// });
		}

		window.onload = function() {
			var urlParams = new URLSearchParams(window.location.search);
			if (urlParams.get('status') === 'success') {
				showSuccessMessage();
			}
		}
	</script>


</body>

</html>
