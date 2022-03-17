package com.myweb.www.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.service.MovieService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/brand/*")
@AllArgsConstructor
@Controller
public class brandController {
	
	private final MovieService msv;
	
	@GetMapping("/disney")
	public void disney(Model model){
		String company = "disney";
		model.addAttribute("list", msv.getBrandList(company));
	}
	
	@GetMapping("/pixar")
	public void pixar(Model model){
		String company = "pixar";
		model.addAttribute("list", msv.getBrandList(company));
	}
	
	@GetMapping("/marvel")
	public void marvel(Model model){
		String company = "marvel";
		model.addAttribute("list", msv.getBrandList(company));
	}
	
	@GetMapping("/starwars")
	public void starwars(Model model){
		String company = "starwars";
		model.addAttribute("list", msv.getBrandList(company));
	}
	
	@GetMapping("/national")
	public void national(Model model){
		String company = "national";
		model.addAttribute("list", msv.getBrandList(company));
	}
	
	@GetMapping("/stars")
	public void stars(Model model){
		String company = "stars";
		model.addAttribute("list", msv.getBrandList(company));
	}
}
