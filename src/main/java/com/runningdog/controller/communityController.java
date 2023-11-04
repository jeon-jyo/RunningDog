package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping( "/comm")
public class communityController {
		
	// 산책소식 홈
	@RequestMapping( "/home")
	public String home(){
		System.out.println("/home");			
		return "community/commHome";
		}	
	
	// 우리동네 소통창구
	@RequestMapping( "/list")
	public String list(){
		System.out.println("/commList");
		return "community/commList";
	}
		
	// 강아지 자랑하기
	@RequestMapping( "/gallery")
	public String gallery(){
		System.out.println("/commGallery");
		return "community/commGallery";
	}	
	
	// 게시글 작성폼
	@RequestMapping( "/insert")
	public String insert(){
		System.out.println("/insert");
		return "community/commInsert";
	}
	
	// 게시글 작성
	
	// 게시글 상세페이지
	@RequestMapping( "/read")
	public String read(){
		System.out.println("/read");
		return "community/commRead";
	}	
	
	// 내 게시글 관리
	@RequestMapping( "/admin")
	public String admin(){
		System.out.println("/admin");
		return "community/commAdmin";
	}	
	
	
}
