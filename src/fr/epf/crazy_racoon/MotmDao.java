package fr.epf.crazy_racoon;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Singleton
public class MotmDao {
	@PersistenceContext
	private EntityManager em;
	
	public void save(Motm motm) {
		em.persist(motm);
	}
	
}
