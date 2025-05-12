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
    <title>Event | Settings</title>
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
         <li><a href="messagesServlet"><i class="fas fa-calendar"></i> Messages</a></li>
        <li><a href="admin_settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        <li><a href="logoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="main">
    	<header>
	        <button id="toggle-btn"><i class="fas fa-bars"></i></button>
	        <h2>Event Management</h2>
	        <div class="user-info">
	          <p style="font-size: 20px">Welcome <strong><%= userName %></strong></p>
	        </div>
      </header>
      <!-- Event Stats -->
      <section class="stats">
        <div class="stat-box">
          <h3>Total Events</h3>
          <p>8</p>
        </div>
        <div class="stat-box">
          <h3>Upcoming Events</h3>
          <p>3</p>
        </div>
      </section>

      <!-- Event Table -->
      <section class="table-section">
        <h3 style="margin-bottom: 10px;">Event List</h3>
        <table>
          <thead>
            <tr>
              <th>Event Name</th>
              <th>Date</th>
              <th>Location</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Blood Camp 2025</td>
              <td>2025-05-15</td>
              <td>New York</td>
              <td>Active</td>
              <td>
                <a href="#" class="edit-btn">Edit</a> |
                <a href="#" class="delete-btn">Delete</a>
              </td>
            </tr>
            <tr>
              <td>Blood Donation Drive</td>
              <td>2024-12-10</td>
              <td>Chicago</td>
              <td>Inactive</td>
              <td>
                <a href="#" class="edit-btn">Edit</a> |
                <a href="#" class="delete-btn">Delete</a>
              </td>
            </tr>
          </tbody>
        </table>
      </section>

      <!-- Add New Event Button -->
      <a href="#" class="add-event-btn" id="addEventBtn">Add New Event</a>


      <!-- Modal -->
      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <h2>Add New Event</h2>
          <form>
            <div class="form-group">
              <label for="eventName">Event Name</label>
              <input type="text" id="eventName" name="eventName" required />
            </div>
            <div class="form-group">
              <label for="eventDate">Event Date</label>
              <input type="date" id="eventDate" name="eventDate" required />
            </div>
            <div class="form-group">
              <label for="eventLocation">Event Location</label>
              <input
                type="text"
                id="eventLocation"
                name="eventLocation"
                required
              />
            </div>
            <div class="form-group">
              <input type="submit" value="Save Event" />
            </div>
          </form>
        </div>
      </div>
    </div>

	<!-- Footer -->
	<footer class="footer">
		<p>&copy; 2025 Blood Donation Camp | All Rights Reserved</p>
	</footer>
    <script>
      // Toggle sidebar visibility
      function toggleSidebar() {
        document.querySelector(".sidebar").classList.toggle("open");
      }

      // Modal functionality
      var modal = document.getElementById("myModal");
      var btn = document.getElementById("addEventBtn");
      var span = document.getElementsByClassName("close")[0];

      btn.onclick = function () {
        modal.style.display = "block";
      };

      span.onclick = function () {
        modal.style.display = "none";
      };

      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      };
    </script>
  </body>
</html>
