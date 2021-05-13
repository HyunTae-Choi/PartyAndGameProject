package com.pag.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.service.LoginService;
import com.pag.client.login.vo.LoginVO;

@Controller
@RequestMapping("login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	// 로그인 화면 호출
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출 성공");
		return "client/login";
	}

	// 로그인 처리 구현
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProceed(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		log.info("login post 호출 성공");
		System.out.println("아이디 : " + lvo.getM_Id());
		System.out.println("비밀번호 : " + lvo.getM_Pw());

		ModelAndView mav = new ModelAndView();

		String m_Id = lvo.getM_Id();

		LoginVO loginResult = loginService.loginSelect(lvo.getM_Id(),lvo.getM_Pw());
		System.out.println(loginResult);

		if (loginResult == null) {
			mav.setViewName("client/login");
			System.out.println("로그인 실패");
		} else {
			mav.setViewName("client/login");
			System.out.println("로그인 성공");
			System.out.println("성공 아이디 : " + loginResult.getM_Id());
			System.out.println("성공 비밀번호 : " + loginResult.getM_Pw());
		}
		return mav;
	}
	
	// PW찾기
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public ModelAndView searchIdPw(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		log.info("find post 호출 성공");

		ModelAndView mav = new ModelAndView();

		System.out.println("이메일 : " + lvo.getM_Email());
		System.out.println("아이디 : " + lvo.getM_Id());

		return null;
	}

}
