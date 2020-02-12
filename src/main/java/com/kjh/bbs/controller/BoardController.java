package com.kjh.bbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.service.BoardService;

@Controller
public class BoardController {

	@Inject
	BoardService service;
	
	@GetMapping({"/list",""})
	public String list(Model model) {
		
		model.addAttribute("list", service.selectAll());
		
		return "list";
	}
	
	@GetMapping("/write")
	public String write() {
		
		return "write";
	}
	
	@PostMapping("/write")
	public @ResponseBody int writeProc(@RequestBody BoardVO board) {
		int result = service.insert(board);
		if(result == 1) {
			return result;
		}else {
			return -1;
		}
	}
	
	@GetMapping("/list/{bno}")
	public String list(@PathVariable int bno, Model model) {

		BoardVO board = service.selectOne(bno);
		
		model.addAttribute("board",board);
		
		return "detail";
	}
}
