package com.runningdog.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.runningdog.vo.LinePathVo;

@Controller
@RequestMapping( "/m")
public class mobileWebController {
		
	// 로그인폼
	@RequestMapping( "/loginForm")
	public String loginForm(){
		System.out.println("/login");
		return "mobileWeb/loginForm";
	}
	
	// 로그인실행
	@RequestMapping( "/login")
	public String login(){
		System.out.println("/login");
		return "mobileWeb/map";
	}
	
	// 모바일메인화면 맵실행
	@RequestMapping( "/map")
	public String map(){
		System.out.println("/산책시작 페이지");
		
		// 내 강아지 정보
		// 내 모임일정정보				
		
		return "mobileWeb/walkStart";
	}
	
	// 산책기록폼
	@RequestMapping("/wif")
	public String wif(@RequestParam(name = "line") String lineData, Model model)
			throws JsonParseException,JsonMappingException, IOException {
		
		System.out.println("wif" + lineData);		    
	    
		// URL 디코딩을 수행하여 JSON 문자열을 원래 형식으로 변환
	    String decodedJson = URLDecoder.decode(lineData, StandardCharsets.UTF_8);

	    // JSON 문자열을 파싱하여 객체로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    List<LinePathVo> lineList = objectMapper.readValue(decodedJson, new TypeReference<List<LinePathVo>>() {});		    
	    
	    // lineData를 사용하여 다른 작업을 수행
	    System.out.println("lineList"+lineList);
	    model.addAttribute("lineList", objectMapper.writeValueAsString(lineList)); // JSON 형식의 문자열로 변환하여 전달
	    System.out.println(objectMapper.writeValueAsString(lineList));
	    
	    return "mobileWeb/walkEnd"; // wif 페이지로 이동
	}
	
	
	// 기록하기
	@RequestMapping( "/walkInsert")
	public String walkInsert(){
		System.out.println("/walkInsert");
		
		
		
		
		
		return "redirect:map";
	}	
	
	
	/*
	 * // 산책기록 보내기
	 * 
	 * @RequestMapping(value = "/walkInsertForm", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String map2(){ System.out.println("/산책기록 받아오기");
	 * 
	 * 
	 * 
	 * return "mobileWeb/walkEnd"; }
	 */
	
	
	// 산책기록 보내기
//	@RequestMapping(value = "/walkInsertForm", method = { RequestMethod.GET, RequestMethod.POST })
//	public String map(@RequestBody ArrayList<linePathVo> line, Model model){
//		System.out.println("/산책기록 받아오기");
//		
//		System.out.println(line);
//		
//		model.addAttribute( "line", line);
//		
//		return "mobileWeb/walkEnd";
//	}
	
	// 기록내용 상세폼
//	@RequestMapping( "/wif")
//	public String walkInsertForm(@RequestBody ArrayList<linePathVo> line){
//		System.out.println("기록내용 폼");
//		
//		System.out.println(line);
//		
//		return "mobileWeb/walkEnd";
//	}

	
	

}
