package com.ssafy.happyhouse.model.dto;

public class BadStore {
	private String name;
	private String badSactor;
	private String checkDate;
	private String checkList;
	private String place;
	
	public BadStore() {}
	
	public BadStore(String name, String badSactor, String checkDate, String checkList, String place) {
		super();
		this.name = name;
		this.badSactor = badSactor;
		this.checkDate = checkDate;
		this.checkList = checkList;
		this.place = place;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBadSactor() {
		return badSactor;
	}
	public void setBadSactor(String badSactor) {
		this.badSactor = badSactor;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getCheckList() {
		return checkList;
	}
	public void setCheckList(String checkList) {
		this.checkList = checkList;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		return "BadStore [name=" + name + ", badSactor=" + badSactor + ", checkDate=" + checkDate + ", checkList="
				+ checkList + ", place=" + place + "]";
	}
	
	
}
