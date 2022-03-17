package com.myweb.www.service;

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.RankPagingHandler;
import com.myweb.www.handler.CustomPagingHandler;

public interface MediaService {
	CustomPagingHandler getSearchList(CustomPagingVO pgvo);
	RankPagingHandler getRankList(CustomPagingVO pgvo);
}
