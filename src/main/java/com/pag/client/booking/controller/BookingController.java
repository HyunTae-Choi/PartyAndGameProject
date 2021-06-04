package com.pag.client.booking.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pag.client.booking.service.BookingService;
import com.pag.client.booking.vo.BookingVO;
import com.pag.client.login.vo.LoginVO;

@Controller
@RequestMapping(value="/booking")
public class BookingController {
	private Logger log = LoggerFactory.getLogger(BookingController.class);
	
	@Autowired
	private BookingService bookingService;
	
	// 조회한 파티룸이 이미 예약된 상품인지 조회
	@ResponseBody
	@RequestMapping(value="/bookingCheck.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingCheck(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingCheck 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingCheck(bookingVO);
		
		// result값이 1이면 품절
		if(result == 1) {
			resultString = "SoldOut";
		} else { // 1이 아니면 품절아님
			resultString = "NotSoldOut";
		}
		
		log.info("result = " + result);
		
		// resultString을 ajax 결과 data로 보내줌
		return resultString+"";   
	}
	
	// 해당 사용자가 예약한 상품이 있는 지 조회 탈퇴요청할때 예약상품이 있을 경우 탈퇴 불가능
	@ResponseBody
	@RequestMapping(value="/bookingCheck_Member.do", method=RequestMethod.POST)
	public String bookingCheck_Member(@ModelAttribute BookingVO bookingVO, HttpSession session) {
		log.info("bookingCheck_Member 호출 성공");
		String resultString = "";
		
		LoginVO loginSession = null;
		loginSession = (LoginVO) session.getAttribute("loginSession");
		
		int result = bookingService.bookingCheck_Member(loginSession.getM_Id());
		
		// result값이 1이면 예약상품있음
		if(result == 1) {
			resultString = "Reserved";
		} else { // result값이 1이 아니면 예약상품이 없음
			resultString = "NotReserved";
		}
		
		log.info("result = " + result);
		
		// resultString을 ajax 결과 data로 보내줌
		return resultString+"";   
	}
	
	// 비회원 예약 등록 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingNonMember.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingNonMember(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingNonMember 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingNonMember(bookingVO);
		
		// result값이 1이면 예약 등록 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 예약 등록 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 회원 예약 등록 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingMember.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingMember(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingMember 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingMember(bookingVO);
		
		// result값이 1이면 예약 등록 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 예약 등록 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 비회원 예약 상품 확인페이지 컨트롤러
	@RequestMapping(value = "/nonReservConfirm", method = RequestMethod.GET)
	public String nonReservConfirm(@ModelAttribute BookingVO bookingVO) {
		log.info("nonReservConfirm 호출 성공");
		return "nonReservConfirm";
	}
	
	// 비회원 예약 상품 리스트 컨트롤러
	@RequestMapping(value = "/nonReservList", method = RequestMethod.POST)
	public String nonReservList(@ModelAttribute BookingVO bookingVO, Model model) {
		log.info("nonReservList 호출 성공");
		
		// 비회원 예약 리스트 출력
		List<BookingVO> nonReservList = bookingService.nonReservList(bookingVO);
		model.addAttribute("nonReservList", nonReservList);
		
		// 페이지 출력
		return "nonReservList";
	}
	
	// 예약 취소 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingReservCancel", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingReservCancel(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingReservCancel 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingReservCancel(bookingVO);
		
		if(result == 1) { // 예약 취소 성공
			resultString = "success";
		} else { // 예약 취소 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 환불요청중인 예약 상품 재 예약 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingReservReturn", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingReservReturn(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingReservReturn 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingReservReturn(bookingVO);
		
		if(result == 1) { // 재예약 성공
			resultString = "success";
		} else { // 재예약 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 입금대기중인 예약 상품 입금 확인 후 예약완료로 변환해주는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingReservComplete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingReservComplete(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingReservComplete 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingReservComplete(bookingVO);
		
		if(result == 1) { // 변환 성공
			resultString = "success";
		} else { // 변환 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 예약완료인 상품 예약당일 대여중으로 변환해주는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingRentalComplete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingRentalComplete(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingRentalComplete 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingRentalComplete(bookingVO);
		
		if(result == 1) { // 변환 성공
			resultString = "success";
		} else { // 변환 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 대여중 상품 퇴실 후 대여완료로 변환해주는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingRentalEnd", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingRentalEnd(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingRentalEnd 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingRentalEnd(bookingVO);
		
		if(result == 1) { // 변환 성공
			resultString = "success";
		} else { // 변환 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	// 환불요청중인 예약 상품 환불 완료로 변환해주는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingCancelComplete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingCancelComplete(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingCancelComplete 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingCancelComplete(bookingVO);
		
		if(result == 1) { // 변환 성공
			resultString = "success";
		} else { // 변환 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString; 
	}
	
	// 입금대기중인 상품 입금처리가 안되면 예약삭제하는 컨트롤러
	@ResponseBody
	@RequestMapping(value="/bookingDelete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingDelete(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingDelete 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingDelete(bookingVO);
		
		if(result == 1) { // 예약 삭제 성공
			resultString = "success";
		} else { // 예약 삭제 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;
	}
}
