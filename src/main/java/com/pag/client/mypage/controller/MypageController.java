package com.pag.client.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.booking.service.BookingService;
import com.pag.client.booking.vo.BookingVO;
import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;
import com.pag.common.vo.PageVO;

@Controller
public class MypageController {
private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/mypage/myinfo")
	public ModelAndView mypageMyInfo(HttpSession session) {	
		log.info("맵핑 /mypage, MypageController 호출");		
			
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = null;
		if((loginSession = (LoginVO) session.getAttribute("loginSession")) == null) {
			return new ModelAndView("redirect:/");	
		}
		
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());
		mvo = memberService.memberSelect(mvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mvo", mvo);	
		mav.setViewName("mypage/info/myinfo");
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage/booking")
	public ModelAndView mypageBooking(HttpSession session, HttpServletRequest request) {	
		log.info("맵핑 /mypage/booking, MypageController 호출");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = null;
		if((loginSession = (LoginVO) session.getAttribute("loginSession")) == null) {	
			return new ModelAndView("redirect:/");			
		}  
		
		PageVO pageVO = bookingService.memberReservListCnt(request.getParameter("page"), loginSession.getM_Id());
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		List<BookingVO> memberReservList = bookingService.memberReservList(loginSession.getM_Id());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageVO", pageVO);
		mav.addObject("memberReservList", memberReservList);			
		mav.setViewName("mypage/booking/bookingList");						
		return mav;
		
	}
}