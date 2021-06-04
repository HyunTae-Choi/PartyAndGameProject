package com.pag.client.booking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.booking.vo.BookingVO;
import com.pag.common.vo.StatisticVO;


@Repository
public class BookingDAOImpl implements BookingDAO {
	
	@Autowired
	private SqlSession session;
	
	// 상품 예약 가능 여부 확인
	@Override
	public int bookingCheck(BookingVO bookingVO) {
		return (Integer)session.selectOne("bookingCheck", bookingVO);
	}
	
	// 회원탈퇴 전 회원 예약상품 여부 확인
	@Override
	public int bookingCheck_Member(String m_Id) {
		return (Integer)session.selectOne("bookingCheck_Member", m_Id);
	}

	// 비회원 예약 등록
	@Override
	public int bookingNonMember(BookingVO bookingVO) {
		return session.insert("bookingNonMember", bookingVO);
	}

	// 회원 예약 등록
	@Override
	public int bookingMember(BookingVO bookingVO) {
		return session.insert("bookingMember", bookingVO);
	}

	// 입금대기중인 상품 예약완료
	@Override
	public int bookingReservComplete(BookingVO bookingVO) {
		return (Integer)session.update("bookingReservComplete", bookingVO);
	}
	
	// 예약 당일 대여중으로 변환
	@Override
	public int bookingRentalComplete(BookingVO bookingVO) {
		return (Integer)session.update("bookingRentalComplete", bookingVO);
	}

	// 대여중 상품 퇴실 시 대여완료로 변환
	@Override
	public int bookingRentalEnd(BookingVO bookingVO) {
		return (Integer)session.update("bookingRentalEnd", bookingVO);
	}
	
	// 입금대기중인 미 입금 시 상품 예약삭제
	@Override
	public int bookingDelete(BookingVO bookingVO) {
		return (Integer)session.delete("bookingDelete", bookingVO);
	}
	
	// 예약 상품 환불 요청	
	@Override
	public int bookingReservCancel(BookingVO bookingVO) {
		return (Integer)session.update("bookingReservCancel", bookingVO);
	}

	// 환불요청중인 상품 재예약
	@Override
	public int bookingReservReturn(BookingVO bookingVO) {
		return (Integer)session.update("bookingReservReturn", bookingVO);
	}
	
	// 환불요청중인 상품 환불완료
	@Override
	public int bookingCancelComplete(BookingVO bookingVO) {
		return (Integer)session.update("bookingCancelComplete", bookingVO);
	}
	
	// 비회원 예약 리스트
	@Override
	public List<BookingVO> nonReservList(BookingVO bookingVO) {
		return session.selectList("nonReservList", bookingVO);
	}

	// 특정회원 예약 리스트 전체 개수
	@Override
	public int memberReservListCnt(String m_Id) {
		return session.selectOne("memberReservListCnt", m_Id);
	}
	
	// 특정회원 예약 리스트 출력
	@Override
	public List<BookingVO> memberReservList(String m_Id) {
		return session.selectList("memberReservList", m_Id);
	}
	
	// 전체 예약 리스트 개수
	@Override
	public int bookingFullListCnt() {
		return session.selectOne("bookingFullListCnt");
	}
	
	// 전체 예약 리스트
	@Override
	public List<BookingVO> bookingFullList(BookingVO bookingVO) {
		return session.selectList("bookingFullList", bookingVO);
	}
	
	// 입금대기 리스트 개수
	@Override
	public int bookingWaitingListCnt() {
		return session.selectOne("bookingWaitingListCnt");
	}
	
	// 입금대기 리스트
	@Override
	public List<BookingVO> bookingWaitingList(BookingVO bookingVO) {
		return session.selectList("bookingWaitingList", bookingVO);
	}
	
	// 예약완료 리스트 개수	
	@Override
	public int bookingReservListCnt() {
		return session.selectOne("bookingReservListCnt");
	}
	
	// 예약완료 리스트
	@Override
	public List<BookingVO> bookingReservList(BookingVO bookingVO) {
		return session.selectList("bookingReservList", bookingVO);
	}
	
	// 예약당일 리스트 개수
	@Override
	public int bookingReservDayListCnt() {
		return session.selectOne("bookingReservDayListCnt");
	}
	
	// 예약당일 리스트
	@Override
	public List<BookingVO> bookingReservDayList(BookingVO bookingVO) {
		return session.selectList("bookingReservDayList", bookingVO);
	}
	
	// 환불요청 리스트 개수
	@Override
	public int bookingRefundWaitingListCnt() {
		return session.selectOne("bookingRefundWaitingListCnt");
	}
	
	// 환불요청 리스트
	@Override
	public List<BookingVO> bookingRefundWaitingList(BookingVO bookingVO) {
		return session.selectList("bookingRefundWaitingList", bookingVO);
	}
	
	// 환불완료 리스트 개수
	@Override
	public int bookingRefundListCnt() {
		return session.selectOne("bookingRefundListCnt");
	}
	
	// 환불완료 리스트
	@Override
	public List<BookingVO> bookingRefundList(BookingVO bookingVO) {
		return session.selectList("bookingRefundList", bookingVO);
	}
	
	// admin 월별 매출 통계
	@Override
	public List<StatisticVO> adminSalesMonthStatisticListSelect() {
		return session.selectList("adminSalesMonthStatisticListSelect");
	}
	
	// admin 월별 횟수 통계
	@Override
	public List<StatisticVO> adminBookingNumMonthStatisticListSelect() {
		return session.selectList("adminBookingNumMonthStatisticListSelect");
	}
}
