package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet("/connection")
public class ConnectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private UserDao userDao;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		List<User> listu = userDao.findAll();
		Iterator<User> iterator = listu.iterator();
		boolean find = false;
		while (iterator.hasNext() && find == false) {
			User u = iterator.next();
			if (u.getPassword().equals(password) == true && u.getEmail().equals(email) == true) {
				req.getSession().setAttribute("user", u);
				req.getSession().setAttribute("connect", true);
				if (u.getStatut()) {
					resp.sendRedirect("dashboard-admin");
				} else {
					resp.sendRedirect("motm-form");
				}
				find = true;
			}
		}
		if (find == false) {
			req.getSession().setAttribute("connect", false);
			resp.sendRedirect("register");
		}
	}

}
