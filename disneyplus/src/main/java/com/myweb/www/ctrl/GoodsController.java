package com.myweb.www.ctrl;

import java.util.List;

import javax.inject.Inject;

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

import com.myweb.www.domain.GFileVO;
import com.myweb.www.domain.GoodsDTO;
import com.myweb.www.domain.GoodsVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.GoodsFileHandler;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.service.GoodsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/goods/*")
@Controller
public class GoodsController {
	
	@Inject
	private GoodsService gsv;
	
	@Inject
	private GoodsFileHandler gfhd;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(GoodsVO gvo, RedirectAttributes reAttr,
			@RequestParam(name = "files", required = false) MultipartFile[] files) {
		List<GFileVO> gfList = null;
		if (files[0].getSize() > 0) {
			gfList = gfhd.uploadGFiles(files);
			String goodsImg = gfList.get(0).getSaveDir().replace("\\", "/") + "/" + gfList.get(0).getUuid() + "_th_" + gfList.get(0).getFileName();
			gvo.setGoodsImg(goodsImg);
		}
		reAttr.addFlashAttribute("isUp", gsv.register(new GoodsDTO(gvo, gfList)) > 0 ? "1" : "0");
		return "redirect:/goods/list?company="+ gvo.getCompany() + "&kinds=" + gvo.getKinds();
	}
	
	@GetMapping("/list")
	public void list(Model model, CustomPagingVO pgvo) {
		model.addAttribute("list", gsv.getList(pgvo));
		int totalCount = gsv.getTotalCount(pgvo);
		model.addAttribute("pgn", new CustomPagingHandler(pgvo, totalCount));
	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(Model model, @RequestParam("gno") long gno,
			@ModelAttribute("pgvo") CustomPagingVO pgvo) {
		model.addAttribute("gdto", gsv.getDetail(gno));
	}
	
	@PostMapping("/modify")
	public String modify(RedirectAttributes reAttr, GoodsVO gvo, CustomPagingVO pgvo,
			@RequestParam(name = "files", required = false) MultipartFile[] files) {
		List<GFileVO> gfList = null;
		if (files[0].getSize() > 0) {
			gfList = gfhd.uploadGFiles(files);
			if (gvo.getGoodsImg() == null) {
				String goodsImg = gfList.get(0).getSaveDir().replace("\\", "/") + "/" + gfList.get(0).getUuid() + "_th_" + gfList.get(0).getFileName();
				gvo.setGoodsImg(goodsImg);
			}
		}
		reAttr.addFlashAttribute("isMod", gsv.modify(new GoodsDTO(gvo, gfList)));
		reAttr.addAttribute("pageNo", pgvo.getPageNo());
		reAttr.addAttribute("qty", pgvo.getQty());
		reAttr.addAttribute("company", pgvo.getCompany().replace(",",""));
		reAttr.addAttribute("kinds", pgvo.getKinds().replace(",",""));
		return "redirect:/goods/detail?gno="+gvo.getGno();
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes reAttr, @RequestParam("gno") long gno, CustomPagingVO pgvo) {
		reAttr.addFlashAttribute("isDel" , gsv.remove(gno) > 0 ? "1" : "0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());
		reAttr.addAttribute("qty", pgvo.getQty());
		reAttr.addAttribute("company", pgvo.getCompany().replace(",",""));
		reAttr.addAttribute("kinds", pgvo.getKinds().replace(",",""));
		return "redirect:/goods/list";
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid) {
		return gsv.removeFile(uuid) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
