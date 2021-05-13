package com.pag.client.login.service;

import com.pag.client.login.vo.LoginVO;

public interface LoginService {

	public LoginVO loginSelect(String m_Id, String m_Pw);
		
}
