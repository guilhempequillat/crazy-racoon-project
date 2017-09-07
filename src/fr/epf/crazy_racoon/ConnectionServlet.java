package fr.epf.crazy_racoon;

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
import javax.swing.JOptionPane;

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
		//User u = parseUser(req);
		//req.getSession().setAttribute("user", u);
		//incrementLiveUserCount();
		User u = userDao.findOne(email);
		if(u.getPassword()==password){
			resp.sendRedirect("dashboard");
		}else{
			JOptionPane.showMessageDialog(null,"alert");
		}
	}
	
//	
//	private User parseUser(HttpServletRequest req) throws ParseException {
//		
//		return new User(firstName, lastName, password, d,email);
//	}
	
	private void incrementLiveUserCount() {
		Integer liveUserCount = (Integer) getServletContext().getAttribute("liveUserCount");
		getServletContext().setAttribute("liveUserCount", liveUserCount + 1);
	}


}
