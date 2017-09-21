package fr.epf.crazy_racoon.dao;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import fr.epf.crazy_racoon.model.DateReport;
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

	public int[] rateMonth(int month, int year) {
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		int[] rates = new int[6];
		calendar.set(year, month - 1, 1, 0, 0);
		int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		Date dateDebut = calendar.getTime();
		calendar.set(year, month - 1, nbDay, 23, 59);
		Date dateFin = calendar.getTime();

		Iterator<Motm> iterator = result.iterator();
		while (iterator.hasNext()) {
			Motm motm = iterator.next();
			Date thisDate = motm.getMotmDate();
			if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0) {
				int i = motm.getGrade();
				rates[motm.getGrade() - 1]++;
				rates[5]++;
			}
		}
		return rates;
	}

	public List<Motm> ownComments(Long userId) {
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

	public List<Motm> commentsMonth(int month, int year) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		List<Motm> result = em.createQuery("FROM Motm").getResultList();
		List<Motm> finalResult = new ArrayList<Motm>();
		month-=1;
		calendar.set(year, month, 1, 0, 0);
		int nbDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

		Date dateDebut = calendar.getTime();
		calendar.set(year, month, nbDay, 23, 59);
		Date dateFin = calendar.getTime();

		String d = sdf.format(dateDebut);
		String f = sdf.format(dateFin);

		Iterator<Motm> iterator = result.iterator();
		while (iterator.hasNext()) {
			Motm motm = iterator.next();
			Date thisDate = motm.getMotmDate();
			if (thisDate.compareTo(dateFin) <= 0 && thisDate.compareTo(dateDebut) >= 0) {
				finalResult.add(motm);
			}
		}
		return finalResult;
	}

	public List<DateReport> chargeAvailableDate() {
		List<Date> result = em.createQuery("SELECT motmDate FROM Motm ORDER BY motmDate DESC").getResultList();
		List<DateReport> dateResult = new ArrayList<DateReport>();
		boolean findDate =false;

		for (int i = 0; i < result.size(); i++) {
			findDate=false;
			Date motmDate = result.get(i);
			int motmDateMonth = motmDate.getMonth()+1;
			int motmDateYear = motmDate.getYear()+1900;
			if (dateResult.size() != 0) {
				for (int j = 0; j < dateResult.size(); j++) {
					DateReport thisDate = dateResult.get(j);
					if (motmDateMonth==thisDate.getMonthNumber() && motmDateYear==thisDate.getYearNumber()) {
						findDate=true;
					}
				}
				if(!findDate){
					DateReport thismonth = new DateReport (new SimpleDateFormat("MMMM yyyy").format(motmDate),motmDateMonth,motmDateYear);
					dateResult.add(thismonth);
				}
			} else {
				DateReport thismonth = new DateReport (new SimpleDateFormat("MMMM yyyy").format(motmDate),motmDateMonth,motmDateYear);
				dateResult.add(thismonth);
			}
		}
		return dateResult;
	}

	public void initialisationRates(HttpServletRequest request, int[] rates, DecimalFormat df) {
		for (int i = 0; i < rates.length - 1; i++) {
			request.getSession().setAttribute("Rate" + (i + 1), rates[i]);
			double number = rates[i];
			double total = rates[5];
			double pourcent = number / total * 100;
			String str = df.format(pourcent);
			double pourcentStr = Double.parseDouble(str.replace(',', '.'));
			if (pourcent != 0) {
				request.getSession().setAttribute("Pourcent" + (i + 1), pourcentStr);
			} else {
				request.getSession().setAttribute("Pourcent" + (i + 1), 0);
			}
		}
	}

	public double calculateAverage(HttpServletRequest request, int[] rates, DecimalFormat df) {
		int sum = 0;
		for (int i = 0; i < rates.length - 1; i++) {
			sum += rates[i] * (i + 1);
		}
		double sumDouble = sum;
		double total = rates[5];
		double average = sumDouble / total;
		String str = df.format(average);
		double averageStr = Double.parseDouble(str.replace(',', '.'));
		request.getSession().setAttribute("Average", averageStr);
		return average;
	}

	public void adaptPicture(HttpServletRequest request, Double average) {
		if (average <= 1) {
			request.getSession().setAttribute("Picture", "img/racoon1.jpg");
		} else if (average <= 2) {
			request.getSession().setAttribute("Picture", "img/racoon2.jpg");
		} else if (average <= 3) {
			request.getSession().setAttribute("Picture", "img/racoon3.jpg");
		} else if (average <= 4) {
			request.getSession().setAttribute("Picture", "img/racoon4.jpg");
		} else {
			request.getSession().setAttribute("Picture", "img/racoon5.jpg");
		}
	}
	
	public String toStringCsv() {
		List<Motm> list = findAll();
		String result = "";
		result = "Grade,Comment,Date\n";
		for(int i = 0 ; i<list.size() ; i++) {
			result += list.get(i).getGrade()+","
				+list.get(i).getComment()+","
				+list.get(i).getDateToString()+"\n";
		}
		return result;
	}

}
