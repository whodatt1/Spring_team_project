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
import com.myweb.www.handler.MediaFileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.CharacterService;
import com.myweb.www.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/movies/*")
@AllArgsConstructor
@Controller
public class MovieController {
	
	private final MovieService msv;
	private final MediaFileHandler mfhd;
	private final CharacterService chsv;
	
	
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
		reAttr.addAttribute("isUp", msv.register(new MediaDTO(mvo, mfList)) > 0 ? "1":"0");
		return"redirect:/movies/list?genre="+mvo.getGenre();
	}
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pagingVO, @RequestParam("genre")String genre) {
		pagingVO.setGenre(genre);
		model.addAttribute("phd", msv.getList(genre,pagingVO));
		
		int totalCount = msv.getTotalCount(pagingVO);
		model.addAttribute("pgn", new PagingHandler(pagingVO,totalCount));
	}
	
	@GetMapping(value="/{genre}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<PagingHandler> spread(@PathVariable("genre") String genre,
			@PathVariable("page")int page){
		log.debug(">>> listGenre :{}/{}", genre, page);
		PagingVO pgvo = new PagingVO(page, 20, genre);
		
		return new ResponseEntity<PagingHandler>(msv.getList(genre,pgvo),HttpStatus.OK);
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("mno")long mno,
			@ModelAttribute("pgvo")PagingVO pgvo) {
		model.addAttribute("mdto", msv.getDetail(mno));
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
			String posterImg = msv.getDetail(mvo.getMno()).getMvo().getPosterImg();
			mvo.setPosterImg(posterImg);
			String bgImg = msv.getDetail(mvo.getMno()).getMvo().getBgImg();
			mvo.setBgImg(bgImg);
		}
		
		reAttr.addAttribute("isMod", msv.modify(new MediaDTO(mvo, mfList)) > 0 ? "1":"0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());
		reAttr.addAttribute("qty", pgvo.getQty());
		reAttr.addAttribute("genre", pgvo.getGenre());
		
		return "redirect:/movies/detail?mno="+mvo.getMno();
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes reAttr, @RequestParam("mno")long mno,
			PagingVO pgvo) {
		String genre = pgvo.getGenre();
		reAttr.addAttribute("isDel", msv.remove(mno)>0? "1":"0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());		
		reAttr.addAttribute("qty", pgvo.getQty());	
		return "redirect:/movies/list?genre="+genre;
	}
	
	@GetMapping("/play")
	public void play(Model model,@RequestParam("mno")long mno) {
		model.addAttribute("url", msv.play(mno));
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid")String uuid){		
		return msv.removeFile(uuid) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
