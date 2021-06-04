package com.pag.client.rooms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pag.client.rooms.service.RoomsService;
import com.pag.client.rooms.vo.RoomsVO;

@Controller
public class RoomsController {
	private Logger log = LoggerFactory.getLogger(RoomsController.class);
	
	@Autowired
	private RoomsService roomsService;
	
	// 파티룸 상품 정보 페이지 컨트롤러
	@RequestMapping(value = "/rooms", method = RequestMethod.GET)
	public String roomsInfo(@ModelAttribute RoomsVO rvo, Model model) {
		log.info("roomsInfo 호출 성공");
		log.info("r_no = " + rvo.getR_no());
		
		RoomsVO r_info = new RoomsVO();
		r_info = roomsService.roomsInfo(rvo);
		
		model.addAttribute("r_info", r_info);
		
		return "rooms";
	}
}
