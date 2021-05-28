package com.pag.client.mail.vo;

public class MailVO {

	// field
	private String from; // 보내는 사람
	private String to; // 받는 사람
	private String subject; // 제목
	private String contents; // 내용

	// getter and setter
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "MailVO [from=" + from + ", to=" + to + ", subject=" + subject + ", content=" + contents + "]";
	}

}
