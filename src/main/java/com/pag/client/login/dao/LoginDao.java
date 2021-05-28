package com.pag.client.login.dao;

import com.pag.client.login.vo.LoginVO;

public interface LoginDao {

	public LoginVO loginSelect(String m_ID); // 로그인(회원 확인)
	public LoginVO idSelect(String m_Email); // 아이디 찾기
	

}
