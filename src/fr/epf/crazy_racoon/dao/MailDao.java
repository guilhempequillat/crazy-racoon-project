package fr.epf.crazy_racoon.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.crazy_racoon.model.Mail;

@Singleton
public class MailDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public void save(Mail m) {
		em.persist(m);
	}
	
	public Mail findOne(Long id) {
		return em.find(Mail.class, id);
	}
	
	public List<Mail> findAll() {
		return em.createQuery("FROM Mail").getResultList();
	}
	
	public void updateOne(String subject, String content, Long id) {
		Mail mailEdit =em.find(Mail.class, id);
		if(subject.equals(mailEdit.getSubject())==false){
			mailEdit.setSubject(subject);
		}
		if(content.equals(mailEdit.getContent())==false){
			mailEdit.setContent(content);
		}

		em.flush();
	}
}

