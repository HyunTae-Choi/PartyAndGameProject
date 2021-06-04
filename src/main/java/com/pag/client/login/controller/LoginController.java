package com.pag.client.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pag.client.login.service.LoginService;
import com.pag.client.login.vo.LoginVO;

@Controller
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	// 로그인 처리
	// ResponseBody 어노테이션을 붙여야, ajax에서 데이터를 받을 수 있다.(여기선 String)
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProceed(@ModelAttribute LoginVO lvo, HttpSession session)
			throws IOException {
		log.info("맵핑 login/login, post방식으로 loginProceed method 호출");
		
		// admin 판정, 판정성공시 admin만 로그인세션 id에 담기
		if(lvo.getM_Id().equals("admin") && lvo.getM_Pw().equals("1234")) {
			LoginVO loginSession = new LoginVO();
			loginSession.setM_Id(lvo.getM_Id());			
			session.setAttribute("loginSession", loginSession);
			System.out.println("관리자 로그인 성공");
			return "success";
		}
		
		// 로그인 조회 (아이디, 이름, 이메일, 리턴, 비밀번호엔 로그인 성공여부가 담김)
		LoginVO loginResult = loginService.loginSelect(lvo);
		
		// 로그인 성공 결과를 담기
		String result = loginResult.getM_Pw();
		loginResult.setM_Pw(null);//null 설정하여 삭제
		
		// 결과가 성공이면 loginSession에 아이디를 저장한 loginVO 저장
		if(result == "success") {
			// 로그인 세션에 (아이디, 이름, 이메일 담기)
			session.setAttribute("loginSession", loginResult);
		} else {
			session.setAttribute("loginSession", null); //로그인 세션을 삭제
		}
		
		return result;
	}
	

	// ID 찾기, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "login/findid", method = RequestMethod.POST)
	public String searchId(@RequestParam("m_Email") String m_Email) {
		log.info("맵핑 login/findid, post방식으로 searchId method 호출");

		// null 값이면 fail, 탈퇴한 아이디면 leave, 정상적으로 아이디가 조회되면 아이디명 리턴
		return loginService.idSelect(m_Email);
	}

	// pw찾기, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "login/findpw", method = RequestMethod.POST)
	public String searchPw(@ModelAttribute LoginVO lvo) {
		log.info("맵핑 login/findpw, post방식으로 searchPw method 호출");
		
		// 성공(이메일 전송) - success, 실패 - fail, 탈퇴한 아이디 - leave 반환
		return loginService.pwSelect(lvo);
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 login/louout, logout method 호출");
		session.invalidate();
		session = request.getSession(true);

		return "redirect:/";
	}

}
