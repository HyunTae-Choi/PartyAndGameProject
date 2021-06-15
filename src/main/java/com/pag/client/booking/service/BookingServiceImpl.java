package com.pag.client.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.booking.dao.BookingDAO;
import com.pag.client.booking.vo.BookingVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	// 상품 예약 가능 여부 확인
	@Override
	public int bookingCheck(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingCheck(bookingVO);
		return result;
	}
	
	// 회원탈퇴 전 회원 예약상품 여부 확인
	@Override
	public int bookingCheck_Member(String m_Id) {
		int result = 0;
		result = bookingDAO.bookingCheck_Member(m_Id);
		return result;
	}

	// 비회원 예약 등록
	@Override
	public int bookingNonMember(BookingVO bookingVO) {
		int result = 0;
		try {
			result = bookingDAO.bookingNonMember(bookingVO);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 회원 예약 등록
	@Override
	public int bookingMember(BookingVO bookingVO) {
		int result = 0;
		try {
			result = bookingDAO.bookingMember(bookingVO);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 입금대기중인 상품 예약완료
	@Override
	public int bookingReservComplete(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingReservComplete(bookingVO);
		
		return result;
	}
	
	// 입금대기중인 상품 예약삭제
	@Override
	public int bookingDelete(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingDelete(bookingVO);
		
		return result;
	}
	
	// 예약 당일 대여중으로 변환
	@Override
	public int bookingRentalComplete(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingRentalComplete(bookingVO);
		
		return result;
	}
	
	// 대여중 상품 퇴실 시 대여완료로 변환
	@Override
	public int bookingRentalEnd(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingRentalEnd(bookingVO);
		
		return result;
	}
	
	// 예약 상품 환불 요청
	@Override
	public int bookingReservCancel(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingReservCancel(bookingVO);
		return result;
	}

	// 환불요청중인 상품 재예약
	@Override
	public int bookingReservReturn(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingReservReturn(bookingVO);
		return result;
	}

	// 환불요청중인 상품 환불완료
	@Override
	public int bookingCancelComplete(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingCancelComplete(bookingVO);
		
		return result;
	}
	
	// 비회원 예약 리스트
	@Override
	public List<BookingVO> nonReservList(BookingVO bookingVO) {
		List<BookingVO> nonReservList = null;
		nonReservList = bookingDAO.nonReservList(bookingVO);
		
		return nonReservList;
	}
	
	// 특정회원 예약 리스트 전체 개수
	@Override
	public PageVO memberReservListCnt(String _page, String m_Id) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 특정회원 예약 리스트 전체 개수
		int memberReservListCnt = bookingDAO.memberReservListCnt(m_Id);
		System.out.println(m_Id + "회원의 예약 리스트 수 : " + memberReservListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(memberReservListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = memberReservListCnt/100;
			maxPage = memberReservListCnt/10;
		} else if (memberReservListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (memberReservListCnt/100) + 1;
			maxPage = memberReservListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = memberReservListCnt/100+1;
			maxPage = memberReservListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(memberReservListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 특정회원 예약 리스트
	@Override
	public List<BookingVO> memberReservList(String m_Id) {
		List<BookingVO> memberReservList = null;
		memberReservList = bookingDAO.memberReservList(m_Id);
		
		return memberReservList;
	}
	
	// 관리자 페이지
	// 전체 예약 리스트 개수
	@Override
	public PageVO bookingFullListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 전체 예약 리스트 개수
		int bookingFullListCnt = bookingDAO.bookingFullListCnt();
		System.out.println("전체 예약 리스트 수 : " + bookingFullListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingFullListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingFullListCnt/100;
			maxPage = bookingFullListCnt/10;
		} else if (bookingFullListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingFullListCnt/100) + 1;
			maxPage = bookingFullListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingFullListCnt/100+1;
			maxPage = bookingFullListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingFullListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 전체 예약 리스트
	@Override
	public List<BookingVO> bookingFullList(BookingVO bookingVO) {
		List<BookingVO> bookingFullList = null;
		bookingFullList = bookingDAO.bookingFullList(bookingVO);
		
		return bookingFullList;
	}
	
	// 입금대기 리스트 개수
	@Override
	public PageVO bookingWaitingListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 입금대기 리스트 개수
		int bookingWaitingListCnt = bookingDAO.bookingWaitingListCnt();
		System.out.println("입금대기 리스트 수 : " + bookingWaitingListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingWaitingListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingWaitingListCnt/100;
			maxPage = bookingWaitingListCnt/10;
		} else if (bookingWaitingListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingWaitingListCnt/100) + 1;
			maxPage = bookingWaitingListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingWaitingListCnt/100+1;
			maxPage = bookingWaitingListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingWaitingListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 입금대기 리스트
	@Override
	public List<BookingVO> bookingWaitingList(BookingVO bookingVO) {
		List<BookingVO> bookingWaitingList = null;
		bookingWaitingList = bookingDAO.bookingWaitingList(bookingVO);
		
		return bookingWaitingList;
	}
	
	// 예약완료 리스트 개수
	@Override
	public PageVO bookingReservListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 예약완료 리스트 개수
		int bookingReservListCnt = bookingDAO.bookingReservListCnt();
		System.out.println("예약완료 리스트 수 : " + bookingReservListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingReservListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingReservListCnt/100;
			maxPage = bookingReservListCnt/10;
		} else if (bookingReservListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingReservListCnt/100) + 1;
			maxPage = bookingReservListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingReservListCnt/100+1;
			maxPage = bookingReservListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingReservListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 예약완료 리스트 
	@Override
	public List<BookingVO> bookingReservList(BookingVO bookingVO) {
		List<BookingVO> bookingReservList = null;
		bookingReservList = bookingDAO.bookingReservList(bookingVO);
		
		return bookingReservList;
	}
	
	// 예약당일 리스트 개수
	@Override
	public PageVO bookingReservDayListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 예약당일 리스트 개수
		int bookingReservDayListCnt = bookingDAO.bookingReservDayListCnt();
		System.out.println("예약당일 리스트 수 : " + bookingReservDayListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingReservDayListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingReservDayListCnt/100;
			maxPage = bookingReservDayListCnt/10;
		} else if (bookingReservDayListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingReservDayListCnt/100) + 1;
			maxPage = bookingReservDayListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingReservDayListCnt/100+1;
			maxPage = bookingReservDayListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingReservDayListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 예약당일 리스트
	@Override
	public List<BookingVO> bookingReservDayList(BookingVO bookingVO) {
		List<BookingVO> bookingReservDayList = null;
		bookingReservDayList = bookingDAO.bookingReservDayList(bookingVO);
		
		return bookingReservDayList;
	}
	
	// 환불요청 리스트 개수
	@Override
	public PageVO bookingRefundWaitingListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 환불요청 리스트 개수
		int bookingRefundWaitingListCnt = bookingDAO.bookingRefundWaitingListCnt();
		System.out.println("환불요청 리스트 수 : " + bookingRefundWaitingListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingRefundWaitingListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingRefundWaitingListCnt/100;
			maxPage = bookingRefundWaitingListCnt/10;
		} else if (bookingRefundWaitingListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingRefundWaitingListCnt/100) + 1;
			maxPage = bookingRefundWaitingListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingRefundWaitingListCnt/100+1;
			maxPage = bookingRefundWaitingListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingRefundWaitingListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 환불요청 리스트
	@Override
	public List<BookingVO> bookingRefundWaitingList(BookingVO bookingVO) {
		List<BookingVO> bookingRefundWaitingList = null;
		bookingRefundWaitingList = bookingDAO.bookingRefundWaitingList(bookingVO);
		
		return bookingRefundWaitingList;
	}
	
	// 환불완료 리스트 개수
	@Override
	public PageVO bookingRefundListCnt(String _page) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 환불완료 리스트 개수
		int bookingRefundListCnt = bookingDAO.bookingRefundListCnt();
		System.out.println("환불완료 리스트 수 : " + bookingRefundListCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(bookingRefundListCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = bookingRefundListCnt/100;
			maxPage = bookingRefundListCnt/10;
		} else if (bookingRefundListCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (bookingRefundListCnt/100) + 1;
			maxPage = bookingRefundListCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = bookingRefundListCnt/100+1;
			maxPage = bookingRefundListCnt/10+1;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setTotalCnt(bookingRefundListCnt);
		pageVO.setMaxSection(maxSection);
		pageVO.setMaxPage(maxPage);
		pageVO.setSection(section);
		pageVO.setPage(page);
						
		return pageVO;
	}
	
	// 환불완료 리스트
	@Override
	public List<BookingVO> bookingRefundList(BookingVO bookingVO) {
		List<BookingVO> bookingRefundList = null;
		bookingRefundList = bookingDAO.bookingRefundList(bookingVO);
		
		return bookingRefundList;
	}
	
	// admin 월별 매출액 통계 
	@Override
	public List<StatisticVO> adminSalesMonthStatisticListSelect() {
		return bookingDAO.adminSalesMonthStatisticListSelect();
	}
	
	// admin 월별 예약 횟수 통계 
	@Override
	public List<StatisticVO> adminBookingNumMonthStatisticListSelect() {
		return bookingDAO.adminBookingNumMonthStatisticListSelect();
	}
	
	// 파티룸 예약자 확인
	@Override
	public int roomsBookingCheck(int r_no) {
		int result = 0;
		result = bookingDAO.roomsBookingCheck(r_no);
		return result;
	}
}
