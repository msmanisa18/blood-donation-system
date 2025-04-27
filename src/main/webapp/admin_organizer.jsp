<%
	HttpSession sessionObj = request.getSession();
	String userName = "";
	if (sessionObj == null || sessionObj.getAttribute("userName") == null) {
		response.sendRedirect("login.jsp");
	} else {
		userName = sessionObj.getAttribute("userName").toString();
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
  </head>
  <body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
      <div class="logo">Admin Panel</div>
      <ul>
        <li><a href="admin_dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="admin_donor.jsp"><i class="fas fa-users"></i> Donors</a></li>
        <li><a href="admin_blood_bank.jsp"><i class="fas fa-hospital"></i> Blood Banks</a></li>
        <li><a href="admin_volunteer.jsp"><i class="fas fa-user-md"></i> Volunteers</a></li>
        <li><a href="admin_patient.jsp"><i class="fas fa-user-injured"></i> Patients</a></li>
        <li><a href="admin_event.jsp"><i class="fas fa-calendar"></i> Events</a></li>
        <li><a href="admin_organizer.jsp"><i class="fas fa-calendar"></i> Organizers</a></li>
        <li><a href="admin_settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        <li><a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="main">
    	<header>
	        <button id="toggle-btn"><i class="fas fa-bars"></i></button>
	        <h2>Organizer Management</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
      <!-- Organizer Stats -->
      <section class="stats">
        <div class="stat-box">
          <h3>Total Organizers</h3>
          <p>15</p>
        </div>
        <div class="stat-box">
          <h3>Upcoming Events</h3>
          <p>5</p>
        </div>
      </section>

      <!-- Organizer Table -->
      <section class="table-section">
        <h3 style="margin-bottom: 10px;">Registered Organizers</h3>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Contact No.</th>
              <th>Event Participation</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Michael Johnson</td>
              <td>michael@example.com</td>
              <td>+91-9988998899</td>
              <td>Blood Camp 2025</td>
              <td>Active</td>
            </tr>
            <tr>
              <td>Sarah Davis</td>
              <td>sarah@example.com</td>
              <td>+91-9988998899</td>
              <td>Blood Camp 2024</td>
              <td>Inactive</td>
            </tr>
          </tbody>
        </table>
      </section>
    </div>
    
	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>    
  </body>
</html>
