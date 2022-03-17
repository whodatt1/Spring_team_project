package com.myweb.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.service.MediaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/search/*")
@Controller
public class SearchController {
	
	@Inject
	private MediaService msv;
	
	@GetMapping(value="/{type}/{keyword}/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CustomPagingHandler> spreadResult(@PathVariable("pageNo") int pageNo, @PathVariable("type") String type, @PathVariable("keyword") String keyword) {
		CustomPagingVO pgvo = new CustomPagingVO(pageNo, 20);
		pgvo.setType(type);
		pgvo.setKeyword(keyword);
		return new ResponseEntity<CustomPagingHandler>(msv.getSearchList(pgvo), HttpStatus.OK);
	}
	
	@GetMapping(value="/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CustomPagingHandler> spread(@PathVariable("pageNo") int pageNo) {
		CustomPagingVO pgvo = new CustomPagingVO(pageNo, 20);
		return new ResponseEntity<CustomPagingHandler>(msv.getSearchList(pgvo), HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
}
