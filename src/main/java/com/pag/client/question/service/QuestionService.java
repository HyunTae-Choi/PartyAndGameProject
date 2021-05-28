package com.pag.client.question.service;

import java.util.List;

import com.pag.client.question.vo.QuestionVO;

public interface QuestionService {

	public List<QuestionVO> questionListSelect(String m_Id);

	public QuestionVO questionDetailSelect(QuestionVO qvo);

}
