package com.pag.client.reply.controller;

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
import com.pag.client.reply.service.ReplyService;
import com.pag.client.reply.vo.ReplyVO;
import com.pag.common.util.Util;

@Controller
@RequestMapping(value = "/mypage/question_reply")
public class ReplyController {
	private Logger log = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/insert")
	public ModelAndView questionReplyInsert(@ModelAttribute ReplyVO rvo, HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question_reply/insert', ReplyController 호출, 답글입력");
		
		System.out.println(rvo);
		
		// 세션에 저장된 loginSession 호출, 
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if (loginSession == null) { // loginSession이 null이면 메인화면으로 redirect 
			return new ModelAndView("redirect:/");
		} else if (!loginSession.getM_Id().equalsIgnoreCase(rvo.getM_Id())) { // loginSession의 id와 rvo의 id가 일치하지 않으면 메인화면으로 redirect
			return new ModelAndView("redirect:/");
		}
				
		/* === 답글 입력 === */
		int result = replyService.questionReplyInsert(rvo); //rvo에 입력자 id, 문의글번호, 문의글 내용이 담김
		if (result == 1) { System.out.println("답글 입력 성공");
		} else { System.out.println("답글 입력 실패"); }
		/* === 답글 입력 end === */
		
		ModelAndView mav = new ModelAndView();
		
		// mypage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {		
			mav.setViewName("redirect:/mypage/question/view?question_no=" + rvo.getQ_No());			
		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/admin/service/question/view?question_no=" + rvo.getQ_No()); 			
		}			
		
		return mav;
	}
	
	@RequestMapping(value = "/update")
	public ModelAndView questionReplyUpdate(@ModelAttribute ReplyVO rvo, HttpSession session, HttpServletRequest request) {
		log.info("매핑 '/mypage/question_reply/update', ReplyController 호출, 답글수정");
		
		// 세션에 저장된 loginSession 호출, 
		LoginVO loginSession = (LoginVO)session.getAttribute("loginSession");	
		if (loginSession == null) { // loginSession이 null이면 메인화면으로 redirect 
			return new ModelAndView("redirect:/");
		} else if (!loginSession.getM_Id().equalsIgnoreCase(rvo.getM_Id())) { // loginSession의 id와 rvo의 id가 일치하지 않으면 메인화면으로 redirect
			return new ModelAndView("redirect:/");
		}
		
		
		/* === 답글 수정 === */
		int result = replyService.questionReplyUpdate(rvo);	//rvo에 입력자 id, 문의글번호, 답글번호, 수정된 문의글 내용이 담김	
		if (result == 1) { System.out.println("답글 수정 성공");
		} else { System.out.println("답글 수정 실패"); }
		/* === 답글 수정 === */
		
		ModelAndView mav = new ModelAndView();
		
		// mypage로 보낼지, adminpage로 보낼지 판단, (adminpageController에서 온 것이면 보냄) 
		String toAdminPage = (String) request.getAttribute("toAdminPage");
		if(Util.checkStringEmpty(toAdminPage) || !"toAdminPage".equals(toAdminPage)) {		
			mav.setViewName("redirect:/mypage/question/view?question_no=" + rvo.getQ_No());			
		} else if("toAdminPage".equals(toAdminPage) && !Util.checkAdminSession(session)) {
			mav.setViewName("redirect:/admin/service/question/view?question_no=" + rvo.getQ_No()); 			
		}
		
		return mav;
	}
}
