package com.myweb.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.RankPagingHandler;
import com.myweb.www.service.MediaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/rank/*")
@Controller
public class RankController {
	
	@Inject
	private MediaService msv;
	
	@GetMapping(value = "/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<RankPagingHandler> spread(@PathVariable("pageNo") int pageNo) {
		CustomPagingVO pgvo = new CustomPagingVO(pageNo, 5);
		return new ResponseEntity<RankPagingHandler>(msv.getRankList(pgvo), HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
}
