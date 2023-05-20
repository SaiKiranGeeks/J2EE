<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Select Image</title>
	<style>
		body {
			background-color: #f7f7f7;
			font-family: Arial, sans-serif;
		}
		
		h1 {
			text-align: center;
			font-size: 36px;
			margin-top: 50px;
		}
		
		.container {
			max-width: 900px;
			margin: 0 auto;
			padding: 20px;
			background-color: #ffffff;
			box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
			border-radius: 10px;
			margin-top: 50px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
		}
		
		.grid {
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			grid-gap: 20px;
			margin-top: 30px;
		}
		
		img {
			width: 100%;
			height: auto;
			cursor: pointer;
			border-radius: 10px;
			transition: all 0.2s ease-in-out;
		}
		
		img:hover {
			transform: scale(1.05);
		}
		
		.selected {
			border: 2px solid #1abc9c;
		}
		
		.btn {
			padding: 10px 20px;
			background-color: #1abc9c;
			color: #ffffff;
			font-size: 18px;
			font-weight: bold;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			transition: all 0.2s ease-in-out;
			margin-top: 30px;
		}
		
		.btn:hover {
			background-color: #148f77;
		}
		
		.alert {
			padding: 10px;
			background-color: #f44336;
			color: #ffffff;
			font-size: 18px;
			border-radius: 5px;
			margin-top: 30px;
			display: none;
		}
		
		.alert.show {
			display: block;
		}
	</style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<form action="imageRegistration" method="post" >
   
	<div class="container">
		<h1>Select an Image</h1>
		<p>Click on one of the images below to select it:</p>
		
		<label for="username">Enter User Name:</label> <input
		type="text" name="usernameinput" id="usernameinput"
			placeholder="User Name" />
			
			
			
		<div class="grid">
		 <input type="radio" name="selectedImage" value="image1.jpg">
	      <img src="images/image1.jpg" alt="Image 1">
	      <br>
	      <input type="radio" name="selectedImage" value="image2.jpg">
	      <img src="images/image2.jpg" alt="Image 2">
	      <br>
	      <input type="radio" name="selectedImage" value="image3.jpg">
	      <img src="images/image3.jpg" alt="Image 3">
	      <br>
	       <input type="radio" name="selectedImage" value="image4.jpg">
	      <img src="images/image4.jpg" alt="Image 4">
	      <br>
	      <input type="radio" name="selectedImage" value="image5.jpg">
	      <img src="images/image5.jpg" alt="Image 5">
	      <br>
	      <input type="radio" name="selectedImage" value="image6.jpg">
	      <img src="images/image6.jpg" alt="Image 6">
	      <br>
	        <input type="radio" name="selectedImage" value="image7.jpg">
	      <img src="images/image7.jpg" alt="Image 7">
	      <br>
	      <input type="radio" name="selectedImage" value="image8.jpg">
	      <img src="images/image8.jpg" alt="Image 8">
	      <br>
	      <input type="radio" name="selectedImage" value="image9.jpg">
	      <img src="images/image9.jpg" alt="Image 9">
	      <br>
      <!-- <img src="images/image1.jpg" alt="Image 1">
			<img src="images/image2.jpg" alt="Image 2">
			<img src="images/image3.jpg" alt="Image 3">
			<img src="images/image4.jpg" alt="Image 4">
			<img src="images/image5.jpg" alt="Image 5">
			<img src="images/image6.jpg" alt="Image 6">
			<img src="images/image7.jpg" alt="Image 7">
			<img src="images/image8.jpg" alt="Image 8">
			<img src="images/image9.jpg" alt="Image 9">  -->
			
		</div>
		<button class="btn" id="save-btn">Save and Exit</button>
		<div class="alert" id="alert">Please select an image!</div>
	</div>
</form>
	
	
<script>
	
	var images = document.querySelectorAll('.grid img');
	images.forEach(function(image) {
		image.addEventListener('click', function() {
			// Remove the 'selected' class from all images
			images.forEach(function(img) {
				img.classList.remove('selected');
			});
			// Add the 'selected' class to the clicked image
			image.classList.add('selected');
		});
	});
	
	// Add click event listener to the save button
	var saveBtn = document.getElementById('save-btn');
	saveBtn.addEventListener('click', function() {
		// Get the selected image
		var selectedImg = document.querySelector('.grid img');
		alert("image selected"+selctedImg);
		if (selectedImg) {
			
			// Save the selected image to the database
			var imgSrc = selectedImg.src;
			// Use an AJAX request to send the image source to the server for saving to the database
			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'image.jsp');
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.onload = function() {
				if (xhr.status === 200 && xhr.responseText === 'success') {
					alert('Image saved!');
					window.location.href = 'login.jsp';
				} else {
					alert('Image save failed!');
				}
			};
			xhr.send('imgSrc=' + imgSrc);
		} else {
			alert('Please select an image!');
		}
	});
</script>
	
</body>
