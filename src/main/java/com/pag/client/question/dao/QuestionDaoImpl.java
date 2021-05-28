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
	
	// 1:1 문의글 리스트 - db연결
	@Override
	public List<QuestionVO> questionListSelect(String m_Id) {
		return session.selectList("questionListSelect", m_Id);
	}
	
	// 1:1 문의글 상세보기 - db연결
	@Override
	public QuestionVO questionDetailSelect(QuestionVO qvo) {
		return session.selectOne("questionDetailSelect", qvo);
	}

}
