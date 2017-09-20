package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.MotmDao;
import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.DateReport;
import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class DashboardAdminServlet
 */
@WebServlet("/dashboard-admin")
public class DashboardAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private MotmDao motmDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			User currentUser = (User) request.getSession().getAttribute("user");
			if (currentUser.getStatut()) {
				DecimalFormat df = new DecimalFormat("########.0");
				int month;
				int year;
				if(request.getSession().getAttribute("month")!=null&&request.getSession().getAttribute("year")!=null){
					month=(int) request.getSession().getAttribute("month");
					year=(int) request.getSession().getAttribute("year");				
				}else{
					Calendar calendar = Calendar.getInstance();
					month = calendar.get(Calendar.MONTH);
					year = calendar.get(Calendar.YEAR);
				}
				List<DateReport> listMonth = motmDao.chargeAvailableDate();
				request.getSession().setAttribute("months", listMonth);
				
				request.getSession().setAttribute("Date", month + "/" + year);

				int[] rates = motmDao.rateMonth(month, year);
				motmDao.initialisationRates(request, rates, df);

				double average = motmDao.calculateAverage(request, rates, df);
				motmDao.adaptPicture(request, average);
				List<Motm> motms = motmDao.commentsMonth(month, year);
				request.getSession().setAttribute("motms", motms);
				request.getRequestDispatcher("WEB-INF/dashboard_admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}
		
	}

	

}
