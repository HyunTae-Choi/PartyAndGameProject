package com.pag.client.rooms.vo;

public class RoomsVO {
	private int r_no; // 룸 번호
	private String r_name; // 룸 이름
	private String r_intro; // 룸 이름
	private int r_min_num; // 룸 사용 기준인원
	private int r_max_num; // 룸 사용 최대인원
	private int r_weekday_day_price; // 룸 평일 낮타임 가격
	private int r_weekday_night_price; // 룸 평일 밤타임 가격
	private int r_weekend_day_price; // 룸 주말 낮타임 가격
	private int r_weekend_night_price; // 룸 주말 밤타임 가격
	private int r_availabled; // 룸 유효 여부
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_intro() {
		return r_intro;
	}
	public void setR_intro(String r_intro) {
		this.r_intro = r_intro;
	}
	public int getR_min_num() {
		return r_min_num;
	}
	public void setR_min_num(int r_min_num) {
		this.r_min_num = r_min_num;
	}
	public int getR_max_num() {
		return r_max_num;
	}
	public void setR_max_num(int r_max_num) {
		this.r_max_num = r_max_num;
	}
	public int getR_weekday_day_price() {
		return r_weekday_day_price;
	}
	public void setR_weekday_day_price(int r_weekday_day_price) {
		this.r_weekday_day_price = r_weekday_day_price;
	}
	public int getR_weekday_night_price() {
		return r_weekday_night_price;
	}
	public void setR_weekday_night_price(int r_weekday_night_price) {
		this.r_weekday_night_price = r_weekday_night_price;
	}
	public int getR_weekend_day_price() {
		return r_weekend_day_price;
	}
	public void setR_weekend_day_price(int r_weekend_day_price) {
		this.r_weekend_day_price = r_weekend_day_price;
	}
	public int getR_weekend_night_price() {
		return r_weekend_night_price;
	}
	public void setR_weekend_night_price(int r_weekend_night_price) {
		this.r_weekend_night_price = r_weekend_night_price;
	}
	public int getR_availabled() {
		return r_availabled;
	}
	public void setR_availabled(int r_availabled) {
		this.r_availabled = r_availabled;
	}
}
