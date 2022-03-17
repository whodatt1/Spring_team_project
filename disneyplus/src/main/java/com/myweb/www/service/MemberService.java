package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.MemberVO;

public interface MemberService {
	int register(MemberVO mvo);
	MemberVO getDetail(String email);
	List<MemberVO> getList();
	int modify(MemberVO mvo);
	int remove(MemberVO mvo);
	MemberVO login(MemberVO mvo);
	int dupleCheck(String string);
	int lastLoginMember(String authEmail);
	String checkPwd(String email);
	
}
