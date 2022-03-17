package com.myweb.www.ctrl;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MediaDTO;
import com.myweb.www.domain.MediaFileVO;
import com.myweb.www.domain.MediaVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.SeasonVO;
import com.myweb.www.handler.MediaFileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.SeriesService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/series/*")
@AllArgsConstructor
@Controller
public class SeriesController {
	
	private final SeriesService ssv;
	private final MediaFileHandler mfhd;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MediaVO mvo, RedirectAttributes reAttr,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		log.debug(">>>> 등록 mvo{}", mvo);
		List<MediaFileVO> mfList = null;
		if(files[0].getSize() > 0) {
			mfList = mfhd.uploadFiles(files);
			String posterImg = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid() + "_ps_" + mfList.get(0).getFileName();
			mvo.setPosterImg(posterImg);
			String bgImg = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid() + mfList.get(0).getFileName();
			mvo.setBgImg(bgImg);
		}
		reAttr.addAttribute("isUp", ssv.register(new MediaDTO(mvo, mfList)) > 0 ? "1":"0");
		return"redirect:/series/list?genre="+mvo.getGenre();
	}
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pagingVO, @RequestParam("genre")String genre) {
		pagingVO.setGenre(genre);
		model.addAttribute("list", ssv.getList(pagingVO));
		int totalCount = ssv.getTotalCount(pagingVO);
		model.addAttribute("pgn", new PagingHandler(pagingVO,totalCount));
		
	}
	
	@GetMapping(value="/{genre}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<PagingHandler> spread(@PathVariable("genre") String genre,
			@PathVariable("page")int page){
		log.debug(">>> listGenre :{}/{}", genre, page);
		
		PagingVO pgvo = new PagingVO(page, 10, genre);
		
		return new ResponseEntity<PagingHandler>(ssv.getList(genre,pgvo),HttpStatus.OK);
	}
	
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("mno")long mno,
			@ModelAttribute("pgvo")PagingVO pgvo) {
		model.addAttribute("mdto", ssv.getDetail(mno));
		model.addAttribute("season", ssv.getListS(mno, 1)); //처음에 시즌 1 보여지게 해놨음
		// 화면 하면서 버튼누르면 시즌 바뀌게 구현해라~
	}
	
	@GetMapping("/play")
	public void play(Model model,@RequestParam("sno")long sno) {
		model.addAttribute("url",ssv.playS(sno));
	}
	
	@PostMapping("/modify")
	public String modify(RedirectAttributes reAttr, MediaVO mvo, PagingVO pgvo,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		log.debug(">>> {}", mvo);
		List<MediaFileVO> mfList = null;
		if(files[0].getSize() > 0) {
			mfList = mfhd.uploadFiles(files);
			String posterImg = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid() + "_ps_" + mfList.get(0).getFileName();
			mvo.setPosterImg(posterImg);
			String bgImg = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid() + mfList.get(0).getFileName();
			mvo.setBgImg(bgImg);
		}
		if(files[0].getSize() == 0) {
			String posterImg = ssv.getDetail(mvo.getMno()).getMvo().getPosterImg();
			mvo.setPosterImg(posterImg);
			String bgImg = ssv.getDetail(mvo.getMno()).getMvo().getBgImg();
			mvo.setBgImg(bgImg);
		}
		
		reAttr.addAttribute("isMod", ssv.modify(new MediaDTO(mvo, mfList)) > 0 ? "1":"0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());
		reAttr.addAttribute("qty", pgvo.getQty());
		reAttr.addAttribute("genre", pgvo.getGenre());
		return "redirect:/movies/detail?mno="+mvo.getMno();
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes reAttr, @RequestParam("mno")long mno,
			PagingVO pgvo) {
		String genre = pgvo.getGenre();
		reAttr.addAttribute("isDel", ssv.remove(mno)>0? "1":"0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());		
		reAttr.addAttribute("qty", pgvo.getQty());
		return "redirect:/series/list?genre="+genre;
	}
	
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid")String uuid){		
		return ssv.removeFile(uuid) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/season/register")
	public void registerS(Model model,@RequestParam("mno")long mno){
		model.addAttribute("mno", mno);
	}
	
	@PostMapping("/season/register")
	public String registerS(SeasonVO svo, RedirectAttributes reAttr,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		List<MediaFileVO> mfList = null;
		if(files[0].getSize() > 0) {
			mfList = mfhd.uploadFiles(files);
			String thumbnail = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid()+"_ps_" + mfList.get(0).getFileName();
			svo.setThumbnail(thumbnail);
		}
		reAttr.addAttribute("isUp",ssv.registerS(new MediaDTO(svo, mfList)) > 0 ? "1" : "0");
		return"redirect:/series/detail?mno="+svo.getMno();
	}
	
	@GetMapping("/season/modify")
	public void modify(Model model, @RequestParam("sno")long sno) {
		model.addAttribute("sdto",ssv.getDetailS(sno));
	}
	
	@PostMapping("/season/modify")
	public String modify(RedirectAttributes reAttr, SeasonVO svo,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		List<MediaFileVO> mfList = null;
		if(files[0].getSize() > 0) {
			mfList = mfhd.uploadFiles(files);
			String thumbnail = mfList.get(0).getSaveDir().replace("\\", "/") +
					"/" + mfList.get(0).getUuid()+"_ps_" + mfList.get(0).getFileName();
			svo.setThumbnail(thumbnail);
		}
		if(files[0].getSize() == 0) {
			String thumbnail = ssv.getDetailS(svo.getSno()).getSvo().getThumbnail();
			svo.setThumbnail(thumbnail);
		}
		reAttr.addAttribute("isMod", ssv.modifyS(new MediaDTO(svo, mfList)) > 0 ? "1":"0");
		
		return "redirect:/series/detail?mno="+svo.getMno();
	}
	
	@DeleteMapping(value = "/sfile/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeSeasonFile(@PathVariable("uuid")String uuid){		
		return ssv.removeSeasonFile(uuid) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/season/remove")
	public String remove(RedirectAttributes reAttr, SeasonVO svo) {
		long mno = svo.getMno();
		reAttr.addAttribute("isDel", ssv.removeS(svo.getSno())>0? "1":"0");
		return "redirect:/series/detail?mno="+mno;
	}
	
	@GetMapping(value="/season/{mno}/{season}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<SeasonVO>> spread(@PathVariable("mno")long mno,
			@PathVariable("season")int season){
		
		return new ResponseEntity<List<SeasonVO>>(ssv.getListS(mno, season),HttpStatus.OK);
	}
}
