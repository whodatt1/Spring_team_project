package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoodsReviewVO {
	private long grno;
	private long gno;
	private String email;
	private String profileName;
	private String content;
	private int score;
	private String modAt;
}
