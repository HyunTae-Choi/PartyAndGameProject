package com.pag.client.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.dao.MemberDao;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		log.info("member/join, post방식으로 memberInsert 호출 성공");
		System.out.println(mvo.toString());
		
		ModelAndView mav = new ModelAndView();
		
		int result = 0;
		result = memberService.memberInsert(mvo);
		if(result == 1){
			mav.setViewName("redirect:/");
			log.info("가입 성공");			
		}else{
			mav.setViewName("redirect:/");
			log.info("가입 실패");
		}
		
//		switch(result) {
//		case 1:
//			mav.addObject("errCode", 1); // userId already exist 
//			mav.setViewName("mainPage/mainPage");
//			break;
//		case 3:
//			mav.addObject("errCode", 3); // success to add new member; move to login page
//			mav.setViewName("mainPage/mainPage"); 
//			break;
//		default: 
//			mav.addObject("errCode", 2); // failed to add new member
//			mav.setViewName("mainPage/mainPage");
//			break;
//			
//		}

		
		return mav;
	}
	
	// 회원 정보 변경 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("MemberVO") MemberVO mvo) {
		log.info("member/update, post방식으로 memberUpdate 호출 성공");

		ModelAndView mav = new ModelAndView();

		System.out.println(mvo.toString());
		
		return null;
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value = "/leave")
	public ModelAndView memberLeave(HttpSession session) {
		log.info("member/leave, memberLeave 호출 성공");

		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		if(login == null) {
			mav.setViewName("client/login");
			System.out.println("로그아웃된 상태입니다.");
			return mav;
		}
		
		return null;
	}
	
}

