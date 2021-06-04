package com.pag.client.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.member.vo.MemberVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;
	
	// 회원정보조회, Select 기능 사용 - DB연결
	@Override
	public MemberVO memberSelect(MemberVO mvo) { 
		return session.selectOne("memberSelect", mvo);
	}
	
	// 회원 비밀번호 확인, 암호화된 비밀번호 리턴 - DB연결
	@Override
	public String memberPwSelect(String m_Id) { 
		return session.selectOne("memberPwSelect", m_Id);
	}
	
	// 회원가입, insert 기능 사용 - DB연결
	@Override
	public int memberInsert(MemberVO mvo) { 
		return session.insert("memberInsert", mvo);
	}
	
	// 회원 정보 변경, Update 기능 사용 - DB연결
	@Override
	public int memberUpdate(MemberVO mvo) { 
		System.out.println("dao, memberUpdate, MemberVO : " + mvo);
		return session.update("memberUpdate", mvo);
	}
	
	// 회원탈퇴, Update 기능으로 탈퇴로 상태변경 - DB연결
	@Override
	public int memberUpdateLeave(String m_Id) { 
		return session.update("memberUpdateLeave", m_Id);
	}

	// admin 회원갯수 확인, select - DB연결
	@Override
	public int adminMemberListCntSelect(String category) {
		return session.selectOne("adminMemberListCntSelect", category);
	}

	//admin 회원리스트 출력, selectList - DB연결
	@Override
	public List<MemberVO> adminMemberListSelect(PageVO pvo) {
		return session.selectList("adminMemberListSelect", pvo);
	}

	//admin 회원 비활성화, update - DB연결
	@Override
	public int adminMemberDisableUpdate(MemberVO mvo) {
		return session.update("adminMemberDisableUpdate", mvo);
	}
	
	//admin 회원 복구, update - DB연결
	@Override
	public int adminMemberEnableUpdate(MemberVO mvo) {
		return session.update("adminMemberEnableUpdate", mvo);
	}
	
	// admin 성별통계
	@Override
	public List<StatisticVO> adminMemberGenderStatisticListSelect() {
		return session.selectList("adminMemberGenderStatisticListSelect");
	}
	
	// admin 월별 가입자수 통계
	@Override
	public List<StatisticVO> adminMemberJoinMonthStatisticListSelect() {
		return session.selectList("adminMemberJoinMonthStatisticListSelect");
	}
	

	

}
