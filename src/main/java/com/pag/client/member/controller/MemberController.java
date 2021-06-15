package com.pag.client.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.service.LoginService;
import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	
	// 회원가입 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("member/join, post방식으로 memberInsert 호출 성공");
		
		System.out.println("회원 가입자 정보 : " + mvo);
		
		ModelAndView mav = new ModelAndView();
		
		int result = memberService.memberInsert(mvo);
		
		if(result == 1){
			System.out.println("회원 가입 성공");
			
			// 회원가입 이후, 세션처리
			LoginVO loginResult = new LoginVO();
			loginResult.setM_Id(mvo.getM_Id());
			loginResult.setM_Email(mvo.getM_Email());
			loginResult.setM_Name(mvo.getM_Name());
			session.setAttribute("loginSession", loginResult);
			
			mav.setViewName("redirect:/");
					
		}else{
			System.out.println("회원 가입 실패");
			mav.setViewName("redirect:/");
		}

		return mav;
	}
	
	// 회원정보 변경을 위한 pw확인
	@ResponseBody
	@RequestMapping(value = "/pwConfirm")
	public Map<String, String> memberPwConfirm(@ModelAttribute LoginVO lvo, HttpSession session){
		log.info("맵핑 member/pwConfirm, MemberController, memberPwConfirm method 호출 성공");
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		// 로그아웃된 상태면 진행 불가
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");
		if(loginSession == null) {
			System.out.println("로그아웃된 상태입니다.");
			returnMap.put("result", "error");
			return returnMap;
		} else if (!loginSession.getM_Id().equals(lvo.getM_Id())) {
			System.out.println("로그인에 문제가 발생했습니다.");
			returnMap.put("result", "error");
			return returnMap;
		}
					
		// pw확인, pw에 성공여부 메시지가 담겨서 반환됨. (success or fail)		
		LoginVO result = loginService.loginSelect(lvo);
		returnMap.put("result", result.getM_Pw());
		
		// 회원정보 변경을 위한 데이터 받기
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(lvo.getM_Id());
		mvo = memberService.memberSelect(mvo);
		
		returnMap.put("m_Id", mvo.getM_Id()); // 아이디
		returnMap.put("m_Name", mvo.getM_Name()); // 이름
		returnMap.put("m_Gender", mvo.getM_Gender()); // 성별
		returnMap.put("m_Phone", mvo.getM_Phone()); // 핸드폰 번호
		returnMap.put("m_Email", mvo.getM_Email()); // 이메일
		returnMap.put("m_Birth", mvo.getM_Birth()); // 생년월일
		
		
		return returnMap;
	}
	
	// 비밀번호 수정
	@ResponseBody
	@RequestMapping(value = "/pwUpdate")
	public String memberPwUpdate(@ModelAttribute MemberVO mvo, HttpSession session){
		log.info("맵핑 member/pwUpdate, MemberController, memberPwUpdate method 호출 성공");

		// 로그아웃된 상태면 진행 불가
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");
		if(loginSession == null) {
			System.out.println("로그아웃된 상태입니다.");
			return "error";
		} else if (!loginSession.getM_Id().equals(mvo.getM_Id())) {
			System.out.println("로그인에 문제가 발생했습니다.");
			return "error";
		}		
		
		// 기존 비밀번호 확인 (success or fail)
		LoginVO lvo = new LoginVO();
		lvo.setM_Id(loginSession.getM_Id());
		lvo.setM_Pw(mvo.getM_Pw_Old());		
		lvo = loginService.loginSelect(lvo);
		
		if("fail".equals(lvo.getM_Pw())) {
			return "fail_pw_old";
		} else if(("success".equals(lvo.getM_Pw())) && mvo.getM_Pw().equals(mvo.getM_Pw_Old())) {
			return "overlap_pw";
		} else {
			// 비밀번호 업데이트
			if((memberService.memberPwUpdate(mvo)) == 1) {
				return "pw_update_success";
			} else {
				return "pw_update_fail";
			}
		}
	}
	
	// 회원 정보 변경 처리
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("member/update, post방식으로 memberUpdate 호출 성공");

		// 세션에 저장된 로그인세션 호출
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");
		
		// 로그아웃된 상태면 변경 불가
		if(loginSession == null) {
			System.out.println("로그아웃된 상태입니다.");
			return "error";
		} 
		
		mvo.setM_Id(loginSession.getM_Id()); // id는 disabled되어서 받아오지 못하므로, 세션에 저장된 아이디를 호출하여 저장
		System.out.println("회원정보 변경 내용");
		System.out.println("아이디 : " + mvo.getM_Id());
		System.out.println("전화번호 : " + mvo.getM_Phone());
		System.out.println("이메일 : " + mvo.getM_Email());
		
		int result = 0;
		result = memberService.memberUpdate(mvo);
		
		return Integer.toString(result);
	}	
	
	// 아이디 체크 (중복여부), ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String memberIdOverlapCheck(@ModelAttribute MemberVO mvo) {
		log.info("member/idcheck, post방식으로 memberInsert 호출 성공");
		
		String result;
		
		mvo = memberService.memberSelect(mvo); 
		
		if(mvo != null){
			if(mvo.getM_Availabled() == 0) {
				result = "leave"; // 탈퇴한 사용자의 아이디
			} else {
				result = "overlap"; // 아이디 중복
			}
		}else{
			result = "notOverlap"; // 아이디 중복 아님
		}

		return result;
	}
	
	// 이메일 체크 (중복여부), ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	public String memberEmailOverlapCheck(@ModelAttribute MemberVO mvo) {
		log.info("member/idcheck, post방식으로 memberInsert 호출 성공");

		String result;
		
		mvo = memberService.memberSelect(mvo);
		
		if(mvo != null){
			if(mvo.getM_Availabled() == 0) {
				result = "leave"; // 탈퇴한 사용자의 이메일
			} else {
				result = "overlap"; // 이메일 중복
			}			
		}else{
			result = "notOverlap"; // 이메일 중복 아님
		}
		return result;
	}
	
	
	// 회원 탈퇴 처리, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/leave")
	public String memberLeave(@ModelAttribute MemberVO mvo){
		log.info("맵핑 member/leave, memberLeave method 호출 성공");
		System.out.println("회원 탈퇴 아이디 : " + mvo.getM_Id());
		System.out.println("회원 탈퇴 비밀번호 : " + mvo.getM_Pw());
		
		// memberService로 회원탈퇴 프로세스 진행
		int result = memberService.memberUpdateLeave(mvo);
		
		if(result == 1) { // 회원 탈퇴 성공
			return "success";
		} else { // 회원 탈퇴 실패
			return "fail";
		}
		
	}
	
}

	