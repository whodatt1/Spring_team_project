package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.CustomPagingVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RankPagingHandler {
	private int endPage;
	private boolean prev, next;
	
	private int totalCount;
	private CustomPagingVO pgvo;
	
	private List<MediaVO> rankList;
	
	public RankPagingHandler(CustomPagingVO pgvo, int totalCount, List<MediaVO> rankList) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		this.rankList = rankList;
		
		this.endPage = (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0))) * pgvo.getQty();
		
		int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
				
		if (realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = pgvo.getPageNo() > 1;
		this.next = pgvo.getPageNo() < realEndPage;
	}
}
