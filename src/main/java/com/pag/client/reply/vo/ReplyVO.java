package com.pag.client.reply.vo;

import java.sql.Timestamp;

import com.pag.client.member.vo.MemberVO;

public class ReplyVO {
	// field
	private int qr_No; // 답글 번호
	private String qr_Content; // 답글 이름
	private Timestamp qr_Date; // 답글 작성일
	private String m_Id; // 작성자 아이디, null일경우엔 admin
	private int q_No; // 1:1 문의글 번호

	private MemberVO memberVO; // m_Name사용
	
	//getter, setter
	public int getQr_No() {
		return qr_No;
	}

	public void setQr_No(int qr_No) {
		this.qr_No = qr_No;
	}

	public String getQr_Content() {
		return qr_Content;
	}

	public void setQr_Content(String qr_Content) {
		this.qr_Content = qr_Content;
	}

	public Timestamp getQr_Date() {
		return qr_Date;
	}

	public void setQr_Date(Timestamp qr_Date) {
		this.qr_Date = qr_Date;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public int getQ_No() {
		return q_No;
	}

	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "ReplyVO [qr_No=" + qr_No + ", qr_Content=" + qr_Content + ", qr_Date=" + qr_Date + ", m_Id=" + m_Id
				+ ", q_No=" + q_No + ", memberVO=" + memberVO + "]";
	}

}
