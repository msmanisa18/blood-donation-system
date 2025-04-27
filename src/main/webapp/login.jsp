<%
	String errMsg = "";
	if (session.getAttribute("ERR_MSG") != null) {
		errMsg = session.getAttribute("ERR_MSG").toString();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link rel="stylesheet" href="style/style.css">
<style type="text/css">
	.footer {
		position: fixed;
		left: 0;
		bottom: 0;
		width: 100%;
	}
</style>
</head>
<body class="">
	<!-- Navbar -->
	<nav class="navbar">
		<div class="logo">
			<h2>Blood Donation Camp</h2>
		</div>
		<ul class="nav-links">
            <li><a href="index.html">Home</a></li>
            <li><a href="aboutus.html">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="events.jsp">Events</a></li>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Register</a></li>
		</ul>
	</nav>
	<div class="login-body">
		<div class="login-container ">
			<div class="login-box">
				<h2 style="color: #b30000;">Welcome!</h2>
				<p style="color: #b30000;"><%= errMsg %></p>
				<form action="loginServlet" method="POST">
					<div class="input-container">
						<label for="email">Email</label>
						<input type="email" id="email" name="email" required placeholder="Enter your email">
					</div>
					<div class="input-container">
						<label for="password">Password</label> 
						<input type="password" id="password" name="password" required placeholder="Enter your password">
					</div>
					<button type="submit" class="login-btn">Login</button>
				</form>
				<p style="color: #120303; margin-top: 10px;">
					Don't have an account? <a href="register.jsp" style="color: #120303; cursor: pointer;">Sign Up</a>
				</p>
			</div>
			<div class="illustration-container">
				<img src="images/heart_blood.jpg" alt="Blood Donation Illustration">
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>
</body>
</html>