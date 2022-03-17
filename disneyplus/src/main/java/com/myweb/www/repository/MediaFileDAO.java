package com.myweb.www.repository;

import java.util.List;


import com.myweb.www.domain.MediaFileVO;

public interface MediaFileDAO {
	int insertMFile (MediaFileVO mfvo);
	List<MediaFileVO> selectListMFile(long mno);
	int deleteMFile(String uuid);
	int deleteAllMFile(long mno);
	long selectOneMno(String uuid);
	int selectOneMFileCount(long mno);
	List<MediaFileVO> selectListAllMFiles();
}
