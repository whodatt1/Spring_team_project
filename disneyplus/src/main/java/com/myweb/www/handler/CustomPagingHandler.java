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
public class CustomPagingHandler {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int totalCount;
	private CustomPagingVO pgvo;
	
	private List<MediaVO> searchList;
	private List<WatchListVO> watchList;
	private List<GoodsReviewVO> goodsReviewList;
	
	public CustomPagingHandler(CustomPagingVO pgvo, int totalCount) {
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
	
	public CustomPagingHandler(CustomPagingVO pgvo, int totalCount, List<MediaVO> searchList) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		this.searchList = searchList;
		
		this.endPage = (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0))) * pgvo.getQty();
		
		int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
				
		if (realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		this.next = this.endPage < realEndPage;
	}
	public CustomPagingHandler(CustomPagingVO pgvo, List<WatchListVO> watchList, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		this.watchList = watchList;
		
		this.endPage = (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0))) * pgvo.getQty();
		
		int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
				
		if (realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		this.next = this.endPage < realEndPage;
	}

	public CustomPagingHandler(List<GoodsReviewVO> goodsReviewList, CustomPagingVO pgvo, int totalCount) {
			this.pgvo = pgvo;
			this.totalCount = totalCount;
			this.goodsReviewList = goodsReviewList;
			
			this.endPage = (int)(Math.ceil(pgvo.getPageNo() / (pgvo.getQty()*1.0))) * pgvo.getQty();
			this.startPage = this.endPage - 9;
			
			int realEndPage = (int)(Math.ceil((totalCount*1.0) / pgvo.getQty()));
					
			if (realEndPage < this.endPage) {
				this.endPage = realEndPage;
			}
			this.prev = this.startPage > 1;
			this.next = this.endPage < realEndPage;
	}
}
