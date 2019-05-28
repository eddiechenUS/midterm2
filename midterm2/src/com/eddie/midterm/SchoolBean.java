package com.eddie.midterm;

public class SchoolBean {

	private int num;
	private int school_code;
	private String school_name;
	private String major_code;
	private String major_name;
	private String level_code;
	private String city_code;
	private double avg_score1;
	private java.sql.Date deadline1;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num=num;
	}
	

	public int getSchool_code() {
		return school_code;
	}

	public void setSchool_code(int school_code) {
		this.school_code = school_code;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getMajor_code() {
		return major_code;
	}

	public void setMajor_code(String major_code) {
		this.major_code = major_code;
	}

	public String getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}

	public String getLevel_code() {
		return level_code;
	}

	public void setLevel_code(String level_code) {
		this.level_code = level_code;
	}

	public String getCity_code() {
		return city_code;
	}

	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}

	public double getAvg_score1() {
		return avg_score1;
	}

	public void setAvg_score1(double avg_score1) {
		this.avg_score1 = avg_score1;
	}

	public java.sql.Date getDeadline1() {
		return deadline1;
	}

	public void setDeadline1(java.sql.Date date) {
		this.deadline1 = date;
	}

	

}
