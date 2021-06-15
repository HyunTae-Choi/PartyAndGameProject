package com.pag.admin.adminpage.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.pag.client.booking.service.BookingService;
import com.pag.client.booking.vo.BookingVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;
import com.pag.client.notice.service.NoticeService;
import com.pag.client.question.service.QuestionService;
import com.pag.client.question.vo.QuestionVO;
import com.pag.client.rooms.service.RoomsService;
import com.pag.client.rooms.vo.RoomsVO;
import com.pag.common.file.FileUploadUtil;
import com.pag.common.util.Util;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

@Controller
public class AdminpageController {
	private Logger log = LoggerFactory.getLogger(AdminpageController.class);

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	private BookingService bookingService;
	
	@Autowired
	private RoomsService roomsService;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	MemberService memberService;
	
	/* ============= admin Manage 예약리스트 파트 ============= */
	// 관리자 예약관리 페이지에서 전체 예약 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingFullList")
	public ModelAndView adminManage(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, AdminpageController 호출");
		log.info("맵핑 /admin/manage, bookingFullList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 전체 예약리스트 페이징
		PageVO pageVO = bookingService.bookingFullListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 리스트 출력
		List<BookingVO> bookingFullList = bookingService.bookingFullList(bookingVO);
		
		// 페이징과 리스트 add
		mav.addObject("bookingFullList", bookingFullList);
		mav.addObject("pageVO", pageVO);
		
		// bookingFullList 출력
		mav.setViewName("admin/manage/booking/bookingFullList");	
		
		return mav;
	}
	
	// 관리자 예약관리 페이지에서 입금대기 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingWaitingList")
	public ModelAndView adminManageBookingWaitingList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, bookingWaitingList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 입금대기 리스트 페이징
		PageVO pageVO = bookingService.bookingWaitingListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 입금대기 리스트 출력
		List<BookingVO> bookingWaitingList = bookingService.bookingWaitingList(bookingVO);
		
		// 입금대기 리스트 페이징 add
		mav.addObject("bookingWaitingList", bookingWaitingList);
		mav.addObject("pageVO", pageVO);
		
		// bookingWaitingList 출력
		mav.setViewName("admin/manage/booking/bookingWaitingList");		
		return mav;
	}
	
	// 관리자 예약관리 페이지에서 예약완료 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingReservList")
	public ModelAndView adminManageBookingReservList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, bookingReservList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 예약완료 리스트 페이징
		PageVO pageVO = bookingService.bookingReservListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 예약완료 리스트 출력
		List<BookingVO> bookingReservList = bookingService.bookingReservList(bookingVO);
		
		// 페이징 리스트 저장
		mav.addObject("bookingReservList", bookingReservList);
		mav.addObject("pageVO", pageVO);
		
