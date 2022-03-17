package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
public class PagingVO {
	private int pageNo;
	private int qty;
	
	private String genre;
	
	public PagingVO() {
		this(1, 20);
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public PagingVO(int page, int i, String genre) {
		this.pageNo=page;
		this.qty=i;
		this.genre=genre;
	}

	public int getPageStart() {
		return (this.pageNo - 1) * qty;
	}
	
}
