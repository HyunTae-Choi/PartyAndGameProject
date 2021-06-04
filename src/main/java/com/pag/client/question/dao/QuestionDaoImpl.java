package com.pag.client.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.question.vo.QuestionVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession session;
	
	// 1:1 문의글 글 갯수 출력 - DB접근
	@Override
	public int questionListCnt(String m_Id) {
		return session.selectOne("questionListCnt", m_Id);
	}
	
	// 1:1 문의글 리스트 - db연결
	@Override
	public List<QuestionVO> questionListSelect(QuestionVO qvo) {
		return session.selectList("questionListSelect", qvo);
	}
	
	// 1:1 문의글 상세보기 - db연결
	@Override
	public QuestionVO questionDetailSelect(QuestionVO qvo) {
		return session.selectOne("questionDetailSelect", qvo);
	}

	// 1:1 문의글 입력 - db연결
	@Override
	public int questionInsert(QuestionVO qvo) {
		return session.insert("questionInsert", qvo);
	}

	// 1:1 문의글 수정 - db연결
	@Override
	public int questionUpdate(QuestionVO qvo) {
		return session.update("questionUpdate", qvo);
	}
	
	// 1:1 문의글 답변상황 변경 - db연결
	@Override
	public int questionReplyCheckUpdate(QuestionVO qvo) {
		return session.update("questionReplyCheckUpdate", qvo);
	}
	


}
