package com.pag.client.booking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.booking.vo.BookingVO;


@Repository
public class BookingDAOImpl implements BookingDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int bookingCheck(BookingVO bookingVO) {
		return (Integer)session.selectOne("bookingCheck", bookingVO);
	}

	@Override
	public int bookingNonMember(BookingVO bookingVO) {
		return session.insert("bookingNonMember", bookingVO);
	}

	@Override
	public List<BookingVO> nonReservList(BookingVO bookingVO) {
		return session.selectList("nonReservList", bookingVO);
	}

	@Override
	public int bookingReservCancel(BookingVO bookingVO) {
		return (Integer)session.update("bookingReservCancel", bookingVO);
	}

	@Override
	public int bookingReservReturn(BookingVO bookingVO) {
		return (Integer)session.update("bookingReservReturn", bookingVO);
	}
}
