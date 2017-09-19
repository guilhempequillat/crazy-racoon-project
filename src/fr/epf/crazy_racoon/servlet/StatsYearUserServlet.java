package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;

/**
 * Servlet implementation class StatsYearUserServlet
 */
@WebServlet("/stats-year-user")
public class StatsYearUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private UserDao userDao;
	private String[] labelMonth = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jui", "Aug", "Sep", "Oct", "Nov",
			"Dec" };

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		double[] aveRates = userDao.rateMonth();
		for (int i = 0; i < aveRates.length; i++) {
			request.getSession().setAttribute("RateMonth" + (i + 1), aveRates[i]);
		}
		User user = (User) request.getSession().getAttribute("user");
		double[] rates = userDao.ownRateMonth(user.getId());
		for (int i = 0; i < rates.length; i++) {
			request.getSession().setAttribute("Rate2Month" + (i + 1), rates[i]);
		}
		initializeLabels(request);
		request.getRequestDispatcher("WEB-INF/stats-year-user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void initializeLabels (HttpServletRequest request){
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH)+1;
		for(int i=0;i<12;i++){
			String m = labelMonth[month];
			request.getSession().setAttribute("LabelMonth"+(i+1), m);
			month++;
			if(month>11){
				month=0;
			}
		}
	}

}
