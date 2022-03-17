package com.myweb.www.repos;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.myweb.www.config.RootConfig.class})
public class MemberTest {
	@Inject
	private MemberDAO mdao;
	
	@Test
	public void insertMemberDummies() throws Exception {
		for (int i = 0; i < 100; i++) {
			MemberVO mvo = new MemberVO();
			mvo.setEmail("Test Email" + i);
			mvo.setPwd("1111");
			mdao.insertMember(mvo);
		}
	}
	
	@Test
	public void insertMember() throws Exception {
		MemberVO mvo = new MemberVO();
		mvo.setEmail("Test Email");
		mvo.setPwd("1111");
		mdao.insertMember(mvo);
	}
}