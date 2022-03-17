package com.myweb.www.service;


import java.util.List;

import com.myweb.www.domain.MediaDTO;
import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;


public interface MovieService {
	
	int register (MediaDTO mdto);
	List<MediaVO> getList();
	MediaDTO getDetail(long mno);
	int modify(MediaDTO mdto);
	int remove(long mno);
	String play(long mno);
	
	
	int removeMFile(String uuid);
	List<MediaVO> getList(PagingVO pagingVO);
	int getTotalCount(PagingVO pagingVO);
	int removeFile(String uuid);
	List<MediaVO> getBrandList(String company);
	PagingHandler getList(String genre, PagingVO pgvo);
	
}
