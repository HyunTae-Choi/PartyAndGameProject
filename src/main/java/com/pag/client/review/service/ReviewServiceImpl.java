package com.pag.client.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.review.dao.ReviewDao;
import com.pag.client.review.vo.ReviewVO;
import com.pag.common.vo.PageVO;

@Transactional
@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;

	// 룸의 리뷰리스트 출력
	@Override
	public List<ReviewVO> roomReviewListSelect(Map<String, Integer> reviewMap) {
		return reviewDao.roomReviewListSelect(reviewMap);
	}
	
	// 리뷰 입력
	@Override
	public int reviewInsert(ReviewVO rvo) { 
		return reviewDao.reviewInsert(rvo);
	}
	
	// 기존 리뷰 데이터 호출
	@Override
	public ReviewVO reviewUpdataDataSelect(ReviewVO rvo) {
		return reviewDao.reviewUpdataDataSelect(rvo);
	}
	
	// 리뷰 수정
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return reviewDao.reviewUpdate(rvo);
	}

	// 리뷰 - 회원 비활성화로 업데이트
	@Override
	public int reviewDisableUpdate(ReviewVO rvo) {
		return reviewDao.reviewDisableUpdate(rvo);
	}
	
	// 리뷰 - admin 비활성화로 업데이트
	@Override
	public int adminReviewDisableUpdate(ReviewVO rvo) {
		return reviewDao.adminReviewDisableUpdate(rvo);
	}
	
	// 리뷰 페이지 카운트
	@Override
	public PageVO reivewSectionPageCnt(PageVO pvo, int r_no) {
		
		int page = pvo.getPage();		
		if(page == 0) { page = 1; } 
		
		int section;
		
		if (page % 10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}

		
		// 전체 리뷰 수
		int totalRoomReviewCnt = reviewDao.reivewSectionPageCnt(r_no);
		System.out.println("방 번호 : " + r_no);
		System.out.println("페이지 : " + page);
		System.out.println("리뷰 수 : " + totalRoomReviewCnt);
		
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		int lineNumber = pvo.getLineNumber();
		
		// roomsInfo이면 5줄(lineNumber)
		// admin이면 10줄(lineNumber)		
		if(totalRoomReviewCnt%(10*lineNumber) == 0) {
			// (5줄인 경우) 300개의 게시글이 있으면 6섹션과 60페이지
			// (5줄인 경우) 250개의 게시글이 있으면 5섹션과 50페이지
			// (10줄인 경우) 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = totalRoomReviewCnt/(10*lineNumber);
			maxPage = totalRoomReviewCnt/lineNumber;
		} else if (totalRoomReviewCnt%lineNumber == 0) {
			// (5줄인 경우)  275개의 글이 있으면, 6섹션과 55페이지
			// (10줄인 경우)  250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (totalRoomReviewCnt/(10*lineNumber)) + 1;
			maxPage = totalRoomReviewCnt/lineNumber;
		} else {
			// (5줄인 경우)  256의 글이 있으면, 6섹션과 52페이지
			// (10줄인 경우)  256의 글이 있으면, 3섹션과 26페이지
			maxSection = totalRoomReviewCnt/(10*lineNumber)+1;
			maxPage = totalRoomReviewCnt/lineNumber+1;
		}
		
		
		// pvo반환
		pvo.setTotalCnt(totalRoomReviewCnt);
		pvo.setMaxSection(maxSection);
		pvo.setMaxPage(maxPage);
		pvo.setSection(section);
		pvo.setPage(page);
						
		return pvo;
	}

	
}
