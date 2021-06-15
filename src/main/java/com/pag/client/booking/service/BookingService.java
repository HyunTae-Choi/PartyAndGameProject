package com.pag.client.booking.service;

import java.util.List;

import com.pag.client.booking.vo.BookingVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

public interface BookingService {
	
	public int bookingCheck(BookingVO bookingVO); // 상품 예약 가능 여부 확인
	public int bookingCheck_Member(String m_Id); // 회원탈퇴 전 회원 예약상품 여부 확인
	public int bookingNonMember(BookingVO bookingVO); // 비회원 예약 등록
	public int bookingMember(BookingVO bookingVO); // 회원 예약 등록
	
	public int bookingReservComplete(BookingVO bookingVO); // 입금대기중인 상품 예약완료
	public int bookingDelete(BookingVO bookingVO); // 입금대기중인 상품 예약삭제
	public int bookingRentalComplete(BookingVO bookingVO); // 예약 당일 대여중으로 변환
	public int bookingRentalEnd(BookingVO bookingVO); // 대여중 상품 퇴실 시 대여완료로 변환
	public int bookingReservCancel(BookingVO bookingVO); // 예약 상품 환불 요청
	public int bookingReservReturn(BookingVO bookingVO); // 환불요청중인 상품 재예약
	public int bookingCancelComplete(BookingVO bookingVO); // 환불요청중인 상품 환불완료
	
	public List<BookingVO> nonReservList(BookingVO bookingVO); // 비회원 예약 리스트
	public PageVO memberReservListCnt(String _page, String m_Id); // 특정회원 예약 리스트 전체 개수
	public List<BookingVO> memberReservList(String m_Id); // 특정회원 예약 리스트
	
	// 관리자 페이지
	public PageVO bookingFullListCnt(String _page); // 전체 예약 리스트 개수
	public List<BookingVO> bookingFullList(BookingVO bookingVO); // 전체 예약 리스트
	public PageVO bookingWaitingListCnt(String _page); // 입금대기 리스트 개수
	public List<BookingVO> bookingWaitingList(BookingVO bookingVO); // 입금대기 리스트
	public PageVO bookingReservListCnt(String _page); // 예약완료 리스트 개수
	public List<BookingVO> bookingReservList(BookingVO bookingVO); // 예약완료 리스트
	public PageVO bookingReservDayListCnt(String _page); // 예약당일 리스트 개수
	public List<BookingVO> bookingReservDayList(BookingVO bookingVO); // 예약당일 리스트
	public PageVO bookingRefundWaitingListCnt(String _page); // 환불요청 리스트 개수
	public List<BookingVO> bookingRefundWaitingList(BookingVO bookingVO); // 환불요청 리스트
	public PageVO bookingRefundListCnt(String _page); // 환불완료 리스트 개수
	public List<BookingVO> bookingRefundList(BookingVO bookingVO); // 환불완료 리스트
	
	public List<StatisticVO> adminSalesMonthStatisticListSelect();
	public List<StatisticVO> adminBookingNumMonthStatisticListSelect();
	
	public int roomsBookingCheck(int r_no); // 파티룸 예약자 확인
}
