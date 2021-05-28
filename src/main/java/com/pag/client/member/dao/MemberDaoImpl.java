package com.pag.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public MemberVO memberSelect(MemberVO mvo) { // 회원정보조회, Select 기능 사용
		return session.selectOne("memberSelect", mvo);
	}
	
	@Override
	public String memberPwSelect(String m_Id) { // 회원 비밀번호 확인, 암호화된 비밀번호 리턴
		return session.selectOne("memberPwSelect", m_Id);
	}
	
	@Override
	public int memberInsert(MemberVO mvo) { // 회원가입, insert 기능 사용
		return session.insert("memberInsert", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) { // 회원 정보 변경, Update 기능 사용
		System.out.println("dao, memberUpdate, MemberVO : " + mvo);
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberUpdateLeave(String m_Id) { // 회원탈퇴, Update 기능으로 탈퇴로 상태변경
		return session.update("memberUpdateLeave", m_Id);
	}

	

}
