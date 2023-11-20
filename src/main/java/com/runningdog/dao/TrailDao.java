package com.runningdog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.TrailCmtVo;
import com.runningdog.vo.TrailTagVo;
import com.runningdog.vo.TrailVo;
import com.runningdog.vo.UsersVo;
import com.runningdog.vo.WalkLogVo;

@Repository
public class TrailDao {

	@Autowired
	private SqlSession sqlSession;
	
	// trailMain //////////////////////////////
	
	// 유저 설정 위치
	public LocationVo userLocation(int userNo) {
		System.out.println("TrailDao.userLocation()");
		
		LocationVo locationVo = sqlSession.selectOne("walkTrail.userLocation", userNo);
		
		return locationVo;
	}

	// 게스트 설정 위치
	public LocationVo guestLocation() {
		System.out.println("TrailDao.guestLocation()");
		
		LocationVo locationVo = sqlSession.selectOne("walkTrail.guestLocation");
		
		return locationVo;
	}
	
	// 산책로 목록
	public List<TrailVo> trailList(Map<String, Object> fetchSet) {
		System.out.println("TrailDao.trailList()");
		
		List<TrailVo> trailList =  sqlSession.selectList("walkTrail.trailList", fetchSet);
		
		return trailList;
	}
	
	// 산책로 좌표 목록
	public List<CoordsVo> coordsList(int trailNo) {
		// System.out.println("TrailDao.coordsList()");
		
		List<CoordsVo> coords = sqlSession.selectList("walkTrail.coordsList", trailNo);
		
		return coords;
	}

	// 산책로 정보
	public TrailVo trailDetail(int trailNo) {
		// System.out.println("TrailDao.trailDetail()");
		
		TrailVo trailVo = sqlSession.selectOne("walkTrail.trailDetail", trailNo);
		
		return trailVo;
	}
	
	// 유저 프로필
	public ImagesVo userImg(int userNo) {
		// System.out.println("TrailDao.userImg()");
		
		ImagesVo imagesVo = sqlSession.selectOne("walkTrail.userImg", userNo);
		
		return imagesVo;
	}

	// 산책로 이용자수
	public int trailUsedCnt(int trailNo) {
		// System.out.println("TrailDao.trailUsedCnt()");
		
		int trailUsedCnt = sqlSession.selectOne("walkTrail.trailUsedCnt", trailNo);
		
		return trailUsedCnt;
	}
	
	// 산책로 찜 갯수
	public int trailStarCnt(int trailNo) {
		// System.out.println("TrailDao.trailStarCnt()");
		
		int trailStarCnt = sqlSession.selectOne("walkTrail.trailStarCnt", trailNo);
		
		return trailStarCnt;
	}
	
	// 산책로 후기 갯수
	public int trailCmtCnt(int trailNo) {
		// System.out.println("TrailDao.trailCmtCnt()");
		
		int trailCmtCnt = sqlSession.selectOne("walkTrail.trailCmtCnt", trailNo);
		
		return trailCmtCnt;
	}

	// 산책일지 목록
	public List<WalkLogVo> walkLogList(Map<String, Object> fetchSet) {
		System.out.println("TrailDao.walkLogList()");
		
		List<WalkLogVo> walkLogList =  sqlSession.selectList("walkTrail.walkLogList", fetchSet);
		
		return walkLogList;
	}

	// 산책일지 좌표
	public List<CoordsVo> walkLogCoords(int walkLogNo) {
		System.out.println("TrailDao.walkLogCoords()");
		
		List<CoordsVo> coords = sqlSession.selectList("walkTrail.walkLogCoords", walkLogNo);
		
		return coords;
	}

	// trailForm //////////////////////////////
	
	// 산책로 이름 중복확인
	public int confirmName(TrailVo trailVo) {
		System.out.println("TrailDao.confirmName()");
		
		int selectCnt = sqlSession.selectOne("walkTrail.confirmName", trailVo);
		
		return selectCnt;
	}

