package com.kjh.bbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.dto.Criteria;
import com.kjh.bbs.dto.PageMaker;
import com.kjh.bbs.service.BoardService;

@Controller
public class BoardController {

	@Inject
	BoardService service;
	
	@GetMapping({"/list","","/"})
	public String list(@ModelAttribute("cri") Criteria cri, Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		int totalPage = service.countPaging(cri);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalPage);
		cri.setPage(page);
		cri.setPerPageNum(10);
		model.addAttribute("pageMaker", pm);
		model.addAttribute("list", service.selectPaging(cri));
		
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
	
	@DeleteMapping("/list/{bno}")
	public @ResponseBody int Delete(@PathVariable int bno) {
		int result = service.delete(bno);
		return result;
	}
	
	@GetMapping("/list/update/{bno}")
	public String update(@PathVariable int bno, Model model) {
		BoardVO board = service.selectOne(bno);
		model.addAttribute("board",board);
		return "update";
	}
	
	@PutMapping("/list/{bno}")
	public @ResponseBody void updateProc(@PathVariable int bno, @RequestBody BoardVO board) {
		service.update(board);
	}
	
	
	@GetMapping("/input")
	public String write2() {
		return "input";
	}
	
	@PostMapping("/input")
	public String input(@ModelAttribute("board") BoardVO board) {
		service.insertSelectKey(board);
		return "redirect:list";
	}
	
	@GetMapping("/update2")
	public String update2(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("board", service.selectOne(bno));
		return "update2";
	}
	
	@PostMapping("/update2")
	public String update2(@ModelAttribute BoardVO board) {
		service.update(board);
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete2(@RequestParam("bno") int bno) {
		service.delete(bno);
		return "redirect:/list";
	}
}
