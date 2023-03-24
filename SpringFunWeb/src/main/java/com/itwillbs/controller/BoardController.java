package com.itwillbs.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.util.UUID;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {

	//스프링의 특징 스프링 객체생성 방식 => 의존관계주입(Dependency Injection)
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String write(BoardDTO baordDTO) {
		System.out.println("BoardController write()");
		// 처리작업
		
		// 가상주소변경 없이 이동
		return "center/write";
	}
	
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String writePro(BoardDTO baordDTO) {
		System.out.println("BoardController writePro()");
		// 처리작업
		boardService.insertBoard(baordDTO);
		
		// 가상주소변경 없이 이동
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("BoardController list()");
		// 처리작업
		// 검색어 가져오기 
		String search= request.getParameter("search");
		
		//한 화면에 보여줄 글의 개수
		int pageSize = 5;
		
		//현재페이지 번호 설정
		String pageNum= request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		} 
		int CurrentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(CurrentPage);
		pageDTO.setSearch(search);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		//페이징 처리
		int count = boardService.getBoardCount(pageDTO);
		int pageBlock = 5;
		int startPage = (CurrentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// 서버단 처리 결과 전달
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 가상주소변경 없이 이동
		return "center/notice";
	}
	
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		System.out.println("BoardController content()");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDTO boardDTO = boardService.getBoard(num);
		
		model.addAttribute("boardDTO",boardDTO);
		
		return "center/content";
	}
	
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		System.out.println("BoardController update()");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDTO boardDTO = boardService.getBoard(num);
		
		model.addAttribute("boardDTO",boardDTO);
		
		return "center/update";
	}
	
	@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)
	public String updatePro(BoardDTO boardDTO) {
		System.out.println("BoardController updatePro()");
		
		boardService.updateBoard(boardDTO);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("BoardController delete()");
		int num = Integer.parseInt(request.getParameter("num"));
		
		boardService.deleteBoard(num);
		
		return "redirect:/board/list";
	}
	
	
}//class
