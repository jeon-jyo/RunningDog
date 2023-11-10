package com.runningdog.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runningdog.service.TrailService;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.UserVo;

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
	
	// 산책로 메인 - 추천 목록
	@RequestMapping(value = "/main", method= { RequestMethod.GET, RequestMethod.POST})
	public String trailMain(HttpSession session, Model model) {
		System.out.println("WalkTrailController.trailMain()");
		
		// UserVo authUser = userService.selectOneUser(userVo);	// UsersVo 로 변경?
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		LocationVo locationVo = null;
		if(authUser != null) {
			locationVo = trailService.userLocation(authUser.getUserNo());
		} else {
			// locationVo = trailService.userLocation(0);
			locationVo = trailService.userLocation(2);
		}
		model.addAttribute("locationVo", locationVo);
		
		return "walkTrail/trailMain";
	}

	// 산책로 목록 ajax
	@ResponseBody
	@RequestMapping(value = "/listMap", method= { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> trailListMap(@RequestBody Map<String, Object> fetchSet) {
		System.out.println("WalkTrailController.trailListMap()");
		System.out.println("fetchSet " + fetchSet);
		
		/*
		 * Map<String, Object> coordsMap = (Map<String, Object>)
		 * fetchSet.get("coordsMap"); ArrayList<String> tags = (ArrayList<String>)
		 * fetchSet.get("tags"); int filter = (int) fetchSet.get("filter");
		 * 
		 * System.out.println("coordsMap : " + coordsMap); System.out.println("tags : "
		 * + tags); System.out.println("filter " + filter);
		 */
		
		/*
		 * if(tags.size() != 0) { for(String str : tags) { System.out.println("str : " +
		 * str); } }
		 */
		
		Map<String, Object> listMap = trailService.trailListMap(fetchSet);
		// Map<String, Object> listMap = null;
		
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
