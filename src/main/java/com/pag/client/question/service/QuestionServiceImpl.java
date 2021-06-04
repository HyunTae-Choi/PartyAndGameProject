package com.pag.client.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.question.dao.QuestionDao;
import com.pag.client.question.vo.QuestionVO;
import com.pag.common.vo.PageVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	// 1:1 문의글 리스트 보기 - 비즈니스 로직
	@Override
	public List<QuestionVO> questionListSelect(QuestionVO qvo) {
		return questionDao.questionListSelect(qvo);
	}
	
	// 1:1 문의글 상세보기 - 비즈니스 로직
	@Override
	public QuestionVO questionDetailSelect(QuestionVO qvo) {
		return questionDao.questionDetailSelect(qvo);
	}

	// 1:1 문의글 입력 - 비즈니스 로직
	@Override
	public int questionInsert(QuestionVO qvo) {
		return questionDao.questionInsert(qvo);
	}

	// 1:1 문의글 수정 - 비즈니스 로직
	@Override
	public int questionUpdate(QuestionVO qvo) {
		return questionDao.questionUpdate(qvo);
	}
		
	// 1:1 문의글 답변상황 변경 (admin)  - 비즈니스 로직
	@Override
	public int questionReplyCheckUpdate(QuestionVO qvo) {
		// TODO Auto-generated method stub
		return questionDao.questionReplyCheckUpdate(qvo);
	}
	
	// 페이지, 섹션 계산  - 비즈니스 로직
	@Override
	public PageVO questionSectionPageCnt(String _page, String m_Id) {
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 전체 1:1문의글 개수
		int totalQuestionCnt = questionDao.questionListCnt(m_Id);
		System.out.println("문의글 수 : " + totalQuestionCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(totalQuestionCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = totalQuestionCnt/100;
			maxPage = totalQuestionCnt/10;
		} else if (totalQuestionCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (totalQuestionCnt/100) + 1;
			maxPage = totalQuestionCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = totalQuestionCnt/100+1;
			maxPage = totalQuestionCnt/10+1;
		}
		
		PageVO pvo = new PageVO();
		pvo.setTotalCnt(totalQuestionCnt);
		pvo.setMaxSection(maxSection);
		pvo.setMaxPage(maxPage);
		pvo.setSection(section);
		pvo.setPage(page);
						
		return pvo;
	}
}
