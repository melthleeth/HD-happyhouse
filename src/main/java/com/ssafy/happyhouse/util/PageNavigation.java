package com.ssafy.happyhouse.util;

public class PageNavigation {

	private boolean startRange;
	private boolean endRange;
	private int totalCount;
	private int newCount;
	private int totalPageCount;
	private int currentPage;
	private int naviSize;
	private int countPerPage;
	private String navigator;

	public boolean isStartRange() {
		return startRange;
	}

	public void setStartRange(boolean startRange) {
		this.startRange = startRange;
	}

	public boolean isEndRange() {
		return endRange;
	}

	public void setEndRange(boolean endRange) {
		this.endRange = endRange;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNewCount() {
		return newCount;
	}

	public void setNewCount(int newCount) {
		this.newCount = newCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public String getNavigator() {
		return navigator;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public void makeNavigator() {
		int startPage = (currentPage - 1) / naviSize * naviSize + 1;
		int endPage = startPage + naviSize - 1;
		if(totalPageCount < endPage)
			endPage = totalPageCount;
		
		StringBuilder buffer = new StringBuilder();
		buffer.append("		<div class=\"container\"><ul id=\"pagination_style_1\"> \n");
		buffer.append("			<li class=\"page_item_1\" data-pg=\"1\"> \n");
		buffer.append("				<a href=\"#\" id=\"page_link_1\"> << </a> \n");
		buffer.append("			</li> \n");
		buffer.append("			<li class=\"page_item_1\" data-pg=\"" + (this.startRange ? 1 : (startPage - 1)) + "\"> \n");
		buffer.append("				<a href=\"#\" id=\"page_link_1\"> < </a> \n");
		buffer.append("			</li> \n");
		for(int i=startPage;i<=endPage;i++) {
			buffer.append("			<li class=\"page_item_1\" data-pg=\"" + i + "\">\n");
			buffer.append("				<a href=\"#\" id=\"page_link_1\" class=\"" + (currentPage == i ? "page_active" : "") + "\">" + i + "</a></li> \n");
		}
		buffer.append("			<li class=\"page_item_1\" data-pg=\"" + (this.endRange ? endPage : (endPage + 1)) + "\"> \n");
		buffer.append("				<a href=\"#\" id=\"page_link_1\"> > </a> \n");
		buffer.append("			</li> \n");
		buffer.append("			<li class=\"page_item_1\" data-pg=\"" + totalPageCount + "\"> \n");
		buffer.append("				<a href=\"#\" id=\"page_link_1\"> >> </a> \n");
		buffer.append("			</li> \n");
		buffer.append("		</ul></div> \n");
		this.navigator = buffer.toString();
	}

}
