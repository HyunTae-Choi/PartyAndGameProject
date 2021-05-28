package com.pag.client.notice.vo;

import java.sql.Timestamp;

import com.pag.common.vo.PageVO;

public class NoticeVO extends PageVO {
	// field
	private int n_No; // 공지글 번호
	private String n_Title; // 공지글 제목
	private String n_Content; // 공지글 내용
	private String n_Writer; // 공지글 작성자
	private Timestamp n_Date; // 공지글 작성일
	private int n_Availabled; // 공지글 비활성화 여부, 1은 활성화, 0 은 비활성화
	private int n_Hit; // 공지글 조회수

	// getter and setter
	public int getN_No() {
		return n_No;
	}

	public void setN_No(int n_No) {
		this.n_No = n_No;
	}

	public String getN_Title() {
		return n_Title;
	}

	public void setN_Title(String n_Title) {
		this.n_Title = n_Title;
	}

	public String getN_Content() {
		return n_Content;
	}

	public void setN_Content(String n_Content) {
		this.n_Content = n_Content;
	}

	public String getN_Writer() {
		return n_Writer;
	}

	public void setN_Writer(String n_Writer) {
		this.n_Writer = n_Writer;
	}

	public Timestamp getN_Date() {
		return n_Date;
	}

	public void setN_Date(Timestamp n_Date) {
		this.n_Date = n_Date;
	}

	public int getN_Availabled() {
		return n_Availabled;
	}

	public void setN_Availabled(int n_Availabled) {
		this.n_Availabled = n_Availabled;
	}

	public int getN_Hit() {
		return n_Hit;
	}

	public void setN_Hit(int n_Hit) {
		this.n_Hit = n_Hit;
	}

	@Override
	public String toString() {
		return "NoticeVO [n_No=" + n_No + ", n_Title=" + n_Title + ", n_Content=" + n_Content + ", n_Writer=" + n_Writer
				+ ", n_Date=" + n_Date + ", n_Availabled=" + n_Availabled + ", n_Hit=" + n_Hit + "]";
	}

}
