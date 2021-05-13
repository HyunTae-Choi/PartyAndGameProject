package com.pag.client.member.vo;

public class MemberSecurity {
	private String m_Id;
	private String ms_Salt;

	public MemberSecurity() {
	}

	public MemberSecurity(String m_Id, String ms_Salt) {
		super();
		this.m_Id = m_Id;
		this.ms_Salt = ms_Salt;
	}

	// getter and setter
	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getMs_Salt() {
		return ms_Salt;
	}

	public void setMs_Salt(String ms_Salt) {
		this.ms_Salt = ms_Salt;
	}

}
