package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.CustomPagingVO;

public interface GoodsReviewDAO {
	int insertGoodsReview(GoodsReviewVO grvo);
	List<GoodsReviewVO> selectListGoodsReview(@Param("gno") long gno, @Param("pgvo") CustomPagingVO pgvo);
	int deleteGoodsReview(long grno);
	int deleteAllGoodsReview(long gno);
	long selectOneGno(long grno);
	int selectOneGoodsReviewTotalCount(long gno);
}
