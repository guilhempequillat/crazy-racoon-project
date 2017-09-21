package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Inject
	private UserDao userDao;

	public RegistrationServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u;
		try {
			u = parseUser(req);
			req.getSession().setAttribute("user", u);
			userDao.save(u);
			resp.sendRedirect("motm-form");
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private User parseUser(HttpServletRequest req) throws ParseException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String dateForm = req.getParameter("birthdate");
		String dateToParse = dateForm; 
		if( dateForm.split("/").length > 0 ) {
			dateToParse = "";
			for( int i = 0 ; i <  dateForm.split("/").length ; i++ ) {
				if ( i == 0 ) {
					dateToParse = dateForm.split("/")[i];
				}
				dateToParse += "-"+dateForm.split("/")[i];
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
<<<<<<< HEAD
		Date d = sdf.parse(dateToParse);
		return new User(firstName, lastName, password, d,email);
=======
		Date d = sdf.parse(req.getParameter("birthdate"));
		return new User(firstName, lastName, password, d, email);
>>>>>>> dd4d17a661fbda96d8e33fb653969b18e786c3f5
	}
}
