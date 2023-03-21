package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result = "";
		// request 파라미터 id값 가져오기
		String id = request.getParameter("id");
		// DB 아이디 중복체크
		MemberDTO memberDTO = memberService.getMember(id);
		// 한글은 깨지므로 영문 result에 영문 사용
		if(memberDTO != null) {
			result = "iddup";
		} else {
			result = "idok";
		}
		// 출력 결과 저장 
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
	 return entity;
	}
	
}// class
