package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.io.StringWriter;
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
 * Servlet implementation class StatsYearAdminServlet
 */
@WebServlet("/stats-year-admin")
public class StatsYearAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private MotmDao motmDao;
	private String[] labelMonth = {"Jan","Feb","Mar","Apr","May","Jun","Jui","Aug","Sep","Oct","Nov","Dec"};
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")!=null){
			User currentUser = (User) request.getSession().getAttribute("user");
			
			if (currentUser.getStatut()) {
				
				//initialisation of rates
				double[] rates = motmDao.ratePerMonth();
				for(int i=0; i<rates.length;i++){
					request.getSession().setAttribute("RateMonth"+(i+1), rates[i]);
				}		
				
				//initialisation of labels
				initializeLabels(request);
				request.getRequestDispatcher("WEB-INF/stats-year-admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
