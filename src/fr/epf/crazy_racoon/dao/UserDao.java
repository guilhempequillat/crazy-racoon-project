package fr.epf.crazy_racoon.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.crazy_racoon.model.User;

@Singleton
public class UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public void save(User u) {
		em.persist(u);
	}
	
	public User findOne(String id) {
		return em.find(User.class, id);
	}
	
	public List<User> findAll() {
		return em.createQuery("FROM User").getResultList();
	}
}
