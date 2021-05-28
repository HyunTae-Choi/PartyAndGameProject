package com.pag.admin.adminpage.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.notice.service.NoticeService;
import com.pag.common.util.Util;

@Controller
public class AdminpageController {
	private Logger log = LoggerFactory.getLogger(AdminpageController.class);

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/admin/manage/booking")
	public ModelAndView adminManage(HttpSession session) {
		log.info("맵핑 /admin/manage, AdminpageController 호출");

		ModelAndView mav = new ModelAndView();
		
		// 세션이 null이거나 session의 id가 admin이 아니면 adminpage로 이동 불가
		if(Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/");
			return mav;
		}
		
		mav.addObject("changeAdminPage", "admin_"); // view.jsp를 adminPage용으로 바꾸기
		mav.setViewName("admin/manage/booking");		
		return mav;
	}
		
	
	/* ============= admin Service 파트 ============= */	
	@RequestMapping(value = "/admin/service")
	public String adminService() {
		log.info("맵핑 /admin/service, AdminpageController 호출");				
		return "redirect:/admin/service/notice";
	}	
	
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
	
		
	/* === admin 공지사항 글쓰기 폼 출력 === */
	@RequestMapping(value = "/admin/service/notice/write")
	public String adminServiceNoticeWriteForm(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/writeform', AdminpageController 호출, 공지사항 글쓰기폼 호출");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/write";
	}
	
	
	/* === admin 공지사항 글쓰기 진행 === */
	@RequestMapping(value = "/admin/service/notice/insert")
	public String adminServiceNoticeInsert(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/insert', AdminpageController 호출, 공지사항 글쓰기 진행");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/insert";
	}
	
	/* === admin 공지사항 글쓰기 진행 === */
	@RequestMapping(value = "/admin/service/notice/update")
	public String adminServiceNoticeUpdate(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/admin/service/notice/update', AdminpageController 호출, 공지사항 글수정 진행");
		
		// noitceController로 포워드
		request.setAttribute("toAdminPage", "toAdminPage");
		return "forward:/notice/update";
	}
	
}
