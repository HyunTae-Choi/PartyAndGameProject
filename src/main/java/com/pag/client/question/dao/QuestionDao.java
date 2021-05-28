package com.pag.client.question.dao;

import java.util.List;

import com.pag.client.question.vo.QuestionVO;


public interface QuestionDao {

	public List<QuestionVO> questionListSelect(String m_Id);

	public QuestionVO questionDetailSelect(QuestionVO qvo);


}
