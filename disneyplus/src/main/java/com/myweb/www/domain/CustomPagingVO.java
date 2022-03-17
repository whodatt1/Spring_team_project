package com.myweb.www.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomPagingVO {
	private int pageNo;
	private int qty;
	
	private String type;
	private String keyword;
	
	private String company;
	private String kinds;
	
	private String email;
	private String profileName;
	
	public CustomPagingVO() {
		this(1, 20);
	}
	
	public CustomPagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		return (this.pageNo - 1) * qty;
	}
	
	public String[] getTypeToArray() {
		return this.type == null ? new String[] {} : this.type.split("");
	}
}
