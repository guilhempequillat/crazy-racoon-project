package fr.epf.crazy_racoon;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MotmForm
 */
@WebServlet("/motm-form")
public class MotmFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private UserDao userDao;
	
    public MotmFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/motm-form.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Motm motm=parseMotm(request);
		request.getSession().setAttribute("motm", motm);
		response.sendRedirect("motm-submit-servlet");
	}
	public Motm parseMotm(HttpServletRequest req) {
		String comment=req.getParameter("comment");
		int grade=Integer.parseInt(req.getParameter("grade"));
		Motm motm=new Motm(grade,comment);
		return motm;
	}

}
