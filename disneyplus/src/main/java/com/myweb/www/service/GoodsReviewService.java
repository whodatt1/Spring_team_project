package com.myweb.www.service;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.CustomPagingHandler;

public interface GoodsReviewService {
	int register(GoodsReviewVO grvo);
	CustomPagingHandler getList(long gno, CustomPagingVO pgvo);
	int remove(long grno);
}
