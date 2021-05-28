package com.pag.client.login.service;

import com.pag.client.login.vo.LoginVO;

public interface LoginService {

	public LoginVO loginSelect(LoginVO lvo); // 로그인
	public String idSelect(String m_Email); // 이메일로 아이디 찾기
	public String pwSelect(LoginVO lvo); // 아이디로 임시비밀번호 재생성, 

}
