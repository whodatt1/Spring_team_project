package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.domain.WatchListVO;
import com.myweb.www.handler.CustomPagingHandler;

public interface WatchListService {
	int register(WatchListVO wvo);
	CustomPagingHandler getList(CustomPagingVO pgvo);
	List<WatchListVO> getAccountList(WatchListVO wvo);
	int remove(long wno);
}
