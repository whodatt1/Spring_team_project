package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.ProfileVO;

public interface ProfileDAO {
	int insertProfile(ProfileVO pvo);
	ProfileVO loginProfile(long pno);
	int updateProfile(ProfileVO pvo);
	int deleteProfile(long pno);
	List<ProfileVO> loginChoice(String email);
	int deleteAllProfile(String email);
	int checkPin(long pno);
	
}
