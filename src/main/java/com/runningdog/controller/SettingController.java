package com.runningdog.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.service.SettingService;
import com.runningdog.vo.DogsVo;
import com.runningdog.vo.FriendsVo;
import com.runningdog.vo.UserVo;

@Controller
@RequestMapping(value="/setting")
public class SettingController {

	@Autowired
	private SettingService settingService;
	
	//내 정보
	@RequestMapping(value="/myProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String myProfile(HttpSession session,
						    Model model){
		System.out.println("SettingController.myProfile()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(userNo);
		//System.out.println(selectUser);
		
		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "m");
		
		return "setting/myProfile";
	}
	
	//내 정보 수정 "폼"
	@RequestMapping(value="/myProfileModifyForm", method={RequestMethod.GET, RequestMethod.POST})
	public String myProfileModify(HttpSession session,
		    					  Model model){
		System.out.println("SettingController.myProfileModifyForm()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();	
				
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(userNo);
		
		//System.out.println(selectUser);

		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "m");
		
		return "setting/myProfileModifyForm";
	}
	
	//내 정보 수정 "기능"
	@RequestMapping(value="/modifyMyProfile", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyMyProfile(@ModelAttribute UserVo userVo, 
								  @RequestParam(value="file") MultipartFile file,
								  HttpSession session){
		System.out.println("SettingController.modifyMyProfile()");
		
		int userNo = ((UserVo) session.getAttribute("authUser")).getUserNo();
		
		settingService.modifyMyProfile(userVo, userNo, file);
		
		return "redirect:/setting/myProfile";
	}
	
	
//	//유저 프로필 이미지 저장 (ajax)
//	@ResponseBody
//	@RequestMapping(value="/uploadMyProfileImg", method={RequestMethod.GET, RequestMethod.POST})
//	public String insertMyProfileImg(@RequestParam(value="file") MultipartFile file,
//			 						 HttpSession session){
//		System.out.println("SettingController.uploadMyProfileImg()");
//		
//		String id = ((UserVo) session.getAttribute("authUser")).getId();
//		
//		String saveName = settingService.uploadMyProfileImg(id, file);
//		
//		return saveName;
//	}
	
	
	//동네 검색 AJAX
	@ResponseBody
	@RequestMapping(value="/selectAddressList", method={RequestMethod.GET, RequestMethod.POST})
	public List<UserVo> selectAddressList(@RequestParam(value="keyword", required=false, defaultValue="") String keyword){
		System.out.println("SettingController.selectAddressList()");
		
		List<UserVo> addressList = settingService.selectAddressList(keyword);
		
		//System.out.println(addressList);
		
		return addressList;
	}
	
	
/*    강아지    */
	
	//강아지 카드 (리스트)
	@RequestMapping(value="/dogList", method={RequestMethod.GET, RequestMethod.POST})
	public String dogList(HttpSession session, Model model){
		System.out.println("SettingController.dogList()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//유저 코드 보여주기 용
		UserVo selectUser = settingService.selectUser(userNo);
		model.addAttribute("selectUser", selectUser);
		
		//강아지 리스트
		Map<String, List<DogsVo>> dogListMap = settingService.selectDogList(userNo);
		//System.out.println(dogList);
		model.addAttribute("dogListMap", dogListMap);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "dl");
		
		return "setting/dogList";
	}
	
	//강아지 등록 폼
	@RequestMapping(value="/dogInsertForm", method={RequestMethod.GET, RequestMethod.POST})
	public String dogInsertForm(HttpSession session, Model model){
		System.out.println("SettingController.dogInsertForm()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//유저 코드 보여주기 용
		UserVo selectUser = settingService.selectUser(userNo);
		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "di");
		
		return "setting/dogInsertForm";
	}
	
	//강아지 등록 기능
	@RequestMapping(value="/dogInsert", method={RequestMethod.GET, RequestMethod.POST})
	public String dogInsert(HttpSession session, 
							@ModelAttribute DogsVo dogsVo, 
							@RequestParam(value="file") MultipartFile file){
		System.out.println("SettingController.dogInsert()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//강아지 등록
		settingService.insertDog(userNo, dogsVo, file);
		
		return "redirect:/setting/dogList";
	}

	
	//강아지 수정 폼
	@RequestMapping(value="/dogModifyForm", method={RequestMethod.GET, RequestMethod.POST})
	public String dogModifyForm(@RequestParam(value="no") int dogNo, Model model, HttpSession session){
		System.out.println("SettingController.dogModifyForm()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//유저 코드 보여주기 용
		UserVo selectUser = settingService.selectUser(userNo);
		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "dm");
		
		//강아지 하나
		DogsVo dogVo = settingService.selectDog(dogNo);
		model.addAttribute("dogVo", dogVo);
		
		return "setting/dogModifyForm";
	}
	
	//강아지 삭제 누르면
	@RequestMapping(value="/deleteDog", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteDog(@RequestParam(value="no") int dogNo){
		System.out.println("SettingController.deleteDog()");
		
		settingService.deleteDog(dogNo);
		
		return "redirect:/setting/dogList";
	}
	
	//강아지 업데이트
	@RequestMapping(value="/updateDog", method={RequestMethod.GET, RequestMethod.POST})
	public String updateDog(@ModelAttribute DogsVo dogVo, 
							@RequestParam(value="file") MultipartFile file,
							HttpSession session){
		System.out.println("SettingController.updateDog()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
				
		settingService.updateDog(userNo, dogVo, file);
		
		return "redirect:/setting/dogList";
	}
	
	
//////////////////////
/*    친구    */
//////////////////////
	
	//친구 목록 (검색 O, 페이징 O)
	@RequestMapping(value="/friendList", method={RequestMethod.GET, RequestMethod.POST})
	public String friendList(@RequestParam(value="what", required=false, defaultValue="") String what,
							 @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							 @RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
							 HttpSession session, Model model){
		System.out.println("SettingController.friendList()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
	
		Map<String, Object> friendMap = settingService.selectFriendList(userNo, what, keyword, crtPage);
		//System.out.println(friendList);
		model.addAttribute("friendMap", friendMap);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fl");
		
		return "setting/friendList";
	}
	
	//친구 삭제 + 거부 + 취소
	@ResponseBody
	@RequestMapping(value="/deleteFriend", method={RequestMethod.GET, RequestMethod.POST})
	public int deleteFriend(@RequestParam(value="friendNo") int friendNo,
			 				   HttpSession session){
		System.out.println("SettingController.deleteFriend()");

		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		int count = settingService.deleteFriend(friendNo, userNo);
		
		return count;
	}
	
	//내가 받은 신청
	@RequestMapping(value="/friendAppliedList", method={RequestMethod.GET, RequestMethod.POST})
	public String friendAppliedList(@RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
			 				  HttpSession session, Model model){
		System.out.println("SettingController.appliedList()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
	
		Map<String, Object> friendMap = settingService.selectAppliedList(userNo, crtPage);
		
		model.addAttribute("friendMap", friendMap);
				
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fad");
		
		return "setting/friendAppliedList";
	}
	
	//친구 수락
	@ResponseBody
	@RequestMapping(value="/acceptFriend", method={RequestMethod.GET, RequestMethod.POST})
	public int acceptFriend(@RequestParam(value="friendNo") int friendNo,
			 				   HttpSession session){
		System.out.println("SettingController.acceptFriend()");

		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		int count = settingService.acceptFriend(friendNo, userNo);
		
		return count;
	}
	
	
	//내가 한 신청
	@RequestMapping(value="/friendApplyList", method={RequestMethod.GET, RequestMethod.POST})
	public String friendApplyList(@RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
			 				  HttpSession session, Model model){
		System.out.println("SettingController.friendApplyList()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
	
		Map<String, Object> friendMap = settingService.selectApplyList(userNo, crtPage);
		
		model.addAttribute("friendMap", friendMap);
				
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fa");
		
		return "setting/friendApplyList";
	}
	
	
	//회원 검색 폼
	@RequestMapping(value="/userSearch", method={RequestMethod.GET, RequestMethod.POST})
	public String friendSearchForm(HttpSession session, Model model){
		System.out.println("SettingController.friendSearchForm()");

		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fs");
		
		return "setting/friendSearchForm";
	}
	
	//회원 검색 기능
	@RequestMapping(value="/friendSearchForm", method={RequestMethod.GET, RequestMethod.POST})
	public String userSearch(@RequestParam(value="what", required=false, defaultValue="") String what,
								   @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
								   @RequestParam(value="crtPage", required=false, defaultValue="1") int crtPage,
			 				       HttpSession session, Model model){
		System.out.println("SettingController.userSearch()");
		
		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
	
		Map<String, Object> friendMap = settingService.selectUserList(userNo, what, keyword, crtPage);
		//System.out.println(friendList);
		model.addAttribute("friendMap", friendMap);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "fs");
		
		return "setting/friendSearchForm";
	}
	
	//친구 수락
	@ResponseBody
	@RequestMapping(value="/insertFriend", method={RequestMethod.GET, RequestMethod.POST})
	public int insertFriend(@RequestParam(value="userNo") int userNo,
			 				HttpSession session){
		System.out.println("SettingController.insertFriend()");

		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int authUserNo = authUser.getUserNo();
		
		int count = settingService.insertFriend(userNo, authUserNo);
		
		return count;
	}
	

//////////////////////
/*    탈퇴    */
//////////////////////
	
	//회원 탈퇴 폼
	@RequestMapping(value="/resignForm", method={RequestMethod.GET, RequestMethod.POST})
	public String resignForm(HttpSession session, Model model){
		System.out.println("SettingController.resignForm()");

		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		//그걸로 db 검색
		UserVo selectUser = settingService.selectUser(userNo);
		//System.out.println(selectUser);
		
		model.addAttribute("selectUser", selectUser);
		
		//사이드 바 색칠용
		model.addAttribute("crtMenu", "r");
		
		return "setting/resignForm";
	}
	
	//회원 탈퇴 기능
	@RequestMapping(value="/resign", method={RequestMethod.GET, RequestMethod.POST})
	public String resign(HttpSession session, @ModelAttribute UserVo userVo){
		System.out.println("SettingController.resign()");

		//세션에서 getUserNo
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		int userNo = authUser.getUserNo();
		
		settingService.resign(userNo, userVo);
		
		return "redirect:/loginForm";
	}
	
	
}



