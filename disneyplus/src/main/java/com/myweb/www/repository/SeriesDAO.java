package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.SeasonVO;

public interface SeriesDAO {
	int insertSeries (MediaVO mvo);
	List<MediaVO> selectListSeriesPaging (PagingVO pagingVO);
	MediaVO selectOneSeries(long mno);
	int updateSeries (MediaVO mvo);
	int deleteSeries (long mno);
	
	int insertSeason(SeasonVO svo);
	List<SeasonVO> selectListSeason(@Param("mno")long mno, @Param("season")int season);
	int updateSeason(SeasonVO svo);
	int deleteSeason(long sno);
	int deleteAllSeason(long mno);
	long selectOneMno();
	int selectOneTotalCount(PagingVO pagingVO);
	String playSeason(long sno);
	SeasonVO selectOneSeason(long sno);
	List<MediaVO> selectListGenre(@Param("genre") String genre, @Param("pgvo") PagingVO pgvo);
}
