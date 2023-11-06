package com.runningdog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.TrailVo;

@Repository
public class TrailDao {

	@Autowired
	private SqlSession sqlSession;
	
	// trailMain //////////////////////////////
	
	// 산책로 목록
	public List<TrailVo> trailList(Map<String, Object> coordsMap) {
		// System.out.println("TrailDao.trailList()");
		
		List<TrailVo> trailList =  sqlSession.selectList("trail.trailList", coordsMap);
		
		return trailList;
	}

	// 산책로 좌표 목록
	public List<CoordsVo> coordsList(int no) {
		// System.out.println("TrailDao.coordsList()");
		
		List<CoordsVo> coords = sqlSession.selectList("trail.coordsList", no);
		
		return coords;
	}

	// 산책로 정보
	public TrailVo trailInfo() {
		System.out.println("TrailDao.trailInfo()");
		
		TrailVo trailVo = sqlSession.selectOne("trail.trailInfo");
		
		return trailVo;
	}
	
	// 산책로 유저 프로필
	public ImagesVo trailUserImg() {
		System.out.println("TrailDao.trailUserImg()");
		
		ImagesVo imagesVo = sqlSession.selectOne("trail.trailUserImg");
		
		return imagesVo;
	}

	// 산책로 이용자수
	public int trailUsedCnt() {
		System.out.println("TrailDao.trailUsedCnt()");
		
		int trailUsedCnt = sqlSession.selectOne("trail.trailUsedCnt");
		
		return trailUsedCnt;
	}

	// 산책로 찜 갯수
	public int trailStarCnt() {
		System.out.println("TrailDao.trailStarCnt()");
		
		int trailStarCnt = sqlSession.selectOne("trail.trailStarCnt");
		
		return trailStarCnt;
	}
	
	// 산책로 후기 갯수
	public int trailCmtCnt() {
		System.out.println("TrailDao.trailCmtCnt()");
		
		int trailCmtCnt = sqlSession.selectOne("trail.trailCmtCnt");
		
		return trailCmtCnt;
	}

}
