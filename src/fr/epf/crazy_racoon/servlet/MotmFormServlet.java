package fr.epf.crazy_racoon.servlet;

import java.util.List;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import fr.epf.crazy_racoon.dao.MotmDao;
import fr.epf.crazy_racoon.dao.UserDao;
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
		if (request.getSession().getAttribute("user") != null) {
			loadMotm(request);
		} else {
			request.getSession().setAttribute("motm", null);
		}
		request.getRequestDispatcher("WEB-INF/motm-form.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Motm motm=parseMotm(request);
		//request.getSession().setAttribute("motm", motm);
		saveMotmInSession(request, motm);
		motmDao.save(motm);
		request.getSession().setAttribute("commentDefine", true);
		response.sendRedirect("motm-form");
	}
	public Motm parseMotm(HttpServletRequest req) {
		String comment=req.getParameter("comment");
		User user=(User) req.getSession().getAttribute("user");
		Timestamp stamp = new Timestamp(System.currentTimeMillis());
		Date motmDate=new Date(stamp.getTime());
		int grade=Integer.parseInt(req.getParameter("grade"));
		Motm motm=new Motm(grade,comment,user,motmDate);
		Long idUser=(long) user.getId();
		checkMotmDate(idUser);
		return motm;
	}
	public void checkMotmDate(Long idUser) {
		Timestamp stamp = new Timestamp(System.currentTimeMillis());
		Date stampDate=new Date(stamp.getTime());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(stampDate);
		List<Motm> listMotm=new ArrayList<Motm>();
		listMotm=motmDao.fillAllByIdUser(idUser);
		for(int i=0;i<listMotm.size();i++) {
			java.util.Date motmDate= listMotm.get(i).getMotmDate();
			Calendar calendarMotm = Calendar.getInstance();
			calendarMotm.setTime(motmDate);
			if(calendarMotm.get(Calendar.MONTH) == calendar.get(Calendar.MONTH) && calendarMotm.get(Calendar.YEAR)== calendar.get(Calendar.YEAR)) {
				motmDao.deleteMotmById(listMotm.get(i).getId());
			}
		}
	}
	public void loadMotm(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		List<Motm> listMotm = new ArrayList<Motm>();
		listMotm = motmDao.fillAllByIdUser(user.getId());
		if(listMotm.size() > 0) {
			//request.getSession().setAttribute("motm", listMotm.get(0));
			saveMotmInSession(request, listMotm.get(0));
			request.getSession().setAttribute("commentDefine", true);
		}else {
			request.getSession().setAttribute("motm", null);
		}
	}
	public void saveMotmInSession(HttpServletRequest request, Motm motm) {
		request.getSession().setAttribute("motm", motm);
		java.util.Date motmDate = motm.getMotmDate();
		Calendar calendarMotm = Calendar.getInstance();
		calendarMotm.setTime(motmDate);
		Timestamp stamp = new Timestamp(System.currentTimeMillis());
		Date stampDate=new Date(stamp.getTime());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(stampDate);
		request.getSession().setAttribute("year",(int) (calendar.get(Calendar.YEAR)-calendarMotm.get(Calendar.YEAR)));
		request.getSession().setAttribute("month",(int) (calendar.get(Calendar.MONTH)-calendarMotm.get(Calendar.MONTH)));
		request.getSession().setAttribute("day",(int) (calendar.get(Calendar.DAY_OF_MONTH)-calendarMotm.get(Calendar.DAY_OF_MONTH)));
	}
}
