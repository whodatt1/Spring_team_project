package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
	private long cno;
	private String email;
	private long gno;
	private String address;
	private String gname;
	private String profileName;
	private String goodsImg;
	private long totalPrice;
	private int purchaseCount;
	private String company;
	private String kinds;
}
