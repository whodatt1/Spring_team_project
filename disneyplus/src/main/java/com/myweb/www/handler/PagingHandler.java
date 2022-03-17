package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter

public class PagingHandler {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int totalCount;
	private PagingVO pgvo;
	
	private List<MediaVO> list;
	
	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage
		= (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0)))*pgvo.getQty();
		
		
		int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
		
		if(realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		
		this.next = this.endPage < realEndPage;
	}

	public PagingHandler(PagingVO pgvo, int totalCount, List<MediaVO> list) {
		this(pgvo, totalCount);
		this.list = list;
	}
	
	
}
