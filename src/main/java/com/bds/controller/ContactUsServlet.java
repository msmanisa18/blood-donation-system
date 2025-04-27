package com.bds.controller;

import java.io.IOException;

import com.bds.bean.ContactUsBean;
import com.bds.dao.ContactUsDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/contactUsServlet")
public class ContactUsServlet extends HttpServlet {

	private static final long serialVersionUID = 3393042903813661390L;

	public ContactUsServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("u_name");
		String email = request.getParameter("u_email");
		String mob = request.getParameter("u_mob");
		String msg = request.getParameter("u_msg");
		
		ContactUsBean contactUsBean = new ContactUsBean();
		contactUsBean.setUserName(name);
		contactUsBean.setUserEmail(email);
		contactUsBean.setUserMob(mob);
		contactUsBean.setUserMsg(msg);

		Integer status = ContactUsDao.insertContactUsData(contactUsBean);
		HttpSession sessionObj = request.getSession();
		if (status > 0) {
			sessionObj.setAttribute("CONTACT_MSG", "Message sent successfully.");
		} else {
			sessionObj.setAttribute("CONTACT_MSG", "Some error occurred, please try again.");
		}		
		response.sendRedirect("contact.jsp");
	}
}