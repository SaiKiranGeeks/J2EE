// Get the password input field
var passwordInput = document.getElementById("pass");

// Add an event listener to the password input field to check the strength and update the UI
passwordInput.addEventListener("input", function() {
    var password = passwordInput.value;

    // Define a regular expression to check for special characters
    var specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;

    // Define an array of classes to apply to the password strength meter based on the strength level
    var strengthClasses = ["weak", "medium", "strong"];

    // Define an array of messages to display based on the strength level
    var strengthMessages = ["Weak", "Medium", "Strong"];

    // Determine the password strength level based on the length and presence of special characters
    var strengthLevel = 0;
    if (password.length >= 8) {
        strengthLevel++;
    }
    if (specialChars.test(password)) {
        strengthLevel++;
    }

    // Update the password strength meter with the appropriate class and message
    var passwordStrengthMeter = document.getElementById("password-strength-meter");
    passwordStrengthMeter.className = "strength-" + strengthClasses[strengthLevel];
    passwordStrengthMeter.innerHTML = strengthMessages[strengthLevel];
});
