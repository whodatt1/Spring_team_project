package com.myweb.www.ctrl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.CartVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.CartPagingHandler;
import com.myweb.www.service.CartService;
import com.myweb.www.service.GoodsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartService csv;
	
	@Inject
	private GoodsService gsv;
	
	@GetMapping("/register")
	public void register(Model model, @RequestParam("gno") long gno, @RequestParam("totalPrice") long totalPrice, @RequestParam("purchaseCount") int purchaseCount) {
		model.addAttribute("gdto", gsv.getDetail(gno));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("purchaseCount", purchaseCount);
	}
	
	@PostMapping("/register")
	public String register(RedirectAttributes reAttr, CartVO cvo) {
		reAttr.addFlashAttribute("isReg", csv.register(cvo) > 0 ? "1" : "0");
		String encodingProfileName = null;
		try {
			encodingProfileName = URLEncoder.encode(cvo.getProfileName(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		return "redirect:/cart/list?email="+cvo.getEmail()+"&profileName="+ encodingProfileName;
	}
	
	@GetMapping("/list")
	public void list(Model model, CustomPagingVO pgvo) {
		model.addAttribute("list", csv.getList(pgvo));
		int totalCount = csv.getTotalCount();
		model.addAttribute("pgn", new CartPagingHandler(pgvo, totalCount));
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes reAttr, CartVO cvo, CustomPagingVO pgvo) {
		reAttr.addFlashAttribute("isDel", csv.remove(cvo.getCno()) > 0 ? "1" : "0");
		reAttr.addAttribute("pageNo", pgvo.getPageNo());
		reAttr.addAttribute("qty", pgvo.getQty());
		String encodingProfileName = null;
		try {
			encodingProfileName = URLEncoder.encode(cvo.getProfileName(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		return "redirect:/cart/list?email="+cvo.getEmail()+"&profileName="+encodingProfileName;
	}
}
