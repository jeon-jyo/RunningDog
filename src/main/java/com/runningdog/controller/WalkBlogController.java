package com.runningdog.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.service.WalkBlogService;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.WalkLogConImgVo;

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

	@RequestMapping(value = "/{code}/{walkLogNo}",method = { RequestMethod.GET, RequestMethod.POST })
	public String viewWalkLog(@PathVariable(value = "code") String code,
			@PathVariable(value = "walkLogNo") int walkLogNo, Model model, Model model2, HttpSession session) {

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
	
	

	@RequestMapping(value = "/{code}/following",method = { RequestMethod.GET, RequestMethod.POST })
	public String viewFollowing(@PathVariable(value = "code") String code,
			 Model model, Model model2, HttpSession session) {

		UserVo authuser = (UserVo) session.getAttribute("authUser");
		System.out.println(authuser);

		int authUserNo = (authuser != null) ? authuser.getUserNo() : 0; // authuser가 null이면 0으로 설정
		System.out.println(authUserNo);
		String paramCode = code;

		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(paramCode, authUserNo);

		System.out.println(blogInfoVo);

		model.addAttribute("blogInfoVo", blogInfoVo);

		

		// 모델에 필요한 다른 속성 추가

		return "walkBlog/following"; // walkLog 상세 정보용 새로운 JSP 생성 (필요한 경우)
	}
	
	@RequestMapping(value = "/{code}/follower",method = { RequestMethod.GET, RequestMethod.POST })
	public String viewFollower(@PathVariable(value = "code") String code,
			 Model model, Model model2, HttpSession session) {

		UserVo authuser = (UserVo) session.getAttribute("authUser");
		System.out.println(authuser);

		int authUserNo = (authuser != null) ? authuser.getUserNo() : 0; // authuser가 null이면 0으로 설정
		System.out.println(authUserNo);
		String paramCode = code;

		BlogInfoVo blogInfoVo = walkBlogService.selectBlogInfo(paramCode, authUserNo);

		System.out.println(blogInfoVo);

		model.addAttribute("blogInfoVo", blogInfoVo);

		

		// 모델에 필요한 다른 속성 추가

		return "walkBlog/follower"; // walkLog 상세 정보용 새로운 JSP 생성 (필요한 경우)
	}
	
	
	
	
	
	
	

	@RequestMapping(value = "/{code}/{walkLogNo}/modifyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String showModifyForm(@PathVariable(value = "code") String code,
			@PathVariable(value = "walkLogNo") int walkLogNo, Model model, Model model2, HttpSession session) {
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

	/*
	 * @RequestMapping(value="/{code}/{walkLogNo}/modify", method=
	 * {RequestMethod.GET, RequestMethod.POST}) public String
	 * modify(@PathVariable(value = "code") String code, @PathVariable(value =
	 * "walkLogNo") int walkLogNo, @ModelAttribute ShowLogVo walkLogVo) {
	 * 
	 * System.out.println("WalkBLogController.modify()");
	 * 
	 * 
	 * walkBlogService.updateWalkLog(walkLogVo);
	 * 
	 * 
	 * 
	 * return "redirect:/walkBlog/" + code +"/" +walkLogNo;
	 * 
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value="/{code}/{walkLogNo}/modify", method=
	 * {RequestMethod.GET, RequestMethod.POST}) public String modify(
	 * 
	 * @PathVariable(value = "code") String code,
	 * 
	 * @PathVariable(value = "walkLogNo") int walkLogNo,
	 * 
	 * @ModelAttribute ShowLogVo walkLogVo, int[] deletedIds, MultipartFile[] images
	 * ) {
	 * 
	 * 
	 * 
	 * try {
	 * 
	 * System.out.println("WalkBLogController.modify()");
	 * walkBlogService.updateWalkLog(walkLogVo);
	 * 
	 * List<WalkLogConImgVo> updatedImageList = new ArrayList<>();
	 *//**
		 * 전체 이미지 리스트 가져오기
		 */
	/*
	 * List<WalkLogConImgVo> imageList = walkBlogService.getWalkLogConImages(1);
	 * 
	 * for (int i = 0; i < imageList.size(); i++) { WalkLogConImgVo image =
	 * imageList.get(i); if (Arrays.binarySearch(deletedIds, image.getImageNo()) >=
	 * 0) {
	 *//**
		 * 삭제 수행
		 */
	/*
	 * // From Database walkBlogService.deleteWalkLogConImage(image.getImageNo());
	 * // From Storage File file = new File(Paths.get(image.getFilePath(),
	 * image.getSaveName()).toString()); if (file.exists()) { file.delete(); } }
	 * else { updatedImageList.add(image); } }
	 * 
	 *//**
		 * 신규 이미지 추가
		 */

	/*
	 * for (int i = 0; i < images.length; i++) { MultipartFile image = images[i]; if
	 * (image.isEmpty()) continue;
	 * 
	 * String filename = image.getOriginalFilename(); // 경로는 수정 필요 String directory
	 * = "C:\\javaStudy\\rdimg\\";
	 * 
	 * // 해당 폴더 내에 파일 저장 String fileExt =
	 * filename.substring(filename.lastIndexOf(".")); String newFilename =
	 * System.nanoTime() + fileExt; String filepath = Paths.get(directory,
	 * newFilename).toString();
	 * 
	 * BufferedOutputStream stream = new BufferedOutputStream(new
	 * FileOutputStream(new File(filepath))); stream.write(image.getBytes());
	 * stream.close();
	 * 
	 * WalkLogConImgVo item = new WalkLogConImgVo(); item.setImageNo(-1);
	 * item.setOrgName(filename); item.setSaveName(newFilename);
	 * item.setType("walkLogCon"); item.setFilePath("C:\\javaStudy\\rdimg\\"); // 추구
	 * 변경 필요 item.setUseNo(1); item.setFileSize(image.getSize());
	 * item.setImageOrder(updatedImageList.size() + 1); updatedImageList.add(item);
	 * walkBlogService.addWalkLogConImage(item); }
	 * 
	 *//**
		 * 순서 조정
		 *//*
			 * for (int i = 0; i < updatedImageList.size(); i++) { WalkLogConImgVo image =
			 * updatedImageList.get(i); if (image.getImageNo() != -1) {
			 * walkBlogService.updateWalkLogConImageOrder(image.getImageNo(), i + 1); } } }
			 * catch (Exception e) { System.out.println(e.getMessage()); }
			 * 
			 * 
			 * return "redirect:/walkBlog/" + code +"/" +walkLogNo;
			 * 
			 * 
			 * }
			 * 
			 * 
			 */

	@RequestMapping(value = "detail")
	public String detail() {
		return "walkBlog/detail";
	}

	@RequestMapping(value = "delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(@RequestParam(value = "no") int no, HttpSession session) {

		System.out.println("walkBlog.delete()");

		UserVo authuser = (UserVo) session.getAttribute("authUser");
		String myId = authuser.getId();

		walkBlogService.deleteWalkLog(no);

		return "redirect:" + myId;

	}

	@RequestMapping(value = "/addComment", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addComment(@RequestParam("walkLogNo") int walkLogNo, @RequestParam("content") String content,
			@RequestParam("userNo") int userNo) {

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

	@RequestMapping(value = "/deleteComment", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String deleteComment(@RequestParam("walkLogCmtNo") int walkLogCmtNo) {
		walkBlogService.deleteComment(walkLogCmtNo);
		return "success";
	}

	@RequestMapping(value = "/toggleFollow", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String toggleFollow(@RequestParam("followeeNo") int followeeNo, HttpSession session) {
		UserVo authuser = (UserVo) session.getAttribute("authUser");
		int followerNo = authuser.getUserNo();

		String result = walkBlogService.toggleFollow(followerNo, followeeNo);

		return result;
	}

}
