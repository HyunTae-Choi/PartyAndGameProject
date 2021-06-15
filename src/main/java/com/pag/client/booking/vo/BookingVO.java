package com.pag.client.booking.vo;

import com.pag.client.review.vo.ReviewVO;
import com.pag.client.rooms.vo.RoomsVO;
import com.pag.common.vo.PageVO;

public class BookingVO extends PageVO {
	private long b_no; // 예약 번호
	private String b_regdate; // 예약 등록일
	private String b_date; // 예약 예정일
	private long b_timestamp; // 예약 예정일 타임스탬프
	private String b_time; // 예약 시간대
	private int b_number; // 예약 인원
	private int b_price; // 예약 금액
	private String b_status; // 예약 상태
	private String m_id; // 회원 아이디
	private String u_name; // 예약자 명
	private String u_email; // 예약자 이메일
	private String u_phone; // 예약자 전화번호
	private String b_memberstatus; // 예약자 회원 여부
	private String r_no; // 룸 번호
	
	private RoomsVO roomsVO; // 방이름
	private ReviewVO reviewVO; // 리뷰번호
	
	public long getB_no() {
		return b_no;
	}
	public void setB_no(long b_no) {
		this.b_no = b_no;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	public int getB_number() {
		return b_number;
	}
	public void setB_number(int b_number) {
		this.b_number = b_number;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public String getB_status() {
		return b_status;
	}
	public void setB_status(String b_status) {
		this.b_status = b_status;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getB_memberstatus() {
		return b_memberstatus;
	}
	public void setB_memberstatus(String b_memberstatus) {
		this.b_memberstatus = b_memberstatus;
	}
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public RoomsVO getRoomsVO() {
		return roomsVO;
	}
	public void setRoomsVO(RoomsVO roomsVO) {
		this.roomsVO = roomsVO;
	}
	public long getB_timestamp() {
		return b_timestamp;
	}
	public void setB_timestamp(long b_timestamp) {
		this.b_timestamp = b_timestamp;
	}
	public ReviewVO getReviewVO() {
		return reviewVO;
	}
	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}
}
