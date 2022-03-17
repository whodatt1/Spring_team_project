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
public class ProfileVO {
	private long pno;
	private String email;
	private String profileName;
	private int pin;
	private String icon;
	private int kids;
	private int locked;
}
