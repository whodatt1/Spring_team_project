package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ReviewVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.handler.CustomPagingHandlerJM;
import com.myweb.www.repository.MediaDAO;
import com.myweb.www.repository.ReviewDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO rdao;
	
	@Inject
	private MediaDAO mdao;
	
	@Transactional
	@Override
	public int register(ReviewVO rvo) {
		int isReg = rdao.insertMediaReview(rvo);
		return isReg;
	}

	@Override
	public CustomPagingHandlerJM getList(long mno, PagingVO pgvo) {
		int totalCount = rdao.selectOneMediaReviewTotalCount(mno);
		List<ReviewVO> list = rdao.selectListMediaReview(mno, pgvo);
		CustomPagingHandlerJM phd = new CustomPagingHandlerJM(list, pgvo, totalCount);
		return phd;
	}
	
	@Transactional
	@Override
	public int remove(long rno) {
		long gno = rdao.selectOneMno(rno);
		int isUp = rdao.deleteMediaReview(rno);
		return isUp;
	}


}
