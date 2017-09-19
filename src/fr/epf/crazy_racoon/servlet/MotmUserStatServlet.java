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

	protected void doGet( HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DecimalFormat df = new DecimalFormat("########.0"); 
		
		//initialisation de la date a afficher
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 1;
		int year = calendar.get(Calendar.YEAR);
		request.getSession().setAttribute("Date", (month - 1) + "/" + (year - 1) + " - " + month + "/" + year);

		User user = (User) request.getSession().getAttribute("user");
		
		// user.getId();
		long id= 16;
		int[] rates = motmDao.ownRateYear(id);
		initialisationRates(request, rates, df);
		
		double average = calculateAverage(request, rates, df);
		adaptPicture(request, average);
		List<Motm> motms =motmDao.ownComments(id);
		request.getSession().setAttribute("motms", motms);
		request.getRequestDispatcher("WEB-INF/motm_user_stat.jsp").forward(request, response);
	}
	
	public void initialisationRates(HttpServletRequest request, int[] rates, DecimalFormat df){
		for (int i = 0; i < rates.length - 1; i++) {
			request.getSession().setAttribute("Rate" + (i + 1), rates[i]);
			double number = rates[i];
			double total = rates[5];
			double pourcent = number / total * 100;
			String str = df.format(pourcent); 
			double pourcentStr = Double.parseDouble(str.replace(',', '.'));
			if (pourcent != 0) {
				request.getSession().setAttribute("Pourcent" + (i + 1), pourcentStr);
			} else {
				request.getSession().setAttribute("Pourcent" + (i + 1), 0);
			}
		}
	}
	
	public double calculateAverage(HttpServletRequest request, int[] rates, DecimalFormat df){
		int sum=0;
		for (int i = 0; i < rates.length - 1; i++) {
			sum += rates[i]*(i+1);
		}		
		double sumDouble = sum;
		double total = rates[5];
		double average = sumDouble/total;
		String str = df.format(average); 
		double averageStr = Double.parseDouble(str.replace(',', '.'));
		request.getSession().setAttribute("Average", averageStr);
		return average;
	}
	
	public void adaptPicture (HttpServletRequest request, Double average){
		if(average<=1){
			request.getSession().setAttribute("Picture", "img/racoon1.jpg");
		}else if(average<=2){
			request.getSession().setAttribute("Picture", "img/racoon2.jpg");
		}else if (average<=3){
			request.getSession().setAttribute("Picture", "img/racoon3.jpg");
		}else if(average<=4){
			request.getSession().setAttribute("Picture", "img/racoon4.jpg");
		}else{
			request.getSession().setAttribute("Picture", "img/racoon5.jpg");
		}
					
	}

}
