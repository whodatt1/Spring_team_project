package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;


public interface MovieDAO {
	int insertMovies (MediaVO mvo);
	//List<MediaVO> selectListMovies (PagingVO pagingVO);
	List<MediaVO> selectListMovies ();
	MediaVO selectOneMovies (long mno);
	int updateMovies(MediaVO mvo);
	int deleteMovies(long mno);
	String playMovies(long mno);
	
	long selectOneMno();
	List<MediaVO> selectListMoviePaging(PagingVO pagingVO);
	int selectOneTotalCount(PagingVO pagingVO);
	void updateMediaRC(@Param("mno")long mno, @Param("cnt")int cnt);
	List<MediaVO> selectBrand(String company);
	List<MediaVO> selectListGenre(@Param("genre") String genre, @Param("pgvo") PagingVO pgvo);
	
}
