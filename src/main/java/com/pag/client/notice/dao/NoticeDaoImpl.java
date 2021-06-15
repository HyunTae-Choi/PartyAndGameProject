package com.pag.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pag.client.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;
	
	// 공지사항 글 갯수 출력 - DB접근
	@Override
	public int noticeListCnt() {
		return session.selectOne("noticeListCnt");
	}

	// 공지사항 리스트 출력 - DB접근
	@Override
	public List<NoticeVO> noticeListSelect(NoticeVO nvo) {
		return session.selectList("noticeListSelect", nvo);
	}

	// 공지사항 글 출력 - DB접근
	@Override
	public NoticeVO noticeDetailSelect(int n_No) {
		return session.selectOne("noticeDetailSelect", n_No);
	}
	
	// 공지사항 글쓰기 - DB접근
	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}
	
	// 공지사항 글 업데이트 - DB접근
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}
	
	// 공지사항 글 조회수 업데이트 - DB접근
	@Override
	public void noticeHitCountUpdate(int n_No) {
		session.update("noticeHitCountUpdate", n_No);		
	}

	// 공지사항 글 비활성화 업데이트 - DB접근
	@Override
	public int noticeUnavailableUpdate(int n_No) {
		return session.update("noticeUnavailableUpdate", n_No);
	}

}
