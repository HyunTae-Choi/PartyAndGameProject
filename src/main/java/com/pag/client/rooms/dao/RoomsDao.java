package com.pag.client.rooms.dao;

import java.util.List;

import com.pag.client.rooms.vo.RoomsVO;

public interface RoomsDao {

	RoomsVO roomsInfo(int r_no);

	int roomsInsert(RoomsVO roomsVO); // 파티룸 상품 등록
	List<RoomsVO> partyroomList(RoomsVO roomsVO); // 파티룸 리스트

	int roomsUnavailableCheck(int r_no); // 파티룸 비활성화 체크

	int roomsUnavailableAction(int r_no); // 파티룸 비활성화 action
	int roomsAvailableAction(int r_no); // 파티룸 활성화 action

	int roomsUpdateAction(RoomsVO roomsVO); // 파티룸 수정 action

	int roomsNumberCheck(int r_no); // 파티룸 추가 시 파티룸 번호 추가가능여부 확인

}
