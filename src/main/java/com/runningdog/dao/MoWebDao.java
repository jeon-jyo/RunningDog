package com.runningdog.dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.runningdog.vo.CoordsVo;
import com.runningdog.vo.ImagesVo;
import com.runningdog.vo.LocationVo;
import com.runningdog.vo.MoDogVo;
import com.runningdog.vo.MoMeetingVo;
import com.runningdog.vo.MoStarVo;
import com.runningdog.vo.MoTrailVo;
import com.runningdog.vo.MoWalkLogVo;
import com.runningdog.vo.MoWalkedDogVo;
import com.runningdog.vo.MotrailUsedVo;
import com.runningdog.vo.UseTrailVo;
import com.runningdog.vo.UserVo;
import com.runningdog.vo.XYVo;

@Repository
public class MoWebDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//유저 1명 찾아오기 (로그인)
	public UserVo selectOneUser(UserVo userVo) {
		System.out.println("다오 모바일웹 로그인");	
		UserVo authUser = sqlSession.selectOne("walkLog.selectOneUser", userVo);
		return authUser;
	}
	
	// 동네번호 검색하기
	public int locationSelect(LocationVo locationVo){
		System.out.println("다오 동네번호로 검색하기");			
		int locationNo = sqlSession.selectOne("walkLog.locationSelect", locationVo);	
		return locationNo;
	}
	
	// 맵 산책로 불러오기 (동네전부)
	public List<UseTrailVo> mapTrailSelect(int locationNo){
		System.out.println("다오 산책로 검색하기");	
		System.out.println(locationNo);
		return sqlSession.selectList("walkLog.mapTrailSelect", locationNo);
	}	
	// 기록 산책로 불러오기 (3개)
	public List<UseTrailVo> threeTrailSelect(XYVo xyVo){
		System.out.println("다오 산책로 3개");	
		List<UseTrailVo> trailList = sqlSession.selectList("walkLog.threeTrailSelect" , xyVo);
		System.out.println("다오 산책로 3개 결과 (이미지추가)" + trailList);	
		return trailList;
	}	

// ----------------- 산책로 업데이트 관련 -----------------------------
	
	// 산책로 이용자수
	public void trailCount(MotrailUsedVo motrailUsedVo){
		System.out.println("산책로 이용자 카운트");	
		System.out.println(motrailUsedVo);
		sqlSession.insert("walkLog.trailCount",motrailUsedVo);
	}	
	
	// 산책로 찜 등록
	public void starInsert(MoStarVo moStarVo){
		System.out.println("산책로 찜 등록");
		sqlSession.insert("walkLog.starInsert",moStarVo);
		System.out.println("찜 등록 후 찜번호 생성"+moStarVo);
	}	
		
	// 산책로 찜 삭제
	public void starDelete(MoStarVo moStarVo){
		System.out.println("산책로 찜 삭제");	
		System.out.println(moStarVo);
		sqlSession.insert("walkLog.starDelete",moStarVo);
	}	
	
