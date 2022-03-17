package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.domain.WatchListVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartPagingHandler {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int totalCount;
	private CustomPagingVO pgvo;
	
	private List<MediaVO> searchList;
	private List<WatchListVO> watchList;
	private List<GoodsReviewVO> goodsReviewList;
	
	public CartPagingHandler(CustomPagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		this.endPage = (int)((Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*0.5))) * (pgvo.getQty()*0.5));
		this.startPage = this.endPage - 9;
		
		int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
				
		if (realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
}
