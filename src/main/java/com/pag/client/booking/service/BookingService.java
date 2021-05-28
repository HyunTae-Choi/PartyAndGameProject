package com.pag.client.booking.service;

import java.util.List;

import com.pag.client.booking.vo.BookingVO;

public interface BookingService {
	public int bookingCheck(BookingVO bookingVO);
	public int bookingNonMember(BookingVO bookingVO);
	public List<BookingVO> nonReservList(BookingVO bookingVO);
	public int bookingReservCancel(BookingVO bookingVO);
	public int bookingReservReturn(BookingVO bookingVO);
}
