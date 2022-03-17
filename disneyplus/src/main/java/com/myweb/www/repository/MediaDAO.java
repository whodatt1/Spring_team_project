package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.CustomPagingVO;

public interface MediaDAO {
	List<MediaVO> selectSearchList(CustomPagingVO pgvo);
	List<MediaVO> selectRankList(CustomPagingVO pgvo);
	int selectMediaTotalCount(CustomPagingVO pgvo);
}
