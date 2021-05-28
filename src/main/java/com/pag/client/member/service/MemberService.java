package com.pag.client.member.service;

import com.pag.client.member.vo.MemberVO;

public interface MemberService {
	
	public MemberVO memberSelect(MemberVO mvo); // 회원 정보 조회
	public int memberInsert(MemberVO mvo); // 회원 가입
	public int memberUpdate(MemberVO mvo); // 회원 정보 변경
	public int memberUpdateLeave(MemberVO mvo); // 회원 탈퇴	 

}
