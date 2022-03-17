package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.GFileVO;

public interface GFileDAO {
	int insertGFile(GFileVO gfvo);
	List<GFileVO> selectGFileList(long gno);
	int deleteGFile(String uuid);
	int deleteAllGFile(long gno);
	List<GFileVO> selectAllGFileList();
}
