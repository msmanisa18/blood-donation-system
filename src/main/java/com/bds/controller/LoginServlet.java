package com.bds.controller;

import java.io.IOException;

import com.bds.bean.UserBean;
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
		userBean = LoginDao.validateLogin(userBean);
		String userRole = userBean.getUserRole();
		if (!"NOT_FOUND".equals(userRole)) {
			sessionObj.setAttribute("userName", userBean.getUserName());
			sessionObj.setAttribute("userEmail", userBean.getUserEmail());
			sessionObj.setAttribute("userMob", userBean.getUserMob());
			sessionObj.setAttribute("bloodGrp", userBean.getBloodGrp());
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