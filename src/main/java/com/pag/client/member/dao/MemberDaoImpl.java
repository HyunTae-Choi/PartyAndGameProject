package com.pag.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;
	
	// 회원가입, 오라클의 insert 기능 사용
	@Override
	public int memberInsert(MemberVO mvo) {
		return session.insert("memberInsert");
	}

}
