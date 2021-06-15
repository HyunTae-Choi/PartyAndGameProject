package com.pag.client.main.controller;

import java.util.List;

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
public class MainController {
	private Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private RoomsService roomsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute RoomsVO roomsVO, Model model) {
		log.info("매핑 '/', 메인컨트롤러 호출");
		
		List<RoomsVO> partyroomList = roomsService.partyroomList(roomsVO);
		
		model.addAttribute("partyroomList", partyroomList);
		
		return "index";
	}
	
}
