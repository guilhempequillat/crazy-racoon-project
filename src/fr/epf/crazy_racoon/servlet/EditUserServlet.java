package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/edit-user")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private UserDao userDao;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/edit_user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		saveUserChanges(request);
		request.getRequestDispatcher("WEB-INF/edit_user.jsp").forward(request, response);
	}
	
	public void saveUserChanges(HttpServletRequest request) {
		User oldUser = (User) request.getSession().getAttribute("user");
		try {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(request.getParameter("birthdate"));
			userDao.updateOne(firstName, lastName, email, date, oldUser.getId());
			request.getSession().setAttribute("user", userDao.findOne(oldUser.getId()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
