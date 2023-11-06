package com.runningdog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runningdog.dao.TrailDao;
import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.TrailVo;

@Service
public class TrailService {
	
	@Autowired TrailDao trailDao;
	
	// trailMain //////////////////////////////

	// 산책로 목록 ajax
	public Map<String, Object> trailListMap(Map<String, Object> coordsMap) {
		System.out.println("TrailService.trailListMap()");
//		System.out.println("coordsMap : " + coordsMap);
		
		// 산책로 목록
		List<TrailVo> trailList = trailDao.trailList(coordsMap);
		// System.out.println("trailList : " + trailList);
		
		// 산책로 좌표 목록
		List<List<CoordsVo>> coordsList = new ArrayList<List<CoordsVo>>();
		for (TrailVo trailVo : trailList) {
			int no = trailVo.getTrailNo();
			List<CoordsVo> coords = trailDao.coordsList(no);
			coordsList.add(coords);
		}
		// System.out.println("coordsList : "  +coordsList);
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("trailList", trailList);
		listMap.put("coordsList", coordsList);
		// System.out.println("listMap : " + listMap);

		return listMap;
	}
	
	// 산책로 툴팁 ajax
	public Map<String, Object> trailTooltip() {
		System.out.println("TrailService.trailTooltip()");
		
		// 산책로 정보
		TrailVo trailVo = trailDao.trailInfo();
		// 산책로 유저 프로필
		ImagesVo imagesVo = trailDao.trailUserImg();
		// 산책로 이용 정보
		int trailUsedCnt = trailDao.trailUsedCnt();
		int trailStarCnt = trailDao.trailStarCnt();
		int trailCmtCnt = trailDao.trailCmtCnt();
		
		Map<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("trailVo", trailVo);
		infoMap.put("imagesVo", imagesVo);
		infoMap.put("trailUsedCnt", trailUsedCnt);
		infoMap.put("trailStarCnt", trailStarCnt);
		infoMap.put("trailCmtCnt", trailCmtCnt);
		
		return infoMap;
	}
	
}
