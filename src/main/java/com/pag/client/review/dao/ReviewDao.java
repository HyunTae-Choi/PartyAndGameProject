package com.pag.client.review.dao;

import java.util.List;
import java.util.Map;

import com.pag.client.review.vo.ReviewVO;

public interface ReviewDao {

	public List<ReviewVO> roomReviewListSelect(Map<String, Integer> reviewMap);

	public int reviewInsert(ReviewVO rvo);

	public ReviewVO reviewUpdataDataSelect(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	public int reviewDisableUpdate(ReviewVO rvo);

	public int adminReviewDisableUpdate(ReviewVO rvo);

	public int reivewSectionPageCnt(int r_no);

}
