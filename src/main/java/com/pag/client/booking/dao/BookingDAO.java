package com.pag.client.booking.dao;

import java.util.List;

import com.pag.client.booking.vo.BookingVO;
import com.pag.common.vo.StatisticVO;

public interface BookingDAO {

	int bookingCheck(BookingVO bookingVO); // 상품 예약 가능 여부 확인
	int bookingCheck_Member(String m_Id); // 회원탈퇴 전 회원 예약상품 여부 확인
	int bookingNonMember(BookingVO bookingVO); // 비회원 예약 등록
	int bookingMember(BookingVO bookingVO); // 회원 예약 등록
	
	int bookingReservComplete(BookingVO bookingVO); // 입금대기중인 상품 예약완료
	int bookingDelete(BookingVO bookingVO); // 입금대기중인 상품 예약삭제
	int bookingRentalComplete(BookingVO bookingVO); // 예약 당일 대여중으로 변환
	int bookingRentalEnd(BookingVO bookingVO); // 대여중 상품 퇴실 시 대여완료로 변환
	int bookingReservCancel(BookingVO bookingVO); // 예약 상품 환불 요청
	int bookingReservReturn(BookingVO bookingVO); // 환불요청중인 상품 재예약
	int bookingCancelComplete(BookingVO bookingVO); // 환불요청중인 상품 환불완료
	
	List<BookingVO> nonReservList(BookingVO bookingVO); // 비회원 예약 리스트
	int memberReservListCnt(String m_Id); // 특정회원 예약 리스트 전체 개수
	List<BookingVO> memberReservList(String m_Id); // 특정회원 예약 리스트 출력
	
	// 관리자 페이지
	int bookingFullListCnt(); // 전체 예약 리스트 개수
	List<BookingVO> bookingFullList(BookingVO bookingVO); // 전체 예약 리스트
	int bookingWaitingListCnt(); // 입금대기 리스트 개수
	List<BookingVO> bookingWaitingList(BookingVO bookingVO); // 입금대기 리스트
	int bookingReservListCnt(); // 예약완료 리스트 개수
	List<BookingVO> bookingReservList(BookingVO bookingVO); // 예약완료 리스트
	int bookingReservDayListCnt(); // 예약당일 리스트 개수
	List<BookingVO> bookingReservDayList(BookingVO bookingVO); // 예약당일 리스트
	int bookingRefundWaitingListCnt(); // 환불요청 리스트 개수
	List<BookingVO> bookingRefundWaitingList(BookingVO bookingVO); // 환불요청 리스트
	int bookingRefundListCnt(); // 환불완료 리스트 개수
	List<BookingVO> bookingRefundList(BookingVO bookingVO); // 환불완료 리스트
	
	List<StatisticVO> adminSalesMonthStatisticListSelect();
	List<StatisticVO> adminBookingNumMonthStatisticListSelect();
	
}
