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
import fr.epf.crazy_racoon.model.DateReport;
import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class ReportAdminServlet
 */
@WebServlet("/report-admin")
public class ReportAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private MotmDao motmDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") != null) {
			User currentUser = (User) request.getSession().getAttribute("user");

			if (currentUser.getStatut()) {
				DecimalFormat df = new DecimalFormat("########.0");
				int month;
				int year;
				
				//If the year and the month has been initialized
				if (request.getParameter("month") != null && request.getParameter("year") != null) {
					month = Integer.parseInt(request.getParameter("month"));
					year = Integer.parseInt(request.getParameter("year"));
				} else {
					//if not the current month is choose
					Calendar calendar = Calendar.getInstance();
					month = calendar.get(Calendar.MONTH);
					year = calendar.get(Calendar.YEAR);
				}
				
				//Initisation of the list of months
				List<DateReport> listMonth = motmDao.chargeAvailableDate();
				request.getSession().setAttribute("months", listMonth);

				//initialisation of the date
				request.getSession().setAttribute("Date", month + "/" + year);

				//initialisation of rates of the month
				int[] rates = motmDao.rateDuringMonth(month, year);

				if (rates[5] > 0) {//if there is data
					//Calculation of the average and the percentage
					motmDao.initialisationPourcentRates(request, rates, df);
					double average = motmDao.calculateAverage(request, rates, df);
					
					//initialisation of the picture and comments
					motmDao.adaptPicture(request, average);
					List<Motm> motms = motmDao.commentsDuringMonth(month, year);
					
					request.getSession().setAttribute("motms", motms);
				}
				request.getRequestDispatcher("WEB-INF/report-admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}

	}

}
