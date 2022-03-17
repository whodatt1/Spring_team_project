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
import com.myweb.www.domain.SeasonVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.MediaFileDAO;
import com.myweb.www.repository.MovieDAO;
import com.myweb.www.repository.SeriesDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Repository
public class SeriesServiceImpl implements SeriesService {
	
	@Inject
	private SeriesDAO sdao;
	
	@Inject
	private MediaFileDAO mfdao;
	
	@Inject
	private MovieDAO mdao;
	
	@Override
	public int register(MediaDTO mdto) {
		int isUp = sdao.insertSeries(mdto.getMvo());
		
		if(isUp > 0 && mdto.getMfList().size() > 0) {
			long mno = sdao.selectOneMno();
			for(MediaFileVO mfvo: mdto.getMfList()) {
				mfvo.setMno(mno);
				isUp *= mfdao.insertMFile(mfvo);
			}
		}
		return isUp;
	}
	
	@Transactional
	@Override
	public List<MediaVO> getList(PagingVO pagingVO) {
		return sdao.selectListSeriesPaging(pagingVO);
	}

	@Override
	public MediaDTO getDetail(long mno) {
		mdao.updateMediaRC(mno, 1);
		log.debug("디테일 가져오는 중의 mvo{}",sdao.selectOneSeries(mno));
		return new MediaDTO(sdao.selectOneSeries(mno), mfdao.selectListMFile(mno));
	}

	@Override
	public int modify(MediaDTO mdto) {
		int isUp =  sdao.updateSeries(mdto.getMvo());
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
		int isDel = sdao.deleteAllSeason(mno);
		log.debug("isDel >>>>> {}", isDel);
		isDel *=  sdao.deleteSeries(mno);
		return isDel;
	}

	@Override
	public int registerS(MediaDTO mdto) {
		int isUp = sdao.insertSeason(mdto.getSvo());
		return isUp;
	}

	@Override
	public List<SeasonVO> getListS(long mno, int season) {
		return sdao.selectListSeason(mno,season);
	}

	@Override
	public int modifyS(MediaDTO mdto) {
		int isUp = sdao.updateSeason(mdto.getSvo());
		return isUp;
	}

	@Override
	public int removeS(long sno) {
		int isUp = sdao.deleteSeason(sno);
		return isUp;
	}

	@Override
	public int removeAllS(long mno) {
		int isUp = sdao.deleteAllSeason(mno);
		return isUp;
	}

	@Override
	public int getTotalCount(PagingVO pagingVO) {
		return sdao.selectOneTotalCount(pagingVO);
	}

	@Override
	public int removeFile(String uuid) {
		long mno = mfdao.selectOneMno(uuid);
		int isDel = mfdao.deleteMFile(uuid);
		return isDel;
	}

	@Override
	public String playS(long sno) {
		return sdao.playSeason(sno);
	}
	
	@Transactional
	@Override
	public MediaDTO getDetailS(long sno) {
		long mno = sdao.selectOneSeason(sno).getMno();
		return new MediaDTO(sdao.selectOneSeason(sno), mfdao.selectListMFile(mno));
	}

	@Override
	public PagingHandler getList(String genre, PagingVO pgvo) {
		int totalCount = sdao.selectOneTotalCount(pgvo);
		List<MediaVO> list = sdao.selectListGenre(genre,pgvo);
		PagingHandler phd = new PagingHandler(pgvo, totalCount, list);
		return phd;
	}

	@Override
	public int removeSeasonFile(String uuid) {
		int isDel = mfdao.deleteMFile(uuid);
		return isDel;
	}

	

}
