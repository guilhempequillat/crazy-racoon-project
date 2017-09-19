package fr.epf.crazy_racoon.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.Template;
import fr.epf.crazy_racoon.model.User;

@Singleton
public class TemplateDao {
	@PersistenceContext
	private EntityManager em;
	
	public void save(Template template) {
		em.persist(template);
	}
	public void deleteTemplateById(Long id) {
		em.remove(findOne(id));
	}
	public Template findOne(Long id) {
		return em.find(Template.class, id);
	}
	public List<Template> findAll() {
		return em.createQuery("FROM Template").getResultList();
	}
}
