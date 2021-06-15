package com.pag.common.vo;

public class PageVO {

	// filed
	private int totalCnt; // 전체 글 수
	private int maxSection; // 최대 섹션
	private int maxPage; // 최대 페이지 번호
	private int section; // 현재 섹션
	private int page; // 현재 페이지 번호
	private String category; // 카테고리
	private int lineNumber; // 1페이지당 글 수

	// getter and setter
	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getMaxSection() {
		return maxSection;
	}

	public void setMaxSection(int maxSection) {
		this.maxSection = maxSection;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(int lineNumber) {
		this.lineNumber = lineNumber;
	}

	@Override
	public String toString() {
		return "PageVO [totalCnt=" + totalCnt + ", maxSection=" + maxSection + ", maxPage=" + maxPage + ", section="
				+ section + ", page=" + page + ", category=" + category + ", lineNumber=" + lineNumber + "]";
	}

}
