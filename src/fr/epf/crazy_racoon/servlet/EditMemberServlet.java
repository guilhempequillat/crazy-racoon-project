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
 * Servlet implementation class EditMemberServlet
 */
@WebServlet("/edit-member")
public class EditMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private UserDao userDao;
	private User userEdit;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			User currentUser = (User) request.getSession().getAttribute("user");
			
			if (currentUser.getStatut()) {
				
				String id = request.getParameter("editbutton");
				Long i= (long) Integer.parseInt(id);
				userEdit = userDao.findOne(i);
				request.getSession().setAttribute("userEdit", userEdit);
				request.getRequestDispatcher("WEB-INF/edit_member.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		try {
			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String email = req.getParameter("email");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sdf.parse(req.getParameter("birthdate"));
			userDao.updateOne(firstName, lastName, email, d, userEdit.getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		response.sendRedirect("manage-members");
	}
}
