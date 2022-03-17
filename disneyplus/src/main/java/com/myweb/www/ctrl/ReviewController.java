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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ReviewVO;
import com.myweb.www.handler.CustomPagingHandlerJM;
import com.myweb.www.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mreview/*")
public class ReviewController {
	
	@Inject
	private ReviewService rsv;
	
	@PostMapping(value = "/post", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody ReviewVO rvo) {
		log.debug("rvo >>>>>> {}", rvo);
		return rsv.register(rvo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{mno}/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CustomPagingHandlerJM> spread(@PathVariable("mno") long mno, @PathVariable("pageNo") int pageNo) {
		PagingVO pgvo = new PagingVO(pageNo, 10);
		return new ResponseEntity<CustomPagingHandlerJM>(rsv.getList(mno, pgvo), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> erase(@PathVariable("rno") long rno) {
		return rsv.remove(rno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
