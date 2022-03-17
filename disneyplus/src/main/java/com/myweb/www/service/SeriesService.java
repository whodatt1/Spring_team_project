package com.myweb.www.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.MediaDTO;
import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.SeasonVO;
import com.myweb.www.handler.PagingHandler;

public interface SeriesService {
	int register (MediaDTO mdto);
	List<MediaVO> getList(PagingVO pagingVO);
	MediaDTO getDetail(long mno);
	int modify(MediaDTO mediaDTO);
	int remove(long mno);
	
	int registerS(MediaDTO mediaDTO);
	List<SeasonVO> getListS(@Param("mno")long mno,@Param("season") int season);
	int modifyS(MediaDTO mediaDTO);
	int removeS(long sno);
	int removeAllS(long mno);
	int getTotalCount(PagingVO pagingVO);
	int removeFile(String uuid);
	int removeSeasonFile(String uuid);
	String playS(long sno);
	MediaDTO getDetailS(long sno);
	PagingHandler getList(String genre, PagingVO pgvo);
}
