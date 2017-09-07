package fr.epf.crazy_racoon;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Singleton
public class UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public void save(User u) {
		em.persist(u);
	}
	
//	public User findOne(Long id) {
//		return em.find(User.class, id);
//	}
//	
//	public List<User> findAll() {
//		return em.createQuery("SELECT * FROM user").getResultList();
//	}
}
