package com.pag.client.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.question.dao.QuestionDao;
import com.pag.client.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	// 1:1 문의글 리스트 보기
	@Override
	public List<QuestionVO> questionListSelect(String m_Id) {
		return questionDao.questionListSelect(m_Id);
	}
	
	// 1:1 문의글 상세보기
	@Override
	public QuestionVO questionDetailSelect(QuestionVO qvo) {
		return questionDao.questionDetailSelect(qvo);
	}

}
