package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.GoodsDTO;
import com.myweb.www.domain.GoodsVO;
import com.myweb.www.domain.CustomPagingVO;

public interface GoodsService {
	int register(GoodsDTO gdto);
	List<GoodsVO> getList(CustomPagingVO pgvo);
	GoodsDTO getDetail(long gno);
	int modify(GoodsDTO gdto);
	int remove(long gno);
	
	int getTotalCount(CustomPagingVO pgvo);
	int removeFile(String uuid);
}
