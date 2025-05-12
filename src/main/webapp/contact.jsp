<%
	String contactMsg = "";
	if (session.getAttribute("CONTACT_MSG") != null) {
		contactMsg = session.getAttribute("CONTACT_MSG").toString();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Contact Us | Blood Donation Camp</title>
<link rel="stylesheet" href="style/style.css" />
<script src="script.js" defer></script>
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
			<li><a href="#">Contact</a></li>
			<li><a href="events.jsp">Events</a></li>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Register</a></li>
		</ul>
	</nav>
	<div class="contact-body">
		<div class="contact-container" style="margin-top: 40px;">
			<div style="background: #b30000;">
				<h2 style="color: #fff;">Contact Us</h2>
				<p style="color: #fff; padding-bottom: 8px;">Have any questions? Reach out to us!</p>
			</div>
			<form id="contact-form" method="post" action="contactUsServlet">
				<p style="color: #167b9b;"><%= contactMsg %></p>
				<div class="input-group">
					<label for="u_name">Name</label> 
					<input type="text" name="u_name" id="name" required maxlength="30" placeholder="Enter your name" />
				</div>
				<div class="input-group">
					<label for="u_email">Email</label> 
					<input type="email" id="email" name="u_email" required maxlength="30" placeholder="Enter your email" /> 
				</div>
				<div class="input-group">
					<label for="u_mob">Mobile</label> 
					<input type="number" id="mobile" name="u_mob" required min="6000000000" max="9999999999" placeholder="Enter your contact number" /> 
				</div>
				<div class="input-group">
					<label for="u_msg">Message</label>
					<textarea id="message" rows="5" placeholder="Write your message" name="u_msg" required maxlength="300"></textarea>
				</div>

				<button type="submit">Send Message</button>
				<p class="success-message"></p>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>
</body>
</html>
