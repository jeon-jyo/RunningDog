package com.runningdog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.runningdog.dao.TrailDao;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.TrailVo;
import com.runningdog.vo.WalkLogVo;

@Service
public class TrailService {
	
	@Autowired TrailDao trailDao;
	
	// trailMain //////////////////////////////
	
	// 유저 설정 위치
	public LocationVo userLocation(int userNo) {
		System.out.println("TrailService.userLocation()");
		
		LocationVo locationVo = null;
		if(userNo != 0) {
			locationVo = trailDao.userLocation(userNo);
		} else {
			locationVo = trailDao.guestLocation();
		}
		
		return locationVo;
	}

	// 산책로 목록 ajax
	public Map<String, Object> trailListMap(Map<String, Object> fetchSet) {
		System.out.println("TrailService.trailListMap()");
		
		// Map<String, Object> coordsMap = (Map<String, Object>) fetchSet.get("coordsMap");
		// ArrayList<String> tags = (ArrayList<String>) fetchSet.get("tags");
		// int filter = (int) fetchSet.get("filter");
		String listKey = (String) fetchSet.get("listKey");
		
		List<TrailVo> trailList = null;
		if(listKey.equals("main") || listKey.equals("my")) {
			// 산책로 추천 / 등록 목록
			trailList = trailDao.trailList(fetchSet);
		} else if(listKey.equals("star")) {
			// 산책로 찜 목록
			trailList = trailDao.trailStarList(fetchSet);
		} else if(listKey.equals("add")) {
			
		}
		// System.out.println("trailList : " + trailList);
		
		// 산책로 좌표 목록
		List<List<CoordsVo>> coordsList = new ArrayList<List<CoordsVo>>();
		for (TrailVo trailVo : trailList) {
			int trailNo = trailVo.getTrailNo();
			List<CoordsVo> coords = trailDao.coordsList(trailNo);
			coordsList.add(coords);
		}
		// System.out.println("coordsList : "  +coordsList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("trailList", trailList);
		listMap.put("coordsList", coordsList);

		return listMap;
	}
	
	// 산책로 툴팁 ajax
	public Map<String, Object> trailTooltip(int trailNo) {
		System.out.println("TrailService.trailTooltip()");
		
		// 산책로 정보
		TrailVo trailVo = trailDao.trailInfo(trailNo);
		// 산책로 유저 프로필
		ImagesVo imagesVo = trailDao.trailUserImg(trailVo.getUsersVo().getUserNo());
		// 산책로 이용 정보
		int trailUsedCnt = trailDao.trailUsedCnt(trailNo);
		int trailStarCnt = trailDao.trailStarCnt(trailNo);
		int trailCmtCnt = trailDao.trailCmtCnt(trailNo);
		
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("trailVo", trailVo);
		infoMap.put("imagesVo", imagesVo);
		infoMap.put("trailUsedCnt", trailUsedCnt);
		infoMap.put("trailStarCnt", trailStarCnt);
		infoMap.put("trailCmtCnt", trailCmtCnt);
		
		return infoMap;
	}

	// 산책일지 목록 ajax
	public List<WalkLogVo> walkLogList(Map<String, Object> fetchSet) {
		System.out.println("TrailService.walkLogList()");
		
		List<WalkLogVo> walkLogList = trailDao.walkLogList(fetchSet);
		// System.out.println("walkLogList : " + walkLogList);

		return walkLogList;
	}

	// 산책일지 좌표 ajax
	public List<CoordsVo> walkLogMap(WalkLogVo walkLogVo) {
		System.out.println("TrailService.walkLogMap()");
		
		int walkLogNo = walkLogVo.getWalkLogNo();
		List<CoordsVo> coords = trailDao.coords(walkLogNo);
		// System.out.println("coords : "  +coords);
		
		return coords;
	}
	
	// trailForm //////////////////////////////
	
	// 산책일지 좌표
	public String walkLogCoords(WalkLogVo walkLogVo) throws JsonProcessingException {
		System.out.println("TrailService.walkLogCoords()");
		
		int walkLogNo = walkLogVo.getWalkLogNo();
		ObjectMapper objectMapper = new ObjectMapper();
		String coordsJson = objectMapper.writeValueAsString(trailDao.coords(walkLogNo));
		
		return coordsJson;
	}

	// 산책로 이름 중복확인 ajax
	public int confirmName(TrailVo trailVo) {
		System.out.println("TrailService.confirmName()");
		
		int selectCnt = trailDao.confirmName(trailVo);
		
		return selectCnt;
	}
	
}
