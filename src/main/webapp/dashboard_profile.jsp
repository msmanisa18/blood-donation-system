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
    <title>Volunteer | Dashboard</title>
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
        <li><a href="dashboard_volunteer.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="#"><i class="fas fa-user-md"></i> Profile</a></li>
        <li><a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>
    <!-- Main dashboard section -->
    <div class="main">
      <header>
	        <button id="toggle-btn"><i class="fas fa-bars"></i></button>
	        <h2>My Profile</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
    
    <!-- Organizer Table -->
      <section class="table-section">
        <table>
          <thead>
            <tr>
              <th>Profile Details</th>
              <th>Value</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Name</td>
              <td><%= userName %></td>
              <td>Edit</td>
            </tr>
            <tr>
              <td>Email</td>
              <td><%= session.getAttribute("userEmail").toString() %></td>
              <td>Edit</td>
            </tr>
            <tr>
              <td>Mobile</td>
              <td><%= session.getAttribute("userMob").toString() %></td>
              <td>Edit</td>
            </tr>
            <tr>
              <td>Blood Group</td>
              <td><%= session.getAttribute("bloodGrp").toString() %></td>
              <td>Edit</td>
            </tr>
            <tr>
              <td>Password</td>
              <td>********</td>
              <td>Edit</td>
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