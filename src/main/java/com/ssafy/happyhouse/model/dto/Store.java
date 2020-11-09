package com.ssafy.happyhouse.model.dto;

public class Store {
	// idx = 1, 4, 8, 18
	private String name;
	private String category;
	private String subclass;
	private String area;
	
	public Store(){}
	
	public Store(String name, String category, String subclass, String area) {
		super();
		this.name = name;
		this.category = category;
		this.subclass = subclass;
		this.area = area;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubclass() {
		return subclass;
	}
	public void setSubclass(String subclass) {
		this.subclass = subclass;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "Store [name=" + name + ", category=" + category + ", subclass=" + subclass + ", area=" + area + "]";
	}
	
	
}
