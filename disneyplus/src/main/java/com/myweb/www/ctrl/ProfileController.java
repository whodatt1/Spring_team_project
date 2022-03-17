package com.myweb.www.ctrl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.ProfileVO;
import com.myweb.www.service.MemberService;
import com.myweb.www.service.ProfileService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	@Inject
	private ProfileService psv;
	
	@Inject
	private MemberService msv;
	
	@GetMapping("/selectIcon")
	public void selectIcon() {}
	
	@GetMapping("/register")
	public void register(@RequestParam("icon") String icon, Model model) {
		model.addAttribute("icon", icon);
	}
	
	@PostMapping("/register")
	public String register(ProfileVO pvo, RedirectAttributes reAttr) {
		int pvoReg = psv.register(pvo);
		reAttr.addFlashAttribute("pvoReg", pvoReg);
		return "redirect:/profile/login?email=" + pvo.getEmail();
	}
	
	@GetMapping("/login")
	public void login(@RequestParam("email") String email, Model model) {
		MemberVO mvo = msv.getDetail(email);
		List<ProfileVO> pvo = psv.choiceProfile(email);
		model.addAttribute("mvo", mvo);
		model.addAttribute("profile", pvo);
	}
	
	@PostMapping("/login")
	public String login(long pno, HttpSession ses, RedirectAttributes reAttr) {
		ProfileVO profile = psv.login(pno);
		if (profile != null) {
			ses.setAttribute("profile", profile);
		}
		return "redirect:/";
	}
	
	@GetMapping("/loginPin")
	public void loginPin(@RequestParam("pno") long pno, Model model) {
		ProfileVO pvo = psv.login(pno);
		model.addAttribute("profile", pvo);
	}
	
	@PostMapping(value = "/loginPin", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> loginPin(@RequestBody HashMap<String, String> map) {
		int pin = psv.checkPin(Integer.parseInt(map.get("pno")));
		return new ResponseEntity<String>(String.valueOf(pin),HttpStatus.OK);
	}
	
	@GetMapping("/profileList")
	public void profileList(@RequestParam("email") String email, Model model) {
		MemberVO mvo = msv.getDetail(email);
		List<ProfileVO> pvo	= psv.choiceProfile(email);
		model.addAttribute("mvo", mvo);
		model.addAttribute("profile", pvo);
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("pno") long pno, Model model) {
		ProfileVO pvo = psv.login(pno);
		model.addAttribute("profile", pvo);
	}
	
	@PostMapping("/modify")
	public String modify(ProfileVO pvo, RedirectAttributes reAttr) {
		psv.modify(pvo);
		return "redirect:/profile/login?email=" + pvo.getEmail();
	}
	
	@PostMapping("/remove")
	public String remove(RedirectAttributes reAttr, ProfileVO pvo) {
		psv.remove(pvo);
		return "redirect:/profile/login?email=" + pvo.getEmail();
	}
	
}
