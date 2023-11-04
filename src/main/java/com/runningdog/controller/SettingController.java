package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettingController {

	//로그인
	@RequestMapping( "/loginForm")
	public String loginForm(){
		
		return "login/loginForm";
	}
	
	//회원가입
	@RequestMapping( "/joinForm")
	public String joinForm(){
		
		return "login/joinForm";
	}	
	
	
	
	//내 정보
	@RequestMapping( "/setting/myProfile")
	public String myProfile(){
		
		return "setting/myProfile";
	}
	
	//내 정보 수정
	@RequestMapping( "/setting/myProfileModify")
	public String myProfileModify(){
		
		return "setting/myProfileModify";
	}
	

	
	
	//강아지 카드
	@RequestMapping( "/setting/dogList")
	public String dogList(){
		
		return "setting/dogList";
	}
	
	//강아지 추가
	@RequestMapping( "/setting/dogInsert")
	public String dogInsert(){
		
		return "setting/dogInsert";
	}

	
	//강아지 수정
	@RequestMapping( "/setting/dogModify")
	public String dogModify(){
		
		return "setting/dogModify";
	}
	

	
	//친구 목록
	@RequestMapping( "/setting/friendList")
	public String friendList(){
		
		return "setting/friendList";
	}

	//내가 받은 신청
	@RequestMapping( "/setting/friendApplied")
	public String friendApplied(){
		
		return "setting/friendApplied";
	}
	
	//내가 한 신청
	@RequestMapping( "/setting/friendApply")
	public String friendApply(){
		
		return "setting/friendApply";
	}
	
	//회원 검색
	@RequestMapping( "/setting/friendSearch")
	public String friendSearch(){
		
		return "setting/friendSearch";
	}
	

	
	//회원 탈퇴
	@RequestMapping( "/setting/resign")
	public String resign(){
		
		return "setting/resign";
	}
	
	
	//메인 페이지
	@RequestMapping( "/")
	public String main(){
		
		return "main/main";
	}	
	
	
}