//-----------------------------------------------------------------
	
	// 기록 산책로 불러오기 (3개)
	public List<UseTrailVo> trailSelect(){
		System.out.println("@Dao");		
		return sqlSession.selectList("walkLog.endTrailSelect");
	}	
	
	
	
	// (2) 강아지정보 가져오기
	public List<MoDogVo> dogSelect(int userNo){
		System.out.println("다오 강아지가져오기");	
		System.out.println("다오 아이디 "+userNo);	
		List<MoDogVo> dogList = sqlSession.selectList("walkLog.dogSelect", userNo);
		System.out.println("내강아지랑 친구강아지 (삭제강아지 X) "+dogList);	
		return dogList;
	}
	
	// (3) 산책기록하기
	public void walkLogInsert(MoWalkLogVo moWalkLogVo){
		System.out.println("다오 산책기록하기");
		
		String title = moWalkLogVo.getTitle();
		String endTime = moWalkLogVo.getEndTime();
		
		String newTitle = tmieTitle(title,endTime);
		
		System.out.println("생성된 제목 : "+ newTitle);
		
		moWalkLogVo.setTitle(newTitle);
		moWalkLogVo.setStatus('T');	
		moWalkLogVo.setStartTime("2023-11-17 11:31");
		moWalkLogVo.setEndTime("2023-11-17 11:45");
			
		System.out.println("셀렉트키 받기 전 " + moWalkLogVo);	              
		sqlSession.insert("walkLog.walkLogInsert", moWalkLogVo);
	}
	
	// 산책기록 좌표값 업데이트 (더미데이터용)
	public void coordsDelete(int walkLogNo){
		System.out.println("다오 산책기록 좌표값 업데이트 (더미데이터용)");		
		sqlSession.delete("walkLog.coordsDelete", walkLogNo);
	}
	
	// 산책기록 맵이미지 업데이트 (더미데이터용)
	public void mapImagDelete(int walkLogNo){
		System.out.println("다오 산책기록 맵이미지 업데이트 (더미데이터용)");		
		sqlSession.delete("walkLog.mapImagDelete", walkLogNo);
	}
	
	// (4) 강아지리스트기록하기
	public void dogListInsert(MoWalkedDogVo walkedDogVo){
		System.out.println("다오 강아지리스트기록하기");	
		sqlSession.insert("walkLog.walkedDogInsert", walkedDogVo);
	}
	
	// (5) 좌표리스트기록하기
	public void coordsListInsert(CoordsVo coordsVo){
		System.out.println("다오 좌표리스트기록하기");			
		sqlSession.insert("walkLog.coordsInsert", coordsVo);
	}
	
	// (6) 캡쳐용 좌표값 불러오기
	public List<CoordsVo> mapSelect(int walkLogNo){
		System.out.println("다오 캡쳐용 좌표값 불러오기");			
		return  sqlSession.selectList("walkLog.mapSelect", walkLogNo);
	}
	
	// 이미지 저장하기
	public void imgsSave(ImagesVo imagesVo){
		System.out.println("다오 첨부이미지 저장하기");	
		System.out.println(imagesVo);
		sqlSession.insert("walkLog.imgsSave", imagesVo);
	}
	
	
	// (0) 유사한 산책로 불러오기 (현재는 더미데이터 3개 불러오기)
	public List<MoTrailVo> trailSelect(int locationNo){
		System.out.println("다오 산책로 3개 불러오기");			
		return sqlSession.selectList("walkLog.trailSelect",locationNo);			
	}
	
	//----------------------------------adminUpdate
	public void adminUpdate(MoWalkLogVo walkLogVo){
		System.out.println("다오 어드민 업데이트");			
		sqlSession.update("walkLog.adminUpdate",walkLogVo);			
	}
	
	
	// ------------- 모임 관련 -------------------
	public List<MoMeetingVo> todayMeetingSelect(Map<String, Object> meetingVo){
		System.out.println("다오 어드민 업데이트");			
		List<MoMeetingVo> meetingList = sqlSession.selectList("walkLog.todayMeetingSelect",meetingVo);			
		System.out.println("미팅 리스트 " + meetingList);
		return meetingList;
	}
	
	public List<MoDogVo> meetingDogSelect(int meetingNo){
		System.out.println("서비스 모임 강아지 리스트");
		List<MoDogVo> meDogList = sqlSession.selectList("walkLog.meetingDogSelect",meetingNo);
		System.out.println("모임 강아지 확인 " + meDogList);		
		return meDogList;
	}
	
	
	
	
	
	//------------------------------------------
	
	private String tmieTitle(String title,String endTime) {
		
		System.out.println("여기서 제목 값 확인" + title);			
		
		if (title == null) {
			System.out.println("여기서 제목 바꾸기" + title+ ", " + endTime);			
			// 문자열을 LocalDateTime으로 변환
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	        LocalDateTime dateTime = LocalDateTime.parse(endTime, formatter);

	        // 시간대에 따라 메시지 출력
	        if (dateTime.getHour() >= 0 && dateTime.getHour() < 6) {
	            System.out.println("새벽입니다");	     
	            title = "새벽산책입니다.";
	        } else if (dateTime.getHour() >= 6 && dateTime.getHour() < 12) {
	            System.out.println("아침입니다");     
	            title = "아침산책입니다.";
	        } else if (dateTime.getHour() >= 12 && dateTime.getHour() < 18) {
	            System.out.println("점심입니다");     
	            title = "점심산책입니다.";
	        } else {
	            System.out.println("저녁입니다");     
	            title = "저녁산책입니다.";
	        }			
		} 
		
		System.out.println("나가기전 확인: " +title);
		
		return title;
		
	}
	
	
	

}