	// 산책로 등록
	public int trailInsert(TrailVo trailVo) {
		System.out.println("TrailDao.trailInsert()");
		
		int insertCnt = sqlSession.insert("walkTrail.trailInsert", trailVo);
		
		return insertCnt;
	}

	// 산책로 태그 등록
	public int trailTagInsert(TrailTagVo trailTagVo) {
		System.out.println("TrailDao.trailTagInsert()");
		
		int insertCnt = sqlSession.insert("walkTrail.trailTagInsert", trailTagVo);
		
		return insertCnt;
	}

	// 산책로 좌표 등록
	public int trailCoordsInsert(CoordsVo coordsVo) {
		System.out.println("TrailDao.trailCoordsInsert()");
		
		int insertCnt = sqlSession.insert("walkTrail.trailCoordsInsert", coordsVo);
		
		return insertCnt;
	}
	
	// trailDetail //////////////////////////////
	
	// 산책로 태그
	public List<TrailTagVo> tagList(int trailNo) {
		System.out.println("TrailDao.tagList()");
		
		List<TrailTagVo> tagList = sqlSession.selectList("walkTrail.tagList", trailNo);
		
		return tagList;
	}

	// 산책로 정보 좌표
	public CoordsVo markerCoords(CoordsVo coordsVo) {
		// System.out.println("TrailDao.markerCoords()");
		
		CoordsVo vo = sqlSession.selectOne("walkTrail.markerCoords", coordsVo);
		
		return vo;
	}

	// 유저 이용수
	public int userUsedCnt(TrailVo trailVo) {
		System.out.println("TrailDao.userUsedCnt()");
		
		int userUsedCnt = sqlSession.selectOne("walkTrail.userUsedCnt", trailVo);
		
		return userUsedCnt;
	}
	
	// 유저 상세
	public UsersVo userDetail(int userNo) {
		System.out.println("TrailDao.userDetail()");
		
		UsersVo usersVo = sqlSession.selectOne("walkTrail.userDetail", userNo);
		
		return usersVo;
	}

	// 최근 산책일지 목록
	public List<WalkLogVo> userwalkLogList(TrailVo trailVo) {
		System.out.println("TrailDao.userwalkLogList()");
		
		List<WalkLogVo> walkLogList =  sqlSession.selectList("walkTrail.userwalkLogList", trailVo);
		
		return walkLogList;
	}

	// 유저 상세 목록
	public List<UsersVo> userDetailList(int trailNo) {
		System.out.println("TrailDao.userDetailList()");
		
		List<UsersVo> userList =  sqlSession.selectList("walkTrail.userDetailList", trailNo);

		return userList;
	}

	// 후기 - 목록 / 갤러리
	public List<TrailCmtVo> cmtList(Map<String, Object> fetchSet) {
		System.out.println("TrailDao.cmtList()");
		
		List<TrailCmtVo> cmtList = sqlSession.selectList("walkTrail.cmtList", fetchSet);
		
		return cmtList;
	}

	// 후기 이미지 목록
	public List<ImagesVo> cmtImages(int trailCmtNo) {
		// System.out.println("TrailDao.cmtImages()");
		
		List<ImagesVo> images = sqlSession.selectList("walkTrail.cmtImages", trailCmtNo);
		
		return images;
	}

	// 후기 좋아요수
	public int cmtLikeCnt(int trailCmtNo) {
		// System.out.println("TrailDao.cmtLikeCnt()");
		
		int cmtLikeCnt = sqlSession.selectOne("walkTrail.cmtLikeCnt", trailCmtNo);
		
		return cmtLikeCnt;
	}

	// 후기 등록
	public int trailCmtAdd(TrailCmtVo trailCmtVo) {
		System.out.println("TrailDao.trailCmtAdd()");
		
		int insertCnt = sqlSession.insert("walkTrail.trailCmtAdd", trailCmtVo);
		
		return insertCnt;
	}

	// 후기 이미지 업로드
	public int cmtImgAdd(ImagesVo imagesVo) {
		System.out.println("TrailDao.cmtImgAdd()");
		
		int insertCnt = sqlSession.insert("walkTrail.cmtImgAdd", imagesVo);
		
		return insertCnt;
	}

}
