package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CartVO;
import com.myweb.www.domain.CustomPagingVO;

public interface CartService {
	int register(CartVO cvo);
	List<CartVO> getList(CustomPagingVO pgvo);
	int remove(long cno);
	int getTotalCount();
}
