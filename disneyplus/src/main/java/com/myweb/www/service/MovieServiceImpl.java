package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.MediaDTO;
import com.myweb.www.domain.MediaFileVO;
import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

import com.myweb.www.repository.MediaFileDAO;
import com.myweb.www.repository.MovieDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Repository
public class MovieServiceImpl implements MovieService {
	
	@Inject
	private MovieDAO mdao;
	
	@Inject
	private MediaFileDAO mfdao;
	

	
	@Override
	public int register(MediaDTO mdto) {
		log.debug(">>>> MovieServiceImpl mvo {}",mdto.getMvo());
		int isUp = mdao.insertMovies(mdto.getMvo());
		
		if(isUp > 0 && mdto.getMfList().size() > 0) {
			long mno = mdao.selectOneMno();
			for(MediaFileVO mfvo: mdto.getMfList()) {
				mfvo.setMno(mno);
				isUp *= mfdao.insertMFile(mfvo);
			}
		}
		return isUp;
	}

	//@Override
	//public List<MediaVO> getList(PagingVO pagingVO) {
	//	return mdao.selectListMovies(pagingVO);
	//}
	
	@Override
	public List<MediaVO> getList() {
		return mdao.selectListMovies();
	}
	
	@Transactional
	@Override
	public MediaDTO getDetail(long mno) {
		mdao.updateMediaRC(mno, 1);
		return new MediaDTO(mdao.selectOneMovies(mno), mfdao.selectListMFile(mno));
	}

	@Override
	public int modify(MediaDTO mdto) {
		int isUp= mdao.updateMovies(mdto.getMvo());
		if(mdto.getMfList() != null) {
			if(isUp > 0 && mdto.getMfList().size() > 0) {
				long mno = mdto.getMvo().getMno();
				for(MediaFileVO mfvo: mdto.getMfList()) {
					mfvo.setMno(mno);
					isUp *= mfdao.insertMFile(mfvo);
				}
			}
		}
		mdao.updateMediaRC(mdto.getMvo().getMno(), -2);
		return isUp;
	}

	@Override
	public int remove(long mno) {
		int isUp = mdao.deleteMovies(mno);
		return isUp;
	}

	@Override
	public String play(long mno) {
		return mdao.playMovies(mno);
	}
	
	@Transactional
	@Override
	public int removeMFile(String uuid) {
		long mno = mfdao.selectOneMno(uuid);
		int isDel = mfdao.deleteMFile(uuid);
		return isDel;
	}

	@Override
	public List<MediaVO> getList(PagingVO pagingVO) {
		return mdao.selectListMoviePaging(pagingVO);
	}

	@Override
	public int getTotalCount(PagingVO pagingVO) {
		return mdao.selectOneTotalCount(pagingVO);
	}

	@Override
	public int removeFile(String uuid) {
		long mno = mfdao.selectOneMno(uuid);
		int isDel = mfdao.deleteMFile(uuid);
		int cnt = mfdao.selectOneMFileCount(mno);
		
		return isDel;
	}

	@Override
	public List<MediaVO> getBrandList(String company) {
		return mdao.selectBrand(company);
	}

	@Override
	public PagingHandler getList(String genre, PagingVO pgvo) {
		int totalCount = mdao.selectOneTotalCount(pgvo);
		List<MediaVO> list = mdao.selectListGenre(genre,pgvo);
		PagingHandler phd = new PagingHandler(pgvo, totalCount, list);
		return phd;
	}


}
