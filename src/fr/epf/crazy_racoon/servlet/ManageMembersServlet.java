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
@WebServlet("/manage-members")
public class ManageMembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private UserDao userDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			User currentUser = (User) request.getSession().getAttribute("user");
			
			if (currentUser.getStatut()) {
				List <User>  listu = userDao.findAll();
				request.getSession().setAttribute("users", listu);
				request.getRequestDispatcher("WEB-INF/manage_members.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id = (long) Integer.parseInt(request.getParameter("removebutton"));
		userDao.removeOne(id);
		response.sendRedirect("manage-members");
	}
}
