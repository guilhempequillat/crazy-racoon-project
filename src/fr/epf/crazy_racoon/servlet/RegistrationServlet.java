package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		req.getSession().setAttribute("errorRegister", null );
		User u;
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String dateForm = req.getParameter("birthdate");
		try {
			if ( checkInputs(firstName, lastName, email, req) ) {
				u = parseUser(req);
				req.getSession().setAttribute("user", u);
				userDao.save(u);
				resp.sendRedirect("motm-form");
			} else {
				req.getRequestDispatcher("WEB-INF/register.jsp").forward(req, resp);
			}
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
		if( dateForm.split("/").length == 3 ) {
			dateToParse = "";
			String year = null, month = null, day = null;
			for( int i = 0 ; i <  dateForm.split("/").length ; i++ ) {
				if ( i == 0 ) {
					month = dateForm.split("/")[i];
				}
				if ( i == 1 ) {
					day = dateForm.split("/")[i];
				}
				if ( i == 2 ) {
					year = dateForm.split("/")[i];
				}
			}
			dateToParse = year + "-" + month + "-" + day;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(dateToParse);
		return new User(firstName, lastName, password, d,email);
	}
	
	public boolean checkInputs(String firstName, String lastName, String email, HttpServletRequest req) {
		return ( checkFirstName(firstName,req) && checkLastName(lastName,req) && checkEmail(email,req) );
	}
	
	public boolean checkFirstName(String firstName, HttpServletRequest req) {
		if ( firstName != null && !firstName.equals("") ) {
			return true;
		} else {
			req.getSession().setAttribute("errorRegister", "Insert a First Name" );
			return false;
		}
	}
	
	public boolean checkLastName(String lastName, HttpServletRequest req) {
		if ( lastName != null && !lastName.equals("") ) {
			return true;
		} else {
			req.getSession().setAttribute("errorRegister", "Insert a Last Name" );
			return false;
		}
	}
	
	public boolean checkEmail(String email, HttpServletRequest req) {
		String regex = "^(.+)@(.+)$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(email);
		boolean goodEmail = matcher.matches();
		if ( goodEmail && emailNotUsed(email)) {
			return true;
		} else {
			if(!goodEmail) {
				req.getSession().setAttribute("errorRegister", "Invalide email" );
			}
			if ( !emailNotUsed(email) ) {
				req.getSession().setAttribute("errorRegister", "Email already used" );
			}
			return false;
		}
	}
																	
	public boolean emailNotUsed(String email) {
		return userDao.emailIsNotUsed(email);
	}
	
}
