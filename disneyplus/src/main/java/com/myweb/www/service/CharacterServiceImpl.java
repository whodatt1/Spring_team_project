package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.myweb.www.domain.CharacterVO;
import com.myweb.www.repository.CharacterDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Repository
public class CharacterServiceImpl implements CharacterService {
	
	@Inject CharacterDAO chdao;
	
	@Override
	public int register(CharacterVO chvo) {
		int isUp = chdao.insertCharacter(chvo);
		return isUp;
	}

	@Override
	public List<CharacterVO> getList(long mno) {
		List<CharacterVO> list = chdao.selectAllCharacter(mno);
		return list;
	}

	@Override
	public int removeOne(long chno) {
		return 0;
	}

	@Override
	public int removeAll(long mno) {
		int isDel = chdao.deleteCharacterAll(mno);
		return isDel;
	}

}
