package com.pag.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pag.client.notice.dao.NoticeDao;
import com.pag.client.notice.vo.NoticeVO;
import com.pag.common.vo.PageVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	// 공지사항 전체 글수, 최대섹션, 최대 페이지, 현재 섹션, 현재 페이지 계산 비즈니스 로직
	@Override
	public PageVO noticeSectionPageCnt(String _page) {
		
		int page = Integer.parseInt(((_page == null) ? "1" : _page));
		int section;
		if (page%10 == 0) {
			section = (page / 10);
		} else {
			section = (page / 10) + 1;
		}
		
		// 전체 공지사항 개수
		int totalNoticeCnt = noticeDao.noticeListCnt();
		System.out.println("공지사항 글 수 : " + totalNoticeCnt);
		
		// 최대 섹션과 최대 페이지 계산
		int maxSection;
		int maxPage;
		
		if(totalNoticeCnt%100 == 0) {
			// 300개의 게시글이 있으면 3섹션과 30페이지
			maxSection = totalNoticeCnt/100;
			maxPage = totalNoticeCnt/10;
		} else if (totalNoticeCnt%10 == 0) {
			// 250개의 글이 있으면, 3섹션과 25페이지
			maxSection = (totalNoticeCnt/100) + 1;
			maxPage = totalNoticeCnt/10;
		} else {
			// 256의 글이 있으면, 3섹션과 26페이지
			maxSection = totalNoticeCnt/100+1;
			maxPage = totalNoticeCnt/10+1;
		}
		
		PageVO pvo = new PageVO();
		pvo.setTotalCnt(totalNoticeCnt);
		pvo.setMaxSection(maxSection);
		pvo.setMaxPage(maxPage);
		pvo.setSection(section);
		pvo.setPage(page);
						
		return pvo;
	}
	
	// 공지사항 리스트 출력 비즈니스 로직
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) { 
		return noticeDao.noticeListSelect(nvo);
	}

	// 공지사항 글 보기 비즈니스 로직
	@Override
	public NoticeVO noticeDetailSelect(int n_No) {
		return noticeDao.noticeDetailSelect(n_No);
	}
	
	// 공지사항 글 쓰기 비즈니스 로직
	@Override
	public int noticeInsert(NoticeVO nvo) {		
		return noticeDao.noticeInsert(nvo);
	}
	
	// 공지사항 글 수정 비즈니스 로직
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		return noticeDao.noticeUpdate(nvo);
	}

	@Override
	public void noticeHitCountUpdate(int n_No) {
		noticeDao.noticeHitCountUpdate(n_No);
		
	}
	
	



	

	
	
}
