package com.runningdog.controller;

import java.util.List;

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


import com.runningdog.service.WalkBlogService;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.UserVo;

@RequestMapping(value = "/walkBlog")
@Controller
public class WalkBlogController {

	@Autowired
	private WalkBlogService walkBlogService;

	@RequestMapping(value = "home")
	public String home(HttpSession session) {

		UserVo authuser = (UserVo) session.getAttribute("authUser");

		System.out.println(authuser);

		return "walkBlog/walkBlogHome";

	}

	@RequestMapping(value = "/{code}", method = { RequestMethod.GET, RequestMethod.POST })
	public String userBlog(@PathVariable(value = "code") String code, Model model, Model model2, HttpSession session) {

		System.out.println("userBlog");

		UserVo authuser = (UserVo) session.getAttribute("authUser");
		System.out.println(authuser);
		
		int authUserNo = (authuser != null) ? authuser.getUserNo() : 0; // authuser가 null이면 0으로 설정
		System.out.println(authUserNo);
		String paramCode = code;

		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(paramCode, authUserNo);

		System.out.println(blogInfoVo);

		model.addAttribute("blogInfoVo", blogInfoVo);

		List<ShowLogVo> walkLogList = walkBlogService.walkLogList(paramCode);
		System.out.println(walkLogList);
		model2.addAttribute("walkLogList", walkLogList);
		
		
		
		

		return "walkBlog/userBlog";
		
		
		
		
		
	}
	
	@RequestMapping(value = "/{code}/{walkLogNo}", method = RequestMethod.GET)
	public String viewWalkLog(@PathVariable(value = "code") String code, 
	                          @PathVariable(value = "walkLogNo") int walkLogNo,
	                          Model model, Model model2, HttpSession session) {
		
		UserVo authuser = (UserVo) session.getAttribute("authUser");
		System.out.println(authuser);
		
		int authUserNo = (authuser != null) ? authuser.getUserNo() : 0; // authuser가 null이면 0으로 설정
		System.out.println(authUserNo);
		String paramCode = code;

		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(paramCode, authUserNo);

		System.out.println(blogInfoVo);

		model.addAttribute("blogInfoVo", blogInfoVo);
		
	    // 특정 walkLog를 검색하고 모델에 설정하는 로직
	    ShowLogVo walkLog = walkBlogService.getWalkLogByNo(walkLogNo);
	    model2.addAttribute("walkLog", walkLog);
	    
	    // 모델에 필요한 다른 속성 추가
	    
	    return "walkBlog/walkLogDetail"; // walkLog 상세 정보용 새로운 JSP 생성 (필요한 경우)
	}
	
	@RequestMapping(value = "/{code}/{walkLogNo}/modifyForm", method = RequestMethod.GET)
	public String showModifyForm(
	    @PathVariable(value = "code") String code,
	    @PathVariable(value = "walkLogNo") int walkLogNo,
	    Model model, Model model2,
	    HttpSession session
	) {
		System.out.println("modifyForm");
		
	    // 필요한 정보 가져오기
	    UserVo authuser = (UserVo) session.getAttribute("authUser");
	    int authUserNo = (authuser != null) ? authuser.getUserNo() : 0;

	    BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(code, authUserNo);
	    model.addAttribute("blogInfoVo", blogInfoVo);

	    // 선택한 WalkLog에 대한 정보를 추가
	    ShowLogVo walkLog = walkBlogService.getWalkLogByNo(walkLogNo);
	    model2.addAttribute("walkLog", walkLog);

	    return "walkBlog/walkLogModifyForm";
	}
	
	@RequestMapping(value="/{code}/{walkLogNo}/modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String modify(@PathVariable(value = "code") String code, @PathVariable(value = "walkLogNo") int walkLogNo,  @ModelAttribute ShowLogVo walkLogVo) {
		
		System.out.println("WalkBLogController.modify()");
		
		
		walkBlogService.updateWalkLog(walkLogVo);
		
		
		
		return "redirect:/walkBlog/" + code +"/" +walkLogNo;
		
		
	}
	
	
	
	

	@RequestMapping(value = "detail")
	public String detail() {
		return "walkBlog/detail";
	}
	
	
	@RequestMapping(value="delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam(value="no") int no , HttpSession session) {
		
		System.out.println("walkBlog.delete()");
		
		UserVo authuser = (UserVo) session.getAttribute("authUser");
		String myId = authuser.getId();
		
		walkBlogService.deleteWalkLog(no);
		
		return "redirect:" + myId;
		
		
	}
	
	@RequestMapping(value = "/addComment", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String addComment(@RequestParam("walkLogNo") int walkLogNo, @RequestParam("content") String content, @RequestParam("userNo") int userNo) {
	    
		System.out.println("addComment");
		/*
		 * UserVo authuser = (UserVo) session.getAttribute("authUser"); int userNo =
		 * authuser.getUserNo();
		 */
	    
	    System.out.println("userNo는");
	    System.out.println(userNo);

	    ShowLogCmtVo comment = new ShowLogCmtVo();
	    comment.setWalkLogNo(walkLogNo);
	    comment.setUserNo(userNo);
	    comment.setContent(content);

	    walkBlogService.addComment(comment);

	    return "success";
	}
	
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	@ResponseBody
	public String deleteComment(@RequestParam("walkLogCmtNo") int walkLogCmtNo) {
	    walkBlogService.deleteComment(walkLogCmtNo);
	    return "success";
	}
	
	@RequestMapping(value = "/toggleFollow", method = RequestMethod.POST)
	@ResponseBody
	public String toggleFollow(@RequestParam("followeeNo") int followeeNo, HttpSession session) {
	    UserVo authuser = (UserVo) session.getAttribute("authUser");
	    int followerNo = authuser.getUserNo();

	    String result = walkBlogService.toggleFollow(followerNo, followeeNo);

	    return result;
	}
	
	

}
