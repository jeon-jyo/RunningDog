package com.runningdog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		int authUserNo = authuser.getUserNo();

		String paramCode = code;

		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(paramCode, authUserNo);

		System.out.println(blogInfoVo);

		model.addAttribute("blogInfoVo", blogInfoVo);

		List<ShowLogVo> walkLogList = walkBlogService.walkLogList(paramCode);
		System.out.println(walkLogList);
		model2.addAttribute("walkLogList", walkLogList);
		
		
		

		return "walkBlog/userBlog";
		
		
		
		
		
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
	public String addComment(@RequestParam("walkLogNo") int walkLogNo, @RequestParam("content") String content, HttpSession session) {
	    
		System.out.println("addComment");
		UserVo authuser = (UserVo) session.getAttribute("authUser");
	    int userNo = authuser.getUserNo();
	    
	    System.out.println("userNo는");
	    System.out.println(userNo);

	    ShowLogCmtVo comment = new ShowLogCmtVo();
	    comment.setWalkLogNo(walkLogNo);
	    comment.setUserNo(userNo);
	    comment.setContent(content);

	    walkBlogService.addComment(comment);

	    return "success";
	}
	

}
