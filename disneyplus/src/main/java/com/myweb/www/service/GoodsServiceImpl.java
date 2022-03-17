package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.GFileVO;
import com.myweb.www.domain.GoodsDTO;
import com.myweb.www.domain.GoodsVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.repository.GFileDAO;
import com.myweb.www.repository.GoodsDAO;
import com.myweb.www.repository.GoodsReviewDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	private GoodsDAO gdao;
	
	@Inject
	private GFileDAO gfdao;
	
	@Inject
	private GoodsReviewDAO grdao;
	
	@Override
	public int register(GoodsDTO gdto) {
		int isUp = gdao.insertGoods(gdto.getGvo());
		if (gdto.getGfList() != null) {
			if (isUp > 0 && gdto.getGfList().size() > 0) {
				long gno = gdao.selectOneGno();
				for (GFileVO gfvo : gdto.getGfList()) {
					gfvo.setGno(gno);
					isUp *= gfdao.insertGFile(gfvo);
				}
			}
		}
		return isUp;
	}

	@Override
	public List<GoodsVO> getList(CustomPagingVO pgvo) {
		return gdao.selectGoodsList(pgvo);
	}

	@Override
	public GoodsDTO getDetail(long gno) {
		gdao.updateGoodsReadCount(gno, 1);
		return new GoodsDTO(gdao.selectOneGoods(gno), gfdao.selectGFileList(gno));
	}

	@Override
	public int modify(GoodsDTO gdto) {
		int isUp = gdao.updateGoods(gdto.getGvo());
		if (gdto.getGfList() != null) {
			if (isUp > 0 && gdto.getGfList().size() > 0) {
				for (GFileVO gfvo : gdto.getGfList()) {
					gfvo.setGno(gdto.getGvo().getGno());
					isUp *= gfdao.insertGFile(gfvo);
				}
			}
		}
		gdao.updateGoodsReadCount(gdto.getGvo().getGno(), -2);
		return isUp;
	}

	@Override
	public int remove(long gno) {
		gfdao.deleteAllGFile(gno);
		grdao.deleteAllGoodsReview(gno);
		return gdao.deleteGoods(gno);
	}

	@Override
	public int getTotalCount(CustomPagingVO pgvo) {
		return gdao.selectOneGoodsTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		return gfdao.deleteGFile(uuid);
	}

}
