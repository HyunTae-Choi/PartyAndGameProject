package com.pag.client.booking.dao;

import java.util.List;

import com.pag.client.booking.vo.BookingVO;

public interface BookingDAO {

	int bookingCheck(BookingVO bookingVO);
	int bookingNonMember(BookingVO bookingVO);
	List<BookingVO> nonReservList(BookingVO bookingVO);
	int bookingReservCancel(BookingVO bookingVO);
	int bookingReservReturn(BookingVO bookingVO);

}
