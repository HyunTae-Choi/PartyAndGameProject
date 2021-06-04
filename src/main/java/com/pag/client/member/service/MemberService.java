package com.pag.client.member.service;

import java.util.List;

import com.pag.client.member.vo.MemberVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

public interface MemberService {
	
	public MemberVO memberSelect(MemberVO mvo); // 회원 정보 조회
	public int memberInsert(MemberVO mvo); // 회원 가입
	public int memberUpdate(MemberVO mvo); // 회원 정보 변경
	public int memberUpdateLeave(MemberVO mvo); // 회원 탈퇴	 
	public PageVO adminMemberSectionPageCnt(String _page, String category); // admin 회원리스트 페이징 값 조회
	public List<MemberVO> adminMemberListSelect(PageVO pvo); // admin 회원리스트 조회
	public int adminMemberDisableUpdate(MemberVO mvo); // admin 회원 비활성화
	public int adminMemberEnableUpdate(MemberVO mvo); // admin 회원 복구
	public List<StatisticVO> adminMemberGenderStatisticListSelect(); // admin 성별 통계
	public List<StatisticVO> adminMemberJoinMonthStatisticListSelect(); // admin 월별 가입자수 통계
}
