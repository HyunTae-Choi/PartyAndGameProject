package com.pag.client.rooms.vo;

import org.springframework.web.multipart.MultipartFile;

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
	
	private MultipartFile thumbnail; // 룸 썸네일
	private String r_thumbnail; // 룸 썸네일
	private MultipartFile introimg1; // 룸 썸네일
	private String r_introimg1; // 룸 이미지1
	private MultipartFile introimg2; // 룸 썸네일
	private String r_introimg2; // 룸 이미지2
	private MultipartFile introimg3; // 룸 썸네일
	private String r_introimg3; // 룸 이미지3
	private MultipartFile introimg4; // 룸 썸네일
	private String r_introimg4; // 룸 이미지4
	
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
	
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getR_thumbnail() {
		return r_thumbnail;
	}
	public void setR_thumbnail(String r_thumbnail) {
		this.r_thumbnail = r_thumbnail;
	}
	public MultipartFile getIntroimg1() {
		return introimg1;
	}
	public void setIntroimg1(MultipartFile introimg1) {
		this.introimg1 = introimg1;
	}
	public String getR_introimg1() {
		return r_introimg1;
	}
	public void setR_introimg1(String r_introimg1) {
		this.r_introimg1 = r_introimg1;
	}
	public MultipartFile getIntroimg2() {
		return introimg2;
	}
	public void setIntroimg2(MultipartFile introimg2) {
		this.introimg2 = introimg2;
	}
	public String getR_introimg2() {
		return r_introimg2;
	}
	public void setR_introimg2(String r_introimg2) {
		this.r_introimg2 = r_introimg2;
	}
	public MultipartFile getIntroimg3() {
		return introimg3;
	}
	public void setIntroimg3(MultipartFile introimg3) {
		this.introimg3 = introimg3;
	}
	public String getR_introimg3() {
		return r_introimg3;
	}
	public void setR_introimg3(String r_introimg3) {
		this.r_introimg3 = r_introimg3;
	}
	public MultipartFile getIntroimg4() {
		return introimg4;
	}
	public void setIntroimg4(MultipartFile introimg4) {
		this.introimg4 = introimg4;
	}
	public String getR_introimg4() {
		return r_introimg4;
	}
	public void setR_introimg4(String r_introimg4) {
		this.r_introimg4 = r_introimg4;
	}
	
}
