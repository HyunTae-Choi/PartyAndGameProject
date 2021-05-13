package com.pag.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.member.dao.MemberDao;
import com.pag.client.member.vo.MemberSecurity;
import com.pag.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int memberInsert(MemberVO mvo) {
		/* 암호화 기능 추가 필요 */
		int result = memberDao.memberInsert(mvo);
		
		return result;
		
	}

}
