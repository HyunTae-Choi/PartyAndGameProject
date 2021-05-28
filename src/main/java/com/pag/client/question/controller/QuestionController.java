package com.pag.client.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.question.service.QuestionService;
import com.pag.client.question.vo.QuestionVO;

@Controller
public class QuestionController {
	private Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	
	/* ===== 1:1 고객 문의게시글 목록 ===== */
	@RequestMapping(value = "/mypage/question")
	public ModelAndView questionList(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question', 1:1 문의게시글 호출");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {
			return new ModelAndView("redirect:/");
		}
		
		ModelAndView mav = new ModelAndView();

		/* == 1:1 문의게시글 목록 출력 == */	
		List<QuestionVO> questionList = questionService.questionListSelect(loginSession.getM_Id());
		mav.addObject("questionList", questionList); // 1:1 문의글 목록 
		/* == 1:1 문의게시글 목록 출력 end == */		
				
		// tiles 지정
		mav.setViewName("mypage/question/questionList");	
		
		return mav;
	}
	
	
	
	/* ===== 1:1 고객 문의게시글 상세보기  ===== */
	@RequestMapping(value = "/mypage/question/view")
	public ModelAndView questionDetailView(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question/view', 1:1 문의게시글 상세보기 호출");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {
			return new ModelAndView("redirect:/");
		}
		
		// 상세보기 조회를 위해, 글번호와 아이디 받기
		QuestionVO qvo = new QuestionVO();
		qvo.setQ_No(Integer.parseInt(request.getParameter("question_no")));
		qvo.setM_Id(loginSession.getM_Id());
		
		
		/* == 1:1 문의게시글 상세보기 출력 == */	
		ModelAndView mav = new ModelAndView();
		qvo = questionService.questionDetailSelect(qvo);
		
		if (qvo == null) { // 조회값이 없으면 질문 리스트로
			System.out.println("문의글 없음");
			return new ModelAndView("redirect:/mypage/question");
		} else {
			mav.addObject("qvo", qvo);
		}		  
		/* == 1:1 문의게시글 상세보기 출력 end == */		
			
		// tiles 지정
		mav.setViewName("mypage/question/questionDetailView");	
		
		return mav;
	}
	
	
	/* ===== 1:1 고객 문의게시글 글쓰기폼 출력 ===== */
	@RequestMapping(value = "/mypage/question/write")
	public ModelAndView questionWriteform(HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question/writeform', 1:1 문의게시글 글쓰기 호출");
		
		// 세션이에 저장된 login값 호출, 해당 값이 null이면 mypage로 못감
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if(loginSession == null) {return new ModelAndView("redirect:/");}
		
		ModelAndView mav = new ModelAndView();
				
		// tiles 지정
		mav.setViewName("mypage/question/questionWrite");	
		
		return mav;
	}
}
