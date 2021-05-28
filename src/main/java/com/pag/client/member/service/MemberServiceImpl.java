package com.pag.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.member.dao.MemberDao;
import com.pag.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Override
	public MemberVO memberSelect(MemberVO mvo) { // 회원정보 조회
		return memberDao.memberSelect(mvo);
	}

	@Override
	public int memberInsert(MemberVO mvo) { // 회원가입

		// 비밀번호 암호화
		String encodedPw = pwEncoder.encode(mvo.getM_Pw());
		mvo.setM_Pw(encodedPw);

		return memberDao.memberInsert(mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) { // 회원 정보 변경

		// 비밀번호 암호화
		String encodedPw = pwEncoder.encode(mvo.getM_Pw());
		mvo.setM_Pw(encodedPw);
		
		return memberDao.memberUpdate(mvo);
	}

	@Override
	public int memberUpdateLeave(MemberVO mvo) { // 회원탈퇴
		
		int result = 0;
		
		// 비밀번호가 확인되면 탈퇴절차 진행
		if (pwEncoder.matches(mvo.getM_Pw(), memberDao.memberPwSelect(mvo.getM_Id()))) {
			result = memberDao.memberUpdateLeave(mvo.getM_Id());
		}
		
		// 탈퇴 성공하면 1, 아니면 0
		return result;
	}

}
