package com.pag.client.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.booking.dao.BookingDAO;
import com.pag.client.booking.vo.BookingVO;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	@Override
	public int bookingCheck(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingCheck(bookingVO);
		return result;
	}

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

	@Override
	public List<BookingVO> nonReservList(BookingVO bookingVO) {
		
		List<BookingVO> nonReservList = null;
		nonReservList = bookingDAO.nonReservList(bookingVO);
		
		return nonReservList;
	}

	@Override
	public int bookingReservCancel(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingReservCancel(bookingVO);
		return result;
	}

	@Override
	public int bookingReservReturn(BookingVO bookingVO) {
		int result = 0;
		result = bookingDAO.bookingReservReturn(bookingVO);
		return result;
	}
}
