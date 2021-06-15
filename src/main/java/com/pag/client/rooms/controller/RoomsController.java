package com.pag.client.rooms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pag.client.review.service.ReviewService;
import com.pag.client.review.vo.ReviewVO;
import com.pag.client.rooms.service.RoomsService;
import com.pag.client.rooms.vo.RoomsVO;
import com.pag.common.vo.PageVO;

@Controller
public class RoomsController {
	private Logger log = LoggerFactory.getLogger(RoomsController.class);
	
	@Autowired
	private RoomsService roomsService;
	
	@Autowired
	private ReviewService reviewService;
	
	// 파티룸 상품 정보 페이지 컨트롤러
	@RequestMapping(value = "/rooms", method = RequestMethod.GET)
	public String roomsInfo(@ModelAttribute RoomsVO rvo, @ModelAttribute PageVO pvo,
			Model model, HttpServletRequest request) {		
		
		log.info("roomsInfo 호출 성공");
		log.info("r_no = " + rvo.getR_no());
		log.info("reivew page = " + pvo.getPage());
		
		/* == 파티룸 정보 출력 == */
		RoomsVO r_info = new RoomsVO();
		r_info = roomsService.roomsInfo(rvo.getR_no());
		
		/* == 페이징 == */
		pvo.setLineNumber(5);
		pvo = reviewService.reivewSectionPageCnt(pvo, rvo.getR_no());
		
		/* == 리뷰 리스트 출력 == */
		Map<String, Integer> reviewMap = new HashMap<String, Integer>();
		reviewMap.put("r_No", rvo.getR_no()); // 방번호
		reviewMap.put("page", pvo.getPage()); // 페이지번호
		reviewMap.put("lineNumber", pvo.getLineNumber()); // 페이지 당 줄 수	
		
		List<ReviewVO> reviewList = reviewService.roomReviewListSelect(reviewMap);
		
		model.addAttribute("r_info", r_info);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pvo", pvo);
		
		return "rooms";
	}
}
