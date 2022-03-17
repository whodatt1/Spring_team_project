package com.myweb.www.service;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ReviewVO;
import com.myweb.www.handler.CustomPagingHandlerJM;

public interface ReviewService {
	int register(ReviewVO rvo);
	CustomPagingHandlerJM getList(long mno, PagingVO pgvo);
	int remove(long rno);
}
