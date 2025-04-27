package com.bds.controller;

import java.io.IOException;

import com.bds.bean.UserBean;
import com.bds.dao.RegistrationDao;
import com.bds.util.EncryptionDecryptionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {

	private static final long serialVersionUID = -1603991323858977952L;

	public UserRegistrationServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		UserBean userBean = new UserBean();
		userBean.setUserName(request.getParameter("uname"));
		userBean.setUserEmail(request.getParameter("email"));
		String password = request.getParameter("upass");
		password = EncryptionDecryptionUtil.encrypt(password);
		userBean.setUserPwd(password);
		userBean.setUserMob(request.getParameter("mob"));
		userBean.setUserRole(request.getParameter("role"));
		userBean.setBloodGrp(request.getParameter("bloodgrp"));
		int status = RegistrationDao.createUser(userBean);
		String message = "User creation failed";
		if (status > 0) {
			message = "User creation success";
		}
		HttpSession sessionObj = request.getSession();
		sessionObj.setAttribute("create_usr_message", message);
		response.sendRedirect("register.jsp");
	}
}