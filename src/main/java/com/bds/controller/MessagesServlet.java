package com.bds.controller;

import java.io.IOException;
import java.util.List;

import com.bds.bean.ContactUsBean;
import com.bds.dao.MessagesDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/messagesServlet")
public class MessagesServlet extends HttpServlet {

	private static final long serialVersionUID = -7350417285019144655L;

	public MessagesServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<ContactUsBean> messageList = MessagesDao.getMessages();
		HttpSession sessionObj = request.getSession();
		sessionObj.setAttribute("messageList", messageList);
		response.sendRedirect("admin_messages.jsp");
	}
}