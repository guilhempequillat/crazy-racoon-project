package fr.epf.crazy_racoon.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
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

	public List<Motm> fillAllByIdUser(Long id_user) {
		return em.createQuery("FROM Motm WHERE user_id=" + id_user + " ORDER BY motmDate DESC").getResultList();
	}

	public void deleteMotmById(Long id) {
		em.remove(findOne(id));
	}

	public double[] rateMonth() {
		double sum = 0;
		double tot = 0;
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		double[] moy = new double[12];
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR);

		for (int i = 0; i < moy.length; i++) {
			sum = 0;
			tot = 0;
			calendar.set(year, month, 1, 0, 0);
			int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

			Date dateDebut = calendar.getTime();
			calendar.set(year, month, nbDay, 23, 59);
			Date dateFin = calendar.getTime();

			Iterator<Motm> iterator = result.iterator();
			while (iterator.hasNext()) {
				Motm motm = iterator.next();
				Date thisDate = motm.getMotmDate();
				if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0) {
					tot++;
					sum = sum + motm.getGrade();
				}
			}
			if (tot != 0) {
				moy[11 - i] = sum / tot;
			}
			month--;
			if (month < 1) {
				month = 12;
				year--;
			}
		}
		return moy;
	}

	public double[] ownRateMonth(Long userId) {
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		double[] rates = new double[12];
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR);

		for (int i = 0; i < rates.length; i++) {
			calendar.set(year, month, 1, 0, 0);
			int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

			Date dateDebut = calendar.getTime();
			calendar.set(year, month, nbDay, 23, 59);
			Date dateFin = calendar.getTime();

			Iterator<Motm> iterator = result.iterator();
			while (iterator.hasNext()) {
				Motm motm = iterator.next();
				Date thisDate = motm.getMotmDate();
				if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0
						&& motm.getUser().getId() == userId) {
					rates[11 - i] = motm.getGrade();
				}
			}
			month--;
			if (month < 1) {
				month = 12;
				year--;
			}
		}
		return rates;
	}

	public int[] ownRateYear(Long userId) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		int[] rates = new int[6];
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR) - 1;
		calendar.set(year, month, 1, 0, 0);
		int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_YEAR);

		Date dateDebut = calendar.getTime();
		calendar.add(Calendar.DATE, nbDay - 2);
		Date dateFin = calendar.getTime();

		String d = sdf.format(dateDebut);
		String f = sdf.format(dateFin);

		Iterator<Motm> iterator = result.iterator();
		while (iterator.hasNext()) {
			Motm motm = iterator.next();
			Date thisDate = motm.getMotmDate();
			if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0
					&& motm.getUser().getId() == userId) {
				int i = motm.getGrade();
				rates[motm.getGrade() - 1]++;
				rates[5]++;
			}
		}
		return rates;
	}

	public List<Motm> ownComments(Long userId) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		List<Motm> finalResult = new ArrayList<Motm>();
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR) - 1;
		calendar.set(year, month, 1, 0, 0);
		int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_YEAR);

		Date dateDebut = calendar.getTime();
		calendar.add(Calendar.DATE, nbDay - 2);
		Date dateFin = calendar.getTime();

		String d = sdf.format(dateDebut);
		String f = sdf.format(dateFin);

		Iterator<Motm> iterator = result.iterator();
		while (iterator.hasNext()) {
			Motm motm = iterator.next();
			Date thisDate = motm.getMotmDate();
			if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0
					&& motm.getUser().getId() == userId) {
				finalResult.add(motm);
			}
		}
		return finalResult;
	}

}
