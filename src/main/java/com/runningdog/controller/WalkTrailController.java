package com.runningdog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.runningdog.service.TrailService;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.TrailCmtVo;
import com.runningdog.vo.TrailVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.UsersVo;
import com.runningdog.vo.WalkLogVo;

@Controller
@RequestMapping(value = "/walkTrail")
public class WalkTrailController {

	@Autowired
	private TrailService trailService;
	
	// trailMain //////////////////////////////
	
	// 산책로 메인 - 추천 / 등록 / 찜 목록
	@RequestMapping(value = "/main", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMain(@RequestParam(value="listKey") String listKey,
			HttpSession session, Model model) {
		System.out.println("WalkTrailController.trailMain()");
		System.out.println("listKey : " + listKey);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		LocationVo locationVo = null;
		if(authUser != null) {
			locationVo = trailService.userLocation(authUser.getUserNo());
		} else {
			// locationVo = trailService.userLocation(0);
			locationVo = trailService.userLocation(2);
		}
		model.addAttribute("locationVo", locationVo);
		model.addAttribute("listKey", listKey);
		
		return "walkTrail/trailMain";
	}

	// 산책로 목록 ajax
	@ResponseBody
	@RequestMapping(value = "/listMap", method= { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> trailListMap(@RequestBody Map<String, Object> fetchSet,
			HttpSession session) {
		System.out.println("WalkTrailController.trailListMap()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if(authUser != null) {
			fetchSet.put("userNo", authUser.getUserNo());
		} else {
			// fetchSet.put("userNo", 0);
			fetchSet.put("userNo", 2);
		}
		Map<String, Object> listMap = trailService.trailListMap(fetchSet);
		
		return listMap;
	}
	
	// 산책로 툴팁 ajax
	@ResponseBody
	@RequestMapping(value = "/tooltip", method= { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> trailTooltip(@RequestParam(value="trailNo") int trailNo) {
		System.out.println("WalkTrailController.trailTooltip()");
		
		Map<String, Object> infoMap = trailService.trailTooltip(trailNo);
		
		return infoMap;
	}
	
	// 산책로 등록 - 산책일지 목록
	@RequestMapping(value = "/walkLog", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailWalkLog(HttpSession session, Model model) {
		System.out.println("WalkTrailController.trailWalkLog()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		LocationVo locationVo = null;
		if(authUser != null) {
			locationVo = trailService.userLocation(authUser.getUserNo());
		} else {
			// locationVo = trailService.userLocation(0);
			locationVo = trailService.userLocation(2);
		}
		model.addAttribute("locationVo", locationVo);
		
		return "walkTrail/trailWalkLog";
	}
	
	// 산책일지 목록 ajax
	@ResponseBody
	@RequestMapping(value = "/walkLogList", method= { RequestMethod.GET, RequestMethod.POST})
	public List<WalkLogVo> walkLogList(@RequestBody Map<String, Object> fetchSet,
			HttpSession session) {
		System.out.println("WalkTrailController.walkLogList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if(authUser != null) {
			fetchSet.put("userNo", authUser.getUserNo());
		} else {
			// fetchSet.put("userNo", 0);
			fetchSet.put("userNo", 2);
		}
		List<WalkLogVo> walkLogList = trailService.walkLogList(fetchSet);
		
		return walkLogList;
	}
	
	// 산책일지 좌표 ajax
	@ResponseBody
	@RequestMapping(value = "/walkLogMap", method= { RequestMethod.GET, RequestMethod.POST})
	public List<CoordsVo> walkLogMap(@ModelAttribute WalkLogVo walkLogVo) {
		System.out.println("WalkTrailController.walkLogMap()");
		
		List<CoordsVo> coords = trailService.walkLogMap(walkLogVo);
		
		return coords;
	}
	
	// trailForm //////////////////////////////
	
	// 산책로 등록폼
	@RequestMapping(value = "/addForm", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailAddForm(@ModelAttribute WalkLogVo walkLogVo,
			Model model) throws JsonProcessingException {
		System.out.println("WalkTrailController.trailAddForm()");

		String coordsJson = trailService.walkLogCoords(walkLogVo);
		
		model.addAttribute("coordsJson", coordsJson);
		
		return "walkTrail/trailAddForm";
	}
	
	// 산책로 이름 중복확인 ajax
	@ResponseBody
	@RequestMapping(value = "/confirmName", method= { RequestMethod.GET, RequestMethod.POST})
	public int confirmName(@ModelAttribute TrailVo trailVo) {
		System.out.println("WalkTrailController.confirmName()");
		
		int selectCnt = trailService.confirmName(trailVo);
		
		return selectCnt;
	}
	
	// 산책로 등록 ajax
	@ResponseBody
	@RequestMapping(value = "/trailAdd", method= { RequestMethod.GET, RequestMethod.POST})
	public int trailAdd(@RequestBody Map<String, Object> fetchSet, HttpSession session) {
		System.out.println("WalkTrailController.trailAdd()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if(authUser != null) {
			fetchSet.put("userNo", authUser.getUserNo());
		} else {
			// fetchSet.put("userNo", 0);
			fetchSet.put("userNo", 2);
		}
		
		int insertCnt = trailService.trailAdd(fetchSet);
		
		return insertCnt;
	}
	
	@RequestMapping(value = "/modifyForm", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailModifyForm() {
		System.out.println("WalkTrailController.trailModifyForm()");
		return "walkTrail/trailModifyForm";
	}
	
	// trailDetail //////////////////////////////
	
	// 산책로 상세
	@RequestMapping(value = "/detail", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetail(@ModelAttribute TrailVo trailVo,
			Model model, HttpSession session) throws JsonProcessingException {
		System.out.println("WalkTrailController.trailDetail()");
		
		// 산책로 상세
		Map<String, Object> detailMap = trailService.trailDetail(trailVo);
		
		// 유저 상세
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> userMap = new HashMap<String, Object>();
		if(authUser != null) {
			UsersVo usersVo = new UsersVo();
			usersVo.setUserNo(authUser.getUserNo());
			trailVo.setUsersVo(usersVo);
			userMap = trailService.userDetail(trailVo);
		} else {
			UsersVo usersVo = new UsersVo();
			usersVo.setUserNo(2);
			trailVo.setUsersVo(usersVo);
			userMap = trailService.userDetail(trailVo);
		}
		
		// 산책로 이용 랭킹
		Map<String, Object> userUsedMap = trailService.trailUserUsed(trailVo);
		
		model.addAttribute("detailMap", detailMap);
		model.addAttribute("userMap", userMap);
		model.addAttribute("userUsedMap", userUsedMap);
		
		return "walkTrail/trailDetail";
	}
	
	// 산책로 후기 목록 ajax
	@ResponseBody
	@RequestMapping(value = "/cmtListMap", method= { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> cmtListMap(@RequestBody Map<String, Object> fetchSet,
			HttpSession session) {
		System.out.println("WalkTrailController.cmtListMap()");
		System.out.println("fetchSet " + fetchSet);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if(authUser != null) {
			fetchSet.put("userNo", authUser.getUserNo());
		} else {
			fetchSet.put("userNo", 0);
		}
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		int cmtNav = (int) fetchSet.get("cmtNav");
		if(cmtNav == 0) {
			// 후기 - 목록 / 갤러리
			listMap = trailService.cmtListMap(fetchSet);
		} else if(cmtNav == 1) {
			// 산책일지
		}
		
		if(authUser != null) {
			listMap.put("authUserNo", authUser.getUserNo());
		} else {
			listMap.put("authUserNo", 0);
		}
		
		return listMap;
	}
	
	// 산책로 후기 작성 ajax
	@ResponseBody
	@RequestMapping(value = "/cmtAdd", method= { RequestMethod.GET, RequestMethod.POST})
	public void trailCmtAdd(MultipartHttpServletRequest request,
		@RequestParam int trailNo, @RequestParam(required = false) String content, HttpSession session) {
		System.out.println("WalkTrailController.trailCmtAdd()");
		System.out.println("trailNo " + trailNo);
		System.out.println("content " + content);
		
		Map<String, MultipartFile> fileMap = request.getFileMap();
		TrailCmtVo trailCmtVo = new TrailCmtVo();
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		if(authUser != null) {
			UsersVo usersVo = new UsersVo();
			usersVo.setUserNo(authUser.getUserNo());
			
			TrailVo trailVo = new TrailVo();
			trailVo.setTrailNo(trailNo);
			
			trailCmtVo.setUsersVo(usersVo);
			trailCmtVo.setTrailVo(trailVo);
			trailCmtVo.setContent(content);
		} else {
			UsersVo usersVo = new UsersVo();
			usersVo.setUserNo(2);
			
			TrailVo trailVo = new TrailVo();
			trailVo.setTrailNo(trailNo);
			
			trailCmtVo.setUsersVo(usersVo);
			trailCmtVo.setTrailVo(trailVo);
			trailCmtVo.setContent(content);
		}
		
		trailService.trailCmtAdd(fileMap, trailCmtVo);
	}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/cmtAdd", method= { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> trailCmtAdd(@RequestBody TrailCmtVo trailCmtVo,
			HttpSession session) {
		System.out.println("WalkTrailController.trailCmtAdd()");
		System.out.println("trailCmtVo : " + trailCmtVo);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> userMap = null;
		if(authUser != null) {

		} else {

		}
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		return listMap;
	}
	*/
	
	@RequestMapping(value = "/detail/deleted", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetailDeleted() {
		System.out.println("WalkTrailController.trailDetailDeleted()");
		return "walkTrail/trailDetailDeleted";
	}
	
	@RequestMapping(value = "/detail/comment", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetailComment() {
		System.out.println("WalkTrailController.trailDetailComment()");
		return "walkTrail/trailDetailComment";
	}
	
	@RequestMapping(value = "/detail/gallery", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetailGallery() {
		System.out.println("WalkTrailController.trailDetailGallery()");
		return "walkTrail/trailDetailGallery";
	}
	
	@RequestMapping(value = "/detail/meetingLog", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetailMeetingLog() {
		System.out.println("WalkTrailController.trailDetailMeetingLog()");
		return "walkTrail/trailDetailMeetingLog";
	}
	
	@RequestMapping(value = "/detail/walkLog", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetailWalkLog() {
		System.out.println("WalkTrailController.trailDetailWalkLog()");
		return "walkTrail/trailDetailWalkLog";
	}
	
	// trailMyList //////////////////////////////
	
	@RequestMapping(value = "/my", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMyList() {
		System.out.println("WalkTrailController.trailMyList()");
		return "walkTrail/trailMyList";
	}
	
	@RequestMapping(value = "/my/starList", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMyStarList() {
		System.out.println("WalkTrailController.trailMyStarList()");
		return "walkTrail/trailMyStarList";
	}
	
	@RequestMapping(value = "/my/commentList", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMyCommentList() {
		System.out.println("WalkTrailController.trailMyCommentList()");
		return "walkTrail/trailMyCommentList";
	}
	
}
