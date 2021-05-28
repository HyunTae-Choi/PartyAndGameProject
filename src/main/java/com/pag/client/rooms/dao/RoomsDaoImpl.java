package com.pag.client.rooms.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.rooms.vo.RoomsVO;

@Repository
public class RoomsDaoImpl implements RoomsDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public RoomsVO roomsInfo(RoomsVO rvo) {
		return (RoomsVO)session.selectOne("roomsInfo", rvo);
	}

}
