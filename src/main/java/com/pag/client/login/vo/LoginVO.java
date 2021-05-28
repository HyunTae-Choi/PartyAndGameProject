package com.pag.client.login.vo;

public class LoginVO {

	// field
	private String m_Id; // 회원 아이디
	private String m_Pw; // 회원 비밀번호
	private String m_Email; // 회원 이메일
	private String m_Name; // 회원 이름
	private int m_Availabled; // 회원 탈퇴유무, DEFAULT 1, 1- TRUE, 0 - FALSE

	// getter and setter
	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Pw() {
		return m_Pw;
	}

	public void setM_Pw(String m_Pw) {
		this.m_Pw = m_Pw;
	}

	public String getM_Email() {
		return m_Email;
	}

	public void setM_Email(String m_Email) {
		this.m_Email = m_Email;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public int getM_Availabled() {
		return m_Availabled;
	}

	public void setM_Availabled(int m_Availabled) {
		this.m_Availabled = m_Availabled;
	}

	@Override
	public String toString() {
		return "LoginVO [m_Id=" + m_Id + ", m_Pw=" + m_Pw + ", m_Email=" + m_Email + ", m_Name=" + m_Name
				+ ", m_Availabled=" + m_Availabled + ", m_Result=" + "]";
	}

}
