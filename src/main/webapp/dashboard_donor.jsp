<%
	String userName = "";
	if (session == null || session.getAttribute("userName") == null) {
		response.sendRedirect("login.jsp");
	} else {
		userName = session.getAttribute("userName").toString();
	}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Donor | Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
	<link rel="stylesheet" href="style/style_admin.css">
	<style type="text/css">
		.card {
			background-color: #e8f5e9;
			padding: 20px;
			border-radius: 10px;
			margin-bottom: 20px;
			border-left: 6px solid #2e7d32;
		}
</style>
  </head>
  <body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
      <ul>
        <li><a href="dashboard_donor.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="dashboard_profile.jsp"><i class="fas fa-user-md"></i> Profile</a></li>
        <li><a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>
    <!-- Main dashboard section -->
    <div class="main">
    
      <header>
	        <button id="toggle-btn"><i class="fas fa-bars"></i></button>
	        <h2>Donor Dashboard</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
    
      <!-- Upcoming events -->
      <div class="card">
        <h2>Upcoming Blood Drives</h2>
        <p>Next camp: April 25, 2025 at City Health Center</p>
      </div>

      <!-- Blood donation history -->
      <div class="card">
        <h2>Your Blood Donation History</h2>
        <p>Last donated: February 10, 2025 (B+)</p>
      </div>

      <!-- Notifications or alerts -->
      <div class="card">
        <h2>Get Notified</h2>
        <p>We’ll notify you when your blood type is urgently needed.</p>
      </div>
    </div>
	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>    
  </body>
</html>
