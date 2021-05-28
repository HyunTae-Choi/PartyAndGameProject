package com.pag.client.member.dao;

import com.pag.client.member.vo.MemberVO;

public interface MemberDao {

	public MemberVO memberSelect(MemberVO mvo); // 회원정보조회, Select 기능 사용
	public String memberPwSelect(String m_Id); // 회원정보조회, Select 기능 사용
	public int memberInsert(MemberVO mvo); // 회원가입, Insert 기능 사용
	public int memberUpdate(MemberVO mvo); // 회원 정보 변경, Update 기능 사용
	public int memberUpdateLeave(String m_Id); // 회원탈퇴, Update 기능을 사용하여 탈퇴로 상태변경

}