		// bookingReservList 출력
		mav.setViewName("admin/manage/booking/bookingReservList");		
		return mav;
	}
	
	// 관리자 예약관리 페이지에서 예약당일 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingReservDayList")
	public ModelAndView adminManageBookingReservDayList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, bookingReservDayList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 예약당일 리스트 페이징
		PageVO pageVO = bookingService.bookingReservDayListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 예약당일 리스트 출력
		List<BookingVO> bookingReservDayList = bookingService.bookingReservDayList(bookingVO);
		
		mav.addObject("bookingReservDayList", bookingReservDayList);
		mav.addObject("pageVO", pageVO);
		
		// bookingReservDayList 출력
		mav.setViewName("admin/manage/booking/bookingReservDayList");		
		return mav;
	}
	
	// 관리자 예약관리 페이지에서 환불요청 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingRefundWaitingList")
	public ModelAndView adminManageBookingRefundWaitingList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, bookingRefundWaitingList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 환불요청 리스트 페이징
		PageVO pageVO = bookingService.bookingRefundWaitingListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 환불요청 리스트 출력
		List<BookingVO> bookingRefundWaitingList = bookingService.bookingRefundWaitingList(bookingVO);
		
		// 저장
		mav.addObject("bookingRefundWaitingList", bookingRefundWaitingList);
		mav.addObject("pageVO", pageVO);
		
		// bookingRefundWaitingList 출력
		mav.setViewName("admin/manage/booking/bookingRefundWaitingList");		
		return mav;
	}
	
	// 관리자 예약관리 페이지에서 환불완료 리스트 조회
	@RequestMapping(value = "/admin/manage/booking/bookingRefundList")
	public ModelAndView adminManageBookingRefundList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage, bookingRefundList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// 환불완료 리스트 페이징
		PageVO pageVO = bookingService.bookingRefundListCnt(request.getParameter("page"));
		BookingVO bookingVO = new BookingVO();
		bookingVO.setPage(pageVO.getPage());
		
		// 환불완료 리스트 출력
		List<BookingVO> bookingRefundList = bookingService.bookingRefundList(bookingVO);
		
		// 저장
		mav.addObject("bookingRefundList", bookingRefundList);
		mav.addObject("pageVO", pageVO);
		
		// bookingRefundList 출력
		mav.setViewName("admin/manage/booking/bookingRefundList");		
		return mav;
	}
	
	/* ============= admin Manage 회원관리 파트 ============= */
	/* ====== admin 회원리스트 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/manage/member")
	public ModelAndView adminManageMemberList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/member, AdminpageController 호출, 회원리스트 출력");

		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return new ModelAndView("redirect:/"); }
		
		ModelAndView mav = new ModelAndView();
		
		/* === 회원리스트 출력 === */		
		// 전체 회원수, 최대섹션, 최대 페이지, 현재 섹션, 현재 페이지 계산
		PageVO pvo = memberService.adminMemberSectionPageCnt(request.getParameter("page"),request.getParameter("category"));
		
		List<MemberVO> memberList = memberService.adminMemberListSelect(pvo); // 회원 리스트 받기				
		mav.addObject("memberList", memberList); // 회원리스트
		mav.addObject("pvo", pvo); // 페이징		
		/* == 회원리스트 출력 end == */		
		
		/* == 회원리스트에 따른 출력 화면 조정 == */
		mav.addObject("memberCategory", pvo.getCategory());// 드랍박스 select		
		if("total".equals(pvo.getCategory())) { // 페이지 url 조정
			mav.addObject("adminMemberTablePath", "admin/manage/member?page");
		} else if("enable".equals(pvo.getCategory())) {
			mav.addObject("adminMemberTablePath", "admin/manage/member?category=enable&page");
		} else if("disable".equals(pvo.getCategory())) {
			mav.addObject("adminMemberTablePath", "admin/manage/member?category=disable&page");
		}
		/* == 회원리스트에 따른 출력 화면 조정 end == */
				
		return mav;
	}
	
	/* ====== admin 회원상태 비활성화 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value = "/admin/manage/member/disable")
	public String adminManageMemberDisable(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("맵핑 /admin/manage/disable, AdminpageController 호출, 회원비활성화");

		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return ("redirect:/"); }
		
		int result = 0;
		/* === 회원 비활성화 === */
		if((result= memberService.adminMemberDisableUpdate(mvo)) == 1) {
			System.out.println("회원 비활성화 성공");
		} else { System.out.println("회원 비활성화 실패");}
		/* === 회원 비활성화 end === */
		
		return Integer.toString(result);
	}
	
	/* ====== admin 회원상태 복구 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value = "/admin/manage/member/enable")
	public String adminManageMemberEnable(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("맵핑 /admin/manage/enable, AdminpageController 호출, 탈퇴/비활성 회원복구");

		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return ("redirect:/"); }
		
		int result = 0;
		/* === 회원 복구 === */
		if((result= memberService.adminMemberEnableUpdate(mvo)) == 1) {
			System.out.println("회원 복구 성공");
		} else {System.out.println("회원 복구 실패");}
		/* === 회원 복구 end === */
		
		return Integer.toString(result);
	}
	
	/* ============= admin Manage 파티룸관리 파트 ============= */
	/* ====== admin 파티룸 리스트 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/manage/partyroomList")
	public ModelAndView adminManagePartyRoomList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomList, adminManagePartyRoomList 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		RoomsVO roomsVO = new RoomsVO();
		List<RoomsVO> partyroomList = roomsService.partyroomList(roomsVO);
		
		// 저장
		mav.addObject("partyroomList", partyroomList);
		
		// adminManagePartyRoom 출력
		mav.setViewName("admin/manage/partyroom/partyroomList");	
		
		return mav;
	}
	
	/* ====== admin 파티룸 추가 페이지 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/manage/partyroomInsertPage")
	public ModelAndView adminManagePartyRoomInsertpage(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomInsertPage, adminManagePartyRoomInsertpage 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		// adminManagePartyRoom 출력
		mav.setViewName("admin/manage/partyroom/partyroomInsertPage");
		
		return mav;
	}
	
	/* ====== admin 파티룸 추가 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomInsertAction", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String adminManagePartyRoomInsertAction(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("맵핑 /admin/manage/partyroomInsertAction, adminManagePartyRoomInsertAction 호출");
		
		int result = 0;
		String resultString = "";
		
		if(roomsVO.getThumbnail() != null) {
			String thumbnail = FileUploadUtil.fileUpload(roomsVO.getThumbnail(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_thumbnail(thumbnail);
		}
		if(roomsVO.getIntroimg1() != null) {
			String introimg1 = FileUploadUtil.fileUpload(roomsVO.getIntroimg1(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg1(introimg1);
		}
		if(roomsVO.getIntroimg2() != null) {
			String introimg2 = FileUploadUtil.fileUpload(roomsVO.getIntroimg2(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg2(introimg2);
		}
		if(roomsVO.getIntroimg3() != null) {
			String introimg3 = FileUploadUtil.fileUpload(roomsVO.getIntroimg3(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg3(introimg3);
		}
		if(roomsVO.getIntroimg4() != null) {
			String introimg4 = FileUploadUtil.fileUpload(roomsVO.getIntroimg4(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg4(introimg4);
		}
		
		result = roomsService.roomsInsert(roomsVO);
		
		// result값이 1이면 예약 등록 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 예약 등록 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 파티룸 추가 시 파티룸 번호 추가가능여부 확인 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomNumberCheck", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String adminManagePartyRoomNumberCheck(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomNumberCheck, adminManagePartyRoomNumberCheck 호출");
		
		int result = 0;
		String resultString = "";
		
		result = roomsService.roomsNumberCheck(roomsVO.getR_no());
		
		// result값이 1이면 예약 불가능
		if(result == 1) {
			resultString = "unavailable";
		} else { // result값이 1이 아니면 예약 가능
			resultString = "available";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 수정 시 파티룸이 비활성화인지 체크하는 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomUnavailableCheck", method=RequestMethod.POST)
	public String adminManagePartyRoomUnavailableCheck(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomUnavailableCheck, adminManagePartyRoomUnavailableCheck 호출");
		
		int result = 0;
		String resultString = "";
		
		result = roomsService.roomsUnavailableCheck(roomsVO.getR_no());
		
		// result값이 0이면 비활성화
		if(result == 0) {
			resultString = "unavailable";
		} else { // result값이 1이면 활성화
			resultString = "available";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 비활성화 시 파티룸에 예약자가 있는 지 체크하는 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomBookingCheck", method=RequestMethod.POST)
	public String adminManagePartyRoomBookingCheck(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomBookingCheck, adminManagePartyRoomBookingCheck 호출");
		
		int result = 0;
		String resultString = "";
		
		result = bookingService.roomsBookingCheck(roomsVO.getR_no());
		
		// result값이 1보다 크거나 같으면 예약자가 있음
		if(result >= 1) {
			resultString = "yes";
		} else { // result값이 0이면 예약자가 없음
			resultString = "no";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 파티룸 비활성화 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomUnavailableAction", method=RequestMethod.POST)
	public String adminManagePartyRoomUnavailableAction(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomUnavailableAction, adminManagePartyRoomUnavailableAction 호출");
		
		int result = 0;
		String resultString = "";
		
		result = roomsService.roomsUnavailableAction(roomsVO.getR_no());
		
		// result값이 1이면 비활성화 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 비활성화 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 파티룸 활성화 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomAvailableAction", method=RequestMethod.POST)
	public String adminManagePartyRoomAvailableAction(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomAvailableAction, adminManagePartyRoomAvailableAction 호출");
		
		int result = 0;
		String resultString = "";
		
		result = roomsService.roomsAvailableAction(roomsVO.getR_no());
		
		// result값이 1이면 활성화 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 활성화 실패
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	/* ====== admin 파티룸 updateform 컨트롤러 ====== */
	@RequestMapping(value="/admin/manage/partyroomUpdateForm", method=RequestMethod.POST)
	public ModelAndView adminManagePartyRoomUpdateform(@ModelAttribute RoomsVO roomsVO, HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/partyroomUpdateform, adminManagePartyRoomUpdateform 호출");
		
		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		RoomsVO roomsUpdate = new RoomsVO();
		roomsUpdate = roomsService.roomsInfo(roomsVO.getR_no());
		
		mav.addObject("roomsUpdate", roomsUpdate);
		
		mav.setViewName("admin/manage/partyroom/partyroomUpdatePage");
		
		return mav;  
	}
	
	/* ====== admin 파티룸 수정 Action 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value="/admin/manage/partyroomUpdateAction", method=RequestMethod.POST)
	public String adminManagePartyRoomUpdateAction(@ModelAttribute RoomsVO roomsVO, HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("맵핑 /admin/manage/partyroomUpdateAction, adminManagePartyRoomUpdateAction 호출");
		
		int result = 0;
		String resultString = "";
		String r_thumbnail = "";
		String r_introimg1 = "";
		String r_introimg2 = "";
		String r_introimg3 = "";
		String r_introimg4 = "";

		if(!roomsVO.getThumbnail().isEmpty()) {
			if(!roomsVO.getR_thumbnail().isEmpty()) {
				FileUploadUtil.fileDelete(roomsVO.getR_thumbnail(), request);
			}
			r_thumbnail = FileUploadUtil.fileUpload(roomsVO.getThumbnail(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_thumbnail(r_thumbnail);
		}else{
			roomsVO.setR_thumbnail("");
		}
		
		if(!roomsVO.getIntroimg1().isEmpty()) {
			if(!roomsVO.getR_introimg1().isEmpty()) {
				FileUploadUtil.fileDelete(roomsVO.getR_introimg1(), request);
			}
			r_introimg1 = FileUploadUtil.fileUpload(roomsVO.getIntroimg1(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg1(r_introimg1);
		}else{
			roomsVO.setR_introimg1("");
		}
		
		if(!roomsVO.getIntroimg2().isEmpty()) {
			if(!roomsVO.getR_introimg2().isEmpty()) {
				FileUploadUtil.fileDelete(roomsVO.getR_introimg2(), request);
			}
			r_introimg2 = FileUploadUtil.fileUpload(roomsVO.getIntroimg2(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg2(r_introimg2);
		} else{
			roomsVO.setR_introimg2("");
		}
		
		if(!roomsVO.getIntroimg3().isEmpty()) {
			if(!roomsVO.getR_introimg3().isEmpty()) {
				FileUploadUtil.fileDelete(roomsVO.getR_introimg3(), request);
			}
			r_introimg3 = FileUploadUtil.fileUpload(roomsVO.getIntroimg3(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg3(r_introimg3);
		} else{
			roomsVO.setR_introimg3("");
		}
		
		if(!roomsVO.getIntroimg4().isEmpty()) {
			if(!roomsVO.getR_introimg4().isEmpty()) {
				FileUploadUtil.fileDelete(roomsVO.getR_introimg4(), request);
			}
			r_introimg4 = FileUploadUtil.fileUpload(roomsVO.getIntroimg4(), request, Integer.toString(roomsVO.getR_no()));
			roomsVO.setR_introimg4(r_introimg4);
		} else{
			roomsVO.setR_introimg4("");
		}
		
		result = roomsService.roomsUpdateAction(roomsVO);
		
		// result값이 1이면 수정 성공
		if(result == 1) {
			resultString = "success";
		} else { // result값이 1이 아니면 수정 실패
			resultString = "fail";
		}
		
		return resultString;  
	}
	
	/* ============= admin Manage 매출분석 파트 ============= */
	/* ====== admin 매출분석 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/manage/statistic")
	public ModelAndView adminManageStatistic(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/manage/statistic, AdminpageController 호출, 통계 출력");
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return new ModelAndView("redirect:/"); }
		
		// 전체 성별 통계
		List<StatisticVO> memberGenderStatisticList = memberService.adminMemberGenderStatisticListSelect();
		
		// (21년) 월별 가입자 수 통계
		List<StatisticVO> memberJoinMonthStatisticList = memberService.adminMemberJoinMonthStatisticListSelect();
		
		// (21년) 월별 매출액 통계
		List<StatisticVO> salesMonthStatisticList = bookingService.adminSalesMonthStatisticListSelect();

		// (21년) 월별 예약건수 통계
		List<StatisticVO> bookingNumMonthStatisticList = bookingService.adminBookingNumMonthStatisticListSelect();
				
		ModelAndView mav = new ModelAndView();
		
		/* 통계 값 담기 */
		mav.addObject("memberGenderStatisticList", memberGenderStatisticList);
		mav.addObject("memberJoinMonthStatisticList", memberJoinMonthStatisticList);
		mav.addObject("salesMonthStatisticList", salesMonthStatisticList);
		mav.addObject("bookingNumMonthStatisticList", bookingNumMonthStatisticList);
		
		mav.setViewName("admin/manage/statistic");		
		return mav;
	}
	
	/* ============= admin Service 파트 ============= */	
	@RequestMapping(value = "/admin/service")
	public String adminService() {
		log.info("맵핑 /admin/service, AdminpageController 호출");				
		return "redirect:/admin/service/notice";
	}	
	
	/* ============= admin Service 공지사항 파트 ============= */
	/* ====== admin 공지사항 리스트 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/notice")
	public String adminServiceNotice(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/notice, AdminpageController 호출, 공지사항 리스트 출력" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";	}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice";
	}
	
	
	/* ====== admin 공지사항 글 상세보기 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/notice/view")
	public String adminServiceNoticeDetailView(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/notice/view, AdminpageController 호출, 공지사항 글 상세보기" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";	}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/view";
	}
	
		
	/* === admin 공지사항 글쓰기 폼 출력 컨트롤러 === */
	@RequestMapping(value = "/admin/service/notice/write")
	public String adminServiceNoticeWriteForm(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/writeform', AdminpageController 호출, 공지사항 글쓰기폼 호출");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/write";
	}
	
	
	/* === admin 공지사항 글입력 컨트롤러 === */
	@RequestMapping(value = "/admin/service/notice/insert")
	public String adminServiceNoticeInsert(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/insert', AdminpageController 호출, 공지사항 글쓰기 진행");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/insert";
	}
	
	/* === admin 공지사항 글수정 컨트롤러 === */
	@RequestMapping(value = "/admin/service/notice/update")
	public String adminServiceNoticeUpdate(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/update', AdminpageController 호출, 공지사항 글수정 진행");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/update";
	}
	
	
	
	/* ============= admin Service 1:1문의 파트 ============= */
	/* ====== admin 1:1문의 리스트 출력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/question")
	public String adminServiceQuestionList(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/question, AdminpageController 호출, 1:1문의 리스트 출력" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/mypage/question";
	}
	
	
	/* ====== admin 1:1문의 상세보기 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/question/view")
	public String adminServiceQuestionDetailView(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/question/view, AdminpageController 호출, admin 1:1문의 상세보기" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/mypage/question/view";
	}	
	
	/* ====== admin 1:1문의 답변상황 변경 컨트롤러 ====== */
	@ResponseBody
	@RequestMapping(value = "/admin/service/question/replychange", method = RequestMethod.POST)
	public String adminServiceQuestionReplyChange(@ModelAttribute QuestionVO qvo,
			HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/question/replychange, AdminpageController 호출, admin 1:1문의 답변상황 변경" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";}
		
		/* === 답변상황 업데이트 === */ 
		int result = 0;		
		if ((result = questionService.questionReplyCheckUpdate(qvo)) == 1) {
			System.out.println("답변상황 업데이트 성공");
		} else { System.out.println("답변상황 업데이트 실패"); }
		/* === 답변상황 업데이트 end === */
		
		return Integer.toString(result);
	}	
	
	/* ====== admin 1:1문의 답변 입력 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/question_reply/insert")
	public String adminServiceQuestionReplyInsert(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/question_reply/insert, AdminpageController 호출, admin 1:1문의 답변 입력" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/mypage/question_reply/insert";
	}	
	
	/* ====== admin 1:1문의 답변 수정 컨트롤러 ====== */
	@RequestMapping(value = "/admin/service/question_reply/update")
	public String adminServiceQuestionReplyUpdate(HttpSession session, HttpServletRequest request) {
		log.info("맵핑 /admin/service/question_reply/update, AdminpageController 호출, admin 1:1문의 답변 수정" );
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) { return "redirect:/";}
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/mypage/question_reply/update";
	}	
}
