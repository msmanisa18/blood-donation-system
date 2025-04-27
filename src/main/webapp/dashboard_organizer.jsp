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
    <title>Organizer | Dashboard</title>
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
        <li><a href="dashboard_organizer.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="dashboard_profile.jsp"><i class="fas fa-user-md"></i> Profile</a></li>
        <li><a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>
    <!-- Main dashboard section -->
    <div class="main">
    
      <header>
	        <button id="toggle-btn"><i class="fas fa-bars"></i></button>
	        <h2>Organizer Dashboard</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
    
      <div class="card">
        <h2>Upcoming Events</h2>
        <p>3 blood donation drives scheduled this month</p>
      </div>

      <div class="card">
        <h2>Manage Volunteers</h2>
        <p>12 volunteers assigned for April 20th event</p>
      </div>

      <div class="card">
        <h2>Data Insights</h2>
        <p>74 units collected last month | 55 registered donors</p>
      </div>
    </div>
	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>    
  </body>
</html>
