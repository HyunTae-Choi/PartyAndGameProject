package com.pag.client.review.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.review.service.ReviewService;
import com.pag.client.review.vo.ReviewVO;
import com.pag.common.util.Util;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	private Logger log = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	// 리뷰 입력, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewVO rvo, HttpSession session) {	
		log.info("맵핑 /review/insert, ReviewController 호출, 리뷰입력");
		
		//rvo에 예약번호, 아이디, 방번호, 리뷰점수, 리뷰내용 담겨서 반환
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 실행안됨, 세션의 id와 rvo의 id가 일치하지 않으면 실행안됨
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return "error";}
		else if(!loginSession.getM_Id().equals(rvo.getM_Id())) {return "error";	}
										
		if(reviewService.reviewInsert(rvo) == 1) { // 리뷰입력, 리뷰입력 성공시 마일리지 지급
			if((memberService.memberReviewMileageUpdate(rvo) == 1)) { // 마일리지 지급 (예약금액의 10%)
				return "success";
			} else {
				return "errorMileageFail"; // 지급 실패시
			}		
		} else {
			return "errorReveiwFail"; // 리뷰 실패시
		}		
	}
	
	// 리뷰 데이터 호출, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/updatedata", method = RequestMethod.POST)
	public ReviewVO reviewUpdateData(@ModelAttribute ReviewVO rvo, HttpSession session) {	
		log.info("맵핑 /review/updatedata, ReviewController 호출, 리뷰수정을 위한 기존 데이터 호출");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 실행안됨, 세션의 id와 rvo의 id가 일치하지 않으면 실행안됨
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return null;}
		else if(!loginSession.getM_Id().equals(rvo.getM_Id())) {return null;}
		
		/* === 기존 리뷰 데이터 호출 === */		
		rvo = reviewService.reviewUpdataDataSelect(rvo);
		/*받은 값 - 리뷰번호, 예약번호, 방번호, 아이디*/ 
		/* 반환 값 - 리뷰 점수, 리뷰 내용 */
		/* === 기존 리뷰 데이터 호출 end === */

		return rvo;		
	}
	
	// 리뷰 수정, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute ReviewVO rvo, HttpSession session) {	
		log.info("맵핑 /review/update, ReviewController 호출, 리뷰수정");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 실행안됨, 세션의 id와 rvo의 id가 일치하지 않으면 실행안됨
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return "error";}
		else if(!loginSession.getM_Id().equals(rvo.getM_Id())) {return "error";	}
		
		/*받은 값 - 예약번호, 방번호, 아이디, 점수, 내용, 리뷰번호*/		
		/* === 리뷰 업데이트 === */		
		int result = reviewService.reviewUpdate(rvo);		 
		/* === 기존 업데이트 end === */

		return Integer.toString(result);		
	}
	
	// 리뷰 삭제, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/disableupdate", method = RequestMethod.POST)
	public String reviewDisableUpdate(@ModelAttribute ReviewVO rvo, HttpSession session) {	
		log.info("맵핑 /review/disableupdate, ReviewController 호출, 리뷰삭제");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 실행안됨, 세션의 id와 rvo의 id가 일치하지 않으면 실행안됨
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return "error";}
		else if(!loginSession.getM_Id().equals(rvo.getM_Id())) {return "error";	}
		
		/*받은 값 - 예약번호, 방번호, 아이디, 리뷰번호*/		
		/* === 리뷰 - 회원 비활성화로 업데이트 === */		
		int result = reviewService.reviewDisableUpdate(rvo);		 
		/* === 리뷰 - 회원 비활성화로 업데이트 end=== */

		return Integer.toString(result);		
	}
	
	// admin 리뷰 삭제, ajax로 처리
	@ResponseBody
	@RequestMapping(value = "/admindisableupdate", method = RequestMethod.POST)
	public String reviewAdminDisableUpdate(@ModelAttribute ReviewVO rvo, HttpSession session) {	
		log.info("맵핑 /review/admindisableupdate, ReviewController 호출, admin 리뷰 비활성화");
		
		// 세션이 null이거나 session의 id가 admin이 아니면 실행아됨
		if(Util.checkAdminSession(session)) {
			return "error";
		}
		
		System.out.println(rvo);
		
		/*받은 값 - 예약번호, 방번호,리뷰번호*/		
		/* === 리뷰 - admin 비활성화로 업데이트 === */		
		int result = reviewService.adminReviewDisableUpdate(rvo);		 
		/* === 리뷰 - admin 비활성화로 업데이트 end=== */

		return Integer.toString(result);		
	}
}
