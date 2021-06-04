package com.pag.client.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;
import com.pag.client.question.service.QuestionService;
import com.pag.client.question.vo.QuestionVO;
import com.pag.client.reply.service.ReplyService;
import com.pag.client.reply.vo.ReplyVO;
import com.pag.common.util.Util;
import com.pag.common.vo.PageVO;

@Controller
@RequestMapping(value = "/mypage/question")
public class QuestionController {
	private Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private MemberService memberService;
	
	/* ===== 1:1 고객 문의글 목록 ===== */
	@RequestMapping(value="")
	public ModelAndView questionList(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question', QuestionController 호출, 1:1 문의글 리스트");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();
		
		/* == 1:1 문의글 목록 출력 == */		
		String m_Id = loginSession.getM_Id(); // 아이디 받기		
		System.out.println("문의글 조회 아이디 :" + m_Id);		
		// 공지사항 전체 글수, 최대섹션, 최대 페이지, 현재 섹션, 현재 페이지 계산
		PageVO pvo = questionService.questionSectionPageCnt(request.getParameter("page"), m_Id);
		// 문의글 리스트 받기
		QuestionVO qvo = new QuestionVO();  qvo.setM_Id(m_Id);  qvo.setPage(pvo.getPage());
		List<QuestionVO> questionList = questionService.questionListSelect(qvo);				
		mav.addObject("questionList", questionList); // 1:1 문의글 목록 
		mav.addObject("pvo", pvo); // 페이징	
		/* == 1:1 문의글 목록 출력 end == */	
				
		/* == 회원 정보 수정용 정보 받기 == */
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());		
		mvo = memberService.memberSelect(mvo);
		mav.addObject("mvo", mvo);
		/* == 회원 정보 수정용 정보 받기 end == */
		
		// mypage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {		
			mav.setViewName("mypage/question/questionList"); // tiles 지정			
		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {			
			mav.setViewName("admin/service/question/questionList"); // tiles 지정 			
		}		
				
		return mav;
	}
	
	
	
	/* ===== 1:1 고객 문의글 상세보기  ===== */
	@RequestMapping(value = "/view")
	public ModelAndView questionDetailView(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question/view', QuestionController 호출, 1:1 문의글 상세보기");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		// 상세보기 조회를 위해, 글번호와 아이디 받기
		QuestionVO qvo = new QuestionVO();
		try {
			qvo.setQ_No(Integer.parseInt(request.getParameter("question_no")));
			qvo.setM_Id(loginSession.getM_Id());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("잘못된 접근");
			return new ModelAndView("redirect:/mypage/question");
		}
		
		ModelAndView mav = new ModelAndView();
		
		/* == 1:1 문의글 상세보기 출력 == */
		// 번호, 제목, 내용, 날짜, 답변상황, 작성자 이름 반환
		qvo = questionService.questionDetailSelect(qvo);
		
		if (qvo != null) {	
			mav.addObject("qvo", qvo);			
		} else if(qvo == null) { // 조회값이 없으면 문의 리스트로 
			System.out.println("문의글 없음");
			return new ModelAndView("redirect:/mypage/question");
		}		  
		/* == 1:1 문의글 상세보기 출력 end == */		
		
		
		/* == 1:1 문의글 답글리스트 출력 == */		
		List<ReplyVO> rvoList = replyService.questionReplyListSelect(qvo.getQ_No());
		if(rvoList != null) { 	
			mav.addObject("questionReplyList", rvoList);
		} else if(rvoList == null) {
			System.out.println("문의글의 답글 없음");
		}
		/* == 1:1 문의글 답글리스트 출력 end == */
		
		
		/* == 회원 정보 수정용 정보 받기 == */
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());		
		mvo = memberService.memberSelect(mvo);
		mav.addObject("mvo", mvo);
		/* == 회원 정보 수정용 정보 받기 end == */
		
		// mypage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {		
			mav.setViewName("mypage/question/questionDetailView"); // tiles 지정			
		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.addObject("changeAdminPage", "admin_"); // view.jsp를 adminPage용으로 바꾸기
			mav.setViewName("admin/service/question/questionDetailView"); // tiles 지정		
		}				
		
		return mav;
	}
	
	
	/* ===== 1:1 고객 문의글 글쓰기폼 출력 ===== */
	@RequestMapping(value = "/write")
	public ModelAndView questionWriteform(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question/writeform', QuestionController 호출, 1:1 문의글 글쓰기");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();
		
		/* == 회원 정보 수정용 정보 받기 == */
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());		
		mvo = memberService.memberSelect(mvo);
		mav.addObject("mvo", mvo);
		/* == 회원 정보 수정용 정보 받기 end == */
		
		mav.setViewName("mypage/question/questionWrite");
		
		return mav;
	}
	
	
	/* ===== 1:1 고객 문의글 글입력 ===== */
	@RequestMapping(value = "/insert")
	public ModelAndView questionInsert(@ModelAttribute("QuestionVO") QuestionVO qvo, HttpSession session) {
		log.info("매핑 '/mypage/question/insert', QuestionController 호출, 1:1 문의게시글 글입력");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();		
		
		/* == 1:1 문의글 입력 == */	
		// 글 입력 결과 받기
		int result = 0;
		result = questionService.questionInsert(qvo);		
		if(result == 1) { System.out.println("문의글 입력 성공");
		} else { System.out.println("문의글 입력 실패"); }
		/* == 1:1 문의글 입력 end == */	
		
		/* == 회원 정보 수정용 정보 받기 == */
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());		
		mvo = memberService.memberSelect(mvo);
		mav.addObject("mvo", mvo);
		/* == 회원 정보 수정용 정보 받기 end == */
		
		mav.setViewName("redirect:/mypage/question");// 문의글 리스트로 리다이렉트		
				
		return mav;
	}
	
	
	/* ===== 1:1 고객 문의글 글수정 ===== */
	@RequestMapping(value = "/update")
	public ModelAndView questionUpdate(@ModelAttribute("QuestionVO") QuestionVO qvo, HttpSession session) {
		log.info("매핑 '/mypage/question/update', QuestionController 호출, 1:1 문의게시글 글수정");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();
		
		/* == 1:1 문의글 수정 == */			
		// 글 입력 결과 받기
		int result = 0; 
		result = questionService.questionUpdate(qvo);		
		if(result == 1) { System.out.println("문의글 수정 성공");
		} else { System.out.println("문의글 수정 실패"); }
		/* == 1:1 문의글 수정 end == */	
		
		/* == 회원 정보 수정용 정보 받기 == */
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());		
		mvo = memberService.memberSelect(mvo);
		mav.addObject("mvo", mvo);
		/* == 회원 정보 수정용 정보 받기 end == */
		
		mav.setViewName("redirect:/mypage/question/view?question_no=" +qvo.getQ_No()); // 해당 글 보기로 리다이렉트
		
		// 해당 문의글로 리다이렉트		
		return mav;
	}
	
}
