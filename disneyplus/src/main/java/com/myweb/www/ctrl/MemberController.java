package com.myweb.www.ctrl;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private BCryptPasswordEncoder bcpEncoder;
	
	@Inject
	private MemberService msv;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO mvo, RedirectAttributes reAttr) {
		mvo.setPwd(bcpEncoder.encode(mvo.getPwd()));
		int reg = msv.register(mvo);
		reAttr.addFlashAttribute("reg", reg);
		return "redirect:/profile/login?email=" + mvo.getEmail();
	}
	
	@ResponseBody
	@PostMapping(value = "/dupleCheck", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> dupleCheck(@RequestBody HashMap<String, String> map) {
		int isExist = msv.dupleCheck(map.get("email"));
		return isExist > 0 ? new ResponseEntity<String>("1",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(HttpServletRequest req, RedirectAttributes reAttr) {
		reAttr.addFlashAttribute("email", req.getAttribute("email"));
		reAttr.addFlashAttribute("errMsg", req.getAttribute("errMsg"));
		return "redirect:/member/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses, RedirectAttributes reAttr) {
		ses.removeAttribute("ses");
		reAttr.addFlashAttribute("isOut", ses.getAttribute("ses") == null ? 1 : 0);
		ses.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("email") String email, Model model) {
		MemberVO mvo = msv.getDetail(email);
		model.addAttribute("mvo", mvo);
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("email") String email, Model model) {
		MemberVO mvo = msv.getDetail(email);
		model.addAttribute("mvo", mvo);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, RedirectAttributes reAttr) {
		mvo.setPwd(bcpEncoder.encode(mvo.getPwd()));
		int isMod = msv.modify(mvo);
		reAttr.addFlashAttribute("isMod", isMod);
		return "redirect:/member/detail?email=" + mvo.getEmail();
	}
	
	@PostMapping("/remove")
	public String remove(MemberVO mvo, RedirectAttributes reAttr) {
		int removeMember = 0;
		String checkPwd = msv.checkPwd(mvo.getEmail());
		if (bcpEncoder.matches(mvo.getPwd(), checkPwd)) {
			mvo.setPwd(checkPwd);
			removeMember = msv.remove(mvo);
			SecurityContextHolder.clearContext();
			reAttr.addFlashAttribute("removeMember", removeMember);
			return "redirect:/";
		} else {
			reAttr.addFlashAttribute("removeMember", removeMember);
			return "redirect:/member/detail?email=" + mvo.getEmail(); 
		}
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", msv.getList());
	}
}
