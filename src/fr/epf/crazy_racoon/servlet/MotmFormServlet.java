package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.MotmDao;
import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class MotmForm
 */
@WebServlet("/motm-form")
public class MotmFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private MotmDao motmDao;
	
    public MotmFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("commentDefine", false);
		request.getRequestDispatcher("WEB-INF/motm-form.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Motm motm=parseMotm(request);
		request.getSession().setAttribute("motm", motm);
		motmDao.save(motm);
		request.getSession().setAttribute("commentDefine", true);
		response.sendRedirect("motm-form");
	}
	public Motm parseMotm(HttpServletRequest req) {
		String comment=req.getParameter("comment");
		int grade=Integer.parseInt(req.getParameter("grade"));
		Motm motm=new Motm(grade,comment);
		return motm;
	}
}
