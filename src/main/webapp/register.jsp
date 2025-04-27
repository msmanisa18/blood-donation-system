<%
	String msg = "";
	if (session.getAttribute("create_usr_message") != null) {
		msg = session.getAttribute("create_usr_message").toString();
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blood Donation Camp - Register</title>
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

<body>
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
			<li><a href="register.jsp" class="active">Register</a></li>
		</ul>
	</nav>
	<!-- Registration Section -->
	<section class="login-body">
		<div class="login-container">
			<div class="login-box">
				<h2>User Registration</h2>
				<p style="color: #b30000;"><%=msg %></p>
				<form id="registerForm" action="UserRegistrationServlet" method="POST">
					<div class="input-container">
						<label for="name">Full Name</label> 
						<input type="text" id="name" name="uname" required placeholder="Enter your full name">
					</div>
					<div class="input-container">
						<label for="email">Email</label> 
						<input type="email" id="email" name="email" required placeholder="Enter your email">
					</div>
					<div class="input-container">
						<label for="confirm-password">Password</label> 
						<input type="password" id="password" name="upass" required placeholder="Confirm your password">
					</div>
					<div class="input-container">
						<label for="mob">Mobile</label> 
						<input type="text" id="mob" name="mob" required placeholder="Contact Number">
					</div>
					<div class="input-container">
						<label for="donate-bloodGroup">Blood Group</label> 
						<select id="donate-bloodGroup" name="bloodgrp" required>
							<option value="">Select</option>
							<option value="A+">A+</option>
							<option value="A-">A-</option>
							<option value="B+">B+</option>
							<option value="B-">B-</option>
							<option value="O+">O+</option>
							<option value="O-">O-</option>
							<option value="AB+">AB+</option>
							<option value="AB-">AB-</option>
						</select>
					</div>
					<div class="input-container">
						<label for="typ">User Type</label> 
						<select id="donate-bloodGroup" name="role" required>
							<option value="">Select</option>
							<option value="DONOR">Donor</option>
							<option value="ORGANIZER">Organizer</option>
							<option value="PATIENT">Patient</option>
							<option value="VOLUNTEER">Volunteer</option>
						</select>
					</div>
					<button type="submit" class="login-btn">Register</button>
				</form>
				<p style="color: #120303; margin-top: 10px;">Already have an account? <a href="login.jsp" style="color: #120303; cursor: pointer;">Login</a> </p>
			</div>
			<div class="illustration-container">
				<img src="images/relation_blood.jpg" alt="Blood Donation Illustration">
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>
</body>
</html>