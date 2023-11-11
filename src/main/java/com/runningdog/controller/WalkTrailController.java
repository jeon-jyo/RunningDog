package com.runningdog.controller;

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

import com.runningdog.service.TrailService;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.WalkLogVo;

@Controller
@RequestMapping(value = "/walkTrail")
public class WalkTrailController {

	@Autowired
	private TrailService trailService;
	
	// trailMain //////////////////////////////
	
	// dogMapExample
	@RequestMapping(value = "/ex", method= { RequestMethod.GET, RequestMethod.POST})
	public String dogMapExample(HttpSession session, Model model) {
		System.out.println("WalkTrailController.dogMapExample()");
		
		return "global/dogMapExample";
	}
	
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
			fetchSet.put("userNo", 99);
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
		// List<CoordsVo> coords = null;
		
		return coords;
	}

	@RequestMapping(value = "/main/myList", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMainMyList() {
		System.out.println("WalkTrailController.trailMainMyList()");
		return "walkTrail/trailMainMyList";
	}
	
	@RequestMapping(value = "/main/starList", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMainStarList() {
		System.out.println("WalkTrailController.trailMainStarList()");
		return "walkTrail/trailMainStarList";
	}
	
	@RequestMapping(value = "/main/addList", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMainAddList() {
		System.out.println("WalkTrailController.trailMainAddList()");
		return "walkTrail/trailMainAddList";
	}
	
	// trailForm //////////////////////////////
	
	@RequestMapping(value = "/addForm", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailAddForm() {
		System.out.println("WalkTrailController.trailAddForm()");
		return "walkTrail/trailAddForm";
	}
	
	@RequestMapping(value = "/modifyForm", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailModifyForm() {
		System.out.println("WalkTrailController.trailModifyForm()");
		return "walkTrail/trailModifyForm";
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
	
	// trailDetail //////////////////////////////
	
	@RequestMapping(value = "/detail", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailDetail() {
		System.out.println("WalkTrailController.trailDetail()");
		return "walkTrail/trailDetail";
	}
	
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
	
}
