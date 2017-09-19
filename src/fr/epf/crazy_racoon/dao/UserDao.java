package fr.epf.crazy_racoon.dao;

import java.util.Date;
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
	
	public User findOne(Long id) {
		return em.find(User.class, id);
	}
	
	public List<User> findAll() {
		return em.createQuery("FROM User").getResultList();
	}
	
	public void updateOne(String firstName, String lastName, String email, Date d, Long id) {
		User userEdit =em.find(User.class, id);
		if(firstName.equals(userEdit.getFirstName())==false){
			userEdit.setFirstName(firstName);
		}
		if(lastName.equals(userEdit.getLastName())==false){
			userEdit.setLastName(lastName);
		}
		if(email.equals(userEdit.getEmail())==false){
			userEdit.setEmail(email);
		}
		if(d!=userEdit.getBirthdate()){
			userEdit.setBirthdate(d);
			userEdit.setStringDate();
		}
		em.flush();
	}
	
	public void removeOne(Long id){
		em.remove(findOne(id));
	}
}
