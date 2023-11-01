package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/walkTrail")
public class WalkTrailController {

	@RequestMapping(value = "/main")
	public String trailMain() {
		System.out.println("WalkTrailController.trailMain()");
		return "walkTrail/trailMain";
	}
	
	@RequestMapping(value = "/main/myList")
	public String trailMainMyList() {
		System.out.println("WalkTrailController.trailMainMyList()");
		return "walkTrail/trailMainMyList";
	}
	
	@RequestMapping(value = "/main/starList")
	public String trailMainStarList() {
		System.out.println("WalkTrailController.trailMainStarList()");
		return "walkTrail/trailMainStarList";
	}
	
	@RequestMapping(value = "/main/addList")
	public String trailMainAddList() {
		System.out.println("WalkTrailController.trailMainAddList()");
		return "walkTrail/trailMainAddList";
	}
	
	@RequestMapping(value = "/addForm")
	public String trailAddForm() {
		System.out.println("WalkTrailController.trailAddForm()");
		return "walkTrail/trailAddForm";
	}
	
	@RequestMapping(value = "/modifyForm")
	public String trailModifyForm() {
		System.out.println("WalkTrailController.trailModifyForm()");
		return "walkTrail/trailModifyForm";
	}
	
	@RequestMapping(value = "/my")
	public String trailMyList() {
		System.out.println("WalkTrailController.trailMyList()");
		return "walkTrail/trailMyList";
	}
	
	@RequestMapping(value = "/my/starList")
	public String trailMyStarList() {
		System.out.println("WalkTrailController.trailMyStarList()");
		return "walkTrail/trailMyStarList";
	}
	
	@RequestMapping(value = "/my/commentList")
	public String trailMyCommentList() {
		System.out.println("WalkTrailController.trailMyCommentList()");
		return "walkTrail/trailMyCommentList";
	}
	
	@RequestMapping(value = "/detail")
	public String trailDetail() {
		System.out.println("WalkTrailController.trailDetail()");
		return "walkTrail/trailDetail";
	}
	
	@RequestMapping(value = "/detail/deleted")
	public String trailDetailDeleted() {
		System.out.println("WalkTrailController.trailDetailDeleted()");
		return "walkTrail/trailDetailDeleted";
	}
	
	@RequestMapping(value = "/detail/comment")
	public String trailDetailComment() {
		System.out.println("WalkTrailController.trailDetailComment()");
		return "walkTrail/trailDetailComment";
	}
	
	@RequestMapping(value = "/detail/gallery")
	public String trailDetailGallery() {
		System.out.println("WalkTrailController.trailDetailGallery()");
		return "walkTrail/trailDetailGallery";
	}
	
	@RequestMapping(value = "/detail/meetingLog")
	public String trailDetailMeetingLog() {
		System.out.println("WalkTrailController.trailDetailMeetingLog()");
		return "walkTrail/trailDetailMeetingLog";
	}
	
	@RequestMapping(value = "/detail/walkLog")
	public String trailDetailWalkLog() {
		System.out.println("WalkTrailController.trailDetailWalkLog()");
		return "walkTrail/trailDetailWalkLog";
	}
	
}
