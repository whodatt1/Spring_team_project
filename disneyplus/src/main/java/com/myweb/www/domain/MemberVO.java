package com.myweb.www.domain;

import java.util.List;

import com.myweb.www.security.AuthVO;

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
public class MemberVO {
	private String email;
	private String pwd;
	private int grade;
	private String regAt;
	private String lastLogin;
	private int profileLimit;
	private List<AuthVO> authList;
}
