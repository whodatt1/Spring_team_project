package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.ProfileVO;

public interface ProfileService {
	int register(ProfileVO pvo);
	ProfileVO login(long pno);
	int modify(ProfileVO pvo);
	int remove(ProfileVO pvo);
	List<ProfileVO> choiceProfile(String email);
	int checkPin(long pno);
}
