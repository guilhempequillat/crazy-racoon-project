package fr.epf.crazy_racoon.model;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Motm {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private int grade;
	private String comment;
	@OneToOne(targetEntity=User.class)
    private User user;
	private Date motmDate;
	
	public Motm(int grade, String comment, User user, Date motmDate) {
		super();
		this.grade = grade;
		this.comment = comment;
		this.user = user;
		this.motmDate = motmDate;
	}
	public Motm(int grade, String comment) {
		super();
		this.grade = grade;
		this.comment = comment;
	}
	public Motm() {
	}
	
	public Date getMotmDate() {
		return motmDate;
	}
	public void setMotmDate(Date motmDate) {
		this.motmDate = motmDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDateToString() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(motmDate);
		return calendar.get(Calendar.MONTH)+"/"+calendar.get(Calendar.DAY_OF_MONTH)
			+"/"+calendar.get(Calendar.YEAR);
	}
}
