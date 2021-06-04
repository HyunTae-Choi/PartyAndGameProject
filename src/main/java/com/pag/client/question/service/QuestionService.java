package com.pag.client.question.service;

import java.util.List;

import com.pag.client.question.vo.QuestionVO;
import com.pag.common.vo.PageVO;

public interface QuestionService {
	
	public PageVO questionSectionPageCnt(String _page, String m_Id);
	
	public List<QuestionVO> questionListSelect(QuestionVO qvo);

	public QuestionVO questionDetailSelect(QuestionVO qvo);

	public int questionInsert(QuestionVO qvo);

	public int questionUpdate(QuestionVO qvo);

	public int questionReplyCheckUpdate(QuestionVO qvo);

	

}
