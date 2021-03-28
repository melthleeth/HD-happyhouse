package com.ssafy.happyhouse.parse;

public class HappyHouseDTO {
	public static String APT_DEAL = "아파트 매매";
	public static String APT_RENT = "아파트 전월세";
	public static String HOUSE_DEAL = "주택 매매";
	public static String HOUSE_RENT = "주택 전월세";

	/** 거래 정보를 식별할 번호 */
	private int no;
	/** 법정 동명 */
	private String dong;
	/** 아파트 이름 */
	private String name;
	/** 지역코드 */
	private String regionCode;
	/** 거래금액/보증금액 */
	private String dealAmount;
	/** 월세금액 */
	private String rentAmount;
	/** 건축 년도 */
	private String buildYear;
	/** 년 */
	private String dealYear;
	/** 월 */
	private String dealMonth;
	/** 일 */
	private String dealDay;
	/** 전용면적 */
	private String area;
	/** 층 */
	private String floor;
	/** 지번 */
	private String jibun;
	/** type */
	private String type;

	/**
	 * type 1 : 아파트 매매
	 *  	2 : 연립 다세세 매매 
	 *  	3 : 아파트 전월세 
	 *  	4 : 연립 다세세 전월세
	 */
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String code) {
		this.regionCode = code;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getRentAmount() {
		return rentAmount;
	}

	public void setRentAmount(String rentAmount) {
		this.rentAmount = rentAmount;
	}

	public String getBuildYear() {
		return buildYear;
	}

	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}

	public String getDealYear() {
		return dealYear;
	}

	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}

	public String getDealMonth() {
		return dealMonth;
	}

	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}

	public String getDealDay() {
		return dealDay;
	}

	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "HappyHouseDTO [no=" + no + ", dong=" + dong + ", name=" + name + ", code=" + regionCode + ", dealAmount="
				+ dealAmount + ", rentAmount=" + rentAmount + ", buildYear=" + buildYear + ", dealYear=" + dealYear
				+ ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", area=" + area + ", floor=" + floor
				+ ", jibun=" + jibun + ", type=" + type + "]";
	}
	
}
