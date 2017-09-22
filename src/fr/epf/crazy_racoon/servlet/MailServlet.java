package fr.epf.crazy_racoon.servlet;

import fr.epf.crazy_racoon.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.MailDao;
import fr.epf.crazy_racoon.dao.UserDao;
import fr.epf.crazy_racoon.model.User;


@WebServlet("/mail")
public class MailServlet extends HttpServlet {

private Session mailSession;
	 
	private static final long serialVersionUID = 1L;
       
	@Inject
	private UserDao userDao;
	@Inject
	private MailDao mailDao;
	
	private List <User>  listu;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listu = userDao.findAll();
		request.getSession().setAttribute("users", listu);
		request.getRequestDispatcher("WEB-INF/mail.jsp").forward(request, response);
			
	   		if(request.getSession().getAttribute("user")!=null){
				User currentUser = (User) request.getSession().getAttribute("user");
				
				if (currentUser.getStatut()) {
					request.getRequestDispatcher("WEB-INF/mail.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("WEB-INF/error.jsp").forward(request, response);
				}
			}else{
				request.getRequestDispatcher("WEB-INF/not_connected.jsp").forward(request, response);
			}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		Mail m;
		try {
			m=parseMail(req);
			req.getSession().setAttribute("users", listu);
			mailDao.save(m);
			Mail.sendmail(Mail.listusersemail(listu),m.getSubject(),m.getContent());
			response.sendRedirect("mail");
		} catch(ParseException e)
		{
			e.printStackTrace();
		}
		catch (MessagingException e) {
			e.printStackTrace();
		} 
        
	}
	
	private Mail parseMail(HttpServletRequest req) throws ParseException {
		String subject = req.getParameter("name");
		String content = emailBody( req.getParameter("email-template") );
		return new Mail(subject, content);
	}
	
	private String emailBody(String input) {
		String body ="<h1>Hi !</h1>"+
			"<h3>Don't forget to complete your motm form !</h3>"+
			"<p>"+input+"</p>"+
			"<br>Regards, your administrator<br><a href=\"http://localhost:8080/crazy-racoon/register\">Go to crazy racoon!</a>";
		return body;
	}
	
}
