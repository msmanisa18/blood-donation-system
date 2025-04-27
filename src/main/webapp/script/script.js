document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    if (email && password) {
        alert("Login successful!");
        // Handle the login logic (e.g., validate the email and password)
    } else {
        alert("Please enter both email and password.");
    }
});
