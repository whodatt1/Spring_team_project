package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoodsVO {
	private long gno;
	private String gname;
	private String description;
	private String company;
	private String kinds;
	private long price;
	private long readCount;
	private String modAt;
	private String goodsImg;
	private int cmtQty;
}
