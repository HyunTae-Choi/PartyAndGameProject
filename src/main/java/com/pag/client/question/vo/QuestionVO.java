package com.pag.client.question.vo;

import java.sql.Timestamp;

public class QuestionVO {

	private int q_No; // 문의게시글 번호
	private String q_Title; // 문의게시글 제목
	private String q_Content; // 문의게시글 내용
	private Timestamp q_Date; // 문의게시글 작성일
	private String q_Reply_Check; // 문의게시글 답변여부 (답변대기, 답변완료, 기본값은 '답변대기')
	private String m_Id; // 회원 아이디
	private String m_Name; // 회원 이름 (join용도)

	// getter and setter
	public int getQ_No() {
		return q_No;
	}

	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}

	public String getQ_Title() {
		return q_Title;
	}

	public void setQ_Title(String q_Title) {
		this.q_Title = q_Title;
	}

	public String getQ_Content() {
		return q_Content;
	}

	public void setQ_Content(String q_Content) {
		this.q_Content = q_Content;
	}

	public Timestamp getQ_Date() {
		return q_Date;
	}

	public void setQ_Date(Timestamp q_Date) {
		this.q_Date = q_Date;
	}

	public String getQ_Reply_Check() {
		return q_Reply_Check;
	}

	public void setQ_Reply_Check(String q_Reply_Check) {
		this.q_Reply_Check = q_Reply_Check;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	@Override
	public String toString() {
		return "QuestionVO [q_No=" + q_No + ", q_Title=" + q_Title + ", q_Content=" + q_Content + ", q_Date=" + q_Date
				+ ", q_Reply_Check=" + q_Reply_Check + ", m_Id=" + m_Id + ", m_Name=" + m_Name + "]";
	}

}
