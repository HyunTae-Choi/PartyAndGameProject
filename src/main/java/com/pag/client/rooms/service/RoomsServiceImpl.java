package com.pag.client.rooms.service;

import java.util.List;

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
	public RoomsVO roomsInfo(int r_no) {
		RoomsVO r_info = null;
		r_info = roomsDao.roomsInfo(r_no);
		return r_info;
	}

	@Override
	public int roomsInsert(RoomsVO roomsVO) {
		int result = 0;
		try{
			result = roomsDao.roomsInsert(roomsVO);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public List<RoomsVO> partyroomList(RoomsVO roomsVO) {

		List<RoomsVO> partyroomList = null;
		partyroomList = roomsDao.partyroomList(roomsVO);
		return partyroomList;
	}

	@Override
	public int roomsUnavailableCheck(int r_no) {

		int roomsUnavailableCheck = 0;
		roomsUnavailableCheck = roomsDao.roomsUnavailableCheck(r_no);
		return roomsUnavailableCheck;
	}

	@Override
	public int roomsUnavailableAction(int r_no) {
		int roomsUnavailableAction = 0;
		roomsUnavailableAction = roomsDao.roomsUnavailableAction(r_no);
		return roomsUnavailableAction;
	}
	
	@Override
	public int roomsAvailableAction(int r_no) {
		int roomsAvailableAction = 0;
		roomsAvailableAction = roomsDao.roomsAvailableAction(r_no);
		return roomsAvailableAction;
	}

	@Override
	public int roomsUpdateAction(RoomsVO roomsVO) {
		int roomsUpdateAction = 0;
		roomsUpdateAction = roomsDao.roomsUpdateAction(roomsVO);
		return roomsUpdateAction;
	}

	@Override
	public int roomsNumberCheck(int r_no) {
		int roomsNumberCheck = 0;
		roomsNumberCheck = roomsDao.roomsNumberCheck(r_no);
		return roomsNumberCheck;
	}

}
