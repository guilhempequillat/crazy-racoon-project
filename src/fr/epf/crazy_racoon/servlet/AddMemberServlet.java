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
 * Servlet implementation class AddMemberServlet
 */
@WebServlet("/add_member")
public class AddMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Inject
	private UserDao userDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/add_member.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		try {
			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String email = req.getParameter("email");
			String password = firstName+lastName+"default";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d;
			d = sdf.parse(req.getParameter("birthdate"));
			User u =new User(firstName, lastName, password, d,email);
			userDao.save(u);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		response.sendRedirect("manage_members");
	}

}
