package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.RankPagingHandler;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.repository.MediaDAO;

@Service
public class MediaServiceImpl implements MediaService {
	
	@Inject
	private MediaDAO mdao;
	

	@Override
	public RankPagingHandler getRankList(CustomPagingVO pgvo) {
		List<MediaVO> rankList = mdao.selectRankList(pgvo);
		return new RankPagingHandler(pgvo, 20, rankList);
	}

	@Override
	public CustomPagingHandler getSearchList(CustomPagingVO pgvo) {
		List<MediaVO> searchList = mdao.selectSearchList(pgvo);
		int totalCount = mdao.selectMediaTotalCount(pgvo);
		return new CustomPagingHandler(pgvo, totalCount, searchList);
	}

}
