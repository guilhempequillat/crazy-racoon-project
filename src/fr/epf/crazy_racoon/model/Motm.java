package fr.epf.crazy_racoon.model;

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
	
	public Motm(int grade, String comment, User user) {
		super();
		this.grade = grade;
		this.comment = comment;
		this.user = user;
	}
	public Motm(int grade, String comment) {
		super();
		this.grade = grade;
		this.comment = comment;
	}
	public Motm() {
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
}
