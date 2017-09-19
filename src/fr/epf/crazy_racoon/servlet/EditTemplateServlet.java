package fr.epf.crazy_racoon.servlet;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.crazy_racoon.dao.TemplateDao;
import fr.epf.crazy_racoon.model.Template;

/**
 * Servlet implementation class EditTemplateServlet
 */
@WebServlet("/edit-template")
public class EditTemplateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private TemplateDao templateDao;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loadCurrentTemplate(request);
		request.getRequestDispatcher("WEB-INF/edit_template.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		saveTemplate(request);
		loadCurrentTemplate(request);
		request.getRequestDispatcher("WEB-INF/edit_template.jsp").forward(request, response);
	}
	
	public void saveTemplate(HttpServletRequest request) {
		Template template = parseTemplate(request);
		deleteOldTemplate();
		templateDao.save(template);
	}
	
	public Template parseTemplate(HttpServletRequest request) {
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		Template template = new Template(title, text);
		return template;
	}
	public void deleteOldTemplate() {
		List<Template> oldsTemplates = templateDao.findAll();
		if (oldsTemplates.size() > 0) {
			for(int i=0; i<oldsTemplates.size(); i++) {
				templateDao.deleteTemplateById(oldsTemplates.get(i).getId());
			}
		}
	}
	public void loadCurrentTemplate(HttpServletRequest request) {
		List<Template> listTemplate = templateDao.findAll();
		if (listTemplate.size() > 0) {
			request.getSession().setAttribute("template", listTemplate.get(0));
		}
	}
}
