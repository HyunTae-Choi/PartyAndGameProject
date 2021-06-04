package com.pag.client.reply.service;

import java.util.List;

import com.pag.client.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> questionReplyListSelect(int q_No);

	public int questionReplyInsert(ReplyVO rvo);

	public int questionReplyUpdate(ReplyVO rvo);

}
