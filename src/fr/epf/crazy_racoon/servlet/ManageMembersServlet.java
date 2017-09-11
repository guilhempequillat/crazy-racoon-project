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

import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class ManageMemberServlet
 */
@WebServlet("/manage_members")
public class ManageMembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private UserDao userDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <User>  listu = userDao.findAll();
		request.getSession().setAttribute("users", listu);
		request.getRequestDispatcher("WEB-INF/manage_members.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/add_member.jsp").forward(request, response);
	}
	
	public void newUser (HttpServletRequest req) throws ParseException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = firstName+lastName+"default";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(req.getParameter("birthdate"));
		User u =new User(firstName, lastName, password, d,email);
		userDao.save(u);
	}
	
	public void editUser (HttpServletRequest req, Long id) throws ParseException {
		User u = userDao.findOne(id);
		u.setFirstName(req.getParameter("firstName"));
		u.setLastName(req.getParameter("lastName"));
		u.setEmail(req.getParameter("email"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		u.setBirthdate(sdf.parse(req.getParameter("birthdate")));
	}
	
	public void searchUser(Long id){
		
	}

}
