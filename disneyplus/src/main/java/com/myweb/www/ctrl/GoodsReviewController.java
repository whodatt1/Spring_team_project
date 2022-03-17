package com.myweb.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.GoodsReviewVO;
import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.service.GoodsReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/greview/*")
public class GoodsReviewController {
	
	
	@Inject
	private GoodsReviewService grsv;
	
	@PostMapping(value = "/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody GoodsReviewVO grvo) {
		return grsv.register(grvo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{gno}/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CustomPagingHandler> spread(@PathVariable("gno") long gno, @PathVariable("pageNo") int pageNo) {
		CustomPagingVO pgvo = new CustomPagingVO(pageNo, 10);
		return new ResponseEntity<CustomPagingHandler>(grsv.getList(gno, pgvo), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{grno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> erase(@PathVariable("grno") long grno) {
		return grsv.remove(grno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
