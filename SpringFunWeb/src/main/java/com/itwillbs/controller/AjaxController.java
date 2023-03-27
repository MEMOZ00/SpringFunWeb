package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;


// rest api controlloer
@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result = "";
		// request 파라미터 id값 가져오기
		String id = request.getParameter("id");
		// DB 아이디 중복체크
		MemberDTO memberDTO = memberService.getMember(id);
		// 한글은 호환이 어려우므로 결과값은 영문 result에 영문 사용
		if(memberDTO != null) {
			result = "iddup";
		} else {
			result = "idok";
		}
		// 서버에서 처리한 출력 결과 저장 
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "/board/listjson", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> listjson() {
		// DB 최근글 5개 가져오기
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setPageSize(5);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(1);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		// 서버에서 처리한 출력 결과 저장 
		ResponseEntity<List<BoardDTO>> entity = new ResponseEntity<List<BoardDTO>>(boardList, HttpStatus.OK);
		// List<BoardDTO> -> json date형으로 변경
		// jackson-databind 프로그램 설치 시 자동으로 변환 가능
		return entity;
	}
	
}// class
