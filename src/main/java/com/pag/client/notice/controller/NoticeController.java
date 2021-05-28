package com.pag.client.notice.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.notice.service.NoticeService;
import com.pag.client.notice.vo.NoticeVO;
import com.pag.common.util.Util;
import com.pag.common.vo.PageVO;

@Controller
public class NoticeController {
	private Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	/* 공지사항 목록 */
	@RequestMapping(value = "/notice")
	public ModelAndView notice(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/notice', 공지사항 리스트 호출");
		
		ModelAndView mav = new ModelAndView();

		/* == 공지사항 글 목록 출력 == */		
		// 공지사항 전체 글수, 최대섹션, 최대 페이지, 현재 섹션, 현재 페이지 계산
		PageVO pvo = noticeService.noticeSectionPageCnt(request.getParameter("page"));
		
		NoticeVO nvo = new NoticeVO();
		nvo.setPage(pvo.getPage());		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		mav.addObject("noticeList", noticeList); // 글 목록	
		mav.addObject("pvo", pvo); // 페이징		
		/* == 공지사항 글 목록 출력 end == */
		
		
		// mainpage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {		
			mav.setViewName("service/notice/noticeList"); // tiles 지정			
			
		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {			
			mav.setViewName("admin/service/notice/noticeList"); // tiles 지정 			
			mav.addObject("changeAdminPage", "admin_"); // view.jsp를 adminPage용으로 바꾸기
		}		
		
		return mav;
	}

	
	/* === 공지사항 상세보기 === */
	@RequestMapping(value = "/notice/view")
	public ModelAndView noticeDetailView(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/notice/view', 공지사항 상세보기 호출");
		
		// 상세보기 글 번호 받기
		String _n_No = request.getParameter("notice_no");
		int n_No = Integer.parseInt(_n_No);		
		System.out.println("글번호 : " + n_No);
				
		/* === 공지글 조회 === */ 
		ModelAndView mav = new ModelAndView();
		NoticeVO nvo = noticeService.noticeDetailSelect(n_No);
				
		if (nvo == null) { // 조회값이 없으면 공지사항 리스트로
			return new ModelAndView("redirect:/notice");
		} else if(nvo != null) { // 조회 내용이 있으면 조회수 증가
			noticeService.noticeHitCountUpdate(nvo.getN_No());
		}
		
		mav.addObject("nvo", nvo); // notice 글 상세보기 값 할당	
		/* === 공지글 조회 end === */
		
		
		// mainpage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {
			// tiles 지정
			mav.setViewName("service/notice/noticeDetailView");			

		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("admin/service/notice/noticeDetailView"); // tiles 지정 
			mav.addObject("changeAdminPage", "admin_"); // view.jsp를 adminPage용으로 바꾸기
		}	
		
		return mav;
	}
		
	/* === 공지사항 글쓰기 폼 출력 === */
	@RequestMapping(value = "/notice/write")
	public ModelAndView noticeWrite(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/notice/writeform', 공지사항 글쓰기폼 호출");
		
		// 세션이 null이거나 session의 id가 admin이 아니면 글쓰기폼 출력 불가
		if(Util.checkAdminSession(session)) { return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();		
		
		// mainpage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {
			mav.setViewName("service/notice/noticeWrite"); // tiles의 이름지정

		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("admin/service/notice/noticeWrite"); // tiles 지정 
			mav.addObject("changeAdminPage", "admin_"); // view.jsp를 adminPage용으로 바꾸기
		}	
		
		return mav;
	}
	
	
	/* === 공지사항 글쓰기 진행 === */
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST)
	public ModelAndView noticeInsert(@ModelAttribute NoticeVO nvo, HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/notice/insert', 공지사항 글쓰기 진행");
		
		// 세션이 null이거나 session의 id가 admin이 아니면 글쓰기폼 출력 불가
		if(Util.checkAdminSession(session)) { return new ModelAndView("redirect:/");}
			
		
		/* === 공지글 쓰기 === */ 
		//세션에서 id(admin)을 가져와서 nvo에 넣고, 글쓰기 진행
		LoginVO lvo = (LoginVO) session.getAttribute("loginSession");
		nvo.setN_Writer(lvo.getM_Id());
		int result = noticeService.noticeInsert(nvo);
		
		if(result == 0) { System.out.println("공지사항 쓰기 실패");
		} else if(result == 1){ System.out.println("공지사항 쓰기 성공"); }		
		/* === 공지글 쓰기 end === */
		
		
		ModelAndView mav = new ModelAndView();
		
		// mainpage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {
			mav.setViewName("redirect:/notice");	

		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/admin/service/notice");
		}	
		
		return mav;
	}
	
	
	
	/* === 공지사항 글수정 진행 === */
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public ModelAndView noticeUpdate(@ModelAttribute NoticeVO nvo, HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/notice/update', 공지사항 글수정 진행");
		
		// 세션이 null이거나 session의 id가 admin이 아니면 글 수정 불가
		if(Util.checkAdminSession(session)) { return new ModelAndView("redirect:/");}
			
				
		/* ==== 공지글 수정 ==== */ 
		int result = noticeService.noticeUpdate(nvo);
		
		if(result == 0) { System.out.println("공지사항 수정 실패");
		} else if(result == 1){ System.out.println("공지사항 수정 성공");}
		/* ==== 공지글 수정 end ==== */
		
		
		ModelAndView mav = new ModelAndView();
		
		// mainpage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {
			mav.setViewName("redirect:/notice/view?notice_no=" + nvo.getN_No());

		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/admin/service/notice/view?notice_no=" + nvo.getN_No());
		}
		
		return mav;
	}
}

