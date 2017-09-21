package fr.epf.crazy_racoon.model;

public class DateReport {
	
	String dateString;
	int monthNumber;
	int yearNumber;
	
	public DateReport(String monthString, int monthNumber, int yearNumber){
		this.dateString =monthString;
		this.monthNumber = monthNumber;
		this.yearNumber = yearNumber;
	}

	public int getYearNumber() {
		return yearNumber;
	}

	public void setYearNumber(int yearNumber) {
		this.yearNumber = yearNumber;
	}

	public String getDateString() {
		return dateString;
	}

	public void setDateString(String monthString) {
		this.dateString = monthString;
	}

	public int getMonthNumber() {
		return monthNumber;
	}

	public void setMonthNumber(int monthNumber) {
		this.monthNumber = monthNumber;
	}

}
