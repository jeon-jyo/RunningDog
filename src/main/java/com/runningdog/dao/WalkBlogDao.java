package com.runningdog.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;

@Repository
public class WalkBlogDao {

	@Autowired
	private SqlSession sqlSession;

	public String selectBlogOwner(String paramCode) {

		return sqlSession.selectOne("walkBlog.selectBlogOwner", paramCode);
	}
	
	public int  selectfollowerNum(String paramCode) {
		
		return sqlSession.selectOne("walkBlog.selectFollowerNum", paramCode);
		
	}
	
	
	public int  selectfollowingNum(String paramCode) {
		
		return sqlSession.selectOne("walkBlog.selectFollowingNum", paramCode);
		
	}
	
	public int  didIFollow(Map<String, String> map) {
		
		System.out.println("didIFollow");
		
		int fno = sqlSession.selectOne("walkBlog.didIFollow", map);
		
		
		if(fno == 0) {
			return 0;
		}
		else {
			return 1;
		}
		
	
		
		
	}

	public List<ShowLogVo> walkLogList(String paramCode) {
		List<ShowLogVo> walkLogList = sqlSession.selectList("walkBlog.walkLogList", paramCode);
		
		return walkLogList;
	}
	
	public List<ShowLogCmtVo> getShowLogCmtList(int walkLogNo) {
        return sqlSession.selectList("walkBlog.getShowLogCmtList", walkLogNo);
    }

	public void deleteWalkLog(int no) {
		
		sqlSession.delete("walkBlog.deleteWalkLog", no);
		
	}
	
	public void addComment(ShowLogCmtVo comment) {
	    sqlSession.insert("walkBlog.addComment", comment);
	}
	
	
	

}
