package com.pag.client.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.member.dao.MemberDao;
import com.pag.client.member.vo.MemberVO;
import com.pag.client.review.vo.ReviewVO;
import com.pag.common.vo.PageVO;
import com.pag.common.vo.StatisticVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원정보 조회 - 비즈니스 로직
	@Override
	public MemberVO memberSelect(MemberVO mvo) { 
		return memberDao.memberSelect(mvo);
	}
	
	// 회원가입 - 비즈니스 로직
	@Override
	public int memberInsert(MemberVO mvo) { 

		// 비밀번호 암호화
		String encodedPw = pwEncoder.encode(mvo.getM_Pw());
		mvo.setM_Pw(encodedPw);

		return memberDao.memberInsert(mvo);
	}

	// 회원 비밀번호 변경 - 비즈니스 로직
	@Override
	public int memberPwUpdate(MemberVO mvo) {
		// 비밀번호 암호화
		String encodedPw = pwEncoder.encode(mvo.getM_Pw());
		mvo.setM_Pw(encodedPw);

		return memberDao.memberPwUpdate(mvo);
	}
	
	// 회원 정보 변경 - 비즈니스 로직
	@Override
	public int memberUpdate(MemberVO mvo) { 		
		return memberDao.memberUpdate(mvo);
	}

	// 회원탈퇴 - 비즈니스 로직
	@Override
	public int memberUpdateLeave(MemberVO mvo) { 
		
		int result = 0;
		
		// 비밀번호가 확인되면 탈퇴절차 진행
		if (pwEncoder.matches(mvo.getM_Pw(), memberDao.memberPwSelect(mvo.getM_Id()))) {
			result = memberDao.memberUpdateLeave(mvo.getM_Id());
		}
		
		// 탈퇴 성공하면 1, 아니면 0
		return result;
	}
	
	// 회원리스트 페이징 값 조회 - 비즈니스 로직
	@Override
	public PageVO adminMemberSectionPageCnt(String _page, String category) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 전체 회원 수
		int totalMemberCnt = memberDao.adminMemberListCntSelect(category);
		System.out.println("회원 카테고리 : " + category);
		System.out.println("페이지 : " + page);
		System.out.println("회원 수 : " + totalMemberCnt);
		
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		/* 10줄 */
		if(totalMemberCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = totalMemberCnt/100;
			maxPage = totalMemberCnt/10;
		} else if (totalMemberCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (totalMemberCnt/100) + 1;
			maxPage = totalMemberCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = totalMemberCnt/100+1;
			maxPage = totalMemberCnt/10+1;
		}
		
//		/* linesNumber 20줄 */
//		if(totalMemberCnt%(20*10) == 0) {
//			// 400개의 게시글이 있으면 2섹션과 20페이지
//			maxSection = totalMemberCnt/(20*10);
//			maxPage = totalMemberCnt/20;
//		} else if (totalMemberCnt%20 == 0) {
//			// 300개의 글이 있으면, 2섹션과 15페이지
//			maxSection = (totalMemberCnt/(20*10)) + 1;
//			maxPage = totalMemberCnt/20;
//		} else {
//			// 256의 글이 있으면, 2섹션과 13페이지
//			maxSection = totalMemberCnt/(20*10)+1;
//			maxPage = totalMemberCnt/20+1;
//		}
		
		// pvo반환
		PageVO pvo = new PageVO();
		pvo.setTotalCnt(totalMemberCnt);
		pvo.setMaxSection(maxSection);
		pvo.setMaxPage(maxPage);
		pvo.setSection(section);
		pvo.setPage(page);
		
		if(category == null || "".equals(category)) {
			pvo.setCategory("total");
		} else {
			pvo.setCategory(category);
		}
						
		return pvo;
	}
	
	// 회원리스트 출력 - 비즈니스 로직
	@Override
	public List<MemberVO> adminMemberListSelect(PageVO pvo) {
		System.out.println("회원리스트 출력 페이지 : " + pvo.getPage());
		return memberDao.adminMemberListSelect(pvo);
	}
	
	// 회원 비활성화 - 비즈니스 로직
	@Override
	public int adminMemberDisableUpdate(MemberVO mvo) {
		return memberDao.adminMemberDisableUpdate(mvo);
	}

	// 회원 복구 - 비즈니스 로직
	@Override
	public int adminMemberEnableUpdate(MemberVO mvo) {
		return memberDao.adminMemberEnableUpdate(mvo);
	}
	
	// 회원 성별 통계
	@Override
	public List<StatisticVO> adminMemberGenderStatisticListSelect() {
		return memberDao.adminMemberGenderStatisticListSelect();
	}

	// 월별 가입자수 통계
	@Override
	public List<StatisticVO> adminMemberJoinMonthStatisticListSelect() {
		return memberDao.adminMemberJoinMonthStatisticListSelect();
	}

	// 리뷰 작성 후, 마일리지 지급
	@Override
	public int memberReviewMileageUpdate(ReviewVO rvo) {
		return memberDao.memberReviewMileageUpdate(rvo);
	}


}
