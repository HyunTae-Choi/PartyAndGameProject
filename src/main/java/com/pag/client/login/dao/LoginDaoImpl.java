package com.pag.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public LoginVO loginSelect(String m_ID) { // 로그인, 비밀번호, 회원상태 반환
		return (LoginVO) session.selectOne("loginSelect", m_ID);
	}

	@Override
	public LoginVO idSelect(String m_Email) { // 아이디 찾기
		return (LoginVO) session.selectOne("idSelect", m_Email);
	}

	
}
