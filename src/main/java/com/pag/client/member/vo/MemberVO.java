package com.pag.client.member.vo;

import java.sql.Timestamp;

import com.pag.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {

	// field
	// loginVO에서 상속
//	private String m_Id; // 회원 아이디
//	private String m_Pw; // 회원 비밀번호
//	private String m_Email; // 회원 이메일
//	private String m_Name; // 회원 이름
//	private int m_Availabled; // 회원 탈퇴유무, DEFAULT 1, 1- TRUE, 0 - FALSE
	private int m_Number; // 회원 번호
	private String m_Birth; // 회원 생년월일
	private String m_Gender; // 회원 성별
	private int m_Email_Marketing; // 회원 이메일 마케팅 수신동의, 1- TRUE, 0 - FALSE
	private String m_Phone; // 회원 전화번호
	private int m_Mileage; // 회원 마일리지
	private Timestamp m_Date; // 회원 등록일자

	private String m_Pw_Old; // 회원 기존의 비밀번호
	private int reservedNum; // 예약횟수

	// getter and setter
	public int getM_Number() {
		return m_Number;
	}

	public void setM_Number(int m_Number) {
		this.m_Number = m_Number;
	}

	public String getM_Birth() {
		return m_Birth;
	}

	public void setM_Birth(String m_Birth) {
		this.m_Birth = m_Birth;
	}

	public String getM_Gender() {
		return m_Gender;
	}

	public void setM_Gender(String m_Gender) {
		this.m_Gender = m_Gender;
	}

	public int getM_Email_Marketing() {
		return m_Email_Marketing;
	}

	public void setM_Email_Marketing(int m_Email_Marketing) {
		this.m_Email_Marketing = m_Email_Marketing;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public int getM_Mileage() {
		return m_Mileage;
	}

	public void setM_Mileage(int m_Mileage) {
		this.m_Mileage = m_Mileage;
	}

	public Timestamp getM_Date() {
		return m_Date;
	}

	public void setM_Date(Timestamp m_Date) {
		this.m_Date = m_Date;
	}

	public String getM_Pw_Old() {
		return m_Pw_Old;
	}

	public void setM_Pw_Old(String m_Pw_Old) {
		this.m_Pw_Old = m_Pw_Old;
	}

	public int getReservedNum() {
		return reservedNum;
	}

	public void setReservedNum(int reservedNum) {
		this.reservedNum = reservedNum;
	}

	@Override
	public String toString() {
		return "MemberVO [m_Number=" + m_Number + ", m_Birth=" + m_Birth + ", m_Gender=" + m_Gender
				+ ", m_Email_Marketing=" + m_Email_Marketing + ", m_Phone=" + m_Phone + ", m_Mileage=" + m_Mileage
				+ ", m_Date=" + m_Date + ", m_Pw_Old=" + m_Pw_Old + ", reservedNum=" + reservedNum + ", toString()="
				+ super.toString() + "]";
	}

}
