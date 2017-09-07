package fr.epf.crazy_racoon;

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

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Inject
	private UserDao userDao;
	
	public RegistrationServlet() {
	}
	
	@Override
	public void init() throws ServletException {
		getServletContext().setAttribute("liveUserCount", 0);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u;
		try {
			u = parseUser(req);
			req.getSession().setAttribute("user", u);
			incrementLiveUserCount();
			userDao.save(u);
			resp.sendRedirect("dashboard");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private User parseUser(HttpServletRequest req) throws ParseException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(req.getParameter("birthdate"));
		return new User(firstName, lastName, password, d,email);
	}
	
	private void incrementLiveUserCount() {
		Integer liveUserCount = (Integer) getServletContext().getAttribute("liveUserCount");
		getServletContext().setAttribute("liveUserCount", liveUserCount + 1);
	}
}
