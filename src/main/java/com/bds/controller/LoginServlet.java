package com.bds.controller;

import java.io.IOException;

import com.bds.bean.UserBean;
import com.bds.bean.UserDtlsBean;
import com.bds.bean.UserRoleBean;
import com.bds.dao.LoginDao;
import com.bds.util.EncryptionDecryptionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 988099017166395875L;

	public LoginServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sessionObj = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		password = EncryptionDecryptionUtil.encrypt(password);
		UserBean userBean = new UserBean();
		userBean.setUserEmail(email);
		userBean.setUserPwd(password);
		UserDtlsBean userDtlsBean = LoginDao.validateLogin(userBean);
		userBean = userDtlsBean.getUserBean();
		String userRole = userBean.getUserRole();
		UserRoleBean userRoleBean = userDtlsBean.getUserRoleBean();
		if (!"NOT_FOUND".equals(userRole)) {
			sessionObj.setAttribute("userName", userBean.getUserName());
			sessionObj.setAttribute("userEmail", userBean.getUserEmail());
			sessionObj.setAttribute("userMob", userBean.getUserMob());
			sessionObj.setAttribute("bloodGrp", userBean.getBloodGrp());
			sessionObj.setAttribute("count_donor", userRoleBean.getDonorCount());
			sessionObj.setAttribute("count_organizer", userRoleBean.getOrganizerCount());
			sessionObj.setAttribute("count_patient", userRoleBean.getPatientCount());
			sessionObj.setAttribute("count_volunteer", userRoleBean.getVolunteerCount());
		} else {
			sessionObj.setAttribute("ERR_MSG", "Login Failed, please try again.");
		}
		if ("NOT_FOUND".equals(userRole)) {
			response.sendRedirect("login.jsp");
		} else if ("ADMIN".equals(userRole)) {
			response.sendRedirect("admin_dashboard.jsp");
		} else if ("DONOR".equals(userRole)) {
			response.sendRedirect("dashboard_donor.jsp");
		} else if ("ORGANIZER".equals(userRole)) {
			response.sendRedirect("dashboard_organizer.jsp");
		} else if ("PATIENT".equals(userRole)) {
			response.sendRedirect("dashboard_patient.jsp");
		} else {
			//VOLUNTEER
			response.sendRedirect("dashboard_volunteer.jsp");
		}
	}
}