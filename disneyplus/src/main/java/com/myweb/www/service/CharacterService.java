package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CharacterVO;

public interface CharacterService {
	
	int register(CharacterVO chvo);
	List<CharacterVO> getList(long mno);
	int removeOne(long chno);
	int removeAll(long mno);
}
