package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ReviewVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomPagingHandlerJM {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int totalCount;
	private PagingVO pgvo;
	
	private List<ReviewVO> reviewList;

	public CustomPagingHandlerJM(List<ReviewVO> reviewList, PagingVO pgvo, int totalCount) {
			this.pgvo = pgvo;
			this.totalCount = totalCount;
			this.reviewList = reviewList;
			
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
