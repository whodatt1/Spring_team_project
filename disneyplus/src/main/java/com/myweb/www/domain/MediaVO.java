package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString
public class MediaVO {
	private long mno;
	private String title;
	private String description;
	private String company;
	private String genre;
	private boolean movie;
	private long readCount;
	private int ageLimit;
	private int openingYear;
	private String media;
	private String posterImg;
	private String bgImg;
	private String description2;
	private String director;
	private String actor;
	private int season;
}
