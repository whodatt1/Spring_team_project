package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CharacterVO;

public interface CharacterDAO {
	int insertCharacter(CharacterVO chvo);
	List<CharacterVO> selectAllCharacter(long mno);
	int deleteCharacterAll(long mno);
	int deleteCharacterOne(long chno);
}
