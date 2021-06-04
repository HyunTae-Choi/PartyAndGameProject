package com.pag.client.question.dao;

import java.util.List;

import com.pag.client.question.vo.QuestionVO;

public interface QuestionDao {
	
	public int questionListCnt(String m_Id);

	public List<QuestionVO> questionListSelect(QuestionVO qvo);

	public QuestionVO questionDetailSelect(QuestionVO qvo);

	public int questionInsert(QuestionVO qvo);

	public int questionUpdate(QuestionVO qvo);

	public int questionReplyCheckUpdate(QuestionVO qvo);

}
