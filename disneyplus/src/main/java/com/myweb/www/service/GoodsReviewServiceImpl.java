package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.repository.GoodsDAO;
import com.myweb.www.repository.GoodsReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsReviewServiceImpl implements GoodsReviewService {
	
	@Inject
	private GoodsReviewDAO grdao;
	
	@Inject
	private GoodsDAO gdao;
	
	@Transactional
	@Override
	public int register(GoodsReviewVO grvo) {
		int isReg = grdao.insertGoodsReview(grvo);
		gdao.updateGoodsReviewCount(grvo.getGno(), 1);
		return isReg;
	}

	@Override
	public CustomPagingHandler getList(long gno, CustomPagingVO pgvo) {
		int totalCount = grdao.selectOneGoodsReviewTotalCount(gno);
		List<GoodsReviewVO> list = grdao.selectListGoodsReview(gno, pgvo);
		CustomPagingHandler phd = new CustomPagingHandler(list, pgvo, totalCount);
		return phd;
	}
	
	@Transactional
	@Override
	public int remove(long grno) {
		long gno = grdao.selectOneGno(grno);
		int isUp = grdao.deleteGoodsReview(grno);
		gdao.updateGoodsReviewCount(gno, -1);
		return isUp;
	}

}
