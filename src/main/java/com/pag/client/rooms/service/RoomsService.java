package com.pag.client.rooms.service;

import java.util.List;

import com.pag.client.rooms.vo.RoomsVO;

public interface RoomsService {
	public RoomsVO roomsInfo(int r_no);

	public int roomsInsert(RoomsVO roomsVO); // 파티룸 상품 등록
	public List<RoomsVO> partyroomList(RoomsVO roomsVO); // adminpage 파티룸 리스트

	public int roomsUnavailableCheck(int r_no); // 파티룸 비활성화 체크
	public int roomsUnavailableAction(int r_no); // 파티룸 비활성화 action
	public int roomsAvailableAction(int r_no); // 파티룸 활성화 action

	public int roomsUpdateAction(RoomsVO roomsVO); // 파티룸 수정 action

	public int roomsNumberCheck(int r_no); // 파티룸 추가 시 파티룸 번호 추가가능여부 확인
	
}
