package com.pag.client.reply.dao;

import java.util.List;

import com.pag.client.reply.vo.ReplyVO;

public interface ReplyDao {

	public List<ReplyVO> questionReplyListSelect(int q_No);

	public int questionReplyInsert(ReplyVO rvo);

	public int questionReplyUpdate(ReplyVO rvo);

	
	


}
