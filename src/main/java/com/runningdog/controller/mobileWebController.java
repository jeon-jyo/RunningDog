package com.runningdog.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.runningdog.service.MoWebService;
import com.runningdog.vo.LinePathVo;
import com.runningdog.vo.UseTrailVo;

@Controller
@RequestMapping( "/m")
public class mobileWebController {
	
	@Autowired
	private MoWebService moWebService;
	
		
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
	public String map(Model model){
		System.out.println("/산책시작 페이지");
		
		//List<UseTrailVo> trailList = moWebService.trailSelect();
		
		//System.out.println(trailList);
		
		//model.addAttribute("trailList",trailList);	
		
		// 산책로 정보 (이걸 어떻게?) <-- 현재 내 위치를 기준으로
		
		
		// 서비스에서 요청해야할것
		
		// 강아지정보		
		
		// 모임정보 (후순위)
		
		
		return "mobileWeb/walkStart";
	}
	
	// 산책기록폼
	@RequestMapping("/wif")
	public String wif(@RequestParam(name = "line") String lineData, Model model,
					  @RequestParam(name = "time") String timeData, Model model2,
					  @RequestParam(name = "distance") String distanceData, Model model3)
			throws JsonParseException,JsonMappingException, IOException {
		
		System.out.println("wif" + lineData);	
		
		System.out.println("시간" +timeData);
		System.out.println("거리" +distanceData);
	    
		model2.addAttribute("time",timeData);
		model3.addAttribute("distance",distanceData);
		
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
	public void walkInsert(){
		System.out.println("/walkInsert");		
		
		// 쿼리문에서 넣어줄 것 (산책일지번호,작성시간,상태)		
		// 회원번호
		// 동네번호 
		// 모임번호 null 
		// 시작시간
		// 종료시간
		// 소요시간 O
		// 거리 O
		// 내용
		// 공개여부
		
		
		
		// 좌표
		
		// 맵사진
		// 첨부사진	
		
		// 산책로이용정보번호
		// 산책일지번호
		// 산책로번호
		
		//return "redirect:map";
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
