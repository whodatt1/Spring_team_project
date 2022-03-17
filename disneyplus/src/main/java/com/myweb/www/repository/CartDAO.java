package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.CartVO;
import com.myweb.www.domain.CustomPagingVO;

public interface CartDAO {
	int insertCart(CartVO cvo);
	List<CartVO> selectCartList(CustomPagingVO pgvo);
	int deleteCart(long cno);
	int deleteAllCart(CartVO cvo);
	int deleteAllMemberCart(String email);
	int selectCartTotalCount();
}
