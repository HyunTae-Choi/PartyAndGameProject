package com.pag.client.review.service;

import java.util.List;
import java.util.Map;

import com.pag.client.review.vo.ReviewVO;
import com.pag.common.vo.PageVO;

public interface ReviewService {

	public List<ReviewVO> roomReviewListSelect(Map<String, Integer> reviewMap);

	public int reviewInsert(ReviewVO rvo);

	public ReviewVO reviewUpdataDataSelect(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	public int reviewDisableUpdate(ReviewVO rvo);

	public int adminReviewDisableUpdate(ReviewVO rvo);

	public PageVO reivewSectionPageCnt(PageVO pvo, int r_no);

	

}
