package com.myweb.www.ctrl;

import java.util.List;

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

import com.myweb.www.domain.CustomPagingVO;
import com.myweb.www.domain.WatchListVO;
import com.myweb.www.handler.CustomPagingHandler;
import com.myweb.www.service.WatchListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/watchlist/*")
public class WatchListController {
	
	@Inject
	private WatchListService wsv;
	
	@PostMapping(value = "/register", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody WatchListVO wvo) {
		return wsv.register(wvo) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/{wno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> erase(@PathVariable("wno") long wno) {
		return wsv.remove(wno) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{email}/{profileName}/{pageNo}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CustomPagingHandler> spread(@PathVariable("pageNo") int pageNo, @PathVariable("email") String email, @PathVariable("profileName") String profileName) {
		CustomPagingVO pgvo = new CustomPagingVO(pageNo, 20);
		pgvo.setEmail(email);
		pgvo.setProfileName(profileName);
		return new ResponseEntity<CustomPagingHandler>(wsv.getList(pgvo), HttpStatus.OK);
	}
	
	@PostMapping(value = "/accountList", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<WatchListVO>> spreadAccount(@RequestBody WatchListVO wvo) {
		return new ResponseEntity<List<WatchListVO>>(wsv.getAccountList(wvo), HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
}
