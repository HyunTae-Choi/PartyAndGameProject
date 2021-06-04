package com.pag.client.member.dao;

import java.util.List;

import com.pag.client.member.vo.MemberVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

public interface MemberDao {

	public MemberVO memberSelect(MemberVO mvo); // 회원정보조회, Select 기능 사용
	public String memberPwSelect(String m_Id); // 회원정보조회, Select 기능 사용
	public int memberInsert(MemberVO mvo); // 회원가입, Insert 기능 사용
	public int memberUpdate(MemberVO mvo); // 회원 정보 변경, Update 기능 사용
	public int memberUpdateLeave(String m_Id); // 회원탈퇴, Update 기능을 사용하여 탈퇴로 상태변경
	public int adminMemberListCntSelect(String category); // admin 회원갯수 조회
	public List<MemberVO> adminMemberListSelect(PageVO pvo); // admin 회원 리스트 조회
	public int adminMemberDisableUpdate(MemberVO mvo); // admin 회원 비활성화
	public int adminMemberEnableUpdate(MemberVO mvo); // admin 회원 복구
	public List<StatisticVO> adminMemberGenderStatisticListSelect(); // 회원 성별 통계
	public List<StatisticVO> adminMemberJoinMonthStatisticListSelect(); // 월별 가입자수 통계
	
}
