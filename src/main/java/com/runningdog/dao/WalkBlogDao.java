package com.runningdog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.BlogDogVo;
import com.runningdog.vo.LogWalkedDogVo;
import com.runningdog.vo.MonthlyStatsVo;
import com.runningdog.vo.ShowLogCmtVo;
import com.runningdog.vo.ShowLogVo;
import com.runningdog.vo.WalkLogConImgVo;

@Repository
public class WalkBlogDao {

	@Autowired
	private SqlSession sqlSession;

	/*
	 * public Map<String, Object> selectBlogOwner(Map<String, Object> paramMap) {
	 * return sqlSession.selectOne("walkBlog.selectBlogOwner", paramMap); }
	 */

	public int selectfollowerNum(String paramCode) {

		return sqlSession.selectOne("walkBlog.selectFollowerNum", paramCode);

	}

	public int selectfollowingNum(String paramCode) {

		return sqlSession.selectOne("walkBlog.selectFollowingNum", paramCode);

	}

	public int didIFollow(Map<String, Integer> map) {
		return sqlSession.selectOne("walkBlog.didIFollow", map);
	}

	public void insertFollow(Map<String, Integer> map) {
		sqlSession.insert("walkBlog.insertFollow", map);
	}

	public void deleteFollow(Map<String, Integer> map) {
		sqlSession.delete("walkBlog.deleteFollow", map);
	}

	public List<ShowLogVo> walkLogList(String paramCode) {
		List<ShowLogVo> walkLogList = sqlSession.selectList("walkBlog.walkLogList", paramCode);

		return walkLogList;
	}

	public List<ShowLogCmtVo> getShowLogCmtList(int walkLogNo) {
		return sqlSession.selectList("walkBlog.getShowLogCmtList", walkLogNo);
	}

	public List<WalkLogConImgVo> getShowLogImageList(int walkLogNo) {
		System.out.println("getShowLogImageList");
		return sqlSession.selectList("walkBlog.getShowLogImageList", walkLogNo);
	}

	public List<LogWalkedDogVo> getWalkedDogList(int walkLogNo) {
		System.out.println("getWalkedDogList");

		return sqlSession.selectList("walkBlog.getWalkedDogList", walkLogNo);
	}
	
	public String getWalkedDogImg(int dogNo) {
		
		return sqlSession.selectOne("walkBlog.getDogSaveName", dogNo);
	}


	

	public void deleteWalkLog(int no) {

		sqlSession.delete("walkBlog.deleteWalkLog", no);

	}

	public void addComment(ShowLogCmtVo comment) {
		sqlSession.insert("walkBlog.addComment", comment);
	}

	public int selectOwnerNo(String paramCode) {

		return sqlSession.selectOne("walkBlog.selectOwnerNo", paramCode);

	}

	public void deleteComment(int walkLogCmtNo) {
		sqlSession.delete("walkBlog.deleteComment", walkLogCmtNo);
	}

	/*
	 * public int didIFollow2(Map<String,Object> map) {
	 * 
	 * System.out.println("didIFollow");
	 * 
	 * int fno = sqlSession.selectOne("walkBlog.didIFollow2", map);
	 * 
	 * 
	 * if(fno == 0) { return 0; } else { return 1; }
	 * 
	 * 
	 * 
	 * }
	 */

	public int didIFollow2(Map<String, Object> map) {
		System.out.println("didIFollow");
		Integer fno = sqlSession.selectOne("walkBlog.didIFollow2", map);

		if (fno == null) {
			return 0;
		} else {
			return fno; // Integer를 int로 반환하는 것이 가능합니다.
		}
	}

	public String selectBannerImg(String paramCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("walkBlog.selectBannerImg", paramCode);
	}

	public MonthlyStatsVo getMonthlyStats(String paramCode) {

		return sqlSession.selectOne("walkBlog.getMonthlyStats", paramCode);
	}

	public MonthlyStatsVo getTotalStats(String paramCode) {

		return sqlSession.selectOne("walkBlog.getTotalStats", paramCode);
	}

	public String selectOwnerName(String paramCode) {
		return sqlSession.selectOne("walkBlog.selectBlogOwnerName", paramCode);

	}

	public ShowLogVo selectWalkLog(int walkLogNo) {

		return sqlSession.selectOne("walkBlog.selectWalkLog", walkLogNo);
	}

	public void updateTitleContent(ShowLogVo walkLogVo) {

		System.out.println("dao.updateWalkLog");
		System.out.println(walkLogVo);
		sqlSession.update("walkBlog.updateTitleContent", walkLogVo);

	}

	public List<BlogDogVo> getBlogDogList(String paramCode) {

		return sqlSession.selectList("walkBlog.getBlogDogList", paramCode);
	}

	public String getDogSaveName(int dogNo) {

		return sqlSession.selectOne("walkBlog.getDogSaveName", dogNo);
	}

	public String getUserSavename(String paramCode) {

		return sqlSession.selectOne("walkBlog.getUserSavename", paramCode);
	}

	public List<BlogDogVo> getFriendDogList(String paramCode) {

		return sqlSession.selectList("walkBlog.getFriendDogList", paramCode);
	}

	
}
