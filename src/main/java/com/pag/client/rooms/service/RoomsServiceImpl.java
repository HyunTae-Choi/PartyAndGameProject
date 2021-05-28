package com.pag.client.rooms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.rooms.dao.RoomsDao;
import com.pag.client.rooms.vo.RoomsVO;

@Service
@Transactional
public class RoomsServiceImpl implements RoomsService {
	
	@Autowired
    private RoomsDao roomsDao;
	
	@Override
	public RoomsVO roomsInfo(RoomsVO rvo) {
		RoomsVO r_info = null;
		r_info = roomsDao.roomsInfo(rvo);
		return r_info;
	}

}
