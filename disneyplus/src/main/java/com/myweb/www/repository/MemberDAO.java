package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.security.AuthVO;

public interface MemberDAO {
	int insertMember(MemberVO mvo);
	MemberVO selectOneMember(String email);
	List<MemberVO> selectAllMember();
	int updateMember(MemberVO mvo);
	int deleteMember(MemberVO mvo);
	int lastLoginMember(String email);
	
	int insertAuthInit(String email);
	List<AuthVO> selectAuths(String email);
	MemberVO selectLogin(MemberVO mvo);
	int selectExist(String email);
	int updateProfileLimit(String email);
	int updateDeleteProfileLimit(String email);
	String checkPwd(String email);
}
