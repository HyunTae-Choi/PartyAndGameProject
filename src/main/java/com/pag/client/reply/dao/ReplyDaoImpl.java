package com.pag.client.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;
	
	// 답글 리스트 출력 - DB연결
	@Override
	public List<ReplyVO> questionReplyListSelect(int q_No) {
		return session.selectList("questionReplyListSelect", q_No);
	}

	// 답글 입력 - DB연결
	@Override
	public int questionReplyInsert(ReplyVO rvo) {
		return session.insert("questionReplyInsert", rvo);
	}

	// 답글 수정 - DB연결
	@Override
	public int questionReplyUpdate(ReplyVO rvo) {
		return session.insert("questionReplyUpdate", rvo);
	}

}
