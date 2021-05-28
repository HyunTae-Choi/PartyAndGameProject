package com.pag.client.notice.dao;

import java.util.List;

import com.pag.client.notice.vo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeListSelect(NoticeVO nvo);

	public int noticeListCnt();

	public NoticeVO noticeDetailSelect(int n_No);

	public int noticeInsert(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public void noticeHitCountUpdate(int n_No);

	
}
