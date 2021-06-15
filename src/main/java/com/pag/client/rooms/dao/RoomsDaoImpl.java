package com.pag.client.rooms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.rooms.vo.RoomsVO;

@Repository
public class RoomsDaoImpl implements RoomsDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public RoomsVO roomsInfo(int r_no) {
		return (RoomsVO)session.selectOne("roomsInfo", r_no);
	}

	@Override
	public int roomsInsert(RoomsVO roomsVO) {
		return session.insert("roomsInsert", roomsVO);
	}

	@Override
	public List<RoomsVO> partyroomList(RoomsVO roomsVO) {
		return session.selectList("partyroomList", roomsVO);
	}

	@Override
	public int roomsUnavailableCheck(int r_no) {
		return session.selectOne("roomsUnavailableCheck", r_no);
	}

	@Override
	public int roomsUnavailableAction(int r_no) {
		return session.update("roomsUnavailableAction", r_no);
	}
	
	@Override
	public int roomsAvailableAction(int r_no) {
		return session.update("roomsAvailableAction", r_no);
	}

	@Override
	public int roomsUpdateAction(RoomsVO roomsVO) {
		return session.update("roomsUpdateAction", roomsVO);
	}

	@Override
	public int roomsNumberCheck(int r_no) {
		return session.selectOne("roomsNumberCheck", r_no);
	}

}
