package com.pag.client.review.vo;

import java.sql.Timestamp;

import com.pag.client.member.vo.MemberVO;

public class ReviewVO {

	// field
	private int rv_No; // 리뷰 번호 (PK)
	private int rv_Grade; // 리뷰 점수
	private String rv_Content; // 리뷰 내용
	private Timestamp rv_Date; // 리뷰 작성일
	private String rv_Availabled; // 리뷰 유효여부 default '유효', '회원비활성', '관리자비활성'
	private long b_No; // 예약 번호 (FK)
	private String m_Id; // 회원 아이디 (FK)
	private int r_No; // 룸 번호  (FK)	

	private MemberVO memberVO; // m_Name, m_Mileage가져오기

	public int getRv_No() {
		return rv_No;
	}

	public void setRv_No(int rv_No) {
		this.rv_No = rv_No;
	}

	public int getRv_Grade() {
		return rv_Grade;
	}

	public void setRv_Grade(int rv_Grade) {
		this.rv_Grade = rv_Grade;
	}

	public String getRv_Content() {
		return rv_Content;
	}

	public void setRv_Content(String rv_Content) {
		this.rv_Content = rv_Content;
	}

	public Timestamp getRv_Date() {
		return rv_Date;
	}

	public void setRv_Date(Timestamp rv_Date) {
		this.rv_Date = rv_Date;
	}

	public String getRv_Availabled() {
		return rv_Availabled;
	}

	public void setRv_Availabled(String rv_Availabled) {
		this.rv_Availabled = rv_Availabled;
	}

	public long getB_No() {
		return b_No;
	}

	public void setB_No(long b_No) {
		this.b_No = b_No;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public int getR_No() {
		return r_No;
	}

	public void setR_No(int r_No) {
		this.r_No = r_No;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "ReviewVO [rv_No=" + rv_No + ", rv_Grade=" + rv_Grade + ", rv_Content=" + rv_Content + ", rv_Date="
				+ rv_Date + ", rv_Availabled=" + rv_Availabled + ", b_No=" + b_No + ", m_Id=" + m_Id + ", r_No=" + r_No
				+ ", memberVO=" + memberVO + "]";
	}
	
	

}
