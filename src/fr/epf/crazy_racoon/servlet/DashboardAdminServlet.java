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
import fr.epf.crazy_racoon.dao.TemplateDao;
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
	@Inject
	private UserDao userDao;
	@Inject
	private TemplateDao templateDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") != null) {
			User currentUser = (User) request.getSession().getAttribute("user");

			if (currentUser.getStatut()) {
				DecimalFormat df = new DecimalFormat("########.0");
				int month;
				int year;

				// Initialisation date
				Calendar calendar = Calendar.getInstance();
				month = calendar.get(Calendar.MONTH)+1;
				year = calendar.get(Calendar.YEAR);

				// initialisation des notes du mois
				int[] rates = motmDao.rateDuringMonth(month, year);
				
				//initialisation de la date
				request.getSession().setAttribute("Date", month + "/" + year);
				
				//initialisation nombre membres et nombre templates
				int totalMember = userDao.findAll().size();
				request.getSession().setAttribute("NumberMember", totalMember);
				int totalTemplate = templateDao.findAll().size();
				request.getSession().setAttribute("NumberTemplate", totalTemplate);

				if (rates[5] > 0) {// s'il y a des données
					// Calcul des pourcentage, de la moyenne
					motmDao.initialisationPourcentRates(request, rates, df);
					double average = motmDao.calculateAverage(request, rates, df);
				}
				request.getRequestDispatcher("WEB-INF/dashboard_admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}

	}

}
