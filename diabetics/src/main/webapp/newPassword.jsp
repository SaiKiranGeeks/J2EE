<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>new password</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}

.grid {
	display: grid;
	grid-template-columns: repeat(9, 1fr);
	grid-gap: 0.5px;
	margin-top: 30px;
}

img {
	width: 100%;
	height: auto;
	cursor: pointer;
	border-radius: 10px;
	transition: transform 0.2s;
}

img:hover {
	background-color: red;
	transform: scale(1.25);
}

.selected {
	border: 10px solid green;
}
</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="main">
					<!-- White Container -->

					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form-horizontal" action="newPassword" method="POST"
								id="myForm">


								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" name="password"
											placeholder="&#xf084; &nbsp; New Password"
											class="form-control border-info placeicon">
									</div>
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									</div>
								</div>


								<div class="form-group row justify-content-center px-3">
									<h4>Security Questions:</h4> <br/></div>
									<div class="form-group row justify-content-center px-3">
									<select id="mylist" name="mylist">
										<option
											value="What is the name of a college you applied to but didnot attend"
											id="question1" name="question1">What is the name of
											a college you applied to but didnot attend</option>
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
											id="question6" name="question6">What was your
											driving instructors first name</option>

									</select>

								</div>

								<div class="form-group row justify-content-center px-3">

									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="q1" id="q1" placeholder="Answer"
										required="required" />
								</div>


								<div class="form-group row justify-content-center px-3">
									<select id="mylist_2" name="mylist_2">

										<option
											value="What is the name of a college you applied to but didnot attend"
											id="question1" name="question1">What is the name of
											a college you applied to but didnot attend</option>
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
											id="question6" name="question6">What was your
											driving instructors first name</option>

									</select>
								</div>
								<div class="form-group row justify-content-center px-3">

									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="q2" id="q2" placeholder="Answer"
										required="required" />
								</div>

								<div class="form-group row justify-content-center px-3">
									<select id="mylist_3" name="mylist_3">

										<option
											value="What is the name of a college you applied to but didnot attend"
											id="question1" name="question1">What is the name of
											a college you applied to but didnot attend</option>
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
											id="question6" name="question6">What was your
											driving instructors first name</option>

									</select>
								</div>

								<div class="form-group row justify-content-center px-3">

									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="q3" id="q3" placeholder="Answer"
										required="required" />
								</div>

								<div class="form-group row justify-content-center px-3">
									<span>Or create your own question:</span>
								</div>
								<br />

								<div class="form-group row justify-content-center px-3">
									<Span for="customQuestion">Custom question:</Span>

								</div>
								<div class="form-group row justify-content-center px-3">
									<input type="text" id="customQuestion" name="customQuestion">

								</div>

								<div class="form-group row justify-content-center px-3">
									<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
										type="password" name="customAnswer" id="customAnswer"
										placeholder="Answer" required="required" />


								</div>


								<div class="form-group row justify-content-center px-3">
									<input type="hidden" name="selected-image" id="selected-image">
								</div>
								<div class="grid">

									<img src="images/image1.jpg" alt="Image 1.jpg"
										onclick="selectImage(this)"> <img
										src="images/image2.jpg" alt="Image 2.jpg"
										onclick="selectImage(this)"> <img
										src="images/image3.jpg" alt="Image 3.jpg"
										onclick="selectImage(this)"> <img
										src="images/image4.jpg" alt="Image 4.jpg"
										onclick="selectImage(this)"> <img
										src="images/image5.jpg" alt="Image 5.jpg"
										onclick="selectImage(this)"> <img
										src="images/image6.jpg" alt="Image 6.jpg"
										onclick="selectImage(this)"> <img
										src="images/image7.jpg" alt="Image 7.jpg"
										onclick="selectImage(this)"> <img
										src="images/image8.jpg" alt="Image 8.jpg"
										onclick="selectImage(this)"> <img
										src="images/image9.jpg" alt="Image 9.jpg"
										onclick="selectImage(this)">
								</div>






								<!-- Log in Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Reset"
											class="btn btn-block btn-info" id="submit-button"
											onclick="checkPassword(event)">
									</div>
								</div>



							</form>
						</div>


						<!-- Alternative Login -->
						s
						<div class="mx-0 px-0 bg-light">

							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
							<!-- Register Now -->
							<div class="pt-2">
								<div class="row justify-content-center">
									<h5>
										Don't have an Account?<span><a href="#"
											class="text-danger"> Register Now!</a></span>
									</h5>
								</div>
								<div
									class="row justify-content-center align-items-center pt-4 pb-5">
									<div class="col-4"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'>
		
	</script>

	<script>
	
	function selectImage()
	{
		
	}
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

		function checkPassword(event) {
			try {

				//event.preventDefault(); // Prevent the form from being submitteds
				var isValid = true;
				var password = document.getElementsByName("password")[0].value
						.toString();
				var confPassword = document.getElementsByName("confPassword")[0].value
						.toString();

				if (password != confPassword) {
					alert('Passwords did not macted');
					return false;
				}

				const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
				if (!regex.test(password)) {
					alert('The password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character.');
					//return false;
				}
				/*	  
				var upperRegex = ".*[A-Z].*";
				// Password must have at least one uppercase letter
				if (!upperRegex.test(password)) {
					alert("Upper case is missing")
					isValid = false;
				}

				// Password must have at least one lowercase letter
				if (!password.test(".*[a-z].*")) {
					alert("Lower case is missing")
					isValid = false;
				}

				// Password must have at least one digit
				if (!password.test(".*\\d.*")) {
					alert("Digit is missing")
					isValid = false;
				}

				// Password must have at least one symbol
				if (!password.test(".*[!@#$%^&*()\\-_+={}\\[\\]|\\\\:;\"'<>,.?/~`].*")) {
					alert("Symbol is missing")
					isValid = false;
				}
				alert("isValid:"+isValid);
				
				if (!isValid) {
					alert('The password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character.');
					return false;
				}*/
				else
					document.getElementById('myForm').submit();

				//alert("password new: "+password)
				/*
				// Define the regular expression pattern for the password
				  const passwordPattern = "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/";
					alert("condition new: "+passwordPattern.test(confPassword));
				  // Test if the password matches the pattern
				  if (!passwordPattern.test(confPassword)) {
					  alert('The password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character.');
					    return false;
				  }
				 */
				// If the password is valid, submit the form
			} catch (e) {
				alert(e)
			}
		}
	</script>

</body>
</html>