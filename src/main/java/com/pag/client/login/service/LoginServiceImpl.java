package com.pag.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.login.dao.LoginDao;
import com.pag.client.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;


	@Override
	public LoginVO loginSelect(String m_Id, String m_Pw) {
		LoginVO vo = null;
		LoginVO lvo = new LoginVO();
		lvo.setM_Id(m_Id);
		lvo.setM_Pw(m_Pw);
		
		vo = loginDao.loginSelect(lvo);
		
		return vo;
	}
	
	

}
