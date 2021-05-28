package com.pag.client.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;

@Controller
public class MypageController {
	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/mypage/myinfo")
	public ModelAndView mypageMyInfo(HttpSession session) {	
		log.info("맵핑 /mypage, MypageController 호출");
		
		LoginVO loginSession = null;

		ModelAndView mav = new ModelAndView();
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		if((loginSession = (LoginVO) session.getAttribute("loginSession")) != null) {
			
			/* == 마이페이지를 호출하면서, 회원정보 변경을 위해 회원정보를 불러온다. == */			
			System.out.println("회원 정보 변경 진행 아이디(호출) : " + loginSession.getM_Id());
			
			MemberVO mvo = new MemberVO();
			mvo.setM_Id(loginSession.getM_Id());
			// 회원 정보 수정용
			MemberVO vo = memberService.memberSelect(mvo);
			mav.addObject("mvo", vo);			
			mav.setViewName("mypage/info/myinfo");
			/* == 마이페이지를 호출하면서, 회원정보 변경을 위해 회원정보를 불러온다. end == */
			
			return mav;
		}  else {
			mav.setViewName("redirect:/");
			return mav;
		}
		
	}
	
	@RequestMapping(value = "/mypage/booking")
	public ModelAndView mypageBooking(HttpSession session) {	
		log.info("맵핑 /mypage/booking, MypageController 호출");
		
		LoginVO loginSession = null;

		ModelAndView mav = new ModelAndView();
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		if((loginSession = (LoginVO) session.getAttribute("loginSession")) != null) {
			
			/* == 마이페이지를 호출하면서, 회원정보 변경을 위해 회원정보를 불러온다. == */			
			System.out.println("회원 정보 변경 진행 아이디(호출) : " + loginSession.getM_Id());
			
			MemberVO mvo = new MemberVO();
			mvo.setM_Id(loginSession.getM_Id());
			
			// 회원 정보 수정용
			MemberVO vo = memberService.memberSelect(mvo);
			mav.addObject("mvo", vo);			
			mav.setViewName("mypage/booking/bookingList");
			/* == 마이페이지를 호출하면서, 회원정보 변경을 위해 회원정보를 불러온다. end == */
			
			return mav;
		}  else {
			mav.setViewName("redirect:/");
			return mav;
		}
		
	}
	

		
	
}
