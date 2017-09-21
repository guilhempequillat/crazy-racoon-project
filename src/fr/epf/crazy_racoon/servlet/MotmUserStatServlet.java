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
import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class MotmUserStatServlet
 */
@WebServlet("/motm-user-stat")
public class MotmUserStatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private MotmDao motmDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") != null) {
			User currentUser = (User) request.getSession().getAttribute("user");
			if (!currentUser.getStatut()) {
				DecimalFormat df = new DecimalFormat("########.0");

				// initialisation de la date a afficher
				Calendar calendar = Calendar.getInstance();
				int month = calendar.get(Calendar.MONTH) + 1;
				int year = calendar.get(Calendar.YEAR);
				request.getSession().setAttribute("Date", (month - 1) + "/" + (year - 1) + " - " + month + "/" + year);

				User user = (User) request.getSession().getAttribute("user");

				// initialisation des pourcentages
				long id = user.getId();
				int[] rates = motmDao.ownRateDuringYear(id);

				if (rates[5] > 0) {// s'il y a des données
					motmDao.initialisationPourcentRates(request, rates, df);

					// initialisation de la moyenne de l'image associée et des
					// commentaires
					double average = motmDao.calculateAverage(request, rates, df);
					motmDao.adaptPicture(request, average);
					List<Motm> motms = motmDao.ownCommentsDuringYear(id);

					request.getSession().setAttribute("motms", motms);
				}
				request.getRequestDispatcher("WEB-INF/motm_user_stat.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}
	}

}
