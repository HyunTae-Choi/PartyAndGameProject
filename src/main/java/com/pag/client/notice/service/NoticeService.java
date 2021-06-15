package com.pag.client.notice.service;

import java.util.List;

import com.pag.client.notice.vo.NoticeVO;
import com.pag.common.vo.PageVO;

public interface NoticeService {

	public PageVO noticeSectionPageCnt(String _page);

	public List<NoticeVO> noticeList(NoticeVO nvo);

	public NoticeVO noticeDetailSelect(int n_No);

	public int noticeInsert(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public void noticeHitCountUpdate(int n_No);

	public int noticeUnavailableUpdate(int n_No);

	

}
