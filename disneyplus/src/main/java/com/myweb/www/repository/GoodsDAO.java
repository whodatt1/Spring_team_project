package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.GoodsVO;
import com.myweb.www.domain.CustomPagingVO;

public interface GoodsDAO {
	int insertGoods(GoodsVO gvo);
	List<GoodsVO> selectGoodsList(CustomPagingVO pgvo);
	GoodsVO selectOneGoods(long gno);
	int updateGoods(GoodsVO bvo);
	int deleteGoods(long gno);
	
	int selectOneGoodsTotalCount(CustomPagingVO pgvo);
	long selectOneGno();
	int updateGoodsReadCount(@Param("gno") long gno, @Param("cnt") long cnt);
	int updateGoodsReviewCount(@Param("gno") long gno, @Param("cnt") long cnt);
}
