package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CartVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.repository.CartDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO cdao;
	
	@Override
	public int register(CartVO cvo) {
		return cdao.insertCart(cvo);
	}

	@Override
	public List<CartVO> getList(CustomPagingVO pgvo) {
		return cdao.selectCartList(pgvo);
	}

	@Override
	public int remove(long cno) {
		return cdao.deleteCart(cno);
	}

	@Override
	public int getTotalCount() {
		return cdao.selectCartTotalCount();
	}

}
