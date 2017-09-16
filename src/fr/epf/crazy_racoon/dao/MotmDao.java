package fr.epf.crazy_racoon.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.crazy_racoon.model.Motm;
import fr.epf.crazy_racoon.model.User;

@Singleton
public class MotmDao {
	@PersistenceContext
	private EntityManager em;
	
	public void save(Motm motm) {
		em.persist(motm);
	}
	
	public Motm findOne(Long id) {
		return em.find(Motm.class, id);
	}
	
	public List<Motm> findAll() {
		return em.createQuery("FROM Motm").getResultList();
	}
	
	public List<Motm> fillAllByIdUser(Long id_user){
		return em.createQuery("FROM Motm WHERE user_id="+id_user).getResultList();
	}
	
	public void deleteMotmById(Long id) {
		em.remove(findOne(id));
	}
}
