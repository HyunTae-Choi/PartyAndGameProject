package com.pag.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.reply.dao.ReplyDao;
import com.pag.client.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	// 답글 리스트 출력 - 비즈니스 로직
	@Override
	public List<ReplyVO> questionReplyListSelect(int q_No) {
		return replyDao.questionReplyListSelect(q_No);
	}

	// 답글 입력 - 비즈니스 로직
	@Override
	public int questionReplyInsert(ReplyVO rvo) {
		return replyDao.questionReplyInsert(rvo);
	}
	
	// 답글 수정 - 비즈니스 로직
	@Override
	public int questionReplyUpdate(ReplyVO rvo) {
		return replyDao.questionReplyUpdate(rvo);
	}

}
