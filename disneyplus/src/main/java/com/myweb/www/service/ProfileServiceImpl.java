package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.CartVO;
import com.myweb.www.domain.ProfileVO;
import com.myweb.www.domain.WatchListVO;
import com.myweb.www.repository.CartDAO;
import com.myweb.www.repository.MemberDAO;
import com.myweb.www.repository.ProfileDAO;
import com.myweb.www.repository.WatchListDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Inject
	private ProfileDAO pdao;
	
	@Inject
	private MemberDAO mdao;
	
	@Inject
	private WatchListDAO wldao;
	
	@Inject
	private CartDAO cdao;
	
	@Transactional
	@Override
	public int register(ProfileVO pvo) {
		mdao.updateProfileLimit(pvo.getEmail());
		return pdao.insertProfile(pvo);
	}

	@Override
	public ProfileVO login(long pno) {
		return pdao.loginProfile(pno);
	}

	@Override
	public int modify(ProfileVO pvo) {
		return pdao.updateProfile(pvo);
	}

	@Transactional // 안해도될거같은데 혹시몰라서..
	@Override
	public int remove(ProfileVO pvo) {
		mdao.updateDeleteProfileLimit(pvo.getEmail());
		WatchListVO wlvo = new WatchListVO();
		wlvo.setEmail(pvo.getEmail());
		wlvo.setProfileName(pvo.getProfileName());
		wldao.deleteAllWatchList(wlvo);
		CartVO cvo = new CartVO();
		cvo.setEmail(pvo.getEmail());
		cvo.setProfileName(pvo.getProfileName());
		cdao.deleteAllCart(cvo);
		return pdao.deleteProfile(pvo.getPno());
	}

	@Override
	public List<ProfileVO> choiceProfile(String email) {
		return pdao.loginChoice(email);
	}

	@Override
	public int checkPin(long pno) {
		return pdao.checkPin(pno);
	}

}
