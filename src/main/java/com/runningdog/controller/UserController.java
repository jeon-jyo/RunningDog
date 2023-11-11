package com.runningdog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.runningdog.service.UserService;
import com.runningdog.vo.UserVo;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	//회원가입 폼
	@RequestMapping(value="/joinForm", method={RequestMethod.GET, RequestMethod.POST})
	public String joinForm(){
		System.out.println("UsersController.joinForm()");
		
		return "join/joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join", method={RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo){
		System.out.println("UsersController.join()");
		
		//System.out.println(userVo);
		userService.insertUser(userVo);
		
		return "redirect:/loginForm";
	}
	
	
	//로그인 폼
	@RequestMapping(value="/loginForm", method={RequestMethod.GET, RequestMethod.POST})
	public String loginForm(){
		System.out.println("UsersController.loginForm()");
		
		return "login/loginForm";
	}
	
	//로그인
	@RequestMapping(value="/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute UserVo userVo,
						HttpSession session) {
		System.out.println("UsersController.login()");
		
		UserVo authUser = userService.selectOneUser(userVo);
		
		session.setAttribute("authUser", authUser);
		//세션은 web 전용이므로 controller에서 처리한다.
			
		return "redirect:/";
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		System.out.println("UsersController.logout()");
		
		//세션의 모든 값을 지움.
		session.invalidate();
		
		return "redirect:/";
	}
}




