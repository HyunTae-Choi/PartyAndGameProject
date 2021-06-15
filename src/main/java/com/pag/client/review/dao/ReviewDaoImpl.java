package com.pag.client.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.review.vo.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession session;

	// 룸의 리뷰리스트 출력
	@Override
	public List<ReviewVO> roomReviewListSelect(Map<String, Integer> reviewMap) {		
		return session.selectList("roomReviewListSelect", reviewMap);
	}

	// 리뷰 입력
	@Override
	public int reviewInsert(ReviewVO rvo) {
		return session.insert("reviewInsert", rvo);
	}

	// 기존 리뷰 데이터 호출
	@Override
	public ReviewVO reviewUpdataDataSelect(ReviewVO rvo) {
		return session.selectOne("reviewUpdataDataSelect", rvo);
	}
	
	// 리뷰 수정
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewUpdate", rvo);
	}

	// 리뷰 - 회원 비활성화로 업데이트
	@Override
	public int reviewDisableUpdate(ReviewVO rvo) {
		return session.update("reviewDisableUpdate", rvo);
	}

	// 리뷰 - admin 비활성화로 업데이트
	@Override
	public int adminReviewDisableUpdate(ReviewVO rvo) {
		return session.update("adminReviewDisableUpdate", rvo);
	}
	
	// 리뷰 - 룸별 리뷰 갯수
	@Override
	public int reivewSectionPageCnt(int r_no) {
		return session.selectOne("reivewSectionPageCnt", r_no);
	}

	
}
