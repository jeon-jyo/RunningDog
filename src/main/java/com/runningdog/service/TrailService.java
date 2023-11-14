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
import com.runningdog.vo.TrailTagVo;
import com.runningdog.vo.TrailVo;
import com.runningdog.vo.UsersVo;
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
		// String listKey = (String) fetchSet.get("listKey");
		
		// 산책로 목록
		List<TrailVo> trailList = trailDao.trailList(fetchSet);
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

	// 산책로 등록 ajax
	public int trailAdd(Map<String, Object> fetchSet) {
		System.out.println("TrailService.trailAdd()");
		
		int insertCnt = 0;
		
		ObjectMapper mapper = new ObjectMapper();
		
		TrailVo trailVo = mapper.convertValue(fetchSet.get("trailVo"), TrailVo.class);
		Map<String, Boolean> infoCheck = (Map<String, Boolean>) fetchSet.get("infoCheck");
		Map<String, Map<String, Object>> infoMarker = (Map<String, Map<String, Object>>) fetchSet.get("infoMarker");
		ArrayList<Map<String, Object>> coordsList = (ArrayList<Map<String, Object>>) fetchSet.get("coordsList");
		ArrayList<String> tagArr = (ArrayList<String>) fetchSet.get("tagArr");
		int userNo = (int) fetchSet.get("userNo");
		UsersVo usersVo = new UsersVo();
		usersVo.setUserNo(userNo);
		trailVo.setUsersVo(usersVo);
		
		if(infoCheck.get("parking") == true) {
			trailVo.setParking('T');
		} else {
			trailVo.setParking('F');
		}
		if(infoCheck.get("restroom") == true) {
			trailVo.setRestroom('T');
		} else {
			trailVo.setRestroom('F');
		}
		if(infoCheck.get("trashCan") == true) {
			trailVo.setTrashCan('T');
		} else {
			trailVo.setTrashCan('F');
		}
		
		// 산책로 등록
		int trailInsertCnt = trailDao.trailInsert(trailVo);
		if(trailInsertCnt != 0) {
			// System.out.println("산책로 등록 성공");
			
			if(tagArr.size() != 0) {
				for (String tag : tagArr) {
					TrailTagVo trailTagVo = new TrailTagVo();
					trailTagVo.setTrailVo(trailVo);
					trailTagVo.setTagName(tag);
					
					// 산책로 태그 등록
					if(trailDao.trailTagInsert(trailTagVo) == 1) {
						// System.out.println("산책로 태그 등록 성공");
					} else {
						// System.out.println("산책로 태그 등록 실패");
					}
				}
			}
			
			for (Map<String, Object> coordsMap : coordsList) {
				
				CoordsVo coordsVo = new CoordsVo();
				coordsVo.setType("trail");
				coordsVo.setUseNo(trailVo.getTrailNo());
				coordsVo.setCoordOrder((int) coordsMap.get("coordOrder"));
				coordsVo.setLat((double) coordsMap.get("y"));
				coordsVo.setLng((double) coordsMap.get("x"));

				// 산책로 좌표 등록
				if(trailDao.trailCoordsInsert(coordsVo) == 1) {
					// System.out.println("산책로 좌표 등록 성공");
				} else {
					// System.out.println("산책로 좌표 등록 실패");
				}
			}
			
			if(infoMarker.get("parking") != null) {
				// System.out.println("parking o : " + infoMarker.get("parking"));
				
				CoordsVo coordsVo = new CoordsVo();
				coordsVo.setType("trailParking");
				coordsVo.setUseNo(trailVo.getTrailNo());
				coordsVo.setCoordOrder(1);
				coordsVo.setLat((double) infoMarker.get("parking").get("y"));
				coordsVo.setLng((double) infoMarker.get("parking").get("x"));
				
				// 정보 좌표 등록
				if(trailDao.trailCoordsInsert(coordsVo) == 1) {
					// System.out.println("parking 좌표 등록 성공");
				} else {
					// System.out.println("parking 좌표 등록 실패");
				}
			} else if(infoMarker.get("restroom") != null) {
				// System.out.println("restroom o : " + infoMarker.get("restroom"));
				
				CoordsVo coordsVo = new CoordsVo();
				coordsVo.setType("restroom");
				coordsVo.setUseNo(trailVo.getTrailNo());
				coordsVo.setCoordOrder(1);
				coordsVo.setLat((double) infoMarker.get("restroom").get("y"));
				coordsVo.setLng((double) infoMarker.get("restroom").get("x"));
				
				// 정보 좌표 등록
				if(trailDao.trailCoordsInsert(coordsVo) == 1) {
					// System.out.println("restroom 좌표 등록 성공");
				} else {
					// System.out.println("restroom 좌표 등록 실패");
				}
			} else if(infoMarker.get("trashCan") != null) {
				System.out.println("trashCan o : " + infoMarker.get("trashCan"));
				
				CoordsVo coordsVo = new CoordsVo();
				coordsVo.setType("trashCan");
				coordsVo.setUseNo(trailVo.getTrailNo());
				coordsVo.setCoordOrder(1);
				coordsVo.setLat((double) infoMarker.get("trashCan").get("y"));
				coordsVo.setLng((double) infoMarker.get("trashCan").get("x"));
				
				// 정보 좌표 등록
				if(trailDao.trailCoordsInsert(coordsVo) == 1) {
					// System.out.println("trashCan 좌표 등록 성공");
				} else {
					// System.out.println("trashCan 좌표 등록 실패");
				}
			}
			insertCnt = 1;
		} else {
			// System.out.println("산책로 등록 실패");
		}
		
		/*
		System.out.println("fetchSet : " + fetchSet);
		System.out.println("trailVo : " + trailVo);
		System.out.println("infoCheck : " + infoCheck);
		System.out.println("infoMarker : " + infoMarker);
		System.out.println("coordsList : " + coordsList);
		System.out.println("tagArr : " + tagArr);
		System.out.println("userNo : " + userNo);
		*/
		
		return insertCnt;
	}
	
}
