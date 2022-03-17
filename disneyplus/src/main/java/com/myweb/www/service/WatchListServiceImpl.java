package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.domain.WatchListVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.repository.WatchListDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WatchListServiceImpl implements WatchListService {
	
	@Inject
	private WatchListDAO wdao;
	
	public int register(WatchListVO wvo) {
		return wdao.insertWatchList(wvo);
	}

	@Override
	public CustomPagingHandler getList(CustomPagingVO pgvo) {
		List<WatchListVO> watchList = wdao.selectWatchList(pgvo);
		int totalCount = wdao.selectWatchListTotalCount();
		return new CustomPagingHandler(pgvo, watchList, totalCount);
	}

	@Override
	public int remove(long wno) {
		return wdao.deleteWatchList(wno);
	}

	@Override
	public List<WatchListVO> getAccountList(WatchListVO wvo) {
		return wdao.selectAccountWatchList(wvo);
	}

}
