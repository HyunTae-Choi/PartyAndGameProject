package com.pag.common.vo;

public class StatisticVO {
	// filed, st로 시작하는 것은 통계를 위한 오리지널 변수
	// 그외로 시작하는 것은 실제 존재하는 컬럼
	private String st_Month; // 년-월별
	private int st_Count; // 건수 (월별)

	// 성별통계
	private String m_Gender; // 회원 성별

	// 매출통계
	private int st_Price; // 매출 (월별)

	// getter and setter
	public String getSt_Month() {
		return st_Month;
	}

	public void setSt_Month(String st_Month) {
		this.st_Month = st_Month;
	}

	public int getSt_Count() {
		return st_Count;
	}

	public void setSt_Count(int st_Count) {
		this.st_Count = st_Count;
	}

	public String getM_Gender() {
		return m_Gender;
	}

	public void setM_Gender(String m_Gender) {
		this.m_Gender = m_Gender;
	}

	public int getSt_Price() {
		return st_Price;
	}

	public void setSt_Price(int st_Price) {
		this.st_Price = st_Price;
	}

	@Override
	public String toString() {
		return "StatisticVO [st_Month=" + st_Month + ", st_Count=" + st_Count + ", m_Gender=" + m_Gender + ", st_Price="
				+ st_Price + "]";
	}

}
