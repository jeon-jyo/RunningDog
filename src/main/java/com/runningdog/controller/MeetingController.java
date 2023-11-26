package com.runningdog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runningdog.service.MeetingService;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.MeetingInfosVo;
import com.runningdog.vo.MeetingsVo;
import com.runningdog.vo.TrailsVo;
import com.runningdog.vo.UserVo;

@RequestMapping(value = "/walkmeeting")
@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService meetingService;
	
	//모임 리스트
	@RequestMapping(value="/meetinglist", method={RequestMethod.GET, RequestMethod.POST})
	public String meetingList(@RequestParam(value="what", required=false, defaultValue="") String what,
							  @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							  @RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
							  Model model){
		System.out.println("MeetingController.meetingList()");
		
		Map<String, Object> meetingMap = meetingService.selectMeetingList(what, keyword, crtPage);
		model.addAttribute("meetingMap", meetingMap);
		
		return "walkMeeting/meetingList";
	}
	
	//모임 등록 페이지
	@RequestMapping(value = "/meetinginsert")
	public String meetingInsert(HttpSession session, Model model){
		System.out.println("MeetingController.meetingInsert()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		List<DogsVo> dogList = meetingService.selectDogList(userNo);
		
		model.addAttribute("dogList", dogList);
		
		return "walkMeeting/meetingInsert";
	}
	
	//산책로 검색 AJAX
	@ResponseBody
	@RequestMapping(value="/searchTrail", method={RequestMethod.GET, RequestMethod.POST})
	public List<TrailsVo> searchTrail(@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
									  @RequestParam(value="what", required=false, defaultValue="") String what){
		System.out.println("MeetingController.searchTrail()");
		
		List<TrailsVo> trailList = meetingService.searchTrail(what, keyword);
		
		return trailList;
	}
	
	//모임 등록 기능
	@RequestMapping(value = "/insertMeeting")
	public String insertMeeting(@ModelAttribute MeetingsVo mVo, HttpSession session){
		System.out.println("MeetingController.insertMeeting()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		mVo.setUserNo(userNo);
		
		//System.out.println(mVo);
		meetingService.insertMeeting(mVo);
		
		return "redirect:/walkmeeting/meetinglist?crtPage=1";
	}
	
	
	//모임 상세 페이지
	@RequestMapping(value = "/meeting")
	public String meetingDetail(@RequestParam(value="no") int no, Model model, HttpSession session){
		System.out.println("MeetingController.meetingDetail()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		Map<String, Object> map = meetingService.selectOneMeeting(no, userNo);
		model.addAttribute("meetingMap", map);
		
		return "walkMeeting/meetingDetail";
	}
	
	//모임 신청
	@RequestMapping(value = "/applyMeeting")
	public String applyMeeting(@ModelAttribute MeetingsVo mvo, HttpSession session){
		System.out.println("MeetingController.applyMeeting()");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		mvo.setUserNo(userNo);

		meetingService.insertMeetingInfo(mvo);
		
		int no = mvo.getMeetingNo();
		
		return "redirect:/walkmeeting/meeting?no="+no;
	}
	
	//모임 삭제 or 종료
	@RequestMapping(value = "/deleteMeeting")
	public String deleteMeeting(@RequestParam(value="meetingNo") int meetingNo, 
								@RequestParam(value="meetingDate") String meetingDate, 
								HttpSession session){
		System.out.println("MeetingController.deleteMeeting()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		meetingService.deleteMeeting(userNo, meetingNo, meetingDate);

		return "redirect:/walkmeeting/meeting?no="+meetingNo;
	}
	
	//모임 신청 취소
	@RequestMapping(value = "/cancelApply")
	public String cancelApply(@RequestParam(value="meetingNo") int meetingNo, HttpSession session){
		System.out.println("MeetingController.cancelApply()");

		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		meetingService.deleteMeetingInfo(meetingNo, userNo);
		
		return "redirect:/walkmeeting/meeting?no="+meetingNo;
	}
	
	
	//내 모임 리스트
	@RequestMapping(value="/mymeetinglist", method={RequestMethod.GET, RequestMethod.POST})
	public String myMeetingList(@RequestParam(value="what", required=false, defaultValue="") String what,
								@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							    @RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
							    Model model, HttpSession session){
		System.out.println("MeetingController.myMeetingList()");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		Map<String, Object> meetingMap = meetingService.selectMyMeetingList(what, keyword, crtPage, userNo);
		model.addAttribute("meetingMap", meetingMap);
		
		return "walkMeeting/myMeetingList";
	}
	
//////////////////////////////////////////////////////
	/*
	 * @RequestMapping(value = "") public String home(){ return
	 * "walkMeeting/walkMeetingHome"; }
	 * 
	 * @RequestMapping(value = "/clublist") public String clubList(){ return
	 * "walkMeeting/clubList"; }
	 * 
	 * 
	 * @RequestMapping(value = "/clubauthority") public String clubAuthority(){
	 * return "walkMeeting/clubAuthority"; }
	 * 
	 * @RequestMapping(value = "/boardsetting") public String boardSetting(){ return
	 * "walkMeeting/clubBoardSetting"; }
	 * 
	 * @RequestMapping(value = "/club") public String club(){ return
	 * "walkMeeting/clubDetail"; }
	 * 
	 * @RequestMapping(value = "/clubinsert") public String clubInsert(){ return
	 * "walkMeeting/clubInsert"; }
	 * 
	 * @RequestMapping(value = "/membersetting") public String memberSetting(){
	 * return "walkMeeting/clubMemberSetting"; }
	 */
}
