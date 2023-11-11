package com.runningdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.WalkBlogDao;
import com.runningdog.vo.BlogInfoVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;

@Service
public class WalkBlogService {
	
	@Autowired
	private WalkBlogDao walkBlogDao;

	public BlogInfoVo selectBlogInfo(String paramCode, int authUserNo) {
		
		System.out.println("selectBlogInfo");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("paramCode",paramCode);
		map.put("authUserNo",authUserNo);
		
		BlogInfoVo blogInfoVo = new BlogInfoVo();
		
		blogInfoVo.setName(walkBlogDao.selectBlogOwner(paramCode));
		// blogInfoVo.setAuthId(authCode);
		blogInfoVo.setParamId(paramCode);
		
		
		blogInfoVo.setFollowerNum(walkBlogDao.selectfollowerNum(paramCode));
		
		blogInfoVo.setFollowingNum(walkBlogDao.selectfollowingNum(paramCode));
		
		// blogInfoVo.setFollowNo(walkBlogDao.didIFollow(map));
		
		
		
		
		return blogInfoVo; 
	}

	public List<ShowLogVo> walkLogList(String paramId) {
		
		//기본정보가져오기
		List<ShowLogVo> walkLogList = walkBlogDao.walkLogList(paramId);
		
		
		 // 각 walkLog에 대한 댓글 리스트 설정
        for (ShowLogVo walkLog : walkLogList) {
            List<ShowLogCmtVo> cmtList = walkBlogDao.getShowLogCmtList(walkLog.getWalkLogNo());
            walkLog.setShowLogCmtList(cmtList);
        }
		
		
       
		/*
		 * //1번글에는 1번댓글 리스트 가져오기
		 * 
		 * int walkLogNo= walkLogList.get(0).getWalkLogNo() 3
		 * 
		 * 3번글의 댓글리스트<-> getCmtList(3) walkLogNo.get(0).setShowLogCmtList(3번글의 댓글리스트);
		 * 
		 * 
		 * 
		 * no
		 */
		
		
		return walkLogList;
	}

	public void deleteWalkLog(int no) {
		
		walkBlogDao.deleteWalkLog(no);
		
	}

	public void addComment(ShowLogCmtVo comment) {
	    walkBlogDao.addComment(comment);
	}


}
