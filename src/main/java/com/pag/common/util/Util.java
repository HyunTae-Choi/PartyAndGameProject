package com.pag.common.util;

import javax.servlet.http.HttpSession;

import com.pag.client.login.vo.LoginVO;

public class Util {
	
	// 비밀번호 재생성
	public static String getNewPw() throws Exception {
	    char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
	                      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 
	                      'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
	                      'w', 'z', 'y', 'z', 
	                      '!', '@', '#', '$', '%'}; 
	         
	    StringBuffer newKey = new StringBuffer(); 
	        
	    for (int i = 0; i < 10; i++) { 
	        int idx = (int) (charSet.length * Math.random());
	        newKey.append(charSet[idx]); 
	    } 
	        
	    return newKey.toString();
	}
	
	// 공백 체크
	public static boolean checkStringEmpty(String str) {
		  return str == null || str.isEmpty();
	}

	// session이 admin인지 체크
	public static boolean checkAdminSession(HttpSession session) {
		LoginVO loginSession = null; 		
		if ((loginSession = (LoginVO) session.getAttribute("loginSession")) != null) {			
			if(!(loginSession.getM_Id()).equals("admin")) {
				return true;}
		} else {
			return true;
		}		
		return false;
		
	}
}
