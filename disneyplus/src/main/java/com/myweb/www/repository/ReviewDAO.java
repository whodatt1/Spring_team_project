package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ReviewVO;

public interface ReviewDAO {
	int insertMediaReview(ReviewVO rvo);
	List<ReviewVO> selectListMediaReview(@Param("mno") long mno, @Param("pgvo") PagingVO pgvo);
	int deleteMediaReview(long rno);
	int deleteAllMediaReview(long mno);
	long selectOneMno(long rno);
	int selectOneMediaReviewTotalCount(long mno);
}
