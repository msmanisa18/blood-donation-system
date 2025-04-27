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
    <title>Blood Bank | Settings</title>
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
	        <h2>Blood Bank Management</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
      <!-- Blood Bank Stats -->
      <section class="stats">
        <div class="stat-box">
          <h3>Total Blood Banks</h3>
          <p>15</p>
        </div>
        <div class="stat-box">
          <h3>Active Blood Banks</h3>
          <p>12</p>
        </div>
      </section>

      <!-- Blood Bank Table -->
      <section class="table-section">
        <h3 style="margin-bottom: 10px;">Blood Bank List</h3>
        <table>
          <thead>
            <tr>
              <th>Blood Bank Name</th>
              <th>Location</th>
              <th>Contact No.</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Red Cross Blood Bank</td>
              <td>New York</td>
              <td>123-456-7890</td>
              <td>Active</td>
              <td>
                <a href="#" class="edit-btn">Edit</a> | 
                <a href="#" class="delete-btn">Delete</a>
              </td>
            </tr>
            <tr>
              <td>ABC Blood Bank</td>
              <td>Los Angeles</td>
              <td>987-654-3210</td>
              <td>Pending</td>
              <td>
                <a href="#" class="edit-btn">Edit</a> | 
                <a href="#" class="delete-btn">Delete</a>
              </td>
            </tr>
            <!-- Other blood banks here -->
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
