package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.CartDAO;
import com.myweb.www.repository.MemberDAO;
import com.myweb.www.repository.ProfileDAO;
import com.myweb.www.repository.WatchListDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mdao;
	
	@Inject
	private ProfileDAO pdao;
	
	@Inject
	private WatchListDAO wldao;
	
	@Inject
	private CartDAO cdao;
	
	@Transactional
	@Override
	public int register(MemberVO mvo) {
		mdao.insertMember(mvo);
		return mdao.insertAuthInit(mvo.getEmail());
	}

	@Override
	public MemberVO getDetail(String email) {
		return mdao.selectOneMember(email);
	}

	@Override
	public List<MemberVO> getList() {
		return mdao.selectAllMember();
	}

	@Override
	public int modify(MemberVO mvo) {
		return mdao.updateMember(mvo);
	}

	@Override
	public int remove(MemberVO mvo) {
		pdao.deleteAllProfile(mvo.getEmail());
		wldao.deleteAllWatchList(mvo.getEmail());
		cdao.deleteAllMemberCart(mvo.getEmail());
		return mdao.deleteMember(mvo);
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		MemberVO loginMvo = mdao.selectLogin(mvo);
		if (loginMvo != null) {
			mdao.lastLoginMember(mvo.getEmail());
		}
		return loginMvo;
	}

	@Override
	public int dupleCheck(String email) {
		return mdao.selectExist(email);
	}

	@Override
	public int lastLoginMember(String authEmail) {
		return mdao.lastLoginMember(authEmail);
	}

	@Override
	public String checkPwd(String email) {
		return mdao.checkPwd(email);
	}

}
